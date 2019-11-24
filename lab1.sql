CONNECT AS SYSDBA

CREATE TABLE Branch (
	bno INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	street VARCHAR2(30) NOT NULL,
	city VARCHAR2(30) NOT NULL,
	tel_no VARCHAR2(15) NOT NULL UNIQUE);
	
CREATE TABLE Staff (
	sno INTEGER  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	fname VARCHAR2(20) NOT NULL,
	lname VARCHAR2(20) NOT NULL,
	adress VARCHAR2(35) NOT NULL,
	tel_no VARCHAR2(15) NOT NULL UNIQUE,
	position VARCHAR2(20) NOT NULL,
	sex VARCHAR2(6) CHECK (sex IN ('male','female')),
	dob DATE NOT NULL,
	salary INTEGER NOT NULL,
	bno INTEGER,
	CONSTRAINT bno_reference_staff FOREIGN KEY (bno) REFERENCES Branch
	ON DELETE CASCADE);

CREATE TABLE Owner(
	ono INTEGER NOT NULL PRIMARY KEY,
	fname VARCHAR2(20) NOT NULL,
	lname VARCHAR2(20) NOT NULL,
	adress VARCHAR2(30) NOT NULL,
	tel_no VARCHAR2(15) NOT NULL);

CREATE TABLE Property_for_rent (
	pno INTEGER  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	street VARCHAR2(30) NOT NULL,
	city VARCHAR2(30) NOT NULL,
	type CHAR(1) CHECK (type IN('h','f')),
    rooms INTEGER NOT NULL,
	rent INTEGER NOT NULL,
	ono INTEGER,
	sno INTEGER,
	bno INTEGER,
	CONSTRAINT ono_reference FOREIGN KEY (ono) REFERENCES Owner ON DELETE CASCADE,
	CONSTRAINT sno_reference FOREIGN KEY (sno) REFERENCES Staff ON DELETE CASCADE,
	CONSTRAINT bno_reference_property FOREIGN KEY (bno) REFERENCES Branch ON DELETE CASCADE);

CREATE TABLE Renter(
	rno INTEGER  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	fname VARCHAR2(20) NOT NULL,
	lname VARCHAR2(20) NOT NULL,
	adress VARCHAR2(30) NOT NULL,
    tel_no VARCHAR2(15) NOT NULL,
    pref_type CHAR(1) CHECK (pref_type IN('h','f')),
	max_rent INTEGER NOT NULL,
	bno INTEGER,
	CONSTRAINT bno_reference_renter FOREIGN KEY (bno) REFERENCES Branch ON DELETE CASCADE);

CREATE TABLE Viewing(
	rno INTEGER,
	pno INTEGER,
	date_o date NOT NULL,
	comment_o VARCHAR2(100) NOT NULL,
	CONSTRAINT rno_reference_viewing FOREIGN KEY (rno) REFERENCES Renter,
	CONSTRAINT pno_reference_viewing FOREIGN KEY (pno) REFERENCES Property_for_rent,
	PRIMARY KEY (rno,pno));

-- creating synonym

CREATE SYNONYM objects FOR Property_for_rent;

-- iserting into Branch

insert into Branch (street, city, tel_no) values ('Hollow Ridge', 'Miaoqian', '628-462-1173');
insert into Branch (street, city, tel_no) values ('Columbus', 'Pak Chom', '134-243-6470');
insert into Branch (street, city, tel_no) values ('Buell', 'Sanbao', '794-518-9616');
insert into Branch (street, city, tel_no) values ('Rockefeller', 'Providencia', '691-235-7122');
insert into Branch (street, city, tel_no) values ('Kropf', 'Vicente Guerrero', '311-837-9709');
insert into Branch (street, city, tel_no) values ('Quincy', 'Wasquehal', '939-768-5728');
insert into Branch (street, city, tel_no) values ('Arapahoe', 'Lethbridge', '504-938-5395');
insert into Branch (street, city, tel_no) values ('Bluejay', 'Ampelgading', '311-677-2666');
insert into Branch (street, city, tel_no) values ('Westridge', 'Stockholm', '461-136-9406');
insert into Branch (street, city, tel_no) values ('Wayridge', 'Sharkawshchyna', '113-311-0198');
insert into Branch (street, city, tel_no) values ('Ludington', 'Washington', '202-550-5485');
insert into Branch (street, city, tel_no) values ('Briar Crest', 'Mompach', '827-340-4508');
insert into Branch (street, city, tel_no) values ('Mockingbird', 'Santa Barbara', '137-493-4842');
insert into Branch (street, city, tel_no) values ('4th', 'Jihui', '754-197-5897');
insert into Branch (street, city, tel_no) values ('Northport', 'Contagem', '755-289-0256');
insert into Branch (street, city, tel_no) values ('5th', 'Dhuusamarreeb', '993-659-2836');
insert into Branch (street, city, tel_no) values ('5th', 'Bawshar', '954-187-4706');
insert into Branch (street, city, tel_no) values ('Victoria', 'Ketian', '705-391-9468');
insert into Branch (street, city, tel_no) values ('Erie', 'Kafr Dan', '569-564-8588');
insert into Branch (street, city, tel_no) values ('Randy', 'Tyoply Stan', '587-340-7613');
insert into Branch (street, city, tel_no) values ('5th', 'Diez de Octubre', '404-549-3861');
insert into Branch (street, city, tel_no) values ('Bobwhite', 'Parang', '126-385-4715');
insert into Branch (street, city, tel_no) values ('Evergreen', 'Tandel', '472-455-4683');
insert into Branch (street, city, tel_no) values ('Cambridge', 'Logovskoye', '203-632-4708');
insert into Branch (street, city, tel_no) values ('Sutherland', 'Panao', '689-484-8770');
insert into Branch (street, city, tel_no) values ('Springs', 'Camindangan', '508-135-9567');
insert into Branch (street, city, tel_no) values ('Express', 'Xinfeng', '831-540-1800');
insert into Branch (street, city, tel_no) values ('Bartillon', 'Marisgama', '376-451-6763');
insert into Branch (street, city, tel_no) values ('Corben', 'Murillo', '499-727-5967');
insert into Branch (street, city, tel_no) values ('Drewry', 'Cipaku', '794-204-9733');
insert into Branch (street, city, tel_no) values ('Colorado', 'Rendui', '485-360-7449');
insert into Branch (street, city, tel_no) values ('Redwing', 'Vinh Tu?ng', '583-820-9638');
insert into Branch (street, city, tel_no) values ('Mariners Cove', 'Cincinnati', '513-308-1718');
insert into Branch (street, city, tel_no) values ('Manitowish', 'Miedzyzdroje', '911-780-7872');
insert into Branch (street, city, tel_no) values ('Warbler', 'Mafa', '264-693-5696');
insert into Branch (street, city, tel_no) values ('Del Mar', 'Igunga', '295-465-3600');
insert into Branch (street, city, tel_no) values ('Monica', 'Maisons-Alfort', '961-491-2713');
insert into Branch (street, city, tel_no) values ('Donald', 'Sundsvall', '522-488-4509');
insert into Branch (street, city, tel_no) values ('Dryden', 'Askiz', '626-791-8553');
insert into Branch (street, city, tel_no) values ('Continental', 'Lindesberg', '838-997-7772');
insert into Branch (street, city, tel_no) values ('Express', 'Vratsa', '466-808-2994');
insert into Branch (street, city, tel_no) values ('Warrior', 'Trieste', '477-493-0968');
insert into Branch (street, city, tel_no) values ('Darwin', 'Novoaleksandrovsk', '509-923-4096');
insert into Branch (street, city, tel_no) values ('Summer Ridge', 'Ljungskile', '810-430-7812');
insert into Branch (street, city, tel_no) values ('Bonner', 'Ninove', '507-224-9939');
insert into Branch (street, city, tel_no) values ('Sunfield', 'Penambangan', '631-373-4597');
insert into Branch (street, city, tel_no) values ('Stoughton', 'Beiqiao', '343-627-2327');
insert into Branch (street, city, tel_no) values ('Red Cloud', 'Nkhotakota', '748-768-4897');
insert into Branch (street, city, tel_no) values ('Lotheville', 'Qaryat al Qabil', '836-405-1237');
insert into Branch (street, city, tel_no) values ('Upham', 'Nanjie', '706-327-5662');
insert into Branch (street, city, tel_no) values ('Cherokee', 'Johor Bahru', '107-928-9332');
insert into Branch (street, city, tel_no) values ('Hazelcrest', 'Minyue', '996-535-8050');
insert into Branch (street, city, tel_no) values ('Toban', 'Hoshigiyn-Ar', '132-376-0479');
insert into Branch (street, city, tel_no) values ('Huxley', 'Delod Pangkung', '142-802-2003');
insert into Branch (street, city, tel_no) values ('Schurz', 'Lianokladhion', '808-995-2874');
insert into Branch (street, city, tel_no) values ('Tony', 'Utarapasar', '568-438-9529');
insert into Branch (street, city, tel_no) values ('Moose', 'Bureya', '889-827-4952');
insert into Branch (street, city, tel_no) values ('Oak Valley', 'Bakov nad Jizerou', '380-930-2762');
insert into Branch (street, city, tel_no) values ('Brentwood', 'Babug', '330-200-8064');
insert into Branch (street, city, tel_no) values ('Mayer', 'Obrsani', '887-986-3674');
insert into Branch (street, city, tel_no) values ('Hazelcrest', 'Cikujang', '817-321-0467');
insert into Branch (street, city, tel_no) values ('Trailsway', 'Beidao', '964-643-0689');
insert into Branch (street, city, tel_no) values ('Scoville', 'Faeanak Dua', '532-486-8946');
insert into Branch (street, city, tel_no) values ('Summer Ridge', 'Brest', '809-988-3181');
insert into Branch (street, city, tel_no) values ('2nd', 'Ouro Branco', '419-918-5832');
insert into Branch (street, city, tel_no) values ('Florence', 'La Habana Vieja', '635-767-7365');
insert into Branch (street, city, tel_no) values ('Hayes', 'Temizhbekskaya', '421-263-3287');
insert into Branch (street, city, tel_no) values ('Boyd', 'Hyrynsalmi', '665-480-7257');
insert into Branch (street, city, tel_no) values ('Morning', 'Negararatu', '119-976-8053');
insert into Branch (street, city, tel_no) values ('Spohn', 'Cuijiaqiao', '273-292-5209');
insert into Branch (street, city, tel_no) values ('David', 'Barrio San Luis', '259-794-3823');
insert into Branch (street, city, tel_no) values ('Summer Ridge', 'Dzialdowo', '818-444-2245');
insert into Branch (street, city, tel_no) values ('Crowley', 'Santa Helena', '950-891-3473');
insert into Branch (street, city, tel_no) values ('Petterle', 'Kihancha', '298-573-0395');
insert into Branch (street, city, tel_no) values ('Sommers', 'Hostka', '730-623-2892');
insert into Branch (street, city, tel_no) values ('David', 'Xinzhou', '367-743-4871');
insert into Branch (street, city, tel_no) values ('Quincy', 'Pohang', '159-954-1374');
insert into Branch (street, city, tel_no) values ('Hauk', 'Waru', '501-474-4102');
insert into Branch (street, city, tel_no) values ('Mayfield', 'Mapiripan', '794-539-7153');
insert into Branch (street, city, tel_no) values ('4th', 'Orzu', '416-142-7922');
insert into Branch (street, city, tel_no) values ('Heffernan', 'Hosteradice', '929-522-7914');
insert into Branch (street, city, tel_no) values ('Cody', 'Lower Hutt', '124-753-0428');
insert into Branch (street, city, tel_no) values ('Rockefeller', 'Puerto La Cruz', '745-107-4274');
insert into Branch (street, city, tel_no) values ('La Follette', 'Daguo', '457-875-4849');
insert into Branch (street, city, tel_no) values ('Stang', 'Bronx', '718-693-0894');
insert into Branch (street, city, tel_no) values ('Arizona', 'Lagasit', '378-987-7150');
insert into Branch (street, city, tel_no) values ('Commercial', 'Qingtaiping', '371-755-8785');
insert into Branch (street, city, tel_no) values ('Little Fleur', 'Paruro', '993-346-6058');
insert into Branch (street, city, tel_no) values ('Eliot', 'Shixiang', '473-684-7657');
insert into Branch (street, city, tel_no) values ('Rusk', 'Dinititi', '530-978-8480');
insert into Branch (street, city, tel_no) values ('Summerview', 'Mississauga', '270-429-3175');
insert into Branch (street, city, tel_no) values ('Vermont', 'Caringin Lor', '481-829-6674');
insert into Branch (street, city, tel_no) values ('Hagan', 'Yako', '692-136-4462');
insert into Branch (street, city, tel_no) values ('Drewry', 'Housuo', '992-786-6172');
insert into Branch (street, city, tel_no) values ('Menomonie', 'Liulihe', '143-873-8047');
insert into Branch (street, city, tel_no) values ('Pierstorff', 'Biting', '641-380-5990');
insert into Branch (street, city, tel_no) values ('Grayhawk', 'Kalia', '102-579-1444');
insert into Branch (street, city, tel_no) values ('Glacier Hill', 'Poitiers', '827-751-2387');
insert into Branch (street, city, tel_no) values ('Lunder', 'Yanghuxiang', '247-324-0394');
insert into Branch (street, city, tel_no) values ('Weeping Birch', 'Frederiksberg', '755-350-8438');

