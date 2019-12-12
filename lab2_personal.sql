-- Условный запрос
-- Вывести список техники, произведённой в "Shuitian"

SELECT T.* 
FROM Suppliers S
INNER JOIN Technics T ON S.mcode = T.mcode
WHERE S.city = 'Shuitian';

-- Итоговый запрос
-- Вывести названия предприятий, которые произвели минимум 2 вида техники, в порядке убывания количества

SELECT S.title, COUNT(T.snumber) AS Technics
FROM Suppliers S
INNER JOIN Technics T ON S.mcode = T.mcode
GROUP BY S.title
HAVING COUNT(T.snumber) > 1
ORDER BY 2 DESC;

-- Параметрический вопрос
-- Вывести типы работ по названию

SELECT * 
FROM Works
WHERE wname = &wname;

-- Запрос на объединение
-- Общий список клиентов с количеством заказов и техники с количеством предоставлений
SELECT C.pnumber, COUNT(P.pnumber)
FROM Clients C
INNER JOIN Provision P ON C.pnumber = P.pnumber
GROUP BY C.pnumber
UNION
SELECT T.title, COUNT(P.snumber)
FROM Technics T
INNER JOIN Provision P ON T.snumber = P.snumber
GROUP BY T.title;

-- Условный запрос по типу поля дата
-- Количество заказов по годам

SELECT EXTRACT(YEAR FROM rdate) AS "Год", COUNT(*) AS "Количество"
FROM Provision 
GROUP BY EXTRACT(YEAR FROM rdate);

-- Внутреннее соединение таблиц (JOIN USING OR NATURAL JOIN)
-- Вывести информацию о клиентах, делавших заказы в 2017 году

SELECT *
FROM Clients 
INNER JOIN Provision USING(pnumber)
WHERE TO_CHAR(rdate, 'YYYY') = 2017;

-- Ну или такое: вывести информацию о предоставлении техники, произведённой в "Acao"

SELECT wcode, pnumber, snumber, Provision.rdate, city
FROM Provision
INNER JOIN Technics USING(snumber)
INNER JOIN Suppliers USING (mcode)
WHERE city = 'Acao';

-- Внешнее соединение таблиц (FULL/LEFT/RIGHT JOIN)
-- Вывести классификацию типов работ и соответствующие им работы, где типы работ имеют в названии букву "D"

SELECT C.towork, wcode, wname
FROM Classification C
LEFT JOIN Works W ON C.towork = W.towork
WHERE C.towork LIKE '%D%';

-- Использование предиката IN
-- Вывести список техники, которую использовали клиенты с номерами, начинающимеся с 9

SELECT DISTINCT T.*
FROM Technics T
INNER JOIN Provision P ON T.snumber = P.snumber
WHERE P.pnumber IN (
SELECT pnumber
FROM Clients
WHERE tnumber LIKE '9%')
ORDER BY 1;

-- Использование предиката ALL/ANY
-- Вывести список производителей, названия городов кооторых длиннее названий городов, начинающихся на "А"

SELECT *
FROM Suppliers
WHERE LENGTH(city) > ALL (
SELECT LENGTH(city)
FROM Suppliers
WHERE city LIKE 'A%');

-- Использование предиката EXIST/NOT EXIST
-- Вывести список техники, произведённой в Ливерпуле

SELECT *
FROM Technics T
WHERE EXISTS (
SELECT *
FROM Suppliers S
WHERE T.mcode = S.mcode AND city = 'Liverpool');
