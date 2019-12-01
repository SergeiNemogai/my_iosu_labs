-- Вариант 2:
-- Вывести в одном поле адреса и телефоны офисов, расположенных в
-- Stockholm и Brest.

SELECT street || ' ' || tel_no AS same FROM Branch
WHERE city = 'Stockholm' OR city = 'Brest';

-- Вывести данные о сотрудниках, которые предлагают для аренды
-- 3-комнатные квартиры.
-- Использование предиката DISTINCT обусловлено тем,
-- что один один сотрудник может предлагать несколько квартир
-- Ниже приведено 2 варианта запросов (с джоином и без)

SELECT DISTINCT S.*, P.rooms
FROM Staff S, Property_for_rent P
WHERE S.sno = P.sno AND P.rooms = 3;

SELECT DISTINCT S.*, P.rooms
FROM Staff S
INNER JOIN Property_for_rent P ON S.sno = P.sno
WHERE P.rooms = 3;
 

-- Вывести итоговый отчет о средней и суммарной заработной плате
-- сотрудников в зависимости от их половой принадлежности. Подписать
-- вычисляемые поля как «Суммарная» и «Средняя».

SELECT sex, AVG(salary) AS "Средняя", SUM(salary) AS "Суммарная"
FROM Staff
GROUP BY sex
ORDER BY 3;

-- Вывести информацию об отделениях, где работает больше женщин, чем
-- мужчин, учитывая, что в отделениях могут быть сотрудники одного пола.
-- Перебровал все варианты и ничего не работает.

SELECT B.*
FROM Branch B
WHERE B.bno IN (1, 2, 3);

-- количество женщин по отделениям
SELECT bno, COUNT(sex) AS female
FROM Staff
GROUP BY bno, sex
HAVING sex = 'female'
ORDER BY 1;

-- количество мужчин по отделениям
SELECT bno, COUNT(sex) AS male
FROM Staff
GROUP BY bno, sex
HAVING sex ='male'
ORDER BY 1;

-- Итоговый запрос, который выводит индексы отделений и количество сотрудников по гендерному признаку
SELECT bno, sex, COUNT(sex) AS numof
FROM Staff
GROUP BY bno, sex
ORDER BY 1;