-- iserting into Staff

insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Lyn', 'Darnody', '086 Oakridge Way', '147-159-6497', 'Pharmacist', 'male', '08-Jul-1986', 7064, 10);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Humfried', 'Filppetti', '341 Sutherland Avenue', '402-274-9345', 'Technical Writer', 'male', '08-Mar-1988', 2008, 47);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Corey', 'Heaslip', '42894 Swallow Circle', '163-849-8569', 'Geological Engineer', 'male', '13-Sep-1985', 9379, 4);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Kaiser', 'Kiddey', '7442 Spenser Lane', '538-652-4261', 'Administrative Officer', 'male', '07-Aug-1974', 4670, 45);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Jecho', 'Dooher', '9 Westend Circle', '390-428-2806', 'Budget/Accounting Analyst IV', 'male', '30-Mar-1989', 1015, 93);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Jerald', 'Zavattieri', '6349 Continental Alley', '902-293-8233', 'Software Engineer III', 'male', '14-Feb-1981', 1836, 22);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Moe', 'Sholl', '89332 Fuller Place', '209-179-7372', 'Quality Engineer', 'male', '04-Jan-1990', 5477, 25);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Ulrich', 'Sharphouse', '1 Cordelia Pass', '413-374-1952', 'Legal Assistant', 'male', '04-Dec-1987', 7048, 77);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Cherey', 'McGuiness', '28 Roxbury Way', '141-471-5818', 'Engineer III', 'female', '08-May-2000', 7898, 50);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Florida', 'Epton', '802 Weeping Birch Avenue', '583-561-9209', 'VP Product Management', 'male', '15-May-1969', 253, 97);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Brynne', 'Tynewell', '4542 Holmberg Plaza', '253-698-6958', 'VP Product Management', 'female', '26-Nov-1969', 9853, 91);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Prentice', 'Goodbar', '13 Meadow Valley Junction', '776-679-6586', 'Recruiting Manager', 'male', '17-Sep-1967', 2017, 20);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Ethelyn', 'Hall-Gough', '8724 Banding Parkway', '508-515-6553', 'Design Engineer', 'female', '24-Oct-1998', 9168, 51);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Kristos', 'Dugmore', '30396 Mayer Court', '191-100-6949', 'Design Engineer', 'male', '06-Jul-1980', 9076, 2);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Gabbi', 'Blazejewski', '752 Fairfield Pass', '237-205-4783', 'Senior Sales Associate', 'female', '20-Mar-1996', 9918, 87);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Burlie', 'Vanacci', '345 Petterle Pass', '752-649-9476', 'Assistant Manager', 'female', '04-Jan-1967', 2635, 70);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Matti', 'Coughlin', '64 Schiller Point', '179-725-8736', 'Marketing Assistant', 'male', '05-Jul-1987', 703, 59);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Gale', 'Dyshart', '632 Mandrake Trail', '151-783-6983', 'Business Systems Development Analyst', 'male', '17-Mar-1995', 7704, 23);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Consalve', 'Van Halen', '352 Schiller Road', '319-716-7105', 'Senior Developer', 'male', '06-Nov-1966', 5385, 46);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Giulietta', 'Grew', '41 Mesta Drive', '527-564-3802', 'Registered Nurse', 'male', '18-Oct-1977', 9358, 85);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Ransom', 'Tamblingson', '3 Londonderry Alley', '678-290-4751', 'Legal Assistant', 'male', '11-Jan-1995', 1281, 53);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Mayne', 'Vanni', '559 Carberry Place', '647-702-1617', 'Administrative Officer', 'female', '05-Jun-1986', 5080, 94);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Halli', 'Dutnell', '82117 Steensland Junction', '322-201-8462', 'Analyst Programmer', 'female', '25-Oct-1974', 1865, 97);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Heinrik', 'Cumberlidge', '792 Valley Edge Place', '132-289-1810', 'Community Outreach Specialist', 'female', '16-Sep-1979', 7905, 57);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Eadmund', 'Barus', '7333 Ridgeview Place', '303-105-8579', 'Director of Sales', 'female', '23-Jun-1998', 4769, 41);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Ky', 'Noel', '00969 Logan Alley', '126-929-1376', 'Financial Advisor', 'male', '26-Aug-1983', 7464, 27);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Coreen', 'Baudy', '197 Scoville Lane', '239-634-8767', 'Chemical Engineer', 'female', '04-Feb-1967', 4919, 44);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Jennie', 'Gration', '26 Division Circle', '324-644-2786', 'Systems Administrator III', 'male', '31-Mar-1988', 9754, 90);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Nedi', 'Kear', '616 Bartillon Plaza', '337-437-6073', 'Tax Accountant', 'male', '14-Jan-1998', 4040, 66);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Quincy', 'Giraudat', '3244 Farragut Drive', '354-774-1609', 'Human Resources Assistant IV', 'male', '30-May-1999', 6724, 39);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Pancho', 'Humblestone', '5091 Tennyson Junction', '418-918-3231', 'Environmental Tech', 'male', '07-Mar-1975', 6817, 86);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Nerte', 'Juorio', '2 Helena Alley', '131-712-5072', 'Associate Professor', 'female', '08-May-1998', 3018, 79);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Gerianne', 'Infante', '67222 Acker Parkway', '826-518-9853', 'Account Coordinator', 'female', '06-Nov-1989', 9908, 34);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Elladine', 'Twatt', '328 Moland Way', '654-129-7972', 'Health Coach II', 'male', '05-Jul-1970', 7474, 13);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Augusto', 'Brain', '2669 Novick Crossing', '388-569-9457', 'Dental Hygienist', 'female', '05-Sep-1987', 3969, 48);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Adlai', 'Canellas', '9521 Westerfield Place', '771-728-4241', 'Recruiter', 'female', '05-Sep-1987', 9513, 95);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Traci', 'Fulkes', '43488 Stone Corner Alley', '850-736-6133', 'Chief Design Engineer', 'male', '11-Nov-1996', 9410, 1);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Jacquelynn', 'Lambertson', '45 Brentwood Center', '351-637-5600', 'Actuary', 'male', '29-Mar-1996', 1552, 54);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Mylo', 'Insole', '1 Oneill Parkway', '485-945-4855', 'Sales Representative', 'male', '28-Jun-1983', 8662, 62);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Willabella', 'Burhouse', '95278 Messerschmidt Crossing', '440-639-0602', 'Design Engineer', 'female', '08-Nov-1984', 8182, 86);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Alphard', 'Gooderridge', '3392 Moose Parkway', '830-228-5729', 'Automation Specialist II', 'male', '09-Dec-1966', 4440, 4);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Ferrell', 'Peltz', '107 Sachs Avenue', '870-238-8413', 'Assistant Professor', 'male', '19-Mar-1978', 3896, 86);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Way', 'Urridge', '668 Evergreen Parkway', '638-305-8542', 'Structural Engineer', 'female', '10-Jul-1999', 9359, 100);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Pier', 'Leftly', '39 Karstens Terrace', '132-533-5163', 'Financial Analyst', 'female', '20-Mar-1994', 8725, 86);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Kara-lynn', 'Dawtrey', '6540 Green Ridge Road', '440-841-0779', 'Assistant Professor', 'male', '04-Aug-1998', 82, 40);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Lianna', 'Rowlinson', '7 Emmet Park', '811-598-7014', 'Web Designer III', 'female', '27-May-1998', 1018, 46);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Auroora', 'DelaField', '95104 Hollow Ridge Parkway', '208-609-0799', 'Registered Nurse', 'male', '14-Mar-1999', 3596, 43);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Lombard', 'Moxley', '6906 Donald Road', '605-438-0364', 'Project Manager', 'male', '17-Sep-1980', 2569, 86);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Ely', 'Tallant', '96582 Grasskamp Center', '800-266-0910', 'Nurse Practicioner', 'female', '10-Jun-1990', 4564, 17);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Jamal', 'Cattell', '9700 Ryan Road', '330-370-4084', 'Information Systems Manager', 'female', '03-Nov-1996', 2390, 37);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Alasdair', 'Worsnop', '70 Bay Place', '955-220-1499', 'Director of Sales', 'male', '28-May-1972', 4630, 58);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Peggie', 'Huskinson', '7873 Linden Drive', '701-614-3038', 'Structural Analysis Engineer', 'female', '10-Dec-1998', 7054, 9);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Aguste', 'Papachristophorou', '7558 Vahlen Parkway', '977-788-7353', 'Compensation Analyst', 'male', '14-Aug-1976', 1840, 51);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Oren', 'Crunkhurn', '41 Thackeray Circle', '494-524-4106', 'General Manager', 'female', '15-Feb-1980', 2338, 39);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Audy', 'Leteurtre', '12878 Transport Plaza', '997-851-5263', 'Media Manager IV', 'male', '13-May-1978', 9113, 44);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Else', 'Lesurf', '18495 Commercial Lane', '990-504-6105', 'Assistant Professor', 'male', '28-Feb-1994', 8693, 12);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Charline', 'Hoodless', '4 Mallory Terrace', '115-116-8070', 'Technical Writer', 'male', '22-Mar-1987', 6882, 8);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Christan', 'Stollmeyer', '043 Morning Street', '955-968-8533', 'Junior Executive', 'female', '04-May-1980', 8201, 100);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Martica', 'Bream', '2107 Debra Park', '977-578-5215', 'Biostatistician IV', 'female', '07-Nov-1984', 5785, 91);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Grayce', 'Crathorne', '504 Corry Park', '368-341-7961', 'Help Desk Technician', 'female', '08-May-1967', 829, 22);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Kacey', 'Dyerson', '900 Nevada Crossing', '846-163-3410', 'Analog Circuit Design manager', 'female', '27-Dec-1987', 4639, 33);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Dana', 'Omar', '66486 Graceland Parkway', '394-796-7542', 'Technical Writer', 'female', '27-Aug-1986', 9203, 58);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Margarita', 'Soan', '8775 Menomonie Way', '737-193-4168', 'Tax Accountant', 'male', '06-Jul-1997', 9800, 93);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Lynnea', 'Margaret', '9 Doe Crossing Junction', '913-746-3048', 'Staff Accountant III', 'female', '27-Jan-1998', 2392, 65);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Perry', 'Casarino', '26315 Loomis Pass', '647-400-3115', 'Teacher', 'male', '04-May-1983', 60, 9);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Moria', 'Woodfin', '22528 Amoth Street', '979-740-7953', 'Product Engineer', 'female', '22-Sep-1974', 6863, 5);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Gilbertina', 'Tripon', '57 Cherokee Alley', '366-763-7848', 'Help Desk Technician', 'male', '28-May-1968', 709, 20);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Kira', 'Glasard', '798 Debra Lane', '971-620-5373', 'Account Coordinator', 'male', '07-Aug-1991', 9591, 68);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Dayle', 'Giottini', '0 Dorton Drive', '155-977-3682', 'Automation Specialist II', 'male', '06-Nov-1979', 7141, 63);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Morissa', 'Bindley', '2825 Kensington Parkway', '876-541-6975', 'Executive Secretary', 'female', '05-Nov-1977', 5899, 37);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Ervin', 'Vardie', '5 Milwaukee Court', '546-117-2582', 'Information Systems Manager', 'male', '11-Oct-1976', 4014, 39);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Iolande', 'Battison', '28 South Hill', '817-221-7159', 'Help Desk Technician', 'male', '02-Feb-1983', 8590, 25);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Noella', 'Johnigan', '4 Tony Road', '906-438-1686', 'GIS Technical Architect', 'female', '04-Apr-1976', 790, 9);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Rosemaria', 'Bertomeu', '5009 Marcy Street', '289-297-1241', 'Legal Assistant', 'male', '07-Sep-1998', 7261, 59);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Tove', 'Stutard', '99 Spaight Avenue', '213-186-6894', 'GIS Technical Architect', 'male', '06-Jul-1979', 9357, 18);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Hugh', 'Ritmeyer', '7481 Kinsman Place', '254-110-3676', 'Systems Administrator IV', 'male', '23-Sep-1981', 6150, 61);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Harriett', 'Gayforth', '31 Thompson Drive', '542-738-8576', 'Operator', 'male', '08-Oct-1995', 5321, 95);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Spense', 'Simenon', '546 Brentwood Junction', '151-446-2983', 'Executive Secretary', 'male', '31-Oct-1982', 2582, 77);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Clementius', 'Gallemore', '879 Stephen Terrace', '268-580-2983', 'Human Resources Manager', 'female', '11-Feb-1991', 8328, 68);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Linn', 'Minghella', '7810 Lukken Road', '365-532-0475', 'VP Accounting', 'male', '14-Sep-1979', 4933, 61);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Daniel', 'Beek', '035 Garrison Park', '616-717-8966', 'Chemical Engineer', 'male', '13-Aug-1977', 5296, 44);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Lev', 'Kubach', '27225 Cambridge Crossing', '116-650-1641', 'Physical Therapy Assistant', 'female', '27-Nov-1977', 4253, 68);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Cobbie', 'Leglise', '74 Farragut Center', '117-379-3946', 'Clinical Specialist', 'female', '31-Jul-1992', 5968, 10);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Marve', 'Hazael', '43362 Everett Street', '179-939-1791', 'Actuary', 'male', '28-Apr-1969', 5315, 84);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Cathrine', 'McNysche', '5927 Roxbury Way', '157-764-3434', 'Physical Therapy Assistant', 'male', '13-May-1994', 8363, 83);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Guthrey', 'Shimwell', '10 Summer Ridge Place', '930-926-2536', 'Senior Cost Accountant', 'male', '28-Jun-1973', 9060, 31);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Myrtice', 'McHaffy', '8785 Anniversary Pass', '164-709-3064', 'VP Accounting', 'female', '10-Apr-1992', 1322, 94);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Collin', 'Ormshaw', '45217 Hallows Point', '760-171-9770', 'Physical Therapy Assistant', 'female', '01-Aug-1991', 9726, 90);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Barbe', 'Hritzko', '02 Bartillon Junction', '410-668-6532', 'Analyst Programmer', 'male', '14-Sep-1988', 2987, 34);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Carolynn', 'Maffi', '6846 Homewood Circle', '649-319-8057', 'Actuary', 'male', '18-Dec-1986', 4511, 36);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Craggie', 'Gusticke', '5 Evergreen Street', '478-457-4246', 'Staff Accountant I', 'female', '08-Oct-1977', 5122, 62);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Bengt', 'Windross', '01 Stephen Plaza', '154-601-5920', 'Biostatistician II', 'female', '07-Feb-1990', 5702, 55);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Marta', 'Sweeten', '868 Hoffman Alley', '856-354-7295', 'Sales Representative', 'male', '02-Oct-1974', 1374, 91);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Darren', 'Burditt', '4082 Ronald Regan Parkway', '812-372-5538', 'Compensation Analyst', 'female', '30-Dec-1977', 50, 82);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Saundra', 'Barrowcliffe', '32616 Calypso Pass', '706-132-3466', 'Occupational Therapist', 'male', '28-Sep-1978', 9342, 97);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Dody', 'Earry', '44 Charing Cross Terrace', '740-629-5414', 'Junior Executive', 'female', '21-Sep-1992', 1695, 21);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Toddie', 'Waller', '6 Clove Park', '624-672-5172', 'Financial Advisor', 'male', '20-Sep-1974', 9110, 3);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Bradford', 'Brocklesby', '2 Sauthoff Park', '379-156-4338', 'Senior Quality Engineer', 'female', '15-Nov-1996', 4299, 1);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Manuel', 'Dougherty', '19779 Loftsgordon Crossing', '757-640-6878', 'Human Resources Assistant II', 'male', '09-Mar-1990', 2523, 1);
insert into Staff (fname, lname, adress, tel_no, position, sex, dob, salary, bno) values ('Hedy', 'Pocke', '224 Thackeray Point', '911-415-2155', 'Software Test Engineer I', 'female', '08-Nov-1971', 6310, 40);

