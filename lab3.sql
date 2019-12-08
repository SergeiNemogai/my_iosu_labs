-- Информация об офисах в Бресте

CREATE OR REPLACE VIEW Branches AS
SELECT *
FROM Branch 
WHERE city = 'Brest';

-- Информация об объектах недвижимости минимальной стоимости (топ-5)

CREATE OR REPLACE VIEW Min_rent AS
SELECT *
FROM (SELECT * FROM objects ORDER BY rent)
WHERE rownum < 6;

-- Информациея о количестве сделанных осмотров с комментариями

CREATE OR REPLACE VIEW Comment_count AS
SELECT COUNT(comment_o) AS NumOfViefs
FROM Viewing;

-- Сведениями об арендаторах, желающих арендовать 3-комнатные
-- квартиры в тех же городах (поле city), где они проживают (поле address)
-- Пришлось изменить несколько записей для корректного отображения
UPDATE Renter SET adress = 'Nizhnyaya Salda, 324 Meadow Valley Alley' WHERE rno = 8;
UPDATE Renter SET adress = 'Iberia, 885 Leroy Street' WHERE rno = 67;
-- //////////////////////////////////////////////////////////////////////////////////

CREATE OR REPLACE VIEW About_renters AS
SELECT R.*, city
FROM Renter R
INNER JOIN Viewing V ON R.rno = V.rno
INNER JOIN Objects O ON V.pno = O.pno
WHERE O.rooms = 3 AND O.city = SUBSTR(R.adress, 1, INSTR(R.adress, ',') - 1);

-- Сведения об отделении с максимальным количеством
-- работающих сотрудников

CREATE OR REPLACE VIEW MaxStaff AS
SELECT *
FROM Branch
WHERE bno IN (SELECT bno
FROM (SELECT B.bno, COUNT(sno)
FROM Branch B
INNER JOIN Staff S ON B.bno = S.bno
GROUP BY B.bno
ORDER BY 2 DESC)
WHERE rownum = 1);

-- Информация о сотрудниках и объектах, которые они предлагают в
-- аренду в текущем квартале (НЕ СКАЗАНО, ЧТО ИМЕННО В ЭТОМ ГОДУ!!!)

CREATE OR REPLACE VIEW Staff_objects AS
SELECT S.*, O.*, V.date_o
FROM Staff S
INNER JOIN Objects O ON S.sno = O.sno
INNER JOIN Viewing V ON O.pno = V.pno
WHERE TO_CHAR(date_o, 'q') IN (SELECT TO_CHAR(SYSDATE,'q') FROM DUAL);

-- Информация о владельцах, чьи дома или квартиры осматривались
-- потенциальными арендаторами более двух раз

CREATE OR REPLACE VIEW Owners_views AS
SELECT *
FROM Owner
WHERE ono IN (SELECT O.ono
FROM Owner O
INNER JOIN Property_for_rent P ON O.ono = P.ono
INNER JOIN Viewing V ON P.pno = V.pno
GROUP BY O.ono
HAVING COUNT(V.pno) > 2);

-- Информацией о собственниках с одинаковыми именами

CREATE OR REPLACE VIEW Same_names AS
SELECT * FROM Owner
WHERE fname IN (SELECT fname
FROM Owner
GROUP BY fname
HAVING COUNT(fname) > 1);