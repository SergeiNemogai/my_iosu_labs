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