-- iserting into Owner

INSERT INTO Owner (ono, fname, lname, adress, tel_no) SELECT sno, fname, lname, adress, tel_no FROM Staff;

insert into Owner (ono, fname, lname, adress, tel_no) values (101, 'Tomaso', 'Draycott', '28 Miller Crossing', '899-173-6109');
insert into Owner (ono, fname, lname, adress, tel_no) values (102, 'Dottie', 'Shiel', '08 Hanover Road', '338-508-4757');
insert into Owner (ono, fname, lname, adress, tel_no) values (103, 'Lelah', 'Byford', '42 Pennsylvania Street', '617-480-3975');
insert into Owner (ono, fname, lname, adress, tel_no) values (104, 'Donna', 'Preator', '53847 Dovetail Road', '159-490-5954');
insert into Owner (ono, fname, lname, adress, tel_no) values (105, 'Shem', 'Ruck', '891 Village Pass', '904-198-7853');
insert into Owner (ono, fname, lname, adress, tel_no) values (106, 'Jethro', 'Bosche', '18819 Riverside Drive', '922-889-9272');
insert into Owner (ono, fname, lname, adress, tel_no) values (107, 'Read', 'Eilhertsen', '59728 Sage Alley', '352-901-2386');
insert into Owner (ono, fname, lname, adress, tel_no) values (108, 'Nathan', 'Tomkys', '93009 5th Terrace', '408-836-3642');
insert into Owner (ono, fname, lname, adress, tel_no) values (109, 'Ettie', 'Aluard', '1841 Express Hill', '746-431-9958');
insert into Owner (ono, fname, lname, adress, tel_no) values (110, 'Cheryl', 'Molesworth', '3 Forest Drive', '168-780-9123');
insert into Owner (ono, fname, lname, adress, tel_no) values (111, 'Cyrillus', 'Rawlcliffe', '1783 Eggendart Point', '402-789-4423');
insert into Owner (ono, fname, lname, adress, tel_no) values (112, 'Aldus', 'Bartolomeu', '8423 Jenna Drive', '382-617-3388');
insert into Owner (ono, fname, lname, adress, tel_no) values (113, 'Selia', 'Spiniello', '92109 Harper Hill', '475-971-5481');
insert into Owner (ono, fname, lname, adress, tel_no) values (114, 'Beret', 'Blakes', '9432 Ryan Pass', '345-516-0430');
insert into Owner (ono, fname, lname, adress, tel_no) values (115, 'Liam', 'Bonnette', '01 Warrior Parkway', '293-726-6466');
insert into Owner (ono, fname, lname, adress, tel_no) values (116, 'Raddy', 'Rodders', '800 Maywood Way', '239-382-3371');
insert into Owner (ono, fname, lname, adress, tel_no) values (117, 'Wanda', 'MacAnelley', '5 Larry Circle', '670-458-2425');
insert into Owner (ono, fname, lname, adress, tel_no) values (118, 'Tamma', 'Coale', '712 Waubesa Place', '977-224-4762');
insert into Owner (ono, fname, lname, adress, tel_no) values (119, 'Karalee', 'Gress', '57015 Vahlen Junction', '440-652-2334');
insert into Owner (ono, fname, lname, adress, tel_no) values (120, 'Ragnar', 'Gonin', '6 Swallow Court', '755-164-0690');
insert into Owner (ono, fname, lname, adress, tel_no) values (121, 'Janel', 'Stillwell', '109 Valley Edge Drive', '464-758-4180');
insert into Owner (ono, fname, lname, adress, tel_no) values (122, 'Benoite', 'Manser', '8075 Mallard Plaza', '352-796-0473');
insert into Owner (ono, fname, lname, adress, tel_no) values (123, 'Dillie', 'Witton', '70 Nevada Plaza', '930-313-9617');
insert into Owner (ono, fname, lname, adress, tel_no) values (124, 'Raphaela', 'Parramore', '2711 Basil Park', '886-951-1428');
insert into Owner (ono, fname, lname, adress, tel_no) values (125, 'Kristel', 'Tomowicz', '19 Pawling Pass', '229-941-5370');
insert into Owner (ono, fname, lname, adress, tel_no) values (126, 'Sawyere', 'Duplock', '36315 David Avenue', '573-819-5322');
insert into Owner (ono, fname, lname, adress, tel_no) values (127, 'Bogey', 'Witsey', '0 Ohio Trail', '636-555-8290');
insert into Owner (ono, fname, lname, adress, tel_no) values (128, 'Frasco', 'Errett', '0 Del Sol Avenue', '692-484-8445');
insert into Owner (ono, fname, lname, adress, tel_no) values (129, 'Britt', 'Langrick', '080 Lighthouse Bay Park', '662-356-6125');
insert into Owner (ono, fname, lname, adress, tel_no) values (130, 'Deerdre', 'Yerlett', '04464 Fieldstone Avenue', '443-761-3758');
insert into Owner (ono, fname, lname, adress, tel_no) values (131, 'Jacki', 'Twelves', '509 Chinook Place', '902-676-5984');
insert into Owner (ono, fname, lname, adress, tel_no) values (132, 'Corbett', 'Brinsford', '9453 Westerfield Circle', '914-788-7916');
insert into Owner (ono, fname, lname, adress, tel_no) values (133, 'Blondell', 'Comar', '4 Rowland Center', '653-786-4861');
insert into Owner (ono, fname, lname, adress, tel_no) values (134, 'Cherlyn', 'Brundle', '04389 Troy Park', '704-933-4871');
insert into Owner (ono, fname, lname, adress, tel_no) values (135, 'Josh', 'Narbett', '1253 Express Plaza', '362-296-1700');
insert into Owner (ono, fname, lname, adress, tel_no) values (136, 'Corbett', 'Frankema', '9 Portage Road', '759-281-1273');
insert into Owner (ono, fname, lname, adress, tel_no) values (137, 'Sydney', 'Elsley', '5 Forest Run Alley', '400-345-2527');
insert into Owner (ono, fname, lname, adress, tel_no) values (138, 'Alisander', 'Pressdee', '61 Gulseth Junction', '962-291-6586');
insert into Owner (ono, fname, lname, adress, tel_no) values (139, 'Christean', 'Passingham', '014 Crescent Oaks Parkway', '106-965-4484');
insert into Owner (ono, fname, lname, adress, tel_no) values (140, 'Barny', 'Woolcocks', '18 Miller Lane', '864-533-6196');
insert into Owner (ono, fname, lname, adress, tel_no) values (141, 'Ase', 'Darridon', '416 Tennyson Way', '350-791-7635');
insert into Owner (ono, fname, lname, adress, tel_no) values (142, 'Noel', 'Tull', '59994 Kennedy Center', '864-686-6451');
insert into Owner (ono, fname, lname, adress, tel_no) values (143, 'Ann-marie', 'Swaby', '36209 Marquette Center', '716-138-8301');
insert into Owner (ono, fname, lname, adress, tel_no) values (144, 'Marianna', 'Coppens', '6743 Lakewood Gardens Junction', '717-426-6863');
insert into Owner (ono, fname, lname, adress, tel_no) values (145, 'Karna', 'Poundsford', '0 Dixon Hill', '943-481-4989');
insert into Owner (ono, fname, lname, adress, tel_no) values (146, 'Dell', 'Dignon', '8732 Truax Place', '119-299-4074');
insert into Owner (ono, fname, lname, adress, tel_no) values (147, 'Faulkner', 'Busson', '6883 Amoth Avenue', '311-683-0637');
insert into Owner (ono, fname, lname, adress, tel_no) values (148, 'Petr', 'Dalloway', '1 3rd Road', '422-125-4968');
insert into Owner (ono, fname, lname, adress, tel_no) values (149, 'Lorna', 'Bridle', '31 Rigney Court', '318-713-2041');
insert into Owner (ono, fname, lname, adress, tel_no) values (150, 'Lorrie', 'Forst', '7948 Troy Circle', '888-150-8673');
insert into Owner (ono, fname, lname, adress, tel_no) values (151, 'Carlyn', 'Kalvin', '13953 Sherman Pass', '304-987-6921');
insert into Owner (ono, fname, lname, adress, tel_no) values (152, 'Larisa', 'Selesnick', '94902 Summer Ridge Park', '971-432-8494');
insert into Owner (ono, fname, lname, adress, tel_no) values (153, 'Berton', 'Pickston', '6964 Bartelt Street', '813-395-7391');
insert into Owner (ono, fname, lname, adress, tel_no) values (154, 'Clemmie', 'Lymer', '0097 Sunfield Plaza', '403-609-3372');
insert into Owner (ono, fname, lname, adress, tel_no) values (155, 'Stavro', 'Sharple', '0159 Westport Road', '420-419-7243');
insert into Owner (ono, fname, lname, adress, tel_no) values (156, 'Felicio', 'Laverack', '34301 5th Street', '818-201-0620');
insert into Owner (ono, fname, lname, adress, tel_no) values (157, 'Renell', 'Whiteside', '1 Anderson Pass', '613-175-5526');
insert into Owner (ono, fname, lname, adress, tel_no) values (158, 'Adey', 'Mosson', '7 Corry Center', '219-324-0541');
insert into Owner (ono, fname, lname, adress, tel_no) values (159, 'Maure', 'Wilcox', '92 Comanche Point', '823-141-2580');
insert into Owner (ono, fname, lname, adress, tel_no) values (160, 'Manon', 'Izakovitz', '7596 Dunning Circle', '561-402-6752');
insert into Owner (ono, fname, lname, adress, tel_no) values (161, 'Deborah', 'Brannan', '0 Starling Road', '789-604-9006');
insert into Owner (ono, fname, lname, adress, tel_no) values (162, 'Christy', 'Schruur', '6657 Morningstar Drive', '469-956-4630');
insert into Owner (ono, fname, lname, adress, tel_no) values (163, 'Larina', 'Wolfinger', '9554 Maple Wood Center', '861-338-8834');
insert into Owner (ono, fname, lname, adress, tel_no) values (164, 'Dareen', 'Tal', '33553 Dorton Hill', '829-468-0405');
insert into Owner (ono, fname, lname, adress, tel_no) values (165, 'Rosalyn', 'Fallowfield', '888 Shasta Pass', '933-574-9037');
insert into Owner (ono, fname, lname, adress, tel_no) values (166, 'Sheelah', 'Cornick', '7 Karstens Terrace', '838-190-9578');
insert into Owner (ono, fname, lname, adress, tel_no) values (167, 'Yolanthe', 'Skakunas', '36 Miller Junction', '632-435-2478');
insert into Owner (ono, fname, lname, adress, tel_no) values (168, 'Gabbey', 'Henningham', '95 Meadow Vale Court', '163-395-4479');
insert into Owner (ono, fname, lname, adress, tel_no) values (169, 'Nicolas', 'Reily', '338 Larry Parkway', '831-347-1853');
insert into Owner (ono, fname, lname, adress, tel_no) values (170, 'Marco', 'Gumley', '93882 Eggendart Lane', '741-216-1493');
insert into Owner (ono, fname, lname, adress, tel_no) values (171, 'Karlan', 'Boneham', '77 Melody Road', '198-887-8857');
insert into Owner (ono, fname, lname, adress, tel_no) values (172, 'Dianna', 'Pycock', '43 Eggendart Court', '421-258-9361');
insert into Owner (ono, fname, lname, adress, tel_no) values (173, 'Maynard', 'Biffen', '1091 Evergreen Hill', '160-200-9129');
insert into Owner (ono, fname, lname, adress, tel_no) values (174, 'Arron', 'Tart', '5 Forest Plaza', '302-820-3175');
insert into Owner (ono, fname, lname, adress, tel_no) values (175, 'Cristy', 'Waghorn', '541 Nova Center', '766-752-5284');
insert into Owner (ono, fname, lname, adress, tel_no) values (176, 'Guenna', 'Calliss', '89954 Mifflin Junction', '290-980-9447');
insert into Owner (ono, fname, lname, adress, tel_no) values (177, 'Estelle', 'Cran', '044 Mockingbird Alley', '121-790-6108');
insert into Owner (ono, fname, lname, adress, tel_no) values (178, 'Gradeigh', 'Paula', '4531 Little Fleur Pass', '773-103-7228');
insert into Owner (ono, fname, lname, adress, tel_no) values (179, 'Baryram', 'Gleed', '019 Corscot Hill', '906-697-0528');
insert into Owner (ono, fname, lname, adress, tel_no) values (180, 'Rossy', 'Eldrett', '855 Oak Plaza', '498-449-7880');
insert into Owner (ono, fname, lname, adress, tel_no) values (181, 'Ingaberg', 'Mayger', '21 Carioca Avenue', '121-328-3014');
insert into Owner (ono, fname, lname, adress, tel_no) values (182, 'Leontine', 'Davenport', '9 Oneill Alley', '357-344-8322');
insert into Owner (ono, fname, lname, adress, tel_no) values (183, 'Rhody', 'Counihan', '05 Pawling Pass', '112-408-5525');
insert into Owner (ono, fname, lname, adress, tel_no) values (184, 'Tallie', 'Braithwait', '12 Schiller Street', '649-573-3076');
insert into Owner (ono, fname, lname, adress, tel_no) values (185, 'Saxon', 'Aughton', '5234 Fair Oaks Terrace', '935-756-8132');
insert into Owner (ono, fname, lname, adress, tel_no) values (186, 'Luis', 'Sunman', '0 Comanche Hill', '739-554-0610');
insert into Owner (ono, fname, lname, adress, tel_no) values (187, 'Marin', 'Boggs', '32 Buena Vista Circle', '765-490-8966');
insert into Owner (ono, fname, lname, adress, tel_no) values (188, 'Eddie', 'Kleinbaum', '9 Roth Pass', '770-621-0996');
insert into Owner (ono, fname, lname, adress, tel_no) values (189, 'Moishe', 'Letrange', '15423 Green Ridge Hill', '362-584-5016');
insert into Owner (ono, fname, lname, adress, tel_no) values (190, 'Diarmid', 'Mains', '5 Dunning Park', '497-789-7656');
insert into Owner (ono, fname, lname, adress, tel_no) values (191, 'Tobiah', 'Stickles', '5 Melby Circle', '455-966-6382');
insert into Owner (ono, fname, lname, adress, tel_no) values (192, 'Roseanne', 'Golling', '8123 Michigan Circle', '416-423-0989');
insert into Owner (ono, fname, lname, adress, tel_no) values (193, 'Chick', 'Mariyushkin', '048 Merchant Drive', '119-736-2191');
insert into Owner (ono, fname, lname, adress, tel_no) values (194, 'Nevins', 'Boodell', '2 Crownhardt Crossing', '374-929-0747');
insert into Owner (ono, fname, lname, adress, tel_no) values (195, 'Krisha', 'Blindermann', '4103 Nova Plaza', '725-719-1558');
insert into Owner (ono, fname, lname, adress, tel_no) values (196, 'Town', 'Tabary', '52096 Meadow Valley Crossing', '716-325-6170');
insert into Owner (ono, fname, lname, adress, tel_no) values (197, 'Murielle', 'McGiff', '83 Prairie Rose Park', '974-412-7536');
insert into Owner (ono, fname, lname, adress, tel_no) values (198, 'Sandra', 'Orme', '4643 Spenser Plaza', '938-138-2089');
insert into Owner (ono, fname, lname, adress, tel_no) values (199, 'Kinsley', 'Blowes', '43 Truax Junction', '152-668-7310');
insert into Owner (ono, fname, lname, adress, tel_no) values (200, 'Berty', 'Soppit', '47 Ridgeway Street', '888-112-9178');


