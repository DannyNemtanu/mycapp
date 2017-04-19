
DROP DATABASE mydb;
CREATE DATABASE IF NOT EXISTS `mydb`;
USE `mydb` ;
 
 
CREATE TABLE IF NOT EXISTS `mydb`.`College` (
    `collegeID` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL,
    `addr1` VARCHAR(50) NOT NULL,
    `addr2` VARCHAR(50) NOT NULL,
    `postalCode`VARCHAR(45) NOT NULL,
    `county` VARCHAR(45) NULL,
    `contactNum` VARCHAR(45) NULL,
    PRIMARY KEY (`collegeID`)
);

 
 
CREATE TABLE IF NOT EXISTS `mydb`.`Course` (
    `collegeID` INT NOT NULL,
    `courseCode` VARCHAR(20) NOT NULL,
    `courseName` VARCHAR(999) NOT NULL,
    PRIMARY KEY (`courseCode`),
    FOREIGN KEY (`collegeID`)
        REFERENCES `mydb`.`College` (`collegeID`)
);
 
 
 
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
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
        REFERENCES `mydb`.`Course` (`courseCode`)
);
 
 
 
CREATE TABLE IF NOT EXISTS `mydb`.`Classes` (
    `className` VARCHAR(100) NOT NULL,
    `lecturer` VARCHAR(100) NOT NULL,
    `assistant` VARCHAR(100) NULL,
    `courseCode` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`className` , `courseCode`),
    FOREIGN KEY (`courseCode`)
        REFERENCES `mydb`.`Course` (`courseCode`)
);
 
 
 
