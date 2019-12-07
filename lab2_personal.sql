-- Условный запрос
-- Вывести список техники, произведённой в "Shuitian"
SELECT T.* 
FROM Suppliers S
INNER JOIN Technics T ON S.mcode = T.mcode
WHERE S.city = 'Shuitian';

-- Итоговый запрос
-- Вывести названия предприятий, которые произвели миним 2 вида техники, в порядке убывания количества

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
-- Вывести список клиентов с фамилией на "A" или именем на "D"

SELECT *
FROM Clients
WHERE lname LIKE 'A%'
UNION
SELECT *
FROM Clients
WHERE fname LIKE 'D%';

-- Условный запрос по типу поля дата
-- Вывести информацию о клиентах, производивших заказы в 2017 году

SELECT C.*, P.rdate
FROM Clients C
INNER JOIN Provision P ON C.pnumber = P.pnumber
WHERE TO_CHAR(P.rdate, 'YYYY') = 2017;