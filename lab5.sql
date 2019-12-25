-- ALTER TRIGGER имя_триггера DISABLE;

/*
Написать DML-триггер, регистрирующий изменение данных (вставку,
обновление, удаление) в одной из таблиц БД. Во вспомогательную таблицу
LOG1 записывать, кто, когда (дата и время) и какое именно изменение
произвел, для одного из столбцов сохранять старые и новые значения.
*/

CREATE TABLE LOG1 (
    table_name VARCHAR2(30),
    oper_name CHAR(1),
    pk_key VARCHAR2(200),
    column_name VARCHAR2(30),
    old_value VARCHAR2(200),
    new_value VARCHAR2(200),
    username VARCHAR2(20),
    dateoper DATE);


CREATE OR REPLACE PROCEDURE SAVE_LOGS (
    vtable_name IN VARCHAR2,
    voper_name IN CHAR,
    vpk_key IN VARCHAR2,
    vcolumn_name IN VARCHAR2,
    vold_value IN VARCHAR2,
    vnew_value IN VARCHAR2
)
IS

BEGIN 
   IF vold_value <> vnew_value or vOper_name in ('I','D')
   THEN
        INSERT INTO LOG1 (
            table_name, oper_name, pk_key,
            column_name, old_value, new_value,
            username, dateoper
        ) VALUES (
            vtable_name, voper_name,
            vpk_key, vcolumn_name, vold_value,
            vnew_value, USER, SYSDATE);
    
    END IF;
END;
/

CREATE OR REPLACE TRIGGER DML_TRIGGER
AFTER INSERT OR UPDATE OR DELETE
ON Suppliers
FOR EACH ROW
DECLARE
op CHAR(1) := 'I';
BEGIN
    CASE
        WHEN INSERTING
        THEN
            op := 'I';
            SAVE_LOGS('Suppliers', op, :NEW.mcode, 'title', NULL, :NEW.title);
            SAVE_LOGS('Suppliers', op, :NEW.mcode, 'city', NULL, :NEW.city);
            SAVE_LOGS('Suppliers', op, :NEW.mcode, 'tnumber', NULL, :NEW.tnumber);

        WHEN UPDATING('title') or UPDATING('city') or  UPDATING('tnumber')
        THEN
            op := 'U';
            SAVE_LOGS('Suppliers', op, :NEW.mcode, 'title', :OLD.title, :NEW.title);
            SAVE_LOGS('Suppliers', op, :NEW.mcode, 'city', :OLD.city, :NEW.city);
            SAVE_LOGS('Suppliers', op, :NEW.mcode, 'tnumber', :OLD.tnumber, :NEW.tnumber);

        WHEN DELETING
        THEN
            op := 'D';
            SAVE_LOGS('Suppliers', op, :old.mcode, 'title', :OLD.title, NULL);
            SAVE_LOGS('Suppliers', op, :old.mcode, 'city', :OLD.city, NULL);
            SAVE_LOGS('Suppliers', op, :old.mcode, 'tnumber', :OLD.tnumber, NULL);
    ELSE
        NULL;

    END CASE;

END DML_TRIGGER;
/

-- Проверка результатов
INSERT INTO Suppliers (title, city, tnumber) VALUES ('TEST_TITLE', 'TEST_CITY', 'TEST_TNUMBER');
UPDATE Suppliers SET city='TEST_CITY_2' WHERE mcode=101;
DELETE FROM Suppliers WHERE mcode=101;

/*
Написать DDL-триггер, протоколирующий действия пользователей по
созданию, изменению и удалению таблиц в схеме во вспомогательную таблицу
LOG2 в определенное время и запрещающий эти действия в другое время
*/

CREATE TABLE LOG2(
    table_name VARCHAR2(30),
    operation_name VARCHAR2(20),
    username VARCHAR2(20),
    operation_date DATE);


CREATE OR REPLACE TRIGGER DDL_TRIGGER
BEFORE CREATE OR ALTER OR DROP ON SCHEMA
BEGIN
IF TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) >= 8 AND TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) <= 18 THEN
    INSERT INTO LOG2(table_name, operation_name, username, operation_date)
    VALUES (ORA_DICT_OBJ_NAME, ORA_SYSEVENT, USER, SYSDATE);