CREATE TABLE IF NOT EXISTS `mydb`.`Grade` (
    `ClassName` VARCHAR(100) NOT NULL,
    `studentNumber` VARCHAR(45) NOT NULL,
    `grade` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`studentNumber`, `ClassName`),
  CONSTRAINT `className`
    FOREIGN KEY (`ClassName`)
    REFERENCES `mydb`.`Classes` (`className`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `studentNumber`
    FOREIGN KEY (`studentNumber`)
    REFERENCES `mydb`.`Student` (`studentNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
 
 
CREATE TABLE IF NOT EXISTS `mydb`.`TimeSlot` (
    `slotID` INT NOT NULL AUTO_INCREMENT,
    `timeStart` TIME NOT NULL,
    `timeEnd` TIME NOT NULL,
    PRIMARY KEY (`slotID`)
);
 
 
CREATE TABLE IF NOT EXISTS `mydb`.`Timetable` (
    `she_Day` VARCHAR(10) NOT NULL,
    `she_TimeSlot` INT NOT NULL,
    `className` VARCHAR(100) NOT NULL,
    `courseCode` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`she_TimeSlot` , `className` , `courseCode`),
    FOREIGN KEY (`she_TimeSlot`)
        REFERENCES `mydb`.`TimeSlot` (`slotID`),
    FOREIGN KEY (`className`)
        REFERENCES `mydb`.`Classes` (`className`),
    FOREIGN KEY (`courseCode`)
        REFERENCES `mydb`.`Course` (`courseCode`)
);
 
 
CREATE TABLE IF NOT EXISTS `mydb`.`Library` (
    `bookID` VARCHAR(45) NOT NULL ,
    `collegeID` INT NOT NULL,
    `title` VARCHAR(45) NULL,
    `author` VARCHAR(45) NULL,
    `description` VARCHAR(500) NULL,
    `image` VARCHAR(900) NULL,
    `category` VARCHAR(45) NULL,
    PRIMARY KEY (`bookID` , `collegeID`),
    FOREIGN KEY (`collegeID`)
        REFERENCES `mydb`.`College` (`collegeID`)
);
 
 
CREATE TABLE IF NOT EXISTS `mydb`.`MyBooks` (
    `bookID` VARCHAR(45) NOT NULL,
    `studentID` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`bookID` , `studentID`),
    FOREIGN KEY (`studentID`)
        REFERENCES `mydb`.`Student` (`studentNumber`),
    FOREIGN KEY (`bookID`)
        REFERENCES `mydb`.`Library` (`bookID`)
);
 
CREATE TABLE IF NOT EXISTS `mydb`.`News` (
    `newsId` mediumint,
  `title` TEXT default NULL,
  `description` TEXT default NULL,
  `location` varchar(255) default NULL,
  `image` TEXT default NULL,
  `date` mediumint default NULL,
  `startTime` mediumint default NULL,
  `endTime` mediumint default NULL,
  `month` varchar(255),
  `collegeID` TEXT default NULL
);
 
 
CREATE TABLE IF NOT EXISTS `mydb`.`Support` (
    `supportName` VARCHAR(50) NOT NULL,
    `desc` VARCHAR(999) NOT NULL,
    `contactNum` VARCHAR(50) NOT NULL,
    `location` VARCHAR(999) NOT NULL,
    `collegeID` INT NOT NULL,
    PRIMARY KEY (`supportName` , `collegeID`),
    FOREIGN KEY (`collegeID`)
        REFERENCES `mydb`.`College` (`collegeID`)
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


INSERT INTO `myTable` (`newsId`,`title`,`description`,`location`,`image`,`date`,`startTime`,`endTime`,`month`,`collegeID`) VALUES (1,"Nunc commodo","imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant","118-5145 In Street","enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris",16,13,18,"May","1"),(2,"in","justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id","P.O. Box 331, 6278 Vel Avenue","aliquet magna a neque. Nullam ut nisi a odio semper",18,9,19,"Jan","1"),(3,"Praesent luctus.","porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem","654-4783 Ultrices. Av.","Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui",18,11,22,"Sep","1"),(4,"velit justo nec ante. Maecenas","euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus","P.O. Box 960, 7204 Ut Av.","lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum",13,10,19,"Oct","1"),(5,"sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor,","molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit","4638 Vestibulum Street","odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam",2,10,21,"Apr","1"),(6,"pellentesque eget, dictum placerat,","habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec","2022 Massa. St.","sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus",15,13,16,"Jan","1"),(7,"euismod in, dolor. Fusce feugiat. Lorem ipsum dolor","mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus.","Ap #528-2843 Consequat Avenue","Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est.",2,15,18,"Jun","1"),(8,"Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci","rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi","8561 Diam Avenue","mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,",15,15,22,"Jun","1"),(9,"elementum purus, accumsan interdum","Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem,","Ap #833-9542 Vestibulum Av.","ante dictum mi, ac mattis velit justo nec ante. Maecenas",5,11,20,"Aug","1"),(10,"nonummy ultricies ornare, elit elit fermentum risus,","tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce","9741 Ut, Avenue","dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris,",30,15,17,"Jul","1"),(11,"tincidunt congue turpis. In condimentum. Donec at arcu.","erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus.","8114 Ipsum Av.","arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt",16,12,22,"Aug","1"),(12,"Mauris magna. Duis dignissim","et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero","P.O. Box 331, 7933 Consequat Ave","tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac",28,11,23,"Jun","1"),(13,"dui. Suspendisse ac metus vitae velit","vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper","Ap #928-2091 Malesuada Street","eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit",5,16,21,"May","1"),(14,"ultrices a, auctor non, feugiat nec, diam.","velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque","6255 Interdum. Street","a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo",11,11,17,"Jul","1"),(15,"luctus felis purus ac tellus.","faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus,","933-9403 Scelerisque Av.","nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque,",6,15,21,"Apr","1"),(16,"interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh","Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.","P.O. Box 580, 359 Quis, Avenue","sit amet nulla. Donec non justo. Proin non massa non",9,14,18,"Sep","1"),(17,"Proin velit. Sed malesuada augue ut lacus.","pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit.","Ap #797-2989 Lacinia Rd.","amet ultricies sem magna nec quam. Curabitur vel lectus. Cum",7,12,23,"Mar","1"),(18,"rhoncus. Nullam velit dui, semper et,","interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam","Ap #646-1790 Arcu. St.","eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla",24,9,20,"Feb","1"),(19,"bibendum ullamcorper. Duis","magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est.","6474 Donec St.","Nam nulla magna, malesuada vel, convallis in, cursus et, eros.",15,15,22,"Jul","1"),(20,"lobortis mauris. Suspendisse aliquet molestie","sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl.","600-7554 Pellentesque. St.","sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit",3,14,24,"Jun","1"),(21,"Cras vulputate velit eu sem. Pellentesque ut","ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce","287-3556 Sit Ave","luctus sit amet, faucibus ut, nulla. Cras eu tellus eu",11,16,16,"Dec","1"),(22,"sed orci lobortis augue scelerisque mollis. Phasellus","risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris,","3690 Donec Rd.","luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed",25,10,17,"Aug","1"),(23,"Donec est. Nunc ullamcorper, velit","odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus.","754-6735 Pede, St.","magna tellus faucibus leo, in lobortis tellus justo sit amet",1,13,24,"Jan","1"),(24,"aliquet lobortis, nisi nibh lacinia","Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet","8173 Mollis Rd.","Nunc ut erat. Sed nunc est, mollis non, cursus non,",24,16,22,"Sep","1"),(25,"sed pede nec ante blandit viverra. Donec tempus, lorem","Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper","Ap #340-9164 Neque St.","magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl.",2,15,17,"Oct","1"),(26,"eros nec tellus. Nunc lectus","non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula","795-6217 Vel Av.","Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor",29,11,20,"Feb","1"),(27,"non enim.","Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit.","853-7085 Non, Avenue","Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus,",17,15,21,"May","1"),(28,"placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,","nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec","739-7179 A, Street","faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare.",23,15,20,"Jun","1"),(29,"adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl","quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor","P.O. Box 848, 5792 Sit Rd.","semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In",1,15,15,"Jul","1"),(30,"libero. Proin mi. Aliquam gravida mauris ut mi.","sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis","P.O. Box 317, 5964 Ipsum Road","pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus",15,10,17,"Feb","1"),(31,"Ut sagittis lobortis","malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque","7223 Sit Road","nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus",11,10,16,"May","1"),(32,"mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus","non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante.","P.O. Box 557, 6554 Tempor St.","urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat",19,16,15,"Jan","1"),(33,"id magna","Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus","P.O. Box 253, 409 Pede Road","Donec porttitor tellus non magna. Nam ligula elit, pretium et,",10,12,15,"Apr","1"),(34,"in magna. Phasellus dolor elit,","senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus","P.O. Box 265, 2213 Velit Av.","mattis semper, dui lectus rutrum urna, nec luctus felis purus",18,12,22,"Feb","1"),(35,"arcu eu odio","Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem,","Ap #804-2353 Nunc Avenue","interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus",3,15,15,"Mar","1"),(36,"facilisis eget,","Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu","9725 Lorem St.","metus sit amet ante. Vivamus non lorem vitae odio sagittis",31,14,23,"Jul","1"),(37,"metus. In nec orci. Donec nibh.","quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed","Ap #346-4652 Ac Street","mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam",2,12,17,"Aug","1"),(38,"cursus luctus, ipsum leo elementum","ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat.","775-5710 Eget Rd.","placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,",14,14,16,"Oct","1"),(39,"mauris sit amet lorem semper","ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque","440-7659 Sem St.","Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor",5,16,24,"Sep","1"),(40,"vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt","Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper","7666 Dignissim. St.","erat semper rutrum. Fusce dolor quam, elementum at, egestas a,",27,16,20,"Aug","1"),(41,"Proin sed turpis nec mauris blandit mattis.","dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus","P.O. Box 714, 851 Dignissim Avenue","neque. Sed eget lacus. Mauris non dui nec urna suscipit",2,13,18,"Sep","1"),(42,"metus facilisis lorem tristique aliquet. Phasellus fermentum convallis","vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc","Ap #536-1455 Ut Av.","sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit",27,10,23,"Aug","1"),(43,"Ut semper pretium neque. Morbi quis urna. Nunc","varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est.","470-496 Orci. Ave","vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id",19,11,15,"May","1"),(44,"Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada","sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a","P.O. Box 169, 8304 Maecenas St.","eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc",27,13,18,"Aug","1"),(45,"nec enim. Nunc ut erat.","Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla.","Ap #281-9555 Mollis Street","Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie",21,16,15,"Jan","1"),(46,"scelerisque mollis. Phasellus libero mauris, aliquam","tellus.","402 Ornare Rd.","molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl",1,12,16,"Jul","1"),(47,"eu, euismod","lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida","P.O. Box 689, 7296 Nunc Rd.","luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis.",12,9,24,"May","1"),(48,"nisl sem, consequat","gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et","Ap #348-4716 Praesent Av.","Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean",13,9,16,"Aug","1"),(49,"libero at","urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus","P.O. Box 613, 4546 Elit, Avenue","ornare, lectus ante dictum mi, ac mattis velit justo nec",20,9,21,"Feb","1"),(50,"fringilla mi lacinia mattis.","est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non","656-3381 Nisi Av.","felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit",16,14,20,"Apr","1"),(51,"primis in faucibus","pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor,","640-2431 Purus Road","enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare",25,14,23,"Aug","1"),(52,"In at pede. Cras vulputate velit eu sem. Pellentesque ut","odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem.","1974 Netus Road","ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer",4,10,23,"Feb","1"),(53,"lectus","nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies","Ap #196-3794 Vel, Av.","aliquet vel, vulputate eu, odio. Phasellus at augue id ante",27,14,22,"Nov","1"),(54,"Nunc sed orci","sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu","Ap #961-2455 Diam St.","ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis",13,15,24,"Jul","1"),(55,"magnis dis parturient montes, nascetur","Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis.","P.O. Box 905, 2475 Non, Avenue","risus. Quisque libero lacus, varius et, euismod et, commodo at,",8,9,16,"May","1"),(56,"nisl arcu","enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac","452-7094 Nascetur Street","dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui.",6,12,22,"Sep","1"),(57,"et magnis","Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam","458-9769 Non Rd.","arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt",2,13,20,"May","1"),(58,"Nam ac","urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel,","Ap #221-4357 Lorem Avenue","semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque",22,16,21,"Jul","1"),(59,"sem ut cursus luctus, ipsum","quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id","194-9051 Eget St.","ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat",22,9,17,"Oct","1"),(60,"ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam","mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit","Ap #210-3761 Dui. St.","sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum",17,16,19,"Nov","1"),(61,"Sed diam lorem, auctor","Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a,","5926 Eu Road","aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend",1,12,18,"Apr","1"),(62,"quis, pede. Suspendisse dui.","Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna","583-4472 Amet, Road","Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum",3,10,21,"Feb","1"),(63,"elit elit fermentum risus, at fringilla purus mauris","vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit","Ap #589-7331 Sed Avenue","sit amet diam eu dolor egestas rhoncus. Proin nisl sem,",11,15,19,"Jun","1"),(64,"Curabitur vel lectus. Cum sociis natoque penatibus","Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci,","787-3853 Non Street","pellentesque, tellus sem mollis dui, in sodales elit erat vitae",6,13,17,"Nov","1"),(65,"pede blandit congue. In scelerisque scelerisque dui. Suspendisse","sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus.","Ap #978-4368 Adipiscing Rd.","Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet",19,11,22,"Mar","1"),(66,"blandit. Nam nulla magna, malesuada","placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt,","Ap #667-5941 Eget Avenue","diam at pretium aliquet, metus urna convallis erat, eget tincidunt",4,12,21,"Apr","1"),(67,"congue a, aliquet vel, vulputate","a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus,","6882 Mi Rd.","ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin",29,11,15,"Jan","1"),(68,"sem mollis dui, in sodales","cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam","2907 Facilisis St.","pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu",6,13,17,"Jan","1"),(69,"convallis convallis dolor.","dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse","Ap #584-5363 Tincidunt, St.","eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est.",31,15,15,"May","1"),(70,"justo nec ante. Maecenas","nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus","9753 Volutpat Rd.","tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed",13,9,23,"Sep","1"),(71,"ipsum. Phasellus vitae","risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa.","Ap #948-2410 Nec St.","Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla",3,16,22,"Dec","1"),(72,"erat volutpat. Nulla dignissim. Maecenas ornare","pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus","Ap #550-1184 Pede. Av.","pellentesque, tellus sem mollis dui, in sodales elit erat vitae",27,15,19,"Sep","1"),(73,"tempor arcu.","sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc","Ap #694-8429 Mauris Ave","cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin",21,12,21,"May","1"),(74,"euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas","pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam","498-7033 Erat Avenue","vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci",26,11,24,"Jul","1"),(75,"auctor non,","penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec","Ap #648-1032 Fringilla Rd.","dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer",26,15,24,"Feb","1"),(76,"eu nibh","Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed","2414 Bibendum Street","sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus",22,12,17,"Dec","1"),(77,"enim mi tempor lorem, eget mollis lectus pede","Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna","Ap #156-967 Tristique Av.","lectus sit amet luctus vulputate, nisi sem semper erat, in",13,16,17,"Nov","1"),(78,"vitae odio sagittis semper. Nam","ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget","Ap #624-4380 Pede St.","Cum sociis natoque penatibus et magnis dis parturient montes, nascetur",8,9,23,"Aug","1"),(79,"ipsum. Suspendisse","Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus","219-7418 Tristique St.","Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus,",19,15,15,"Dec","1"),(80,"fermentum arcu. Vestibulum ante","nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque","2760 Ipsum Rd.","lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus",12,12,16,"Nov","1"),(81,"orci, in consequat enim diam vel arcu. Curabitur","ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue","P.O. Box 699, 1683 Erat. Avenue","suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in",19,9,16,"Apr","1"),(82,"Praesent interdum ligula","lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat","P.O. Box 574, 6255 Nunc Avenue","magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus",28,16,18,"Aug","1"),(83,"velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum","ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt","546-3372 Dolor. Road","ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus.",22,10,23,"May","1"),(84,"euismod urna.","enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci","210-9286 Penatibus Rd.","urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum",9,13,22,"Jul","1"),(85,"sit amet luctus vulputate, nisi","nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed","P.O. Box 931, 849 Dolor St.","hendrerit neque. In ornare sagittis felis. Donec tempor, est ac",16,13,18,"Jul","1"),(86,"dictum","sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed","P.O. Box 631, 9018 Ac Street","Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi,",14,15,21,"Aug","1"),(87,"mi lorem, vehicula","eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu","Ap #896-3552 Eget, Street","mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras",25,13,24,"Dec","1"),(88,"dui lectus rutrum urna,","per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu","6112 Natoque St.","varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla",24,9,16,"Sep","1"),(89,"Suspendisse eleifend.","libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean","989-6243 Ligula. Av.","metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh.",24,11,23,"Aug","1"),(90,"Quisque purus sapien, gravida","pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem","298-5452 Integer Ave","at fringilla purus mauris a nunc. In at pede. Cras",15,16,15,"Sep","1"),(91,"Morbi accumsan laoreet ipsum. Curabitur consequat,","ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel","P.O. Box 601, 5567 Sodales St.","euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut,",6,16,19,"Aug","1"),(92,"ut, pharetra sed,","egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras","625-4532 Erat. St.","Quisque ornare tortor at risus. Nunc ac sem ut dolor",23,10,22,"May","1"),(93,"rutrum, justo. Praesent luctus. Curabitur egestas","sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est","Ap #307-868 Mollis Avenue","Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus",4,16,21,"Dec","1"),(94,"nulla magna,","blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor","P.O. Box 450, 4535 Ultricies Ave","Cum sociis natoque penatibus et magnis dis parturient montes, nascetur",31,14,15,"Apr","1"),(95,"adipiscing","enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus","P.O. Box 164, 3331 Natoque Street","per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare.",25,14,16,"Sep","1"),(96,"ad","lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor.","749-1834 Mauris, Av.","dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing",30,15,23,"Jun","1"),(97,"dolor vitae","neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget,","713-9677 Mollis Street","diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat.",11,14,19,"Feb","1"),(98,"egestas. Aliquam fringilla","sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in","P.O. Box 123, 7570 Consectetuer, St.","libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus",15,12,16,"Nov","1"),(99,"amet ante. Vivamus non lorem vitae odio sagittis","Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum","Ap #213-2511 Sit Road","dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur",17,9,17,"Nov","1"),(100,"nascetur ridiculus mus. Aenean eget magna. Suspendisse","Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc","Ap #836-6462 Cras Rd.","diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget,",11,11,20,"Jul","1");


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