-- iserting into Property_for_rent

insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('80 Glendale Trail', 'Guangang', 'h', 10, 18681, 36, 88, 49);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('33 Susan Street', 'Madaba', 'f', 9, 99710, 62, 38, 19);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('41 Veith Court', 'Ruoqiang', 'f', 10, 24012, 86, 17, 2);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('58189 Pleasure Crossing', 'Timrat', 'h', 1, 22662, 91, 92, 68);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('219 Ramsey Avenue', 'Ni’ao', 'f', 6, 6068, 24, 3, 15);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('47 Welch Court', 'Santa Cruz del Quiche', 'f', 9, 11225, 14, 16, 52);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('58 Fordem Way', 'Hats’avan', 'f', 1, 69228, 19, 46, 100);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('7757 Fulton Terrace', 'Nicosia', 'f', 1, 30200, 32, 19, 12);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('8 Crest Line Court', 'Trikeri', 'h', 9, 77202, 93, 37, 13);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('0 Jay Avenue', 'Konstantynow', 'f', 9, 34856, 12, 95, 48);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('4631 Mockingbird Pass', 'Dancheng', 'f', 9, 55686, 99, 2, 19);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('5 Vermont Plaza', 'Yirga ‘Alem', 'h', 3, 73744, 21, 38, 7);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('1 Westend Way', 'Taby', 'h', 2, 98104, 99, 97, 90);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('10625 Del Mar Park', 'Guanajuato', 'f', 1, 28429, 62, 25, 52);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('53 Russell Pass', 'Orebro', 'h', 8, 58615, 33, 92, 84);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('1268 Longview Circle', 'Acheritou', 'f', 10, 17377, 16, 83, 61);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('8230 Badeau Court', 'Marmashen', 'h', 10, 84239, 40, 74, 76);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('07 Artisan Trail', 'Tyshkivka', 'h', 9, 19090, 68, 21, 56);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('1920 Corben Pass', 'Nizhnyaya Salda', 'f', 3, 43854, 75, 15, 19);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('54 Drewry Park', 'Barubandung', 'h', 8, 74835, 25, 0, 96);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('08523 Scofield Point', 'Badou', 'f', 4, 71291, 76, 64, 30);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('9 Waywood Terrace', 'San Pedro', 'f', 5, 64257, 45, 69, 87);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('175 Heffernan Street', 'Pantenan', 'f', 8, 39185, 74, 30, 82);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('214 Clove Plaza', 'Slobozia', 'h', 8, 83482, 23, 90, 53);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('12 Surrey Junction', 'Calangain', 'f', 4, 40320, 89, 52, 7);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('3353 Dakota Plaza', 'Kamenskiy', 'h', 2, 95537, 19, 78, 78);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('5 Heffernan Place', 'Ponta do Sol', 'f', 8, 69698, 72, 12, 33);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('99184 Sloan Road', 'Sherpur', 'h', 7, 58946, 78, 63, 39);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('1 Lillian Parkway', 'Bretana', 'h', 2, 21738, 90, 37, 36);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('1 Lake View Hill', 'Argenteuil', 'f', 2, 4970, 52, 30, 28);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('3774 Shasta Parkway', 'Changwon', 'f', 5, 53589, 85, 87, 68);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('290 Butternut Terrace', 'Warung Wetan', 'f', 7, 55198, 10, 17, 99);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('11459 Shelley Center', 'Ballyjamesduff', 'f', 3, 17688, 60, 76, 59);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('6 Roth Center', 'Mainri', 'h', 1, 96894, 35, 53, 95);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('67193 Magdeline Parkway', 'San Agustin', 'h', 6, 17780, 13, 47, 16);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('5 Bartelt Avenue', 'Kendari', 'h', 5, 53832, 75, 65, 100);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('7125 Lake View Place', 'Veiga', 'f', 1, 45614, 22, 52, 45);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('17 Dixon Parkway', 'Faaa', 'h', 1, 84663, 29, 3, 36);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('270 Cherokee Road', 'Zhaoyuan', 'h', 3, 60159, 23, 16, 29);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('13101 Vermont Trail', 'Nurmijarvi', 'h', 2, 43790, 24, 47, 30);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('4791 Knutson Court', 'Lordelo', 'h', 2, 25519, 85, 2, 71);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('72659 Boyd Hill', 'Rizomilos', 'h', 6, 72310, 35, 100, 55);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('2 Monument Place', 'Dabat', 'h', 2, 21238, 83, 99, 93);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('8067 Arkansas Way', 'Karbinci', 'h', 1, 97570, 77, 58, 74);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('18 Bartillon Lane', 'San Martin', 'h', 4, 7379, 73, 96, 30);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('24 Rowland Place', 'Opuzen', 'h', 10, 88311, 61, 96, 76);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('1 John Wall Point', 'Lokolande', 'h', 8, 43319, 98, 62, 6);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('9371 Nova Terrace', 'Bojszowy Nowe', 'h', 10, 64296, 1, 9, 47);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('64 Del Mar Center', 'Las Vegas', 'h', 6, 65906, 91, 9, 57);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('1 Debs Plaza', 'Sarandi', 'h', 3, 13496, 1, 22, 24);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('046 Karstens Circle', 'Golmud', 'h', 5, 24758, 53, 9, 90);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('325 Sachs Alley', 'Baita', 'h', 5, 30837, 18, 30, 35);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('52 Florence Parkway', 'Santa Tecla', 'h', 6, 19658, 40, 60, 21);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('4126 Anzinger Crossing', 'Barao de Cocais', 'h', 4, 13613, 97, 35, 34);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('6089 Talmadge Plaza', 'Shuitianzhuang', 'h', 9, 47561, 32, 73, 20);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('054 Esch Crossing', 'Ariguani', 'h', 9, 30291, 48, 71, 61);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('5 Maywood Alley', 'Ar Rahad', 'h', 4, 91088, 4, 88, 86);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('31759 Gateway Center', 'Caen', 'h', 7, 24479, 84, 0, 18);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('690 Fisk Road', 'Tazemmourt', 'h', 9, 72528, 24, 70, 38);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('659 Lotheville Alley', 'Shenglilu', 'h', 10, 42259, 79, 35, 75);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('60 Lighthouse Bay Terrace', 'Pirassununga', 'h', 5, 94399, 41, 69, 98);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('59 Scott Crossing', 'Hukvaldy', 'h', 5, 29923, 10, 11, 39);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('38 Armistice Hill', 'Fukuroi', 'h', 7, 91274, 6, 88, 55);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('48 Lunder Plaza', 'Jelcz', 'h', 6, 13457, 80, 84, 37);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('19 Moulton Terrace', 'Rossosh’', 'h', 2, 60888, 99, 86, 74);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('48551 Dexter Alley', 'Bor', 'h', 5, 83391, 13, 31, 14);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('0 Katie Avenue', 'Sousa', 'h', 1, 49610, 20, 5, 61);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('2002 Lakeland Lane', 'Matamey', 'h', 9, 46129, 69, 95, 51);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('35859 Del Sol Street', 'Kulase', 'h', 5, 77788, 1, 67, 23);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('830 Crescent Oaks Junction', 'Malabugas', 'h', 8, 81423, 69, 70, 69);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('4 Coolidge Avenue', 'Grand Junction', 'h', 4, 9169, 20, 69, 62);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('2 Ramsey Circle', 'Delgerhaan', 'h', 3, 94078, 85, 89, 73);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('591 Cottonwood Alley', 'Ermelo', 'h', 9, 80027, 7, 52, 9);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('0 Twin Pines Parkway', 'Qiqin', 'h', 10, 69610, 81, 30, 86);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('4554 Clyde Gallagher Road', 'Sinarbakti', 'h', 9, 81661, 56, 57, 56);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('8 Chinook Way', 'San Jose Village', 'h', 5, 16505, 77, 68, 54);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('907 Lillian Road', 'Pondaguitan', 'h', 6, 23167, 68, 11, 28);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('8952 Harper Court', 'Iberia', 'h', 3, 32259, 13, 93, 31);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('4467 Fulton Center', 'Polyarnyy', 'h', 7, 962, 90, 24, 83);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('7 Ilene Center', 'Riachao do Jacuipe', 'h', 1, 72859, 87, 14, 86);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('93708 Forster Lane', 'Shanga', 'h', 10, 88938, 40, 54, 43);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('4354 Victoria Terrace', 'Hebu', 'h', 9, 77782, 33, 70, 14);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('03074 Shopko Crossing', 'Lingshan', 'h', 3, 22331, 95, 7, 65);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('01 1st Circle', 'Da B?c', 'h', 1, 71586, 86, 84, 48);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('9 Lunder Lane', 'Russkiy', 'h', 4, 64574, 86, 38, 99);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('124 Butterfield Circle', 'Springfield', 'h', 4, 42433, 26, 51, 80);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('2 Superior Junction', 'Colon', 'h', 7, 14899, 77, 84, 51);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('0 Carberry Circle', 'Xiangfu', 'h', 9, 52736, 2, 69, 16);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('788 Ryan Hill', 'Is', 'h', 6, 96392, 79, 78, 60);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('82206 Beilfuss Place', 'Kavadarci', 'h', 1, 46025, 17, 42, 33);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('7315 Rutledge Plaza', 'Liupai', 'h', 1, 69751, 57, 75, 65);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('462 Crest Line Point', 'Aioi', 'h', 3, 65195, 99, 9, 53);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('08897 Petterle Plaza', 'E’zhou', 'h', 6, 55174, 29, 54, 3);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('14826 Macpherson Street', 'Laingsburg', 'h', 4, 28397, 15, 91, 93);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('210 Hayes Street', 'Zolotyy Potik', 'h', 7, 96004, 29, 7, 9);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('081 Northridge Junction', 'Nor Yerznka', 'h', 1, 47790, 94, 3, 78);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('48558 Southridge Alley', 'Ar Ruways', 'h', 7, 89201, 78, 44, 40);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('26 Carioca Point', 'Las Tunas', 'h', 3, 22415, 64, 33, 9);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('50 Larry Court', 'Sagrada Familia', 'h', 9, 39683, 88, 43, 98);
insert into objects (street, city, type, rooms, rent, bno, sno, ono) values ('25 Twin Pines Street', 'Na Yung', 'h', 3, 86073, 46, 18, 51);

