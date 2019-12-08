-- Горизонтальное обновляемое представление
-- Создать представлние, позволяющее получить
-- список техники, произведённой в 'Shuitian'

CREATE OR REPLACE VIEW Technics_Shuitian AS
SELECT T.* 
FROM Suppliers S
INNER JOIN Technics T ON S.mcode = T.mcode
WHERE S.city = 'Shuitian';

-- Вертикальное необновляемое представление
-- для таблицы "предоставление техники"
-- Все выводимые столбцы являются ссылками на неключевые атрибуты подчинённых таблиц,
-- поэтому изменение данного представления не является возможным

CREATE OR REPLACE VIEW Provision_view AS
SELECT wname, fname, lname, title, T.rdate AS Production_date
FROM Provision P
INNER JOIN Works W ON P.wcode = W.wcode
INNER JOIN Clients C ON P.pnumber = C.pnumber
INNER JOIN Technics T ON P.snumber = T.snumber;

-- Проверить обновляемость горизонтального представления с фразой
-- WITH CHECK OPTION

CREATE OR REPLACE VIEW Clients_with_check AS
SELECT *
FROM Clients
WHERE fname LIKE 'A%'
WITH CHECK OPTION CONSTRAINT fname_starts_with_a;

-- Здесь всё нормально, имя начинается с "А"
insert into Clients_with_check (pnumber, fname, lname, tnumber) values ('BZ3000482', 'Ann', 'Kingcote', '211-549-5002');
-- А вот здесь уже нет, ограничение, указанное в WHERE, не выполняется. Будет ошибка
insert into Clients_with_check (pnumber, fname, lname, tnumber) values ('BZ3000483', 'Ben', 'Kingcote', '211-549-5003');

-- Создать обновляемое представление для работы с одной из
-- родительских таблиц индивидуальной БД и через него
-- разрешить работу с данными только в рабочие дни
-- (с понедельника по пятницу) и в рабочие часы (с 9:00 до 18:00)

CREATE OR REPLACE VIEW work_time AS
SELECT * FROM Suppliers
WHERE (SELECT TO_CHAR(sysdate,'d') FROM dual) BETWEEN 2 AND 6 
AND (SELECT TO_CHAR(sysdate, 'hh24:mi:ss') FROM dual) BETWEEN '09:00:00' AND '18:00:00';