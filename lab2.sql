-- Вариант 2:
-- Вывести в одном поле адреса и телефоны офисов, расположенных в
-- Stockholm и Brest.

SELECT street || ' ' || tel_no AS same FROM Branch
WHERE city = 'Stockholm' OR city = 'Brest';

-- Вывести данные о сотрудниках, которые предлагают для аренды
-- 3-комнатные квартиры.
-- Использование предиката DISTINCT обусловлено тем,
-- что один сотрудник может предлагать несколько квартир
-- Ниже приведено 2 варианта запросов (с джоином и без)

SELECT DISTINCT S.*, P.rooms
FROM Staff S, Property_for_rent P
WHERE S.sno = P.sno AND P.rooms = 3;

SELECT DISTINCT S.*, P.rooms
FROM Staff S
INNER JOIN Property_for_rent P ON S.sno = P.sno
WHERE P.rooms = 3 AND P.type = 'f';
 

-- Вывести итоговый отчет о средней и суммарной заработной плате
-- сотрудников в зависимости от их половой принадлежности. Подписать
-- вычисляемые поля как «Суммарная» и «Средняя».

SELECT sex, AVG(salary) AS "Средняя", SUM(salary) AS "Суммарная"
FROM Staff
GROUP BY sex
ORDER BY 3;

-- Вывести информацию об отделениях, где работает больше женщин, чем
-- мужчин, учитывая, что в отделениях могут быть сотрудники одного пола.
-- Блок CASE работает следующим образом: если значения поля sex соответсвует
-- литералу 'female', то возвращается значение 1, иначе -1.
-- Таким образом, если результат вычисления SUM будет положительный,
-- то это будет означать, что в офисе женщин больше, чем мужчин.

SELECT B.*
FROM Branch B
WHERE B.bno IN (SELECT bno
FROM Staff
GROUP BY bno
HAVING SUM(CASE sex WHEN 'female' THEN 1 ELSE -1 END) > 0)
ORDER BY 1;

-- Обновить одной командой информацию о максимальной рентной
-- стоимости объектов, уменьшив стоимость квартир на 5 %, а стоимость домов
-- увеличив на 7 %.

UPDATE Renter
SET max_rent = CASE pref_type WHEN 'h' THEN max_rent*1.07 ELSE max_rent*0.95 END;