-- iserting into Renter

insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Carissa', 'Rubinsohn', '430 Arkansas Drive', '328-703-2321', 'h', 10995, 61);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Andi', 'Lindwasser', '43 Lukken Alley', '231-609-7795', 'h', 33281, 83);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Esmaria', 'Fernant', '90255 Bultman Terrace', '927-888-8680', 'h', 98785, 91);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Frederick', 'Duckering', '54583 Macpherson Center', '650-492-1397', 'h', 523, 45);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Javier', 'Crotch', '5 Towne Circle', '516-330-7540', 'h', 47289, 61);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Jaime', 'Fitzsymons', '02 Anthes Crossing', '682-208-4545', 'h', 23188, 15);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Blinni', 'Lince', '25 Sunnyside Street', '132-986-8542', 'h', 49365, 49);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Vale', 'Mesias', '324 Meadow Valley Alley', '533-997-4497', 'h', 34523, 64);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Tull', 'Abrahams', '71 Mcbride Street', '507-602-8838', 'h', 84514, 22);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Trixy', 'Cheese', '75 Ronald Regan Alley', '491-635-1980', 'h', 51137, 45);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Dugald', 'Whisker', '79733 Talisman Drive', '759-166-0477', 'h', 20481, 1);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Janka', 'Birchwood', '51 Sunbrook Park', '550-275-3405', 'h', 21345, 75);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Alejandro', 'Lohrensen', '40 Beilfuss Drive', '241-429-2991', 'h', 4763, 9);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Emelita', 'Aldwick', '8694 Delladonna Drive', '905-808-5614', 'h', 68273, 6);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Glori', 'Franceschino', '7 Pepper Wood Hill', '867-645-9804', 'h', 98728, 19);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Bartram', 'Gilchriest', '639 Schiller Junction', '864-958-9541', 'h', 17692, 52);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Leesa', 'Soper', '2260 Independence Court', '277-732-0399', 'h', 23029, 30);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Giuseppe', 'Bolesma', '4 Hoard Plaza', '807-827-2387', 'h', 42457, 22);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Olga', 'Hutt', '6704 Hallows Center', '657-915-8762', 'h', 57293, 73);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Garv', 'Cristou', '50323 Menomonie Pass', '947-357-2587', 'h', 27005, 35);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Shandy', 'Kindell', '68 Harbort Lane', '755-448-2968', 'h', 18696, 52);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Nelle', 'O''Lynn', '9 Shasta Circle', '105-518-7350', 'h', 27428, 97);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Walker', 'Cleugh', '5483 Quincy Drive', '200-247-5149', 'h', 19514, 52);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Jacquette', 'Hedworth', '68 Nancy Way', '906-970-4676', 'h', 96006, 89);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Wanda', 'Lantoph', '51 Hollow Ridge Trail', '183-563-1374', 'h', 52967, 85);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Selinda', 'Goslin', '22 Kensington Way', '319-178-3839', 'h', 46970, 82);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Druci', 'Karus', '87 Hooker Court', '181-725-7447', 'h', 82689, 20);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Celestia', 'Armer', '9 Spaight Court', '633-388-8559', 'h', 65417, 84);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Mellie', 'Tort', '10448 Superior Court', '829-694-8014', 'h', 45298, 40);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Ashien', 'Mosdall', '1162 Wayridge Hill', '577-316-7216', 'h', 12075, 28);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Steve', 'Branston', '3 Kropf Lane', '605-528-4321', 'h', 81449, 56);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Tamra', 'Matthius', '540 Stoughton Plaza', '614-955-0372', 'h', 68699, 53);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Ivan', 'Harget', '7 Washington Parkway', '438-457-2185', 'h', 61781, 88);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Mira', 'Duffett', '70 Oneill Way', '411-545-4665', 'h', 10517, 40);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Emmalee', 'O''Hone', '428 Arrowood Trail', '430-802-8702', 'h', 55305, 21);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Elysha', 'Scrowston', '7470 Sachs Trail', '537-442-1053', 'h', 55078, 76);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Verene', 'Islep', '99 Bobwhite Plaza', '763-728-6025', 'h', 99808, 81);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Dyanne', 'Stickney', '2085 Porter Lane', '719-950-9957', 'h', 17700, 51);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Aggy', 'McKeon', '45 Bashford Point', '969-287-6261', 'h', 95189, 64);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Andres', 'Mathews', '2650 Sunnyside Point', '609-440-5877', 'h', 87429, 72);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Jard', 'Measey', '1 Transport Court', '432-297-9740', 'h', 28685, 38);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Munroe', 'Elsmore', '22 Weeping Birch Alley', '891-382-5569', 'h', 23500, 32);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Britney', 'Welsh', '1 Katie Avenue', '434-780-8105', 'h', 71707, 78);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Alexandrina', 'Enticknap', '76 Twin Pines Avenue', '651-736-8629', 'h', 90446, 99);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Hebert', 'Kirkness', '844 Karstens Court', '812-776-8857', 'h', 57654, 75);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Kaleena', 'Gorham', '9 Gerald Parkway', '876-874-6502', 'h', 54136, 12);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Emmalee', 'Swinglehurst', '385 Warbler Road', '581-904-4275', 'h', 45125, 31);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Say', 'Donavan', '20649 Quincy Parkway', '286-438-6108', 'h', 26067, 83);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Andeee', 'Sperring', '891 Ilene Hill', '922-598-2700', 'h', 67326, 26);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Drucie', 'Brislawn', '107 Truax Parkway', '693-377-0148', 'h', 37011, 96);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Raye', 'Seely', '407 Scofield Terrace', '350-727-1462', 'h', 37535, 98);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Feliza', 'Ogus', '083 Lillian Center', '960-435-1901', 'h', 14016, 50);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Hugibert', 'Placidi', '5 Vidon Place', '604-563-0449', 'h', 92350, 33);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Zed', 'Hayball', '10 7th Trail', '377-706-5940', 'h', 60610, 60);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Leta', 'Wilbore', '3472 Crowley Plaza', '447-798-5308', 'h', 87273, 69);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Spencer', 'Daborn', '3515 Hanson Pass', '571-487-1376', 'h', 7368, 22);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Jemimah', 'Van der Mark', '915 Crownhardt Junction', '332-363-1197', 'h', 50372, 42);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Federica', 'Torfin', '3306 Forest Crossing', '453-222-4425', 'h', 77667, 1);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Rutger', 'Boyan', '6 Porter Hill', '647-543-2884', 'h', 8312, 88);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Mikel', 'Billings', '5 Sunbrook Plaza', '448-284-7815', 'h', 23500, 98);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Maggy', 'Arthey', '7382 Sheridan Plaza', '165-701-9462', 'f', 11948, 20);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Rosalyn', 'Heugh', '0739 Clarendon Hill', '414-229-3326', 'f', 97696, 23);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Sawyer', 'Portchmouth', '05 Melby Avenue', '807-440-2794', 'f', 41836, 37);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Valaree', 'Pluthero', '8 Sherman Park', '765-775-5834', 'h', 93367, 30);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Angie', 'Dews', '0457 Alpine Circle', '582-871-5740', 'h', 2461, 27);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Levin', 'Abernethy', '41552 Bultman Trail', '266-816-2244', 'h', 83711, 5);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Ellie', 'Lightbown', '885 Leroy Street', '916-866-5190', 'f', 41742, 53);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Turner', 'Olanda', '7 Eagan Lane', '574-455-5240', 'h', 25137, 86);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Bibbie', 'Vousden', '28 Transport Place', '931-769-1034', 'h', 99637, 63);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Abram', 'Mingauld', '2430 Roxbury Road', '781-170-9255', 'h', 69363, 43);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Jennine', 'Ironside', '8743 Union Way', '579-461-8704', 'f', 17299, 20);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Yorke', 'Pilgram', '0 Pine View Hill', '255-407-9806', 'f', 92316, 10);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Malena', 'Deaconson', '970 Carpenter Avenue', '250-512-3765', 'h', 47420, 96);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Aylmer', 'Soutar', '2262 Maywood Road', '442-596-2767', 'f', 66223, 59);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Robinett', 'Ibbs', '5 Coolidge Crossing', '625-672-4541', 'f', 59893, 15);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Hillyer', 'Klimuk', '34687 Almo Avenue', '967-785-1888', 'h', 33906, 95);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Leilah', 'Buchanan', '1 5th Crossing', '206-150-0442', 'h', 90056, 43);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Hattie', 'Matyushenko', '20 Meadow Ridge Hill', '545-833-2909', 'h', 79012, 92);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Tony', 'Walstow', '03 Calypso Circle', '283-855-7096', 'h', 5606, 92);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Honey', 'Blann', '774 Haas Crossing', '476-157-0002', 'h', 95192, 75);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Rafa', 'Heinsen', '55375 Bayside Junction', '542-428-9887', 'f', 12251, 90);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Selena', 'Saunier', '9 Annamark Plaza', '505-486-5563', 'h', 74520, 80);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Ivie', 'Cuncliffe', '8 Badeau Trail', '275-552-1919', 'h', 42281, 54);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Lynnet', 'Itzkovwich', '812 Del Sol Park', '727-708-6489', 'h', 5438, 29);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Sallie', 'Wadelin', '0 Manufacturers Terrace', '710-269-8529', 'f', 97198, 39);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Lori', 'Fairnington', '79 Dawn Circle', '366-465-6552', 'h', 83351, 11);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Rochella', 'Croisdall', '948 Glendale Drive', '576-235-9607', 'f', 44229, 56);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Lanny', 'Anker', '3271 Onsgard Hill', '745-643-3368', 'h', 81278, 69);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Bevin', 'Flaonier', '26284 Welch Hill', '155-934-3963', 'h', 95490, 9);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Genvieve', 'Gauvain', '4199 Kinsman Point', '314-725-2409', 'f', 78642, 21);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Tony', 'Jellings', '62046 Eagan Crossing', '679-802-2485', 'f', 92168, 13);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Davy', 'De Minico', '61 Hayes Park', '114-636-4398', 'h', 26432, 33);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Karalee', 'Westcar', '01858 Cherokee Way', '470-273-6669', 'f', 40537, 93);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Cilka', 'Duckitt', '1 Welch Avenue', '431-486-9415', 'h', 4234, 78);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Dulcea', 'Bennett', '83 Elka Hill', '309-128-4550', 'h', 77462, 15);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Guthrey', 'Wilse', '270 Meadow Valley Parkway', '125-535-7360', 'f', 7681, 7);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Winnie', 'Whyatt', '34 Pennsylvania Center', '411-961-4815', 'f', 95183, 55);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Alvy', 'Saxby', '13 Hansons Center', '937-504-2120', 'h', 30947, 36);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Ashlen', 'Stachini', '721 Namekagon Trail', '787-142-3731', 'h', 29381, 64);
insert into Renter (fname, lname, adress, tel_no, pref_type, max_rent, bno) values ('Kimbell', 'Anyene', '8 Old Gate Hill', '240-818-8199', 'f', 53068, 88);

