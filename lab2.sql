-- Вариант 2:
-- Вывести в одном поле адреса и телефоны офисов, расположенных в
-- Stockholm и Brest.

SELECT CONCAT(street,  tel_no) AS same FROM Branch
WHERE city = 'Stockholm' OR city = 'Brest';

-- Вывести данные о сотрудниках, которые предлагают для аренды
-- 3-комнатные квартиры.

SELECT DISTINCT fname, lname, adress, tel_no, position, sex, dob, salary, rooms
FROM Staff S, Property_for_rent P
WHERE S.sno = P.sno AND P.rooms = 3;

SELECT fname, lname, adress, tel_no, position, sex, dob, salary, rooms
FROM Staff S
INNER JOIN Property_for_rent P ON S.sno = P.sno AND P.rooms = 3;
 

-- Вывести итоговый отчет о средней и суммарной заработной плате
-- сотрудников в зависимости от их половой принадлежности. Подписать
-- вычисляемые поля как «Суммарная» и «Средняя».



-- Вывести информацию об отделениях, где работает больше женщин, чем
-- мужчин, учитывая, что в отделениях могут быть сотрудники одного пола.

