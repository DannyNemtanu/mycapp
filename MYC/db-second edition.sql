
DROP DATABASE thepanthers;
CREATE DATABASE IF NOT EXISTS `thepanthers`;
USE `thepanthers` ;
 
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`College` (
    `collegeID` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL,
    `addr1` VARCHAR(50) NOT NULL,
    `addr2` VARCHAR(50) NOT NULL,
    `postalCode`VARCHAR(45) NOT NULL,
    `county` VARCHAR(45) NULL,
    `contactNum` VARCHAR(45) NULL,
    PRIMARY KEY (`collegeID`)
);

 
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`Course` (
    `collegeID` INT NOT NULL,
    `courseCode` VARCHAR(20) NOT NULL,
    `courseName` VARCHAR(999) NOT NULL,
    PRIMARY KEY (`courseCode`),
    FOREIGN KEY (`collegeID`)
        REFERENCES `thepanthers`.`College` (`collegeID`)
);
 
 
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`Student` (
    `studentNumber` VARCHAR(45) NOT NULL,
    `fname` VARCHAR(90) NOT NULL,
    `lname` VARCHAR(90) NOT NULL,
    `pass` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `addr1` VARCHAR(90) NOT NULL,
    `addr2` VARCHAR(90) NULL,
    `county` VARCHAR(45) NOT NULL,
    `country` VARCHAR(45) NOT NULL,
    `nationality` VARCHAR(45) NOT NULL,
    `courseCode` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`studentNumber`),
    FOREIGN KEY (`courseCode`)
        REFERENCES `thepanthers`.`Course` (`courseCode`)
);
 
 
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`Classes` (
    `className` VARCHAR(100) NOT NULL,
    `lecturer` VARCHAR(100) NOT NULL,
    `assistant` VARCHAR(100) NULL,
    `courseCode` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`className` , `courseCode`),
    FOREIGN KEY (`courseCode`)
        REFERENCES `thepanthers`.`Course` (`courseCode`)
);
 
 
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`Grade` (
    `ClassName` VARCHAR(100) NOT NULL,
    `studentNumber` VARCHAR(45) NOT NULL,
    `grade` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`studentNumber`, `ClassName`),
	CONSTRAINT `className`
    FOREIGN KEY (`ClassName`)
    REFERENCES `thepanthers`.`Classes` (`className`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	CONSTRAINT `studentNumber`
    FOREIGN KEY (`studentNumber`)
    REFERENCES `thepanthers`.`Student` (`studentNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
 
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`TimeSlot` (
    `slotID` INT NOT NULL AUTO_INCREMENT,
    `timeStart` TIME NOT NULL,
    `timeEnd` TIME NOT NULL,
    PRIMARY KEY (`slotID`)
);
 
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`Timetable` (
    `she_Day` VARCHAR(10) NOT NULL,
    `she_TimeSlot` INT NOT NULL,
    `className` VARCHAR(100) NOT NULL,
    `courseCode` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`she_TimeSlot` , `className` , `courseCode`),
    FOREIGN KEY (`she_TimeSlot`)
        REFERENCES `thepanthers`.`TimeSlot` (`slotID`),
    FOREIGN KEY (`className`)
        REFERENCES `thepanthers`.`Classes` (`className`),
    FOREIGN KEY (`courseCode`)
        REFERENCES `thepanthers`.`Course` (`courseCode`)
);
 
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`Library` (
    `bookID` VARCHAR(45) NOT NULL ,
    `collegeID` INT NOT NULL,
    `title` VARCHAR(45) NULL,
    `author` VARCHAR(45) NULL,
    `description` VARCHAR(500) NULL,
    `image` VARCHAR(900) NULL,
    `category` VARCHAR(45) NULL,
    PRIMARY KEY (`bookID` , `collegeID`),
    FOREIGN KEY (`collegeID`)
        REFERENCES `thepanthers`.`College` (`collegeID`)
);
 
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`MyBooks` (
    `bookID` VARCHAR(45) NOT NULL,
    `studentID` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`bookID` , `studentID`),
    FOREIGN KEY (`studentID`)
        REFERENCES `thepanthers`.`Student` (`studentNumber`),
    FOREIGN KEY (`bookID`)
        REFERENCES `thepanthers`.`Library` (`bookID`)
);
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`News` (
    `newsId` INT NOT NULL,
    `title` VARCHAR(999) NULL,
    `description` TEXT NULL,
    `location` VARCHAR(999) NULL,
    `image` VARCHAR(999) NULL,
    `date` LONGBLOB NULL,
    `collegeID` INT NOT NULL,
    PRIMARY KEY (`newsId`),
    FOREIGN KEY (`collegeID`)
        REFERENCES `thepanthers`.`College` (`collegeID`)
);
 
 
CREATE TABLE IF NOT EXISTS `thepanthers`.`Support` (
    `supportName` VARCHAR(50) NOT NULL,
    `desc` VARCHAR(999) NOT NULL,
    `contactNum` VARCHAR(50) NOT NULL,
    `location` VARCHAR(999) NOT NULL,
    `collegeID` INT NOT NULL,
    PRIMARY KEY (`supportName` , `collegeID`),
    FOREIGN KEY (`collegeID`)
        REFERENCES `thepanthers`.`College` (`collegeID`)
);
 
INSERT INTO college (`name`,`addr1`,`addr2`,`postalCode`,`county`,`contactNum`) VALUES ('National College of Ireland', 'Mayor Street', 'IFSC', 'D1', 'Dublin', '+353134123213');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (2, 'Universidad Abierta Interamericana', '0590 Springview Circle', 'Unquillo', 'D7', 'Argentina', '54-(781)459-0795');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (3, 'Centro Regional Universitário de Espiríto Santo do Pinhal', '9 Sunbrook Way', 'Macau', 'D3', 'Brazil', '55-(299)483-6927');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (4, 'Southern Yangtze University', '41717 Schlimgen Street', 'Yandian', 'D12', 'China', '86-(360)984-0353');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (5, 'Internationle Akademie für Philosophie', '6 Sachtjen Place', 'Triesenberg', 'D20', 'Liechtenstein', '423-(876)701-3578');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (6, 'Universidad de Occidente', '7376 Autumn Leaf Street', 'La Guadalupe', 'D16', 'Mexico', '52-(880)339-0455');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (7, 'Universitas Nasional Jakarta', '9 Reindahl Crossing', 'Talangbetutu', 'D24', 'Indonesia', '62-(605)822-2494');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (8, 'Karaganda State Buketov University', '876 Fieldstone Trail', 'Shu', 'D3', 'Kazakhstan', '7-(807)685-4208');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (9, 'Centro Universitário Adventista de São Paulo', '6606 Portage Alley', 'Cerquilho', 'D5', 'Brazil', '55-(839)827-1457');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (10, 'Al-Azhar University of Gaza', '5 Dahle Pass', 'Majdal Banī Fāḑil', 'D11', 'Palestinian Territory', '970-(446)695-6923');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (11, 'Universidad Autónoma de Bucaramanga', '4 High Crossing Hill', 'Villanueva', 'D15', 'Colombia', '57-(440)710-1440');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (12, 'Medical Academy of Latvia', '038 Parkside Point', 'Vaiņode', 'D15', 'Latvia', '371-(723)936-3325');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (13, 'Beijing Union University', '132 Susan Point', 'Tatou', 'D1', 'China', '86-(332)898-0167');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (14, 'Universidad de Palermo', '25495 Menomonie Alley', 'General San Martín', 'D14', 'Argentina', '54-(551)444-8852');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (15, 'Universitas Katolik Widya Manadala', '548 Thackeray Road', 'Banjar', 'D12', 'Indonesia', '62-(653)358-4476');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (16, 'Universidad de Hermosillo', '551 Glendale Trail', 'Lindavista', 'D3', 'Mexico', '52-(294)543-9530');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (17, 'University of the Philippines Visayas', '99128 Twin Pines Avenue', 'Payao', 'D10', 'Philippines', '63-(238)467-9562');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (18, 'Kunmimg University of Science and Technology', '36 Burrows Trail', 'Lop', 'D22', 'China', '86-(183)498-9944');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (19, 'Kenya Medical Training College', '16001 Florence Circle', 'Garissa', 'D12', 'Kenya', '254-(952)503-4642');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (20, 'Notre Dame University', '4958 Mallory Place', 'Burgos', 'D9', 'Philippines', '63-(271)614-4091');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (21, 'Palawan State University', '19872 3rd Road', 'Paitan Norte', 'D7', 'Philippines', '63-(737)991-3348');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (22, 'Agricultural University of Szczecin', '53780 Alpine Street', 'Libiąż', 'D11', 'Poland', '48-(821)798-6965');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (23, 'Fomic Polytechnic', '7326 Evergreen Avenue', 'Ndom', 'D1', 'Cameroon', '237-(206)654-3201');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (24, 'Universitas Muhammadiyah Malang', '93632 Surrey Drive', 'Feondari', 'D8', 'Indonesia', '62-(665)952-0916');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (25, 'Universitas Negeri Yogyakarta', '4 Macpherson Alley', 'Kedungdowo', 'D17', 'Indonesia', '62-(157)792-7988');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (26, 'Volgograd State University', '71 Dakota Alley', 'Pavlogradka', 'D24', 'Russia', '7-(808)743-1754');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (27, 'Universidad Autónoma de Centro América', '9 Meadow Ridge Street', 'Pocora', 'D18', 'Costa Rica', '506-(489)847-5075');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (28, 'Ningbo University of Technology', '138 Roth Plaza', 'Shuangmiao', 'D22', 'China', '86-(160)249-3051');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (29, 'Universitas Syiah Kuala', '58 Fairfield Junction', 'Neglasari', 'D19', 'Indonesia', '62-(499)412-3758');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (30, 'Universidade Tecnica de Lisboa', '33 Oneill Place', 'Pobral', 'D21', 'Portugal', '351-(955)215-5758');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (31, 'Yan''an University', '79 Mesta Plaza', 'Yanmen', 'D9', 'China', '86-(787)219-6338');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (32, 'Far Eastern State Technical University', '275 Wayridge Center', 'Muchkapskiy', 'D5', 'Russia', '7-(418)893-5821');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (33, 'Danang College Of Technology', '4 Anthes Road', 'Anh Son', 'D18', 'Vietnam', '84-(982)437-5380');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (34, 'European Academy of Arts in Warsaw', '807 Red Cloud Plaza', 'Pokrzywnica', 'D15', 'Poland', '48-(835)576-8144');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (35, 'Xinjiang Agriculture University', '610 Hayes Trail', 'Shouxihu', 'D17', 'China', '86-(554)182-5407');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (36, 'Instituto Superior de Entre Douro e Vouga', '583 International Drive', 'Gândara de Aquém', 'D20', 'Portugal', '351-(833)108-7911');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (37, 'Notre Dame of Marbel University', '964 Melrose Park', 'San Diego', 'D22', 'Philippines', '63-(755)185-3828');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (38, 'Liaocheng Teachers University', '11247 Shoshone Avenue', 'Fengjiang', 'D18', 'China', '86-(197)676-4041');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (39, 'The Superior College ', '39452 Bartillon Hill', 'Khairpur', 'D10', 'Pakistan', '92-(615)440-8875');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (40, 'South China Agricultural University', '7 Aberg Drive', 'Tingsiqiao', 'D23', 'China', '86-(277)522-4965');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (41, 'Asian University of Science and Technology', '486 Thierer Hill', 'Bang Mun Nak', 'D20', 'Thailand', '66-(300)394-8464');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (42, 'University of the Philippines Manila', '68 Parkside Terrace', 'Navatat', 'D15', 'Philippines', '63-(847)964-2108');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (43, 'Tanta University', '566 6th Street', '‘Izbat al Burj', 'D16', 'Egypt', '20-(772)866-7032');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (44, 'Universidad Blas Pascal', '46 Bayside Parkway', 'La Rioja', 'D23', 'Argentina', '54-(324)310-6018');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (45, 'Arab American University - Jenin', '87179 East Road', 'Ḩablah', 'D20', 'Palestinian Territory', '970-(669)696-4632');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (46, 'Universidad Señor de Sipán', '3 Browning Lane', 'Coalaque', 'D13', 'Peru', '51-(268)785-0864');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (47, 'Shanghai Lixin University of Commerce', '60 Meadow Ridge Street', 'Huarong', 'D6', 'China', '86-(391)252-7144');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (48, 'Göteborg University', '26488 David Street', 'Falun', 'D20', 'Sweden', '46-(969)334-6916');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (49, 'Universitas Semarang', '45290 Carioca Junction', 'Puamata', 'D4', 'Indonesia', '62-(736)374-6637');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (50, 'University College of Arts, Crafts and Design', '2602 Utah Avenue', 'Falun', 'D5', 'Sweden', '46-(888)507-1079');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (51, 'Universitas Kristen Indonesia Tomohon', '054 Fisk Park', 'Gajrug', 'D14', 'Indonesia', '62-(902)594-0118');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (52, 'Universidad Mariano Gálvez', '8608 Pierstorff Way', 'Sacapulas', 'D7', 'Guatemala', '502-(437)962-5419');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (53, 'Colorado State University-Pueblo', '15374 Talisman Street', 'Reno', 'D16', 'United States', '1-(775)425-0348');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (54, 'Jishou University', '43123 Duke Terrace', 'Sunduan', 'D19', 'China', '86-(736)731-2969');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (55, 'Chengdu Institute University', '02 Roxbury Alley', 'Liujiage', 'D17', 'China', '86-(128)524-6857');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (56, 'Orenburg State University', '83983 Emmet Junction', 'Galitsy', 'D17', 'Russia', '7-(829)904-7778');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (57, 'Capital University of Economics and Business', '3 Jana Junction', 'Jiuzhen', 'D19', 'China', '86-(913)698-6115');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (58, 'Faculdades Integradas Curitiba', '8 Hooker Court', 'Itaperuna', 'D9', 'Brazil', '55-(180)319-2314');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (59, 'Université Catholique de l'' Ouest', '7728 Del Sol Street', 'Boé', 'D7', 'France', '33-(361)489-5081');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (60, 'Murmansk State Technical University', '5 Rusk Way', 'Bayangol', 'D8', 'Russia', '7-(562)912-9169');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (61, 'Carlow Institute of Technology', '08 Elka Point', 'Monkstown', 'D22', 'Ireland', '353-(378)199-8961');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (62, 'Neijiang Teacher University', '8 Springview Hill', 'Mulong', 'D18', 'China', '86-(565)303-4791');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (63, 'Jiangxi University of Traditional Chinese Medicine', '31451 Westridge Circle', 'Sanzao', 'D24', 'China', '86-(404)278-8042');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (64, 'Universidad Popular Autonóma del Estado de Puebla', '29474 Golden Leaf Circle', 'Vicente Guerrero', 'D9', 'Mexico', '52-(410)909-0199');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (65, 'Fine Arts Academy in Gdansk', '3606 Armistice Road', 'Biała Piska', 'D18', 'Poland', '48-(263)287-2323');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (66, 'Universidade de Lisboa', '6 Hintze Avenue', 'Baratã', 'D6', 'Portugal', '351-(455)384-2969');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (67, 'Nayanova University', '4798 Debs Drive', 'Meshcherino', 'D13', 'Russia', '7-(247)614-7352');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (68, 'Universidad Nacional de Formosa', '076 Fulton Junction', 'Libertador General San Martín', 'D10', 'Argentina', '54-(656)298-5023');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (69, 'Universitas Ahmad Dahlan', '3317 West Terrace', 'Rahayu', 'D19', 'Indonesia', '62-(821)913-4189');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (70, 'Universidad Salesiana', '6 Jana Junction', 'San Marcos', 'D12', 'Mexico', '52-(780)515-4286');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (71, 'Universidade da Madeira', '5 Iowa Center', 'Macedo de Cavaleiros', 'D24', 'Portugal', '351-(103)776-8491');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (72, 'Gnesins Russian Academy of Music', '15 Harper Junction', 'Primorskiy', 'D20', 'Russia', '7-(502)654-0736');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (73, 'Saratov State Agrarian University', '01 Grasskamp Lane', 'Syktyvkar', 'D3', 'Russia', '7-(180)504-0604');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (74, 'Kerman University of Medical Sciences', '70 Eastlawn Trail', 'Kelīshād va Sūdarjān', 'D13', 'Iran', '98-(448)631-6354');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (75, 'Engineering College of Aarhus', '1 Pawling Lane', 'København', 'D15', 'Denmark', '45-(416)260-1046');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (76, 'Al-Nasser University', '4570 Sycamore Park', 'Sayyān', 'D19', 'Yemen', '967-(637)370-3500');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (77, 'Escuela Superior Politécnica del Litoral', '3 High Crossing Terrace', 'La Libertad', 'D16', 'Ecuador', '593-(470)808-0638');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (78, 'Universitas Bakrie', '085 Atwood Lane', 'Cigadog', 'D24', 'Indonesia', '62-(874)409-1256');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (79, 'Instituto Politécnico Nacional', '965 Mitchell Center', 'La Cruz', 'D2', 'Mexico', '52-(124)798-0064');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (80, 'University of Vlora "Ismail Qemali"', '0299 Village Terrace', 'Peza e Madhe', 'D24', 'Albania', '355-(965)576-3045');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (81, 'Vongchavalitkul University', '18 Glendale Road', 'Bang Nam Priao', 'D2', 'Thailand', '66-(328)677-9348');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (82, 'Ecole Nationale Supérieure de Chimie de Lille', '023 Mayer Place', 'Angoulême', 'D21', 'France', '33-(103)411-5662');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (83, 'Universitas Islam Indonesia', '9 Hauk Trail', 'Serang', 'D22', 'Indonesia', '62-(748)886-3213');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (84, 'Xi''an International Studies University', '94 Sloan Parkway', 'Nanjie', 'D10', 'China', '86-(548)650-1199');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (85, 'Communication University of China', '9556 John Wall Plaza', 'Yanjiang', 'D6', 'China', '86-(291)370-2883');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (86, 'Universitas 17 Agustus 1945 Surabaya', '7967 1st Terrace', 'Pakusari', 'D3', 'Indonesia', '62-(771)454-5136');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (87, 'University of Batangas', '272 Parkside Court', 'Balibagan Oeste', 'D9', 'Philippines', '63-(561)960-2109');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (88, 'East Kazakhstan State University', '90 Welch Crossing', 'Kokshetau', 'D24', 'Kazakhstan', '7-(386)857-7707');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (89, 'Chongqing Medical University', '1193 Pearson Plaza', 'Lushikeng', 'D10', 'China', '86-(499)890-6657');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (90, 'Universidad de Piura', '271 Mallard Lane', 'Antabamba', 'D1', 'Peru', '51-(347)316-4580');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (91, 'Victoria University Toronto, University of Toronto', '4329 Chinook Street', 'Grand Bank', 'D15', 'Canada', '1-(448)907-3961');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (92, 'Trinity College Carmarthen', '40 Merry Road', 'Merton', 'D9', 'United Kingdom', '44-(648)474-6433');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (93, 'Universidad Católica de Salta', '88133 Mosinee Court', 'Tres Isletas', 'D4', 'Argentina', '54-(269)388-6204');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (94, 'Bogor Agricultural University', '567 Carey Terrace', 'Barusuda', 'D14', 'Indonesia', '62-(451)639-7967');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (95, 'Manuel L. Quezon University', '3951 Butternut Plaza', 'Tiguha', 'D5', 'Philippines', '63-(378)961-1169');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (96, 'Kursk State Medical University', '4 Little Fleur Terrace', 'Krasnofarfornyy', 'D2', 'Russia', '7-(659)252-8432');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (97, 'University of Modern Sciences', '536 Hagan Hill', 'Al Ḩumaydāt', 'D9', 'Yemen', '967-(383)954-0548');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (98, 'Universitas Darma Agung', '2158 Algoma Trail', 'Pasirbatang', 'D23', 'Indonesia', '62-(323)675-7149');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (99, 'Silesian University', '2 Merrick Court', 'Želešice', 'D14', 'Czech Republic', '420-(937)270-7303');
insert into College (collegeID, name, addr1, addr2, postalCode, county, contactNum) values (100, 'Universitas Sultan Ageng Tirtayasa', '36 Dayton Court', 'Jatirejo', 'D13', 'Indonesia', '62-(749)518-0665');



insert into course (collegeID, courseCode, courseName) values (1, 1, 'BA (Honours) in Business');
insert into course (collegeID, courseCode, courseName) values (1, 2, 'BA (Honours) in Human Resource Management');
insert into course (collegeID, courseCode, courseName) values (1, 3, 'BA (Honours) in Marketing Practice');
insert into course (collegeID, courseCode, courseName) values (1, 4, 'BA (Hons) in Early Childhood Education');
insert into course (collegeID, courseCode, courseName) values (1, 5, 'BA (Hons) Psychology - Evening');
insert into course (collegeID, courseCode, courseName) values (1, 6, 'BA Honours in Adult and Workforce Education');
insert into course (collegeID, courseCode, courseName) values (1, 7, 'BA Honours in Business Management');
insert into course (collegeID, courseCode, courseName) values (1, 8, 'Bachelor of Arts (Hons) Psychology');
insert into course (collegeID, courseCode, courseName) values (1, 9, 'BSc (Honours) in Computing');
insert into course (collegeID, courseCode, courseName) values (1, 10, 'BSc (Honours) in Computing - Evening');
insert into course (collegeID, courseCode, courseName) values (1, 11, 'BSc (Hons) in Business Information Systems');
insert into course (collegeID, courseCode, courseName) values (1, 12, 'BSc (Hons) in Business Information Systems - Part-time');
insert into course (collegeID, courseCode, courseName) values (1, 13, 'BSc (Hons) in Technology Management');
insert into course (collegeID, courseCode, courseName) values (1, 14, 'BSc (Hons) in Technology Management Evening');
insert into course (collegeID, courseCode, courseName) values (1, 15, 'Certificate in Business Analysis');
insert into course (collegeID, courseCode, courseName) values (1, 16, 'Certificate in Credit Union Compliance and Risk');
insert into course (collegeID, courseCode, courseName) values (1, 17, 'Certificate in Digital Marketing');
insert into course (collegeID, courseCode, courseName) values (1, 18, 'Certificate in Financial Regulation');
insert into course (collegeID, courseCode, courseName) values (1, 19, 'Certificate in First Line Management');
insert into course (collegeID, courseCode, courseName) values (1, 20, 'Certificate in Personal Financial Planning');
insert into course (collegeID, courseCode, courseName) values (1, 21, 'CIPD Award in Digital and Blended Learning');
insert into course (collegeID, courseCode, courseName) values (1, 22, 'CIPD Award in Employment Law and Employee Relations');
insert into course (collegeID, courseCode, courseName) values (1, 23, 'CIPD Certificate in HRM');
insert into course (collegeID, courseCode, courseName) values (1, 24, 'CIPD Certificate in Learning and Development');
insert into course (collegeID, courseCode, courseName) values (1, 25, 'CIPD Diploma in HRM');
insert into course (collegeID, courseCode, courseName) values (1, 26, 'CIPD Diploma in Learning and Development');
insert into course (collegeID, courseCode, courseName) values (1, 27, 'Diploma in Marketing Advertising Public Relations and Sales');
insert into course (collegeID, courseCode, courseName) values (1, 28, 'Diploma in Pensions Management & Policy - Online');
insert into course (collegeID, courseCode, courseName) values (1, 29, 'Higher Certificate in Business');
insert into course (collegeID, courseCode, courseName) values (1, 30, 'Higher Certificate in Science in Business Computing');
insert into course (collegeID, courseCode, courseName) values (1, 31, 'Higher Certificate in Science in Computing Applications and Business Support');
insert into course (collegeID, courseCode, courseName) values (1, 32, 'Higher Diploma in Business in Finance -part time');
insert into course (collegeID, courseCode, courseName) values (1, 33, 'Higher Diploma in Science in Computing');
insert into course (collegeID, courseCode, courseName) values (1, 34, 'Higher Diploma in Science in Data Analytics');
insert into course (collegeID, courseCode, courseName) values (1, 35, 'Higher Diploma in Science in Fintech');
insert into course (collegeID, courseCode, courseName) values (1, 36, 'Higher Diploma in Science in Web Technologies');


insert into Classes (className, lecturer, assistant, courseCode) values ('The Computing Industry', 'Jesse Wheeler', 'Michelle Wright', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('The Computing Industry', 'Terry Nelson', 'Irene Owens', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Managing Your Learning', 'Martha Foster', 'Raymond Butler', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Managing Your Learning', 'Elizabeth Burton', 'Joe Ruiz', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Problem Solving and Programming Concepts', 'Joseph Sanders', 'Barbara Harper', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Problem Solving and Programming Concepts', 'Jack Jacobs', 'Adam Sullivan', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Introduction to Mathematics for Business & Computing', 'Marilyn Kim', 'Karen Roberts', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Introduction to Mathematics for Business & Computing', 'Lori West', 'Russell Bennett', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Web Design', 'Judy Ward', 'Julie Smith', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Web Design', 'Margaret Moore', 'Ernest Ferguson', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Digital Multimedia', 'Patricia Garcia', 'Terry Lawrence', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Digital Multimedia', 'Shirley Duncan', 'Anne Palmer', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Software Applications for Business', 'Gregory Arnold', 'Christopher Stewart', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Software Applications for Business', 'Elizabeth Dean', 'Steven Edwards', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Introduction to Programming', 'Billy Cole', 'Ryan Marshall', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Introduction to Programming', 'Keith Gomez', 'Brenda Oliver', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Computer Architecture', 'Virginia Bell', 'Annie Butler', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Computer Architecture', 'Sharon Murphy', 'Lawrence Palmer', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Introduction to Marketing', 'Patrick Gardner', 'Emily Little', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Introduction to Marketing', 'Rose Allen', 'Johnny Lawson', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Operating Systems', 'Diane Hansen', 'Robin Roberts', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Operating Systems', 'Roger Rivera', 'William Phillips', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Web Application Development', 'Patricia Morgan', 'Ruby Perez', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Web Application Development', 'Patricia Kennedy', 'Robert Wilson', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Fundamentals of Business Analysis', 'Diana Morris', 'Patricia Morgan', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Fundamentals of Business Analysis', 'Kevin Henderson', 'Charles Meyer', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Object Oriented Programming', 'Jerry Nelson', 'Keith Andrews', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Object Oriented Programming', 'Earl Richardson', 'Craig Anderson', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('IT Project Management', 'Amy Sanchez', 'Anna Burns', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('IT Project Management', 'Peter Harvey', 'John Edwards', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Introduction to Databases', 'John James', 'Christina Little', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Introduction to Databases', 'Alan Butler', 'Jennifer Carpenter', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Data Communications and Networking', 'Mary Fields', 'Phillip Nichols', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Data Communications and Networking', 'Julie Mason', 'Carolyn Watson', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Interdisciplinary Team Project', 'Donna Carter', 'Jimmy Bradley', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Interdisciplinary Team Project', 'Louis Ellis', 'Sarah Montgomery', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Business Entrepreneurship', 'Kimberly Morgan', 'Jimmy Henry', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Business Entrepreneurship', 'Ernest Nguyen', 'Melissa Hansen', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Software Engineering', 'Joe Alexander', 'Irene Duncan', 9);
insert into Classes (className, lecturer, assistant, courseCode) values ('Software Engineering', 'Harold Hill', 'Debra Frazier', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Data Structures', 'Ruby Hansen', 'Jeffrey Gilbert', 31);
insert into Classes (className, lecturer, assistant, courseCode) values ('Management Information System', 'Ruby Hansen', 'Jeffrey Gilbert', 31);


insert into Student (studentNumber, fname, lname, pass, email, addr1, addr2, county, country, nationality, courseCode) values ('x16822375', 'Emily', 'Hunter', 'qdgnWP1JtdK', 'ehunter0@cyberchimps.com', '23 Chinook Park', 'Ohio', 'Cincinnati', 'United States', 'United States', 9);
insert into Student (studentNumber, fname, lname, pass, email, addr1, addr2, county, country, nationality, courseCode) values ('x16389847', 'Larry', 'Reed', '6cFeRTFsb60', 'lreed1@e-recht24.de', '9830 Boyd Way', 'California', 'Sacramento', 'United States', 'United States', 31);
insert into Student (studentNumber, fname, lname, pass, email, addr1, addr2, county, country, nationality, courseCode) values ('x14023074', 'Benjamin', 'Mcdonald', 'ZKAFYo5rgMhx', 'bmcdonald2@weebly.com', '51 Bellgrove Junction', 'Minnesota', 'Minneapolis', 'United States', 'United States', 9);
insert into Student (studentNumber, fname, lname, pass, email, addr1, addr2, county, country, nationality, courseCode) values ('x15534742', 'Melissa', 'Hall', '42HUXU', 'mhall3@biblegateway.com', '87 Delaware Court', 'District of Columbia', 'Washington', 'United States', 'United States', 31);
insert into Student (studentNumber, fname, lname, pass, email, addr1, addr2, county, country, nationality, courseCode) values ('x13785934', 'Andrea', 'Kelly', 'SBA2q082aAjz', 'akelly4@ehow.com', '4 Cody Way', 'Florida', 'Miami', 'United States', 'United States', 9);
insert into Student (studentNumber, fname, lname, pass, email, addr1, addr2, county, country, nationality, courseCode) values ('x15075302', 'Margaret', 'Long', 'Yn2ZvYL0l7rF', 'mlong5@nytimes.com', '9 Oakridge Street', 'Oklahoma', 'Oklahoma City', 'United States', 'United States', 31);
insert into Student (studentNumber, fname, lname, pass, email, addr1, addr2, county, country, nationality, courseCode) values ('x15661896', 'Christina', 'Daniels', '5bAqMs0', 'cdaniels6@archive.org', '8543 Coleman Parkway', 'Missouri', 'Kansas City', 'United States', 'United States', 9);
insert into Student (studentNumber, fname, lname, pass, email, addr1, addr2, county, country, nationality, courseCode) values ('x13101474', 'Steven', 'Collins', '7Fdv9dA', 'scollins7@cbc.ca', '4 Stephen Circle', 'Utah', 'Salt Lake City', 'United States', 'United States', 31);
insert into Student (studentNumber, fname, lname, pass, email, addr1, addr2, county, country, nationality, courseCode) values ('x13672956', 'Steven', 'Daniels', 'upvedyCti', 'sdaniels8@walmart.com', '01 Elgar Terrace', 'Illinois', 'Rockford', 'United States', 'United States', 9);
insert into Student (studentNumber, fname, lname, pass, email, addr1, addr2, county, country, nationality, courseCode) values ('x15181499', 'Angela', 'Ferguson', 'wMd40qBAjDd', 'aferguson9@myspace.com', '2 Charing Cross Parkway', 'Kentucky', 'Louisville', 'United States', 'United States', 31);

insert into Grade (ClassName, studentNumber, grade) values ('The Computing Industry', 'x16822375', 25);
insert into Grade (ClassName, studentNumber, grade) values ('Managing Your Learning', 'x16822375', 73);
insert into Grade (ClassName, studentNumber, grade) values ('Problem Solving and Programming Concepts', 'x16822375', 29);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Mathematics for Business & Computing', 'x16822375', 68);
insert into Grade (ClassName, studentNumber, grade) values ('Web Design', 'x16822375', 90);
insert into Grade (ClassName, studentNumber, grade) values ('Digital Multimedia', 'x16822375', 82);
insert into Grade (ClassName, studentNumber, grade) values ('Software Applications for Business', 'x16822375', 55);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Programming', 'x16822375', 61);
insert into Grade (ClassName, studentNumber, grade) values ('Computer Architecture', 'x16822375', 68);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Marketing', 'x16822375', 10);
insert into Grade (ClassName, studentNumber, grade) values ('Operating Systems', 'x16822375', 6);

insert into Grade (ClassName, studentNumber, grade) values ('The Computing Industry', 'x16389847', 75);
insert into Grade (ClassName, studentNumber, grade) values ('Managing Your Learning', 'x16389847', 14);
insert into Grade (ClassName, studentNumber, grade) values ('Problem Solving and Programming Concepts', 'x16389847', 43);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Mathematics for Business & Computing', 'x16389847', 99);
insert into Grade (ClassName, studentNumber, grade) values ('Web Design', 'x16389847', 62);
insert into Grade (ClassName, studentNumber, grade) values ('Digital Multimedia', 'x16389847', 47);
insert into Grade (ClassName, studentNumber, grade) values ('Software Applications for Business', 'x16389847', 38);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Programming', 'x16389847', 38);
insert into Grade (ClassName, studentNumber, grade) values ('Computer Architecture', 'x16389847', 14);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Marketing', 'x16389847', 17);
insert into Grade (ClassName, studentNumber, grade) values ('Operating Systems', 'x16389847', 73);

insert into Grade (ClassName, studentNumber, grade) values ('The Computing Industry', 'x14023074', 27);
insert into Grade (ClassName, studentNumber, grade) values ('Managing Your Learning', 'x14023074', 6);
insert into Grade (ClassName, studentNumber, grade) values ('Problem Solving and Programming Concepts', 'x14023074', 6);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Mathematics for Business & Computing', 'x14023074', 18);
insert into Grade (ClassName, studentNumber, grade) values ('Web Design', 'x14023074', 68);
insert into Grade (ClassName, studentNumber, grade) values ('Digital Multimedia', 'x14023074', 71);
insert into Grade (ClassName, studentNumber, grade) values ('Software Applications for Business', 'x14023074', 92);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Programming', 'x14023074', 25);
insert into Grade (ClassName, studentNumber, grade) values ('Computer Architecture', 'x14023074', 86);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Marketing', 'x14023074', 8);
insert into Grade (ClassName, studentNumber, grade) values ('Operating Systems', 'x14023074', 62);
insert into Grade (ClassName, studentNumber, grade) values ('Web Application Development', 'x14023074', 100);
insert into Grade (ClassName, studentNumber, grade) values ('Fundamentals of Business Analysis', 'x14023074', 7);
insert into Grade (ClassName, studentNumber, grade) values ('Object Oriented Programming', 'x14023074', 88);
insert into Grade (ClassName, studentNumber, grade) values ('IT Project Management', 'x14023074', 70);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Databases', 'x14023074', 91);
insert into Grade (ClassName, studentNumber, grade) values ('Data Communications and Networking', 'x14023074', 27);
insert into Grade (ClassName, studentNumber, grade) values ('Interdisciplinary Team Project', 'x14023074', 93);
insert into Grade (ClassName, studentNumber, grade) values ('Business Entrepreneurship', 'x14023074', 67);
insert into Grade (ClassName, studentNumber, grade) values ('Software Engineering', 'x14023074', 83);
insert into Grade (ClassName, studentNumber, grade) values ('Data Structures', 'x14023074', 94);


insert into Grade (ClassName, studentNumber, grade) values ('The Computing Industry', 'x15534742', 54);
insert into Grade (ClassName, studentNumber, grade) values ('Managing Your Learning', 'x15534742', 21);
insert into Grade (ClassName, studentNumber, grade) values ('Problem Solving and Programming Concepts', 'x15534742', 45);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Mathematics for Business & Computing', 'x15534742', 38);
insert into Grade (ClassName, studentNumber, grade) values ('Web Design', 'x15534742', 76);
insert into Grade (ClassName, studentNumber, grade) values ('Digital Multimedia', 'x15534742', 80);
insert into Grade (ClassName, studentNumber, grade) values ('Software Applications for Business', 'x15534742', 5);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Programming', 'x15534742', 16);
insert into Grade (ClassName, studentNumber, grade) values ('Computer Architecture', 'x15534742', 35);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Marketing', 'x15534742', 99);
insert into Grade (ClassName, studentNumber, grade) values ('Operating Systems', 'x15534742', 100);
insert into Grade (ClassName, studentNumber, grade) values ('Web Application Development', 'x15534742', 50);
insert into Grade (ClassName, studentNumber, grade) values ('Fundamentals of Business Analysis', 'x15534742', 92);
insert into Grade (ClassName, studentNumber, grade) values ('Object Oriented Programming', 'x15534742', 47);
insert into Grade (ClassName, studentNumber, grade) values ('IT Project Management', 'x15534742', 97);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Databases', 'x15534742', 16);
insert into Grade (ClassName, studentNumber, grade) values ('Data Communications and Networking', 'x15534742', 68);
insert into Grade (ClassName, studentNumber, grade) values ('Interdisciplinary Team Project', 'x15534742', 35);
insert into Grade (ClassName, studentNumber, grade) values ('Business Entrepreneurship', 'x15534742', 66);
insert into Grade (ClassName, studentNumber, grade) values ('Software Engineering', 'x15534742', 69);
insert into Grade (ClassName, studentNumber, grade) values ('Data Structures', 'x15534742', 50);


insert into Grade (ClassName, studentNumber, grade) values ('The Computing Industry', 'x13785934', 87);
insert into Grade (ClassName, studentNumber, grade) values ('Managing Your Learning', 'x13785934', 12);
insert into Grade (ClassName, studentNumber, grade) values ('Problem Solving and Programming Concepts', 'x13785934', 11);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Mathematics for Business & Computing', 'x13785934', 4);
insert into Grade (ClassName, studentNumber, grade) values ('Web Design', 'x13785934', 28);
insert into Grade (ClassName, studentNumber, grade) values ('Digital Multimedia', 'x13785934', 75);
insert into Grade (ClassName, studentNumber, grade) values ('Software Applications for Business', 'x13785934', 27);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Programming', 'x13785934', 92);
insert into Grade (ClassName, studentNumber, grade) values ('Computer Architecture', 'x13785934', 37);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Marketing', 'x13785934', 82);
insert into Grade (ClassName, studentNumber, grade) values ('Operating Systems', 'x13785934', 55);
insert into Grade (ClassName, studentNumber, grade) values ('Web Application Development', 'x13785934', 48);
insert into Grade (ClassName, studentNumber, grade) values ('Fundamentals of Business Analysis', 'x13785934', 86);
insert into Grade (ClassName, studentNumber, grade) values ('Object Oriented Programming', 'x13785934', 27);
insert into Grade (ClassName, studentNumber, grade) values ('IT Project Management', 'x13785934', 20);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Databases', 'x13785934', 13);
insert into Grade (ClassName, studentNumber, grade) values ('Data Communications and Networking', 'x13785934', 23);
insert into Grade (ClassName, studentNumber, grade) values ('Interdisciplinary Team Project', 'x13785934', 64);
insert into Grade (ClassName, studentNumber, grade) values ('Business Entrepreneurship', 'x13785934', 51);
insert into Grade (ClassName, studentNumber, grade) values ('Software Engineering', 'x13785934', 99);
insert into Grade (ClassName, studentNumber, grade) values ('Data Structures', 'x13785934', 81);

insert into Grade (ClassName, studentNumber, grade) values ('The Computing Industry', 'x15075302', 62);
insert into Grade (ClassName, studentNumber, grade) values ('Managing Your Learning', 'x15075302', 96);
insert into Grade (ClassName, studentNumber, grade) values ('Problem Solving and Programming Concepts', 'x15075302', 60);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Mathematics for Business & Computing', 'x15075302', 44);
insert into Grade (ClassName, studentNumber, grade) values ('Web Design', 'x15075302', 55);
insert into Grade (ClassName, studentNumber, grade) values ('Digital Multimedia', 'x15075302', 78);
insert into Grade (ClassName, studentNumber, grade) values ('Software Applications for Business', 'x15075302', 15);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Programming', 'x15075302', 30);
insert into Grade (ClassName, studentNumber, grade) values ('Computer Architecture', 'x15075302', 64);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Marketing', 'x15075302', 79);
insert into Grade (ClassName, studentNumber, grade) values ('Operating Systems', 'x15075302', 46);
insert into Grade (ClassName, studentNumber, grade) values ('Web Application Development', 'x15075302', 77);
insert into Grade (ClassName, studentNumber, grade) values ('Fundamentals of Business Analysis', 'x15075302', 59);
insert into Grade (ClassName, studentNumber, grade) values ('Object Oriented Programming', 'x15075302', 15);
insert into Grade (ClassName, studentNumber, grade) values ('IT Project Management', 'x15075302', 16);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Databases', 'x15075302', 28);
insert into Grade (ClassName, studentNumber, grade) values ('Data Communications and Networking', 'x15075302', 60);
insert into Grade (ClassName, studentNumber, grade) values ('Interdisciplinary Team Project', 'x15075302', 34);
insert into Grade (ClassName, studentNumber, grade) values ('Business Entrepreneurship', 'x15075302', 56);
insert into Grade (ClassName, studentNumber, grade) values ('Software Engineering', 'x15075302', 99);
insert into Grade (ClassName, studentNumber, grade) values ('Data Structures', 'x15075302', 23);


insert into Grade (ClassName, studentNumber, grade) values ('The Computing Industry', 'x15661896', 6);
insert into Grade (ClassName, studentNumber, grade) values ('Managing Your Learning', 'x15661896', 67);
insert into Grade (ClassName, studentNumber, grade) values ('Problem Solving and Programming Concepts', 'x15661896', 75);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Mathematics for Business & Computing', 'x15661896', 54);
insert into Grade (ClassName, studentNumber, grade) values ('Web Design', 'x15661896', 94);
insert into Grade (ClassName, studentNumber, grade) values ('Digital Multimedia', 'x15661896', 11);
insert into Grade (ClassName, studentNumber, grade) values ('Software Applications for Business', 'x15661896', 15);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Programming', 'x15661896', 35);
insert into Grade (ClassName, studentNumber, grade) values ('Computer Architecture', 'x15661896', 41);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Marketing', 'x15661896', 21);
insert into Grade (ClassName, studentNumber, grade) values ('Operating Systems', 'x15661896', 38);
insert into Grade (ClassName, studentNumber, grade) values ('Web Application Development', 'x15661896', 63);
insert into Grade (ClassName, studentNumber, grade) values ('Fundamentals of Business Analysis', 'x15661896', 31);
insert into Grade (ClassName, studentNumber, grade) values ('Object Oriented Programming', 'x15661896', 51);
insert into Grade (ClassName, studentNumber, grade) values ('IT Project Management', 'x15661896', 6);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Databases', 'x15661896', 97);
insert into Grade (ClassName, studentNumber, grade) values ('Data Communications and Networking', 'x15661896', 80);
insert into Grade (ClassName, studentNumber, grade) values ('Interdisciplinary Team Project', 'x15661896', 94);
insert into Grade (ClassName, studentNumber, grade) values ('Business Entrepreneurship', 'x15661896', 20);
insert into Grade (ClassName, studentNumber, grade) values ('Software Engineering', 'x15661896', 66);
insert into Grade (ClassName, studentNumber, grade) values ('Data Structures', 'x15661896', 84);

insert into Grade (ClassName, studentNumber, grade) values ('The Computing Industry', 'x13101474', 6);
insert into Grade (ClassName, studentNumber, grade) values ('Managing Your Learning', 'x13101474', 36);
insert into Grade (ClassName, studentNumber, grade) values ('Problem Solving and Programming Concepts', 'x13101474', 65);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Mathematics for Business & Computing', 'x13101474', 19);
insert into Grade (ClassName, studentNumber, grade) values ('Web Design', 'x13101474', 47);
insert into Grade (ClassName, studentNumber, grade) values ('Digital Multimedia', 'x13101474', 38);
insert into Grade (ClassName, studentNumber, grade) values ('Software Applications for Business', 'x13101474', 59);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Programming', 'x13101474', 70);
insert into Grade (ClassName, studentNumber, grade) values ('Computer Architecture', 'x13101474', 72);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Marketing', 'x13101474', 77);
insert into Grade (ClassName, studentNumber, grade) values ('Operating Systems', 'x13101474', 98);
insert into Grade (ClassName, studentNumber, grade) values ('Web Application Development', 'x13101474', 33);
insert into Grade (ClassName, studentNumber, grade) values ('Fundamentals of Business Analysis', 'x13101474', 50);
insert into Grade (ClassName, studentNumber, grade) values ('Object Oriented Programming', 'x13101474', 98);
insert into Grade (ClassName, studentNumber, grade) values ('IT Project Management', 'x13101474', 85);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Databases', 'x13101474', 9);
insert into Grade (ClassName, studentNumber, grade) values ('Data Communications and Networking', 'x13101474', 37);
insert into Grade (ClassName, studentNumber, grade) values ('Interdisciplinary Team Project', 'x13101474', 64);
insert into Grade (ClassName, studentNumber, grade) values ('Business Entrepreneurship', 'x13101474', 95);
insert into Grade (ClassName, studentNumber, grade) values ('Software Engineering', 'x13101474', 72);
insert into Grade (ClassName, studentNumber, grade) values ('Data Structures', 'x13101474', 13);

insert into Grade (ClassName, studentNumber, grade) values ('The Computing Industry', 'x13672956', 16);
insert into Grade (ClassName, studentNumber, grade) values ('Managing Your Learning', 'x13672956', 55);
insert into Grade (ClassName, studentNumber, grade) values ('Problem Solving and Programming Concepts', 'x13672956', 60);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Mathematics for Business & Computing', 'x13672956', 7);
insert into Grade (ClassName, studentNumber, grade) values ('Web Design', 'x13672956', 74);
insert into Grade (ClassName, studentNumber, grade) values ('Digital Multimedia', 'x13672956', 42);
insert into Grade (ClassName, studentNumber, grade) values ('Software Applications for Business', 'x13672956', 18);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Programming', 'x13672956', 86);
insert into Grade (ClassName, studentNumber, grade) values ('Computer Architecture', 'x13672956', 69);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Marketing', 'x13672956', 56);
insert into Grade (ClassName, studentNumber, grade) values ('Operating Systems', 'x13672956', 21);
insert into Grade (ClassName, studentNumber, grade) values ('Web Application Development', 'x13672956', 18);
insert into Grade (ClassName, studentNumber, grade) values ('Fundamentals of Business Analysis', 'x13672956', 20);
insert into Grade (ClassName, studentNumber, grade) values ('Object Oriented Programming', 'x13672956', 93);
insert into Grade (ClassName, studentNumber, grade) values ('IT Project Management', 'x13672956', 50);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Databases', 'x13672956', 98);
insert into Grade (ClassName, studentNumber, grade) values ('Data Communications and Networking', 'x13672956', 60);
insert into Grade (ClassName, studentNumber, grade) values ('Interdisciplinary Team Project', 'x13672956', 51);
insert into Grade (ClassName, studentNumber, grade) values ('Business Entrepreneurship', 'x13672956', 54);
insert into Grade (ClassName, studentNumber, grade) values ('Software Engineering', 'x13672956', 7);
insert into Grade (ClassName, studentNumber, grade) values ('Data Structures', 'x13672956', 90);

insert into Grade (ClassName, studentNumber, grade) values ('The Computing Industry', 'x15181499', 54);
insert into Grade (ClassName, studentNumber, grade) values ('Managing Your Learning', 'x15181499', 25);
insert into Grade (ClassName, studentNumber, grade) values ('Problem Solving and Programming Concepts', 'x15181499', 70);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Mathematics for Business & Computing', 'x15181499', 78);
insert into Grade (ClassName, studentNumber, grade) values ('Web Design', 'x15181499', 45);
insert into Grade (ClassName, studentNumber, grade) values ('Digital Multimedia', 'x15181499', 44);
insert into Grade (ClassName, studentNumber, grade) values ('Software Applications for Business', 'x15181499', 25);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Programming', 'x15181499', 11);
insert into Grade (ClassName, studentNumber, grade) values ('Computer Architecture', 'x15181499', 28);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Marketing', 'x15181499', 93);
insert into Grade (ClassName, studentNumber, grade) values ('Operating Systems', 'x15181499', 92);
insert into Grade (ClassName, studentNumber, grade) values ('Web Application Development', 'x15181499', 38);
insert into Grade (ClassName, studentNumber, grade) values ('Fundamentals of Business Analysis', 'x15181499', 60);
insert into Grade (ClassName, studentNumber, grade) values ('Object Oriented Programming', 'x15181499', 60);
insert into Grade (ClassName, studentNumber, grade) values ('IT Project Management', 'x15181499', 81);
insert into Grade (ClassName, studentNumber, grade) values ('Introduction to Databases', 'x15181499', 53);
insert into Grade (ClassName, studentNumber, grade) values ('Data Communications and Networking', 'x15181499', 53);
insert into Grade (ClassName, studentNumber, grade) values ('Interdisciplinary Team Project', 'x15181499', 93);
insert into Grade (ClassName, studentNumber, grade) values ('Business Entrepreneurship', 'x15181499', 25);
insert into Grade (ClassName, studentNumber, grade) values ('Software Engineering', 'x15181499', 25);
insert into Grade (ClassName, studentNumber, grade) values ('Data Structures', 'x15181499', 18);


insert into Library (bookID, collegeID, title, author, description, image, category) values ('541720477', 1, 'ut', 'Irene Perez', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://dummyimage.com/178x120.png/5fa2dd/ffffff', 'Computer science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('826260812', 1, 'ante ipsum primis', 'Kimberly Kelly', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/129x238.jpg/5fa2dd/ffffff', 'information and general works');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('114325639', 1, 'blandit', 'David Kelley', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://dummyimage.com/207x247.jpg/dddddd/000000', 'Philosophy and psychology');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('021886458', 1, 'leo', 'Melissa Mason', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/245x158.jpg/cc0000/ffffff', 'Religion');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('676783042', 1, 'phasellus sit', 'Antonio Mills', 'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/236x113.jpg/dddddd/000000', 'Social Sciences');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('407085073', 1, 'eu tincidunt in', 'Catherine Lawrence', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/237x243.jpg/ff4444/ffffff', 'Language');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('196995201', 1, 'cubilia', 'Louis Rodriguez', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/152x113.png/5fa2dd/ffffff', 'Science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('097686060', 1, 'praesent blandit nam', 'Martha Rodriguez', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'http://dummyimage.com/142x216.jpg/ff4444/ffffff', 'Technology and applied science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('802642880', 1, 'varius integer ac', 'Cheryl Green', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 'http://dummyimage.com/236x176.bmp/5fa2dd/ffffff', 'Arts and recreation');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('748467404', 1, 'etiam pretium iaculis', 'Wanda Medina', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://dummyimage.com/147x199.jpg/ff4444/ffffff', 'Literature');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('947847262', 1, 'nulla', 'Susan Pierce', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/205x236.jpg/cc0000/ffffff', 'History and geography');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('672524594', 1, 'hac', 'Kenneth Baker', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'http://dummyimage.com/151x162.png/ff4444/ffffff', 'Computer science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('803389276', 1, 'porta', 'Michael Berry', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://dummyimage.com/118x233.png/5fa2dd/ffffff', 'information and general works');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('148953823', 1, 'et eros', 'Harold Robinson', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/240x105.bmp/cc0000/ffffff', 'Philosophy and psychology');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('338553622', 1, 'ante nulla', 'Joan Hudson', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'http://dummyimage.com/132x183.bmp/5fa2dd/ffffff', 'Religion');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('702548287', 1, 'congue vivamus', 'Annie Murphy', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/149x110.bmp/ff4444/ffffff', 'Social Sciences');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('638359919', 1, 'diam', 'Jerry Rogers', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/186x175.bmp/ff4444/ffffff', 'Language');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('054199233', 1, 'mattis egestas', 'Robin Anderson', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/116x138.png/cc0000/ffffff', 'Science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('104989036', 1, 'pellentesque', 'Roger Price', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'http://dummyimage.com/235x122.png/5fa2dd/ffffff', 'Technology and applied science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('016939088', 1, 'velit id', 'Virginia Kennedy', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'http://dummyimage.com/182x214.png/cc0000/ffffff', 'Arts and recreation');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('396364721', 1, 'vivamus vel', 'Marie Watkins', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'http://dummyimage.com/212x230.bmp/cc0000/ffffff', 'Literature');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('624538872', 1, 'dui', 'Earl Lynch', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'http://dummyimage.com/102x238.jpg/5fa2dd/ffffff', 'History and geography');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('225375092', 1, 'in', 'Ashley Stanley', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/180x183.png/cc0000/ffffff', 'Computer science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('746178279', 1, 'est lacinia nisi', 'Angela Garza', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/250x114.jpg/5fa2dd/ffffff', 'information and general works');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('305973776', 1, 'volutpat dui maecenas', 'Carl Harrison', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'http://dummyimage.com/169x186.jpg/dddddd/000000', 'Philosophy and psychology');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('093176878', 1, 'turpis elementum', 'Steven Hughes', 'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/124x238.png/5fa2dd/ffffff', 'Religion');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('908455829', 1, 'tortor id', 'Nicole Sims', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/141x188.png/5fa2dd/ffffff', 'Social Sciences');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('686500366', 1, 'tortor sollicitudin mi', 'Roger Warren', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'http://dummyimage.com/115x223.png/cc0000/ffffff', 'Language');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('548457373', 1, 'tristique est', 'Jerry Phillips', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/103x138.png/ff4444/ffffff', 'Science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('492229268', 1, 'sapien dignissim vestibulum', 'Paul Barnes', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'http://dummyimage.com/231x176.png/cc0000/ffffff', 'Technology and applied science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('656320618', 1, 'duis', 'Robert Gardner', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'http://dummyimage.com/157x122.jpg/cc0000/ffffff', 'Arts and recreation');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('047274893', 1, 'tincidunt eu', 'Howard Hicks', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/164x124.png/5fa2dd/ffffff', 'Literature');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('539853072', 1, 'nibh in quis', 'Jimmy Lawson', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'http://dummyimage.com/214x201.bmp/cc0000/ffffff', 'History and geography');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('343719703', 1, 'suscipit nulla', 'Marilyn Arnold', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'http://dummyimage.com/213x163.bmp/5fa2dd/ffffff', 'Computer science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('079521948', 1, 'velit vivamus vel', 'Laura Lee', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/169x193.bmp/cc0000/ffffff', 'information and general works');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('670711424', 1, 'rhoncus aliquam', 'Brandon Snyder', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/186x151.jpg/5fa2dd/ffffff', 'Philosophy and psychology');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('231156200', 1, 'nec', 'Frances Larson', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/219x248.png/dddddd/000000', 'Religion');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('673781863', 1, 'mauris non ligula', 'Donna Payne', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'http://dummyimage.com/198x186.jpg/5fa2dd/ffffff', 'Social Sciences');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('289102371', 1, 'lacus curabitur', 'Paul Gonzales', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/214x137.bmp/ff4444/ffffff', 'Language');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('431184257', 1, 'sed', 'Patrick Watson', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/168x120.bmp/dddddd/000000', 'Science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('864673761', 1, 'ligula pellentesque', 'Walter James', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/116x130.png/ff4444/ffffff', 'Technology and applied science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('282740586', 1, 'orci luctus', 'Brian Crawford', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/182x100.png/5fa2dd/ffffff', 'Arts and recreation');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('040865516', 1, 'quis', 'Ashley Dean', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'http://dummyimage.com/137x212.bmp/cc0000/ffffff', 'Literature');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('361494312', 1, 'nullam porttitor', 'Brandon Bryant', 'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/219x100.bmp/cc0000/ffffff', 'History and geography');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('593867461', 1, 'vitae mattis', 'Angela Henderson', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/172x173.bmp/ff4444/ffffff', 'Computer science');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('355201927', 1, 'donec ut mauris', 'Barbara Martinez', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/154x169.png/5fa2dd/ffffff', 'information and general works');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('603249040', 1, 'lacus', 'Jane Stewart', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/204x117.jpg/5fa2dd/ffffff', 'Philosophy and psychology');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('729474228', 1, 'est quam', 'Nicholas Stewart', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/167x223.jpg/5fa2dd/ffffff', 'Religion');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('004876602', 1, 'vel', 'Ronald Gray', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'http://dummyimage.com/198x186.png/ff4444/ffffff', 'Social Sciences');
insert into Library (bookID, collegeID, title, author, description, image, category) values ('361417513', 1, 'nisi nam', 'Ruby Spencer', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/212x130.png/ff4444/ffffff', 'Language');


insert into MyBooks (bookID, studentID) values ('541720477', 'x13101474');
insert into MyBooks (bookID, studentID) values ('826260812', 'x13672956');
insert into MyBooks (bookID, studentID) values ('114325639', 'x13785934');
insert into MyBooks (bookID, studentID) values ('021886458', 'x13101474');
insert into MyBooks (bookID, studentID) values ('676783042', 'x13672956');
insert into MyBooks (bookID, studentID) values ('407085073', 'x13785934');
insert into MyBooks (bookID, studentID) values ('196995201', 'x13101474');
insert into MyBooks (bookID, studentID) values ('541720477', 'x13672956');
insert into MyBooks (bookID, studentID) values ('826260812', 'x13785934');
insert into MyBooks (bookID, studentID) values ('114325639', 'x13101474');


insert into News (newsId, title, description, location, image, date, collegeID) values (1, 'new1', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '76724 Rockefeller Plaza', 'http://dummyimage.com/204x186.jpg/dddddd/000000', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJMSURBVDjLpVPPaxNBGH3ZJCQkVSEkJJja0MSCabHoSUEKerAgggRy0ZP9F4QeDAhepKeeBA8GPFQCEutdCMRSSYkimouIVqUkNW1iyJZN0mR/zvrNwtbUGjw48JiZb773vvfN7jhM08T/DNfwplgsekjwBuEWY+wMzVMEWrKPNH+j+QmhmEqlDJvjsB0QeZrWz0Kh0GwkEoHf74fP5wM/lyQJ3W4XtVoNrVarRLGb6XS6bhF5AkehUFirVqu8nDlqaJpmVioVM5/Pr9g8wbZCm5lwOPzPnqPRKKjItSN3QEFLsdlswuv1wuPxwO12W7F+vw9RFFGv15FIJKzckQIulwt7e3uQZdna67qOTqcDRVGsMx77q4Ddk9PptBzwZA7q2xJZrWYw0PaRmXwBwzj4CL/vwHbAkzmJgydy8JiiqxgPJpF5eR0aUxwjW7AJD98swGQaVKZDpf3JwBSSkQvoyvtY/XE/+HT57tjrRbF3RMCurjMVV2duwzAZDGaATrEjbePs+CX01AHe19al2QdC4JAAB6/OIZNlTq62v5JlipEbzdDQUbo4d2oOPa0vvN0qtQ8EuHX+qehPRKPRIAEZuqEjfHyCyIYltivVEBiL4MP2Bja+l1qqjvlhBwvlcvl5Mpn0x2IxDHQFK+VlugPVchMPTuNifB7vqiWsbRbbso7LO0vmJ8fwa8zlcpMkdI+QFgThBH8LvB3u7LF4xzw/MedY33y1qzDzCpG/HHpMf45sNnuMyKcJjC718yNpUTSY0zdgRvznkrll5/0CZpfQA8IRXj8AAAAASUVORK5CYII=', 1);
insert into News (newsId, title, description, location, image, date, collegeID) values (2, 'new2', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '11336 John Wall Center', 'http://dummyimage.com/155x188.bmp/ff4444/ffffff', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAG2SURBVDjLrZNJKIRhGMdHxpTtwIUoRRxdlZvcJsuFcBAHFHGSSBKlbCUZOTgolLKXskyDshwsJWQLYx+DGcaSsWS+5+95Z5jQzJjirf/hfb9+v+d5l08GQPaXyP5NkFGnDuT0cF45cBENJ9KRYKRvdg9vFgmuxujSkZDscxR2AU/8OBaJCHdPhKsHgv6eoLslnJgIh9eEfYMErcEmr+hcEJKYr4KworYZ68dLBvV3hDOGj28IBx/wzqWELb1N0NC/IgQJDgXnDJ+aPmAjYe/KBm8yvK5zLrBvQbR/xFW1Rgm7DG9fSNhgeE0nBBaroLJ7UQhiHR6ikHwdopu1M8kq/nGI3s6u0fJ5ZR3qLbtIoyrARFoQpuLlGE70oZb0QM2vD4kl2guTGV3VmVgticXzWBNoWw1zbzGWC6NRk+o/7Qpuah/fFJ08DiX50RPDUCUBZQFAbTiMjXHoUyrIGRzBOeTkirlom1aGv53NbVUwJnndrfc+wJUeO3IAhl5KZTBxTvI9Maj0IrcErVkhcwt5UdCXhcNQ7oWDXA9MJctRn+I77/Zf15wdOtOvVEii7QGuzPCsWH8HCxz5pzmy7lQAAAAASUVORK5CYII=', 1);
insert into News (newsId, title, description, location, image, date, collegeID) values (3, 'new3', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '45359 South Avenue', 'http://dummyimage.com/130x207.bmp/ff4444/ffffff', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGeSURBVDjLvZPPK4NxHMe/F4dFymE8hx2YpEn+gWcHR20au4gdbCcnu3l6TqL8yO9oYSJmYbNSFsraZCSlbHJANEabaZtFYUzW29cOojzyK4f37ft6vz71/XwIAPKbkD8r4Hkeb6PX66HVaqFSqSCXyyGTycAwDLKyJchk8vGjCTTjATHNPk2MpujDCT4zl7etot8ZwYDjAuqBg6ii01v0LXMfBV27McxthMGbDsByTvvrI2rmqJmjZo6aOWrmqJnLkZY0V/Rsh7uXgim4w+bH+PI5ajs3UayzTgtaEy7C+BfztHZLzeWw3f0O1rSsoaB6wpVbaRQJwcoHN4N7jxoJXxdi8+mw2EZTcFXTCijokigNIsFfiC8T9QucvFlHMjKCRNCK0Ewa+NZuUPAVFiy4XSKauEeDp8ggnk50SEbNuNqqR2OD4ugtLFhwbSd1t9463JyZ8BgYwZ1vAmFHGbyGDNWXVjk2R4YOF0oRXShEYJLsnI4R87GR9O71EbFgAcuyszRrcpZdt7VLE6EpMhYwkcJvH1PYSsQUFv/bNT4D22mzuYC6IhwAAAAASUVORK5CYII=', 1);
insert into News (newsId, title, description, location, image, date, collegeID) values (4, 'new4', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '35 Lien Road', 'http://dummyimage.com/187x164.jpg/5fa2dd/ffffff', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGkSURBVDjLpZM/T8JAGMZf/gRU0lgU1EZDok5KSIwOfgKJhsGlgyaOfAE/Abo7dNfQ1W9AmNk0kjYO6ISLk4tBDJb27nzfKyWNFhLjJZeXlnue5/feXWNCCPjPSEa9bLfbpud5Z67rJrECVjmHwyHVW13XTyMNbNueR8GNqqp6Oj0HDoqAc5CMSJrNqtBsNk7w6beBZVmHJM7lcquZTAa6L69A6ZwL4IKjkQCGZo7jRLeAixuFQkH+Hgy+wEXxo/2ABnw8D8pHso1IA+oxlUpBr9fzkxmD7eKOTBejdNrwiQTkzFBEi+hgCN227rEymU7/aZXj6QT+Xgm5mAyKpV2ZHlCIiD2IhwkCA2lCyczv/U3pQv3dAB5aF9nCWDwSBun152v4/PDk80QDQgtuJYn4CJnju/PFC+ALRMfHrUYS0CkkEgk/mXEpIAOfxN/cnwTxEMFdq9WCfr8PiqLAzGwab2BMGjHh0xDhRIJqtbpvGEal0+lcapq2t76xCUv5NSkIWltZzss7Eh6xqK+xVquVUXiFsxR8TFRp4hE/maa5NdXgL+Mbb/xsAcKofWEAAAAASUVORK5CYII=', 1);
insert into News (newsId, title, description, location, image, date, collegeID) values (5, 'new5', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '75 Dayton Pass', 'http://dummyimage.com/132x207.png/dddddd/000000', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAI5SURBVDjLpVM5q1pREJ6r1w33qLihIgoS0Z8QYhRCAjapXBqrFCn8BQ9SBixs1N+RVyqBGBvttFELxUJxRwm4gc81ZwauaNp3YJhz7p2Zb7nnctfrFV6zRPDKxQubTqfz+3w+h1nA6XSC4/F4i8PhcIuXlxfM5VQqFcE+DiWw5vdSqbRiMpmo6P91L1MikUClUoHBYBBJp9NlYsAQv+t0OpjNZiCTyW5N9424H41GoNFowO12I+gTe1zmms0moRsMBliv1w90UQo2chwHYrGY0NVqNSiVSiiVStDr9SI8oiN11IpFcrmcQkC/Z4L5crnAfr+HYDAI7Xb7iUek3W4Hi8WCDBKK0EzMwll4hmee50GlUhFLHBDG6XjAAiaJKItEogcGwiCn00l1drsde8I8oqJWDHyBgzabDcmwWCzQ7/dBoVCQvO12C1qtFubzOaxWK2JMA7ARA31AI41GI8RiMZLm8XigVqsRQDKZJCOn0ynU63UCogH4BXBAo9GgwnfhMORyOZKDLNAwbMpms5QDgQBEo1G8C8AzR0vFYvETUq9Wq4RIV5QZhQzi8Tjo9Xqij0YXCgUYj8dUw+Rc+EQi8Vm4LPl8/hvT/oNtda1W6xcz7kMmk5Hgd8eFA9k6svyH5Y+TyWTN3d82v9//1uv1/gyFQhaHw3FhLN6gYd1ul26oy+UCs9mMMv8Oh0MRu9KzhwE+n09stVqDDPHZZrOZWJMY/9jlcvmV5TEz9xl/B+bbmaEvGJMv/wD5tI7A5/InTwAAAABJRU5ErkJggg==', 1);
insert into News (newsId, title, description, location, image, date, collegeID) values (6, 'new6', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '9865 Becker Road', 'http://dummyimage.com/172x217.bmp/dddddd/000000', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ/SURBVDjLpZNLiI1xGMZ/3/edOWZojjkiudbMuEVMM4SMBVlbSUpZyAIhG4qlkcJWycZOSslCMTNFuYVpRrkzLuMy5tA4xulcv//t/Vt80ZTLxltvz7N43vd5F+8TeO/5n0r9JNLTs9A7t8FbO0WsfSvWdtdv2VIAKJ45kxWtt4rWh5xSQ6LUyeldXVcAAu890t29zzt3hPp0ljBCyiVMofhMjNkmWldE64t1U5qWTpjXiiuVqDx8RDX35ZxTalfgrl7d6K2+HC5cQBBGYAyk05jhYWrPX350WpcbWpsX17e0QGEMwgiasnzv7eX7oyfHUmLt3mjWTIJqFXJfwAlYS13zHKKV7XN9rInqG6D/AYgkBo0TyXSuId/Xvz0lxiyJMhkYegfGghdwDl68JpycgSiAwTeAgLYJ5scIWgUXx5mUGJPGOYgVKJUs0CZZMpIDaxNnEfAOlAFxYDSilKRE66K3dlpgDcQ1sC4ZtjbB8dxacBZSIYQhTqkwFKWu28FBmD0TKmWo1SCOwagEdZxgrZYYlEowv4X8jVuIUudDp9SJyodP7+NPI9C2FNJRIipXk4FqDVQM1QrUhbB2FYXRMXJXusdE667Ae0/++PFlotTZhmzjiknLlxOO5mDgCQRBcnq1Cm2L8M3zGO3p5fPte0/FmN0d/f13gp+v/Pnw4clOqQOi1P5sR1tj46wZcPceFMuwdjXFbwXen7+gRevTYsyxjoGB/K9PHF/vduxY4ZQ61dQ8d/XUDevBWfJ37jJy/eaQaL2z/f79a+P1wZ/C9Grz5ian1FHRek92zozg68s3l0Trg+19fUO/ib33f+3H69ZtetjZuf9fmuB/4/wDFoO2ZVesLdkAAAAASUVORK5CYII=', 1);
insert into News (newsId, title, description, location, image, date, collegeID) values (7, 'new7', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '22092 Pawling Junction', 'http://dummyimage.com/142x122.jpg/5fa2dd/ffffff', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ7SURBVDjLjZNPSFRRFMZ/9/2Z90anRlKzMS1UjFyoWS3U2oVQ0KIWrXJRFC7KTdRCqUWQkBt34aKN1a5FEUkRLbKFiBAoVi4kUQIbtfwz0zjjezPv3ttCwyYr+jibs7g/vu+cc8XDwbE+pcT5TFa5fsB26fzWtsC1Gbh85vA1AEtp0X76WGWp67pCCJN/yVMggxxP30xfADYAGV85juOKR29X8VgmJaaoKvtK2E4SaMXK9zCT01EKdB0Wxdw4V4VUQvyEWtkADMPEEJA1Fqgq+YoT+kzSTxHIAMtxqK6MMTtTSFGoBKXyXVkACjAMga+/EbJXSawn8aVHNggIdBrHcUj7YYrDBhqdN5gtgBDoQOHLHF7gs57zyaoAqQCRQyuJZQi0zp+qAaD1BsCllFS6EI2NryR+IBEiRDoVIRIqxzQN0GJ7BK03IkTMvXxZWCTqzlNQaOCIgLWVAhYXYsSi1ViG2LYZS/8KsHdTHm5ibnyIokgcISW2V8q+mnYibgyp1O9nseVgarkDqRRSKQ7432ip3I8CZuYXebXWjZkoxFQRbj/wyHjezhfd87de3p3osbTWCODkxmEBYNYnyKSXceffU9LaQcP0GEuZKY7UHaViVy1Dk8/E6Mf4nebO8qLNVPnGZLgIv6SGZP1ZtGnzbvIthw42Ig1JY6wNKXI017cCXLVcWyRRuWhjWTMIsYnSPwuApeQitohwqu4SANdP3GfwQz/w3LVClnj8ZGimJSt1vdZ//gOJVCI6GR9hIj5MV9sAva8v4poOgCf03179oubO8p6KqujN1obj1O5p4tPCOCPvh5mbTfb9F2AT0gtcAXYAKaB/9F686wcCdBKN9UyNSAAAAABJRU5ErkJggg==', 1);
insert into News (newsId, title, description, location, image, date, collegeID) values (8, 'new8', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '4 Grasskamp Plaza', 'http://dummyimage.com/181x232.png/5fa2dd/ffffff', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJlSURBVDjLpZNNSJRhEMd/z7u6666b6VaQFoohgYpYFHoKo2+SDnbo4smOHQUvfVy6CoHHTkUQHYLCgyAEK32AUUSHCqKMxYIs3ErXV3ff93memQ7FJhkdak7DMPPjz8z8jaryP1Hze8HNmKwqoyqcEKFPFVR4IsK0Clc2ndJwfb9Zr8DNmAEVrpnWsXbT2Icmc6AeLRfx354TvR0viDDSNKT3NwBc3gxp48CdYPswmtmMX3uNRF9QVwFTR1DXgbEB0fvbRJ/vn952Ru9WATZvcqrMJ3puZSUo4SsFsCuIi1Bf+QERxaRaSaR6WJ49G4rQ1jysXwMAFUaDtgtZTYJEBXCr5CeLIDH4mAf3QGyIK73AR+/IdF7IimcUIAAQYdA09SOVAurKqFgOnkyjYlFvOTAQohKhNsQtPaOmcTfiGVwP6CLVgLil6pCKRV2M+vhnblEfI1ERiPCe9uoZVSirqyTxDnxMuFzixdM5St9CEEd9xtDd3UAm5VECUEWExC8FngK2DCQJl1eYzb+iZUeWw8d3cehYG80taR4/WiBcKWOCDOJrsBFzVQUiTNni8z1BYyvp2rf0D3RSX1tGfAX1ETtbkuSae0n7j9Q09FIuzmNjptYrmFh7dTnEbSKR7SSbBpUIfFzdR9p/JFHfgaZ6WXh4ObQRE1VA02ldFGFkbe4G6A4SDf2YRA4VBVGC5FZqtx1BM4f48nISGzOy97wubnjlhZvmqHiu1neNtSe3dBPUBiAOF3lWF97waXa84Czn9l3U6T96AeDDdZMVz5gIJ7ynz8XgLE+cZdpZxvdf+ouZ/iW+AxEldjf3XZxpAAAAAElFTkSuQmCC', 1);
insert into News (newsId, title, description, location, image, date, collegeID) values (9, 'new9', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '0 Holy Cross Circle', 'http://dummyimage.com/246x115.bmp/cc0000/ffffff', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJlSURBVDjLpZNrSJNRGMdlr7qat+zKaoYhjqYphRCWCtKFoCj60CeRpDB0djHUSMOZm0JhGEmlNhczXXunDgy7TNcVcsjGpk6dNsiJyyjWNg3ZnJfef69vMBBkFn34wXMu/995DocTBCDof1h1cvBJnM5RTsBVyYLzBgvfigjopbGDfyUwK+Nfu2RsTNcTDO5aAk4RC1/KQ2BqjetbU+AiOZip/xNyLndQSeCHmMBUIQFzTjDWFDiu0O0qzmJKU4OvPSmYuETAXhKM8WshsOYR0NZlRAUUtOXt+Dk99hYufSu+6x7D8fEAnLozmLEq0V3M8ww1F4QGFEhz+Aa3QQmHsQPeQZJGxdRuEwnp+SRjwCs0FpwIf3guwfayKBE+owxzI50M3oGn0JbuQW323vE7uac2rSpoFB6Pll/M0FjEofDZe2Go2ocu0VGG5dpjUWOEXpPlp72X5h/irhBIcrNYNunp5s+31gFTWmCsAfiQDWiOgXq2H1Q7H1TPSVCfmjBaHY4HFzJfNOQd5vgFZGHmo5n7bEBfQlPMBNGVCqgTQZGxWGjhwivbCKorHb/UybDf5UFekE76Bf3lu5ccz0uxpIgBOvgMlGoXPeZhvnkbHY7GbEMYnHVseKQb4OquQF+JYMEvMIsElFsroTfQL/TqCBYVOzHfsh0++RZ4mqIxJ98Kj2wzc7qtJhLTb6pguJ5A+QXDLZfLTGXxi45762G7TUs6BKtirWZjWByG/opkH52pWvEKEyphRK8oLan9aurkgCSGslRHYVTCwQjNkDgSpptcqrMwafZd2cGUyTZhRMDf+C/8Blefvm4GxFC9AAAAAElFTkSuQmCC', 1);
insert into News (newsId, title, description, location, image, date, collegeID) values (10, 'new10', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '5 Anderson Junction', 'http://dummyimage.com/199x125.bmp/5fa2dd/ffffff', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJoSURBVDjLhZJZTxNhFIbnRq/9E/4Rf4JRE+PChV4YYjQxLglRQkgDWhGXRo2VNJWu0IWh0hY6iEvpjl1AWuoImqFCO6V0uqRrzOt8H0mxBvQkTyYnOfOcd775mPn5+WMcx12dm5v74Ha7806ns+JwOOIsyyptNttxAMy/YDwejz6ZTKJQKKDZbKLdbkOSJKTTaVgslrX/CmZnZwu1Wg3VarUjID3BbDZD5d7GE+cWRhwZ3J8SoLD+wMDEOu4ZvqFP9zXMuFyuXLlcphszmQwEQUAwGESpVILBYEC13j6Um9pUg5mZmck2Gg3wPI9isYh4PE4hNT4+DlXkIUZDw3jgH4TC24+Bj324u3CbCq6//gJmenqaClZXV6kgEolQSGk0GhxWRND7MgHGbrdTQSKRwM7ODnw+H/x+Px1Sq9UwenMHQgSXVVEwVqtVarVaSKVS9PvD4TBisRgVqFSqzkZrINuVIF+qo+dxBMyEXCSyKIr095EDJUmI6OlzNeyhHFgZIiBPNpiFcymLje0yziqDYIxG41GdTtc7pp/CpMWCMa0eJpMJYyYXKpXKoQn4nyWcHvLvXQatVntEaV0Dv7GJCW4Ztk882MAm3i6JFHdUpAKaQk5gl1kTJJwaWty/UYOT31GsNOkwKS6e79roiYko19qdngh6HgX3Bf3mdSrwyC9yf/EukYfzs9gFEZxX+vcFffo0dmXBwvLe5vcr3QlsAbGrpwlG/hDcepNCodyAKNWxVahBEKvySVfAZ0p0+CAuKH2/OoIbmuTitVcr1SsvErj0LIqLoxGcU4ZwZjiAkwrvgZy4w7G/AXhUV4qmXai6AAAAAElFTkSuQmCC', 1);



INSERT INTO support (`supportName`, `desc`, `contactNum`, `location`, `collegeID`) VALUES ('Computing Support', 'tuition', '+353 1548945', 'NCI 1st Floor', 1);
INSERT INTO support (`supportName`, `desc`, `contactNum`, `location`, `collegeID`) VALUES ('College Office', 'Contact the lecturer of business.', '+353 1672354', 'NCI 1st Floor', 1);
INSERT INTO support (`supportName`, `desc`, `contactNum`, `location`, `collegeID`) VALUES ('Fees Office', 'Tuition fees cover the cost of your study and include charges for registration', '+353 1654983', 'NCI 3rd Floor', 1);
INSERT INTO support (`supportName`, `desc`, `contactNum`, `location`, `collegeID`) VALUES ('International Students', 'Get help of study.', '+353 1648524', 'NCI 3rd Floor', 1);
INSERT INTO support (`supportName`, `desc`, `contactNum`, `location`, `collegeID`) VALUES ('School of Computing', 'supervision', '+353 1648524', 'NCI 1st Floor', 1);
INSERT INTO support (`supportName`, `desc`, `contactNum`, `location`, `collegeID`) VALUES ('School of Business', 'The Computing Support Service provides additional support to computing students experiencing difficulties in technical computing modules.', '+353 1672354', 'NCI1st Floor', 1);
INSERT INTO support (`supportName`, `desc`, `contactNum`, `location`, `collegeID`) VALUES ('Teaching and Learning', 'examinations and graduation.', '+353 1648524', 'NCI 1st Floor', 1);

insert into TimeSlot (slotID, timeStart, timeEnd) values (1, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (2, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (3, '15:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (4, '9:00', '10:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (5, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (6, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (7, '15:00', '16:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (8, '10:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (9, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (10, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (11, '11:00', '13:00');

insert into TimeSlot (slotID, timeStart, timeEnd) values (12, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (13, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (14, '15:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (15, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (16, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (17, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (18, '16:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (19, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (20, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (21, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (22, '14:00', '16:00');

insert into TimeSlot (slotID, timeStart, timeEnd) values (23, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (24, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (25, '15:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (26, '9:00', '10:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (27, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (28, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (29, '15:00', '16:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (30, '10:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (31, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (32, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (33, '11:00', '13:00');

insert into TimeSlot (slotID, timeStart, timeEnd) values (34, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (35, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (36, '15:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (37, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (38, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (39, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (40, '16:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (41, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (42, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (43, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (44, '14:00', '16:00');

insert into TimeSlot (slotID, timeStart, timeEnd) values (45, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (46, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (47, '15:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (48, '9:00', '10:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (49, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (50, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (51, '15:00', '16:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (52, '10:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (53, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (54, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (55, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (56, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (57, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (58, '15:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (59, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (60, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (61, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (62, '16:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (63, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (64, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (65, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (66, '14:00', '16:00');

insert into TimeSlot (slotID, timeStart, timeEnd) values (67, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (68, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (69, '15:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (70, '9:00', '10:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (71, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (72, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (73, '15:00', '16:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (74, '10:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (75, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (76, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (77, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (78, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (79, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (80, '15:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (81, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (82, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (83, '14:00', '15:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (84, '16:00', '17:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (85, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (86, '9:00', '11:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (87, '11:00', '13:00');
insert into TimeSlot (slotID, timeStart, timeEnd) values (88, '14:00', '16:00');

insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 1, 'Data Communications and Networking', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 2, 'Software Engineering', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 3, 'Business Entrepreneurship', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 4, 'Management Information System', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 5, 'Interdisciplinary Team Project', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 6, 'Business Entrepreneurship', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 7, 'Data Communications and Networking', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 8, 'Software Engineering', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 9, 'Interdisciplinary Team Project', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 10, 'Interdisciplinary Team Project', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 11, 'Management Information System', 9);

insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 12, 'Data Communications and Networking', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 13, 'Data Communications and Networking', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 14, 'Business Entrepreneurship', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 15, 'Data Structures', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 16, 'Interdisciplinary Team Project', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 17, 'Business Entrepreneurship', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 18, 'Software Engineering', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 19, 'Interdisciplinary Team Project', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 20, 'Interdisciplinary Team Project', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 21, 'Data Structures', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 22, 'Software Engineering', 31);

insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 23, 'The Computing Industry', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 24, 'Problem Solving and Programming Concepts', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 25, 'The Computing Industry', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 26, 'Introduction to Mathematics for Business & Computing', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 27, 'Web Design', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 28, 'Problem Solving and Programming Concepts', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 29, 'Introduction to Mathematics for Business & Computing', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 30, 'Web Design', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 31, 'The Computing Industry', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 32, 'Problem Solving and Programming Concepts', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 33, 'Web Design', 9);

insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 34, 'The Computing Industry', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 35, 'Managing Your Learning', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 36, 'Problem Solving and Programming Concepts', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 37, 'Introduction to Mathematics for Business & Computing', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 38, 'Web Design', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 39, 'Problem Solving and Programming Concepts', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 40, 'Introduction to Mathematics for Business & Computing', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 41, 'Web Design', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 42, 'The Computing Industry', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 43, 'Problem Solving and Programming Concepts', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 44, 'Web Design', 31);

insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 45, 'Digital Multimedia', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 46, 'Software Applications for Business', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 47, 'Introduction to Programming', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 48, 'Computer Architecture', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 49, 'Introduction to Marketing', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 50, 'Software Applications for Business', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 51, 'Introduction to Programming', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 52, 'Computer Architecture', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 53, 'Introduction to Marketing', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 54, 'Introduction to Marketing', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 55, 'Digital Multimedia', 9);

insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 56, 'Digital Multimedia', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 57, 'Digital Multimedia', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 58, 'Introduction to Programming', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 59, 'Computer Architecture', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 60, 'Introduction to Marketing', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 61, 'Software Applications for Business', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 62, 'Computer Architecture', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 63, 'Computer Architecture', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 64, 'Introduction to Marketing', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 65, 'Introduction to Marketing', 31);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 66, 'Digital Multimedia', 31);

insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 67, 'Operating Systems', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 68, 'Web Application Development', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 69, 'Fundamentals of Business Analysis', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 70, 'Object Oriented Programming', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 71, 'IT Project Management', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 72, 'Introduction to Databases', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 73, 'IT Project Management', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 74, 'Introduction to Databases', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 75, 'Object Oriented Programming', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 76, 'Object Oriented Programming', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 77, 'Operating Systems', 9);

insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 78, 'Web Application Development', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 79, 'Web Application Development', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Monday', 80, 'Fundamentals of Business Analysis', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 81, 'Object Oriented Programming', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 82, 'IT Project Management', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 83, 'Introduction to Databases', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Tuesday', 84, 'IT Project Management', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Wednesday', 85, 'Introduction to Databases', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 86, 'Object Oriented Programming', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 87, 'Object Oriented Programming', 9);
insert into timetable (she_Day, she_TimeSlot, className, courseCode) values ('Thursday', 88, 'Operating Systems', 9);