-- iserting into Viewing

insert into Viewing (rno, pno, date_o, comment_o) values (84, 19, '09-Jul-2019', 'vqicsjlhmcitzooqplrxmbqbpaxf');
insert into Viewing (rno, pno, date_o, comment_o) values (73, 89, '15-May-2019', 'jssnuwprukwecemiajxaungupyhd');
insert into Viewing (rno, pno, date_o, comment_o) values (67, 69, '06-Jun-2019', 'omaicnkyipphyzeykojcnxjmhaia');
insert into Viewing (rno, pno, date_o, comment_o) values (64, 8, '14-Aug-2019', 'xexdxsirweeuwjrwfizfqlfpbstw');
insert into Viewing (rno, pno, date_o, comment_o) values (59, 67, '22-Dec-2018', 'lbhcyqxvydqiqlwdljmukickegap');
insert into Viewing (rno, pno, date_o, comment_o) values (12, 77, '06-Jul-2019', 'nhlgsxboxpldzqxfzyodfojkoebl');
insert into Viewing (rno, pno, date_o, comment_o) values (1, 2, '10-Oct-2019', 'nixfonpqknwwaozdweaktcuplwak');
insert into Viewing (rno, pno, date_o, comment_o) values (4, 38, '03-Mar-2019', 'mvjsgzhwmzvdqskmpssapoqlsfql');
insert into Viewing (rno, pno, date_o, comment_o) values (48, 9, '08-Apr-2019', 'giplfgvdjhwbduijfyelgwcwxxwq');
insert into Viewing (rno, pno, date_o, comment_o) values (30, 54, '22-Dec-2018', 'avejcpartlirrhbrbncyldydveqm');
insert into Viewing (rno, pno, date_o, comment_o) values (44, 31, '05-Oct-2019', 'ezbauytvmamivkeecttkbjbktqlc');
insert into Viewing (rno, pno, date_o, comment_o) values (23, 15, '21-Apr-2019', 'rwtemabkpfnfhnzjarymgudnixze');
insert into Viewing (rno, pno, date_o, comment_o) values (53, 35, '24-Jan-2019', 'ltsuzhjbzhmlfxhejgwztnoutbdi');
insert into Viewing (rno, pno, date_o, comment_o) values (68, 48, '12-Jan-2019', 'sbilyszflgpshkkicwxltldkykmr');
insert into Viewing (rno, pno, date_o, comment_o) values (60, 71, '06-Nov-2019', 'rprwebgrcinrmreeicdbtbancpry');
insert into Viewing (rno, pno, date_o, comment_o) values (71, 1, '09-Sep-2019', 'hpqqtefxntpawhrwjqisnyfqxsam');
insert into Viewing (rno, pno, date_o, comment_o) values (10, 68, '04-Jan-2019', 'lzvikzcsapmfakawydxbcahgzrvu');
insert into Viewing (rno, pno, date_o, comment_o) values (50, 85, '12-Jul-2019', 'obenleobytaqnmhbladufyhaegcl');
insert into Viewing (rno, pno, date_o, comment_o) values (96, 35, '02-May-2019', 'hutmfrjtschtiebeuqhjpysycwyq');
insert into Viewing (rno, pno, date_o, comment_o) values (19, 40, '14-Sep-2019', 'kqaiuhgbupwwwyaouyisiuwivtab');
insert into Viewing (rno, pno, date_o, comment_o) values (99, 22, '04-Jan-2019', 'ilcrzilsavrbnawnousvywfrbrpa');
insert into Viewing (rno, pno, date_o, comment_o) values (4, 41, '31-Aug-2019', 'ixlqzawikwitufxfevjoehgunsbt');
insert into Viewing (rno, pno, date_o, comment_o) values (52, 68, '21-May-2019', 'jydrpqvuuamdpjieujzksolocotr');
insert into Viewing (rno, pno, date_o, comment_o) values (96, 68, '04-Aug-2019', 'nvduywzyqpbygykjiyucmwimvuau');
insert into Viewing (rno, pno, date_o, comment_o) values (76, 63, '23-Apr-2019', 'gghuiefxylvmividprujhxqyubtm');
insert into Viewing (rno, pno, date_o, comment_o) values (3, 1, '30-Apr-2019', 'ujldxfhriuaqotdlgtbcgzapljol');
insert into Viewing (rno, pno, date_o, comment_o) values (54, 87, '08-May-2019', 'smlidfurewapkpovztahuotvmwgo');
insert into Viewing (rno, pno, date_o, comment_o) values (52, 25, '15-Nov-2019', 'pswsrcdyuiwcmwvlbkcvmfwdbryk');
insert into Viewing (rno, pno, date_o, comment_o) values (67, 90, '15-Jan-2019', 'tgmozavpjpmvnmrlfnshoquuwzsh');
insert into Viewing (rno, pno, date_o, comment_o) values (50, 92, '07-Mar-2019', 'ouybpvfqhljmxstoacirvnkgebil');
insert into Viewing (rno, pno, date_o, comment_o) values (75, 86, '03-Feb-2019', 'arqnmoakwmzrszqpbhhkinoxzzzz');
insert into Viewing (rno, pno, date_o, comment_o) values (41, 42, '10-Dec-2018', 'qmutpvvenkzswsqhckfpqyowaxqa');
insert into Viewing (rno, pno, date_o, comment_o) values (67, 78, '04-Sep-2019', 'opovhdmwblfryufkmzkqrgpcwxpr');
insert into Viewing (rno, pno, date_o, comment_o) values (76, 77, '08-May-2019', 'jnanpqijgcdswsawydhnhonfmydt');
insert into Viewing (rno, pno, date_o, comment_o) values (14, 84, '10-Nov-2019', 'afogkndtavsycaoizrhhzeebshbv');
insert into Viewing (rno, pno, date_o, comment_o) values (94, 53, '08-Dec-2018', 'cmmdveljxsffjgvdontyvumxmnrv');
insert into Viewing (rno, pno, date_o, comment_o) values (92, 66, '27-Jan-2019', 'umhrruvyjxtynpibdvnpddoofchl');
insert into Viewing (rno, pno, date_o, comment_o) values (89, 24, '22-Apr-2019', 'qcdeozcrzyiavddtpgcduxjvmswk');
insert into Viewing (rno, pno, date_o, comment_o) values (53, 38, '02-Mar-2019', 'qlwmwjtgsswfoeizuspikqcgfdzk');
insert into Viewing (rno, pno, date_o, comment_o) values (42, 7, '28-Jan-2019', 'xrtzfkalvlpyrhhauhfjuurnqhva');
insert into Viewing (rno, pno, date_o, comment_o) values (88, 8, '21-Mar-2019', 'asscxfdgquszicdfyxymmwzyoolo');
insert into Viewing (rno, pno, date_o, comment_o) values (44, 73, '01-May-2019', 'qkblqqrewrsxdsvftqjrnzkgipxr');
insert into Viewing (rno, pno, date_o, comment_o) values (4, 8, '12-Dec-2018', 'klizfrnwllswjhmkyscabfrvebud');
insert into Viewing (rno, pno, date_o, comment_o) values (74, 96, '19-Jun-2019', 'ulcoqoaofzehdisywlmkctfvjlxp');
insert into Viewing (rno, pno, date_o, comment_o) values (41, 72, '24-Aug-2019', 'ixyuzunnhvhofeverutxnhijnwno');
insert into Viewing (rno, pno, date_o, comment_o) values (21, 68, '27-Sep-2019', 'ywilgymfercijendbdmcklicksaw');
insert into Viewing (rno, pno, date_o, comment_o) values (34, 12, '04-Nov-2019', 'zbjnqlhkrctvlijqwpedpczoeske');
insert into Viewing (rno, pno, date_o, comment_o) values (47, 35, '16-Sep-2019', 'ksdqlzitcwmhnzkkxjzuhkjrpyxd');
insert into Viewing (rno, pno, date_o, comment_o) values (43, 74, '09-Dec-2018', 'eueoociuoqwmrdrgbsxzavyhcroe');
insert into Viewing (rno, pno, date_o, comment_o) values (42, 56, '08-Dec-2018', 'ivyjatmsdxasqzmhskgowzxhzvjd');
insert into Viewing (rno, pno, date_o, comment_o) values (44, 85, '04-Aug-2019', 'lynlemypomsgeqseyltxrvpnoqov');
insert into Viewing (rno, pno, date_o, comment_o) values (3, 79, '17-Aug-2019', 'yzpexaupuzqkembwhuqcjjtvzosc');
insert into Viewing (rno, pno, date_o, comment_o) values (10, 13, '17-Sep-2019', 'mbafadycroijuperdmakqwyxgybr');
insert into Viewing (rno, pno, date_o, comment_o) values (76, 95, '16-Feb-2019', 'ryhqqvakrzupugcvaonspltnmibj');
insert into Viewing (rno, pno, date_o, comment_o) values (86, 47, '12-Dec-2018', 'zawnfygufvcqqagaxhoobdkknjrj');
insert into Viewing (rno, pno, date_o, comment_o) values (24, 46, '04-Nov-2019', 'cyqvkvjpteuejtbmckkizxigpyze');
insert into Viewing (rno, pno, date_o, comment_o) values (8, 19, '25-Sep-2019', 'wsqnginjyuxrkayqjilkrtqjvtuo');
insert into Viewing (rno, pno, date_o, comment_o) values (62, 86, '30-Jan-2019', 'yzgotuycizeznmwxtvvcwoeyofyx');
insert into Viewing (rno, pno, date_o, comment_o) values (37, 44, '06-Feb-2019', 'tcincefcvctgveyheuhgdnqdgixu');
insert into Viewing (rno, pno, date_o, comment_o) values (39, 8, '16-Jan-2019', 'hvxtkahigcxcjmhktpxxyvigovik');
insert into Viewing (rno, pno, date_o, comment_o) values (5, 84, '20-Jul-2019', 'ajpzkpyfzusjglikkzyeeflnkgtq');
insert into Viewing (rno, pno, date_o, comment_o) values (53, 29, '08-Apr-2019', 'lurosgujbudquoxrtnhlzryhkffp');
insert into Viewing (rno, pno, date_o, comment_o) values (59, 28, '17-Jun-2019', 'rtxaarqceyuqxyitxaouihwjqxoy');
insert into Viewing (rno, pno, date_o, comment_o) values (89, 84, '21-Sep-2019', 'yvzruhpqrtqvtkpvllrxpzqkenkx');
insert into Viewing (rno, pno, date_o, comment_o) values (37, 38, '26-Dec-2018', 'oycmzinxjjylwqyhbzpgvmlcspxj');
insert into Viewing (rno, pno, date_o, comment_o) values (83, 42, '15-Oct-2019', 'civuvvekgssnsombtsqywuemqcyo');
insert into Viewing (rno, pno, date_o, comment_o) values (34, 64, '20-Mar-2019', 'jacjvwozloxrzxnqmkeepmoehdve');
insert into Viewing (rno, pno, date_o, comment_o) values (32, 5, '18-Aug-2019', 'emlkroagxqqflthezqtlkekgdhfx');
insert into Viewing (rno, pno, date_o, comment_o) values (83, 24, '14-Jan-2019', 'ztlfgzxuwcvlzvnkliokaucxsiqo');
insert into Viewing (rno, pno, date_o, comment_o) values (99, 50, '30-Apr-2019', 'rxndmyhsjkyhricqyhadvlsbytjk');
insert into Viewing (rno, pno, date_o, comment_o) values (99, 56, '04-Dec-2018', 'jpxzpflwqyvtfsprljuxxkerimae');
insert into Viewing (rno, pno, date_o, comment_o) values (40, 18, '08-Apr-2019', 'wdyclcakdvagvgavlncqcgkqcxwl');
insert into Viewing (rno, pno, date_o, comment_o) values (43, 69, '18-Jun-2019', 'mgxvgdsktozwmxivjmweywytbskw');
insert into Viewing (rno, pno, date_o, comment_o) values (37, 14, '01-Jul-2019', 'lcjphrvddijxautpvzzknjlqavqn');
insert into Viewing (rno, pno, date_o, comment_o) values (62, 71, '04-Jan-2019', 'axrqooqjcvssphblqezrqrimmddg');
insert into Viewing (rno, pno, date_o, comment_o) values (44, 8, '03-Jul-2019', 'cotkyqlazemshextdfsqkkcaobag');
insert into Viewing (rno, pno, date_o, comment_o) values (75, 40, '25-Sep-2019', 'cmyogwhljkdmasfeaucicskbzlwj');
insert into Viewing (rno, pno, date_o, comment_o) values (96, 5, '12-Oct-2019', 'joejviwycnvjrpenbwikzfdizjop');
insert into Viewing (rno, pno, date_o, comment_o) values (18, 97, '30-Aug-2019', 'ndockutslkcildfgwbgqrivckwxl');
insert into Viewing (rno, pno, date_o, comment_o) values (86, 70, '11-Jun-2019', 'jvnqyptatakuhvhdokpguxehyrnh');
insert into Viewing (rno, pno, date_o, comment_o) values (41, 61, '15-Sep-2019', 'nhsobccpxoziyrbxpgulmbiigcrh');
insert into Viewing (rno, pno, date_o, comment_o) values (97, 45, '22-Aug-2019', 'ilzggsrwmmnxrozprnbngqphdznx');
insert into Viewing (rno, pno, date_o, comment_o) values (88, 72, '20-Jul-2019', 'rzhhumedcdpixsklvntkgntfoekj');
insert into Viewing (rno, pno, date_o, comment_o) values (11, 98, '30-Apr-2019', 'txnsxvswkrpgioravncgovjcjhzd');
insert into Viewing (rno, pno, date_o, comment_o) values (88, 6, '26-Sep-2019', 'yypislsygcpjdbjfgioycorhoaiv');
insert into Viewing (rno, pno, date_o, comment_o) values (47, 76, '09-Sep-2019', 'vilmfzyjhvtdoklunsfaseazelli');
insert into Viewing (rno, pno, date_o, comment_o) values (6, 67, '05-Jul-2019', 'qgftktsjdajnarwnotblpdlzjxsb');
insert into Viewing (rno, pno, date_o, comment_o) values (73, 56, '16-Apr-2019', 'xnbectovcbxzvebxrjbndsrmfkcb');
insert into Viewing (rno, pno, date_o, comment_o) values (87, 96, '07-Mar-2019', 'nsffqptlwdlyeskdovgtqexlabte');
insert into Viewing (rno, pno, date_o, comment_o) values (20, 4, '17-Apr-2019', 'qtbhionkeytknjqqfopsuzccokjv');
insert into Viewing (rno, pno, date_o, comment_o) values (27, 69, '14-Feb-2019', 'znpqygeahevmbiwqfxylxpfpvhmy');
insert into Viewing (rno, pno, date_o, comment_o) values (77, 4, '16-Aug-2019', 'wpndxzqnbijcssyckdvhhmgmnabs');
insert into Viewing (rno, pno, date_o, comment_o) values (56, 1, '14-Sep-2019', 'zapypeymrpaudbemggixpwtfghgz');
insert into Viewing (rno, pno, date_o, comment_o) values (74, 88, '23-Sep-2019', 'dmyjoamsyievenoooluhvoswchgk');
insert into Viewing (rno, pno, date_o, comment_o) values (96, 77, '01-Jul-2019', 'xlbiptirfhndadvhlfuscgrimrvz');
insert into Viewing (rno, pno, date_o, comment_o) values (62, 1, '25-Jan-2019', 'ipofsomdqzhniynvuphgrbqdvxps');
insert into Viewing (rno, pno, date_o, comment_o) values (48, 25, '05-Dec-2018', 'izbshimheaxvwewpyecyrpimdxza');
insert into Viewing (rno, pno, date_o, comment_o) values (31, 89, '07-Aug-2019', 'zvxgxrgffeurqwqzddomwzgflsib');
insert into Viewing (rno, pno, date_o, comment_o) values (82, 57, '08-Dec-2018', 'ggoqygzhnwnujipzcazbskqppyzc');
insert into Viewing (rno, pno, date_o, comment_o) values (92, 49, '22-Oct-2019', 'urizyembyvragslpwfsarvtanitm');

-- output
SELECT * FROM Branch;
SELECT * FROM Staff;
SELECT * FROM Owner;
SELECT * FROM Property_for_rent;
SELECT * FROM Renter;
SELECT * FROM Viewing; 
 
-- to save changes
COMMIT