ELSE
    RAISE_APPLICATION_ERROR(
        num => -20000,
        msg => 'DDL operations are not provided at this time. Try it later');
END IF;
END;
/

-- Проверки работы триггера

CREATE TABLE Example(example_id INTEGER, example_title VARCHAR2(20));
DROP TABLE Example;
ALTER TABLE Example ADD author VARCHAR2(30);

/*
Написать системный триггер, добавляющий запись во вспомогательную
таблицу LOG3, когда пользователь подключается или отключается. В таблицу
логов записывается имя пользователя (USER), тип активности (LOGON или
LOGOFF), дата (SYSDATE), количество записей в основной таблице БД.
*/

CREATE TABLE LOG3(
    username VARCHAR2(20),
    action_type VARCHAR(10),
    action_date DATE);
    
CREATE OR REPLACE TRIGGER LOGON_TRIGGER AFTER LOGON ON SCHEMA
BEGIN
    INSERT INTO LOG3(username, action_type, action_date)
    VALUES (USER, 'LOGON', SYSDATE);
END;
/
  
CREATE OR REPLACE TRIGGER LOGOFF_TRIGER BEFORE LOGOFF ON SCHEMA
BEGIN
    INSERT INTO LOG3(username, action_type, action_date)
    VALUES (USER, 'LOGOFF', SYSDATE);
END;
/

/*
Написать триггеры, реализующие бизнес-логику (ограничения) в
заданной вариантом предметной области. Три задания приведены в прил. 6.
Количество и тип триггеров (строковый или операторный, выполняется AFTER
или BEFORE) определять самостоятельно исходя из сути заданий и имеющейся
схемы БД; учесть, что в некоторых вариантах первые два задания могут быть
выполнены в рамках одного триггера, а также возможно возникновение
мутации, что приведет к совмещению данного пункта лабораторной работы со
следующим. Третий пункт задания предполагает использование планировщика
задач, который обязательно должен быть настроен на многократный запуск с
использованием частоты, интервала и спецификаторов.

• Техника, находящаяся в ремонте, не может быть предоставлена.
• Техника, не предназначенная для опр. вида работ, не может быть предоставлена.
• Срок эксплуатации оборудования – не более 15 лет.
*/ 

-- 1) При предоставлении техники проверять, доступна ли она.
-- 2) При предоставлении техники проверять, выполняет ли он указанный тип работ
-- Указанные выше действия можно выполнить в одном триггере

CREATE OR REPLACE TRIGGER BEFORE_INSERT_TRIGGER
BEFORE INSERT OR UPDATE
ON Provision
FOR EACH ROW
DECLARE
TO_WORK_1 VARCHAR2(20);
TO_WORK_2 VARCHAR2(20);
READY_VAR CHAR(1);
BEGIN
    SELECT towork INTO TO_WORK_1 FROM Works WHERE wcode = :NEW.wcode;
    SELECT towork INTO TO_WORK_2 FROM Technics WHERE snumber = :NEW.snumber;
    SELECT ready INTO READY_VAR FROM Technics WHERE snumber = :NEW.snumber;
    
	IF TO_WORK_1 <> TO_WORK_2 THEN
		RAISE_APPLICATION_ERROR(
        num => -20000,
        msg => 'ITS IMPOSSIBLE TO PROVIDE THE TECHNIC UNIT WHICH DOESNT MAKE REQURIED TYPE OF WORK');
	END IF;
    
    IF READY_VAR = 'n' THEN
		RAISE_APPLICATION_ERROR(
        num => -20000,
        msg => 'ITS IMPOSSIBLE TO PROVIDE THE TECHNIC UNIT WHICH IS NOT READY');
	END IF;
END;
/

-- Проверка условия 2)
insert into Provision (wcode, pnumber, snumber, rdate) values (11, 'BZ3000481', 1, '09-Apr-2019');

-- Изменение данных для дальнейшей проверки условия 1)
UPDATE Technics SET ready = 'n' where snumber = 1;

-- Проверяем условие 1)
insert into Provision (wcode, pnumber, snumber, rdate) values (1, 'BZ3000481', 1, '09-Apr-2019');

-- 3) Раз в год производить учёт техники и делать недоступными те единицы,
-- у которых с момента производства прошло более 15 лет

BEGIN
DBMS_SCHEDULER.CREATE_JOB(
JOB_NAME => 'update_technics_ready_once_a_year',
JOB_TYPE => 'PLSQL_BLOCK',
JOB_ACTION => 'UPDATE Technics SET ready=''n'' WHERE TO_CHAR(sysdate,''yyyy'') - TO_CHAR(rdate, ''yyyy'') >= 15;',
START_DATE => '01-JAN-19 01.00.00 AM ',
REPEAT_INTERVAL => 'FREQ=YEARLY; BYYEARDAY = 3',
END_DATE => '01-JAN-50 12.00.00 AM ',
COMMENTS => 'Update technics status once a year (3 jan at 12 am) ',
ENABLED => TRUE);
END;
/

/*
Самостоятельно или при помощи преподавателя составить задание на
триггер, который будет вызывать мутацию таблиц, и решить эту проблему
одним из двух способов (при помощи переменных пакета и двух триггеров или
при помощи COMPAUND-триггера).
*/

-- если техника недоступна, триггер предлагает другую технику (тот же тип работ)
-- при этом, если с момента предоставления не прошло n дней, то изменять дату предоставления

CREATE OR REPLACE TRIGGER PROVISION_CHECK_TRIGGER
FOR INSERT ON Provision
COMPOUND TRIGGER

TO_WORK VARCHAR2(20);
READY_STATUS CHAR(1);
NEW_PCODE INTEGER := :NEW.pcode;
NEW_SNUMBER INTEGER := :NEW.snumber;
NEW_WCODE INTEGER := :NEW.wcode;
NEW_PNUMBER VARCHAR2(30) := :NEW.pnumber;
PROVISION_DATE DATE := :NEW.rdate;
PROVISION_COUNT INTEGER;


BEFORE EACH ROW IS
BEGIN
	SELECT ready INTO READY_STATUS FROM Technics WHERE snumber = NEW_SNUMBER;
	IF READY_STATUS = 'n' THEN
		SELECT towork INTO TO_WORK FROM Technics WHERE snumber = NEW_SNUMBER;
        SELECT snumber INTO NEW_SNUMBER FROM Technics WHERE towork = TO_WORK AND ROWNUM = 1 AND snumber <> NEW_SNUMBER;
        :NEW.snumber := NEW_SNUMBER;
        DBMS_OUTPUT.PUT_LINE('REQURIED TECHIC UNIT IS NOT AVAILABLE. ' || NEW_SNUMBER || ' HAS BEEN PROVIDED');
    END IF;
END BEFORE EACH ROW;

AFTER STATEMENT IS
BEGIN
	SELECT COUNT(1) INTO PROVISION_COUNT FROM Provision WHERE snumber = NEW_SNUMBER AND rdate BETWEEN PROVISION_DATE - 3 AND PROVISION_DATE;
	IF PROVISION_COUNT > 1 THEN
		UPDATE Provision SET rdate = PROVISION_DATE + 3 WHERE pcode = NEW_PCODE;
	END IF;
END AFTER STATEMENT;

END;
/


/*
Написать триггер INSTEAD OF для работы с необновляемым
представлением, созданным после выполнения п. 2 задания к лабораторной
работе №3, проверить DML-командами возможность обновления
представления до и после включения триггера.
*/

-- Собственно само представление

CREATE OR REPLACE VIEW Provision_view AS
SELECT wname, fname, lname, title, T.rdate AS Production_date
FROM Provision P
INNER JOIN Works W ON P.wcode = W.wcode
INNER JOIN Clients C ON P.pnumber = C.pnumber
INNER JOIN Technics T ON P.snumber = T.snumber;

-- При попытке обновить данные, вызывается исключение:
-- ORA-01779: cannot modify a column which maps to a non key-preserved table 

UPDATE Provision_view SET Production_date = '22-Apr-2019';

-- Триггер, исправляющий это

CREATE OR REPLACE TRIGGER UPDATE_VIEW
INSTEAD OF UPDATE ON Provision_view
FOR EACH ROW
BEGIN
UPDATE Technics SET
rdate = :NEW.Production_date;
END;
/

-- Проверка работы триггера

UPDATE Provision_view SET Production_date = '22-Apr-2019';