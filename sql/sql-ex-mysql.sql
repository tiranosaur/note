/*
drop table pass_in_trip;
drop table  passenger;
drop table  trip;
drop table  company;

*/
CREATE TABLE Company (
                         ID_comp int NOT NULL ,
                         name char (10) NOT NULL
);


CREATE TABLE Pass_in_trip (
                              trip_no int NOT NULL ,
                              date datetime NOT NULL ,
                              ID_psg int NOT NULL ,
                              place char (10) NOT NULL
);


CREATE TABLE Passenger (
                           ID_psg int NOT NULL ,
                           name char (20) NOT NULL
);


CREATE TABLE Trip (
                      trip_no int NOT NULL ,
                      ID_comp int NOT NULL ,
                      plane char (10) NOT NULL ,
                      town_from char (25) NOT NULL ,
                      town_to char (25) NOT NULL ,
                      time_out datetime NOT NULL ,
                      time_in datetime NOT NULL
);


ALTER TABLE Company  ADD
    CONSTRAINT PK2 PRIMARY KEY
        (
         ID_comp
            );


ALTER TABLE Pass_in_trip  ADD
    CONSTRAINT PK_pt PRIMARY KEY  CLUSTERED
        (
         trip_no,
         date,
         ID_psg
            );


ALTER TABLE Passenger  ADD
    CONSTRAINT PK_psg PRIMARY KEY  CLUSTERED
        (
         ID_psg
            );


ALTER TABLE Trip  ADD
    CONSTRAINT PK_t PRIMARY KEY  CLUSTERED
        (
         trip_no
            );


ALTER TABLE Pass_in_trip ADD
    CONSTRAINT FK_Pass_in_trip_Passenger FOREIGN KEY
        (
         ID_psg
            ) REFERENCES Passenger (
                                    ID_psg
            );

ALTER TABLE Pass_in_trip ADD
    CONSTRAINT FK_Pass_in_trip_Trip FOREIGN KEY
        (
         trip_no
            ) REFERENCES Trip (
                               trip_no
            );


ALTER TABLE Trip ADD
    CONSTRAINT FK_Trip_Company FOREIGN KEY
        (
         ID_comp
            ) REFERENCES Company (
                                  ID_comp
            );


/*----Company------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Company values(1,'Don_avia  ');
insert into Company values(2,'Aeroflot  ');
insert into Company values(3,'Dale_avia ');
insert into Company values(4,'air_France');
insert into Company values(5,'British_AW');



/*----Passenger------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Passenger values(1,'Bruce Willis        ');
insert into Passenger values(2,'George Clooney      ');
insert into Passenger values(3,'Kevin Costner       ');
insert into Passenger values(4,'Donald Sutherland   ');
insert into Passenger values(5,'Jennifer Lopez      ');
insert into Passenger values(6,'Ray Liotta          ');
insert into Passenger values(7,'Samuel L. Jackson   ');
insert into Passenger values(8,'Nikole Kidman       ');
insert into Passenger values(9,'Alan Rickman        ');
insert into Passenger values(10,'Kurt Russell        ');
insert into Passenger values(11,'Harrison Ford       ');
insert into Passenger values(12,'Russell Crowe       ');
insert into Passenger values(13,'Steve Martin        ');
insert into Passenger values(14,'Michael Caine       ');
insert into Passenger values(15,'Angelina Jolie      ');
insert into Passenger values(16,'Mel Gibson          ');
insert into Passenger values(17,'Michael Douglas     ');
insert into Passenger values(18,'John Travolta       ');
insert into Passenger values(19,'Sylvester Stallone  ');
insert into Passenger values(20,'Tommy Lee Jones     ');
insert into Passenger values(21,'Catherine Zeta-Jones');
insert into Passenger values(22,'Antonio Banderas    ');
insert into Passenger values(23,'Kim Basinger        ');
insert into Passenger values(24,'Sam Neill           ');
insert into Passenger values(25,'Gary Oldman         ');
insert into Passenger values(26,'Clint Eastwood      ');
insert into Passenger values(27,'Brad Pitt           ');
insert into Passenger values(28,'Johnny Depp         ');
insert into Passenger values(29,'Pierce Brosnan      ');
insert into Passenger values(30,'Sean Connery        ');
insert into Passenger values(31,'Bruce Willis        ');
insert into Passenger values(37,'Mullah Omar         ');




/*----Trip------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Trip values(1100,4,'Boeing    ','Rostov                   ','Paris                    ','1900-01-01 14:30:00','1900-01-01 17:50:00');
insert into Trip values(1101,4,'Boeing    ','Paris                    ','Rostov                   ','1900-01-01 08:12:00','1900-01-01 11:45:00');
insert into Trip values(1123,3,'TU-154    ','Rostov                   ','Vladivostok              ','1900-01-01 16:20:00','1900-01-01 03:40:00');
insert into Trip values(1124,3,'TU-154    ','Vladivostok              ','Rostov                   ','1900-01-01 09:00:00','1900-01-01 19:50:00');
insert into Trip values(1145,2,'IL-86     ','Moscow                   ','Rostov                   ','1900-01-01 09:35:00','1900-01-01 11:23:00');
insert into Trip values(1146,2,'IL-86     ','Rostov                   ','Moscow                   ','1900-01-01 17:55:00','1900-01-01 20:01:00');
insert into Trip values(1181,1,'TU-134    ','Rostov                   ','Moscow                   ','1900-01-01 06:12:00','1900-01-01 08:01:00');
insert into Trip values(1182,1,'TU-134    ','Moscow                   ','Rostov                   ','1900-01-01 12:35:00','1900-01-01 14:30:00');
insert into Trip values(1187,1,'TU-134    ','Rostov                   ','Moscow                   ','1900-01-01 15:42:00','1900-01-01 17:39:00');
insert into Trip values(1188,1,'TU-134    ','Moscow                   ','Rostov                   ','1900-01-01 22:50:00','1900-01-01 00:48:00');
insert into Trip values(1195,1,'TU-154    ','Rostov                   ','Moscow                   ','1900-01-01 23:30:00','1900-01-01 01:11:00');
insert into Trip values(1196,1,'TU-154    ','Moscow                   ','Rostov                   ','1900-01-01 04:00:00','1900-01-01 05:45:00');
insert into Trip values(7771,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 01:00:00','1900-01-01 11:00:00');
insert into Trip values(7772,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 12:00:00','1900-01-01 02:00:00');
insert into Trip values(7773,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 03:00:00','1900-01-01 13:00:00');
insert into Trip values(7774,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 14:00:00','1900-01-01 06:00:00');
insert into Trip values(7775,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 09:00:00','1900-01-01 20:00:00');
insert into Trip values(7776,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 18:00:00','1900-01-01 08:00:00');
insert into Trip values(7777,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 18:00:00','1900-01-01 06:00:00');
insert into Trip values(7778,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 22:00:00','1900-01-01 12:00:00');
insert into Trip values(8881,5,'Boeing    ','London                   ','Paris                    ','1900-01-01 03:00:00','1900-01-01 04:00:00');
insert into Trip values(8882,5,'Boeing    ','Paris                    ','London                   ','1900-01-01 22:00:00','1900-01-01 23:00:00');




/*----Pass_in_trip------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Pass_in_trip values(1100,'2003-04-29 00:00:00',1,'1a        ');
insert into Pass_in_trip values(1123,'2003-04-05 00:00:00',3,'2a        ');
insert into Pass_in_trip values(1123,'2003-04-08 00:00:00',1,'4c        ');
insert into Pass_in_trip values(1123,'2003-04-08 00:00:00',6,'4b        ');
insert into Pass_in_trip values(1124,'2003-04-02 00:00:00',2,'2d        ');
insert into Pass_in_trip values(1145,'2003-04-05 00:00:00',3,'2c        ');
insert into Pass_in_trip values(1181,'2003-04-01 00:00:00',1,'1a        ');
insert into Pass_in_trip values(1181,'2003-04-01 00:00:00',6,'1b        ');
insert into Pass_in_trip values(1181,'2003-04-01 00:00:00',8,'3c        ');
insert into Pass_in_trip values(1181,'2003-04-13 00:00:00',5,'1b        ');
insert into Pass_in_trip values(1182,'2003-04-13 00:00:00',5,'4b        ');
insert into Pass_in_trip values(1187,'2003-04-14 00:00:00',8,'3a        ');
insert into Pass_in_trip values(1188,'2003-04-01 00:00:00',8,'3a        ');
insert into Pass_in_trip values(1182,'2003-04-13 00:00:00',9,'6d        ');
insert into Pass_in_trip values(1145,'2003-04-25 00:00:00',5,'1d        ');
insert into Pass_in_trip values(1187,'2003-04-14 00:00:00',10,'3d        ');
insert into Pass_in_trip values(8882,'2005-11-06 00:00:00',37,'1a        ');
insert into Pass_in_trip values(7771,'2005-11-07 00:00:00',37,'1c        ');
insert into Pass_in_trip values(7772,'2005-11-07 00:00:00',37,'1a        ');
insert into Pass_in_trip values(8881,'2005-11-08 00:00:00',37,'1d        ');
insert into Pass_in_trip values(7778,'2005-11-05 00:00:00',10,'2a        ');
insert into Pass_in_trip values(7772,'2005-11-29 00:00:00',10,'3a        ');
insert into Pass_in_trip values(7771,'2005-11-04 00:00:00',11,'4a        ');
insert into Pass_in_trip values(7771,'2005-11-07 00:00:00',11,'1b        ');
insert into Pass_in_trip values(7771,'2005-11-09 00:00:00',11,'5a        ');
insert into Pass_in_trip values(7772,'2005-11-07 00:00:00',12,'1d        ');
insert into Pass_in_trip values(7773,'2005-11-07 00:00:00',13,'2d        ');
insert into Pass_in_trip values(7772,'2005-11-29 00:00:00',13,'1b        ');
insert into Pass_in_trip values(8882,'2005-11-13 00:00:00',14,'3d        ');
insert into Pass_in_trip values(7771,'2005-11-14 00:00:00',14,'4d        ');
insert into Pass_in_trip values(7771,'2005-11-16 00:00:00',14,'5d        ');
insert into Pass_in_trip values(7772,'2005-11-29 00:00:00',14,'1c        ');

/*
drop table Laptop;
drop table pc;
drop table printer;
drop table product;
*/
-- USE computers;
CREATE TABLE Laptop (
                        code int NOT NULL ,
                        model varchar (50) NOT NULL ,
                        speed smallint NOT NULL ,
                        ram smallint NOT NULL ,
                        hd real NOT NULL ,
                        price decimal(12,2) NULL ,
                        screen tinyint NOT NULL
);

CREATE TABLE PC (
                    code int NOT NULL ,
                    model varchar (50) NOT NULL ,
                    speed smallint NOT NULL ,
                    ram smallint NOT NULL ,
                    hd real NOT NULL ,
                    cd varchar (10) NOT NULL ,
                    price decimal(12,2) NULL
);


CREATE TABLE Product (
                         maker varchar (10) NOT NULL ,
                         model varchar (50) NOT NULL ,
                         type varchar (50) NOT NULL
);


CREATE TABLE Printer (
                         code int NOT NULL ,
                         model varchar (50) NOT NULL ,
                         color char (1) NOT NULL ,
                         `type` varchar (10) NOT NULL ,
                         price decimal(12,2) NULL
);


ALTER TABLE Laptop ADD
    CONSTRAINT PK_Laptop PRIMARY KEY
        (
         code
            );


ALTER TABLE PC ADD
    CONSTRAINT PK_pc PRIMARY KEY
        (
         code
            );


ALTER TABLE Product ADD
    CONSTRAINT PK_product PRIMARY KEY
        (
         model
            );


ALTER TABLE Printer ADD
    CONSTRAINT PK_printer PRIMARY KEY
        (
         code
            );


ALTER TABLE Laptop ADD
    CONSTRAINT FK_Laptop_product FOREIGN KEY
        (
         model
            ) REFERENCES Product (
                                  model
            );


ALTER TABLE PC ADD
    CONSTRAINT FK_pc_product FOREIGN KEY
        (
         model
            ) REFERENCES Product (
                                  model
            );


ALTER TABLE Printer ADD
    CONSTRAINT FK_printer_product FOREIGN KEY
        (
         model
            ) REFERENCES Product (
                                  model
            );

/*----Product------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Product values('B','1121','PC')
                         ,('A','1232','PC')
                         ,('A','1233','PC')
                         ,('E','1260','PC')
                         ,('A','1276','Printer')
                         ,('D','1288','Printer')
                         ,('A','1298','Laptop')
                         ,('C','1321','Laptop')
                         ,('A','1401','Printer')
                         ,('A','1408','Printer')
                         ,('D','1433','Printer')
                         ,('E','1434','Printer')
                         ,('B','1750','Laptop')
                         ,('A','1752','Laptop')
                         ,('E','2113','PC')
                         ,('E','2112','PC');



/*----PC------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into PC values(1,'1232',500,64,5,'12x',600)
                    ,(2,'1121',750,128,14,'40x',850)
                    ,(3,'1233',500,64,5,'12x',600)
                    ,(4,'1121',600,128,14,'40x',850)
                    ,(5,'1121',600,128,8,'40x',850)
                    ,(6,'1233',750,128,20,'50x',950)
                    ,(7,'1232',500,32,10,'12x',400)
                    ,(8,'1232',450,64,8,'24x',350)
                    ,(9,'1232',450,32,10,'24x',350)
                    ,(10,'1260',500,32,10,'12x',350)
                    ,(11,'1233',900,128,40,'40x',980)
                    ,(12,'1233',800,128,20,'50x',970)
;


/*----Laptop------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Laptop values(1,'1298',350,32,4,700,11)
                        ,(2,'1321',500,64,8,970,12)
                        ,(3,'1750',750,128,12,1200,14)
                        ,(4,'1298',600,64,10,1050,15)
                        ,(5,'1752',750,128,10,1150,14)
                        ,(6,'1298',450,64,10,950,12)
;



/*----Printer------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Printer values(1,'1276','n','Laser',400)
                         ,(2,'1433','y','Jet',270)
                         ,(3,'1434','y','Jet',290)
                         ,(4,'1401','n','Matrix',150)
                         ,(5,'1408','n','Matrix',270)
                         ,(6,'1288','n','Laser',400)
;

CREATE TABLE Income (
                        code int NOT NULL ,
                        point tinyint NOT NULL ,
                        date datetime NOT NULL ,
                        inc decimal(12,2) NOT NULL
);


CREATE TABLE Outcome (
                         code int NOT NULL ,
                         point tinyint NOT NULL ,
                         date datetime NOT NULL ,
                         `out` decimal(12,2) NOT NULL
);


CREATE TABLE Income_o (
                          point tinyint NOT NULL ,
                          date datetime NOT NULL ,
                          inc decimal(12,2) NOT NULL
);


CREATE TABLE Outcome_o (
                           point tinyint NOT NULL ,
                           date datetime NOT NULL ,
                           `out` decimal(12,2) NOT NULL
);


ALTER TABLE Income  ADD
    CONSTRAINT PK_Income PRIMARY KEY  NONCLUSTERED
        (
         code
            );


ALTER TABLE Outcome  ADD
    CONSTRAINT PK_Outcome PRIMARY KEY  NONCLUSTERED
        (
         code
            )   ;


ALTER TABLE Income_o  ADD
    CONSTRAINT PK_Income_o PRIMARY KEY  NONCLUSTERED
        (
         point,
         date
            )   ;


ALTER TABLE Outcome_o  ADD
    CONSTRAINT PK_Outcome_o PRIMARY KEY  NONCLUSTERED
        (
         point,
         date
            )   ;


/*----Income------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Income values(1,1,'2001-03-22 00:00:00',15000.00);
insert into Income values(2,1,'2001-03-23 00:00:00',15000.00);
insert into Income values(3,1,'2001-03-24 00:00:00',3600.00);
insert into Income values(4,2,'2001-03-22 00:00:00',10000.00);
insert into Income values(5,2,'2001-03-24 00:00:00',1500.00);
insert into Income values(6,1,'2001-04-13 00:00:00',5000.00);
insert into Income values(7,1,'2001-05-11 00:00:00',4500.00);
insert into Income values(8,1,'2001-03-22 00:00:00',15000.00);
insert into Income values(9,2,'2001-03-24 00:00:00',1500.00);
insert into Income values(10,1,'2001-04-13 00:00:00',5000.00);
insert into Income values(11,1,'2001-03-24 00:00:00',3400.00);
insert into Income values(12,3,'2001-09-13 00:00:00',1350.00);
insert into Income values(13,3,'2001-09-13 00:00:00',1750.00);




/* Outcome */
insert into Outcome values(1,1,'2001-03-14 00:00:00',15348.00);
insert into Outcome values(2,1,'2001-03-24 00:00:00',3663.00);
insert into Outcome values(3,1,'2001-03-26 00:00:00',1221.00);
insert into Outcome values(4,1,'2001-03-28 00:00:00',2075.00);
insert into Outcome values(5,1,'2001-03-29 00:00:00',2004.00);
insert into Outcome values(6,1,'2001-04-11 00:00:00',3195.04);
insert into Outcome values(7,1,'2001-04-13 00:00:00',4490.00);
insert into Outcome values(8,1,'2001-04-27 00:00:00',3110.00);
insert into Outcome values(9,1,'2001-05-11 00:00:00',2530.00);
insert into Outcome values(10,2,'2001-03-22 00:00:00',1440.00);
insert into Outcome values(11,2,'2001-03-29 00:00:00',7848.00);
insert into Outcome values(12,2,'2001-04-02 00:00:00',2040.00);
insert into Outcome values(13,1,'2001-03-24 00:00:00',3500.00);
insert into Outcome values(14,2,'2001-03-22 00:00:00',1440.00);
insert into Outcome values(15,1,'2001-03-29 00:00:00',2006.00);
insert into Outcome values(16,3,'2001-09-13 00:00:00',1200.00);
insert into Outcome values(17,3,'2001-09-13 00:00:00',1500.00);
insert into Outcome values(18,3,'2001-09-14 00:00:00',1150.00);




/* Income_o */
insert into Income_o values(1,'2001-03-22 00:00:00',15000.00);
insert into Income_o values(1,'2001-03-23 00:00:00',15000.00);
insert into Income_o values(1,'2001-03-24 00:00:00',3400.00);
insert into Income_o values(1,'2001-04-13 00:00:00',5000.00);
insert into Income_o values(1,'2001-05-11 00:00:00',4500.00);
insert into Income_o values(2,'2001-03-22 00:00:00',10000.00);
insert into Income_o values(2,'2001-03-24 00:00:00',1500.00);
insert into Income_o values(3,'2001-09-13 00:00:00',11500.00);
insert into Income_o values(3,'2001-10-02 00:00:00',18000.00);


/* Outcome_o  */
insert into Outcome_o values(1,'2001-03-14 00:00:00',15348.00);
insert into Outcome_o values(1,'2001-03-24 00:00:00',3663.00);
insert into Outcome_o values(1,'2001-03-26 00:00:00',1221.00);
insert into Outcome_o values(1,'2001-03-28 00:00:00',2075.00);
insert into Outcome_o values(1,'2001-03-29 00:00:00',2004.00);
insert into Outcome_o values(1,'2001-04-11 00:00:00',3195.04);
insert into Outcome_o values(1,'2001-04-13 00:00:00',4490.00);
insert into Outcome_o values(1,'2001-04-27 00:00:00',3110.00);
insert into Outcome_o values(1,'2001-05-11 00:00:00',2530.00);
insert into Outcome_o values(2,'2001-03-22 00:00:00',1440.00);
insert into Outcome_o values(2,'2001-03-29 00:00:00',7848.00);
insert into Outcome_o values(2,'2001-04-02 00:00:00',2040.00);
insert into Outcome_o values(3,'2001-09-13 00:00:00',1500.00);
insert into Outcome_o values(3,'2001-09-14 00:00:00',2300.00);
insert into Outcome_o values(3,'2002-09-16 00:00:00',2150.00);


CREATE TABLE utB (
                     B_DATETIME datetime NOT NULL ,
                     B_Q_ID int NOT NULL ,
                     B_V_ID int NOT NULL ,
                     B_VOL tinyint UNSIGNED NOT NULL
);


CREATE TABLE utQ (
                     Q_ID int NOT NULL ,
                     Q_NAME varchar (35) NOT NULL
);


CREATE TABLE utV (
                     V_ID int NOT NULL ,
                     V_NAME varchar (35) NOT NULL ,
                     V_COLOR char (1) NOT NULL
);


ALTER TABLE utB  ADD
    CONSTRAINT PK_utB PRIMARY KEY  NONCLUSTERED
        (
         B_DATETIME,
         B_Q_ID,
         B_V_ID
            );


ALTER TABLE utQ  ADD
    CONSTRAINT PK_utQ PRIMARY KEY  NONCLUSTERED
        (
         Q_ID
            );


ALTER TABLE utV  ADD
    CONSTRAINT PK_utV PRIMARY KEY  NONCLUSTERED
        (
         V_ID
            );


ALTER TABLE utB ADD
    CONSTRAINT FK_utB_utQ FOREIGN KEY
        (
         B_Q_ID
            ) REFERENCES utQ (
                              Q_ID
            );

ALTER TABLE utB ADD
    CONSTRAINT FK_utB_utV FOREIGN KEY
        (
         B_V_ID
            ) REFERENCES utV (
                              V_ID
            );


/*----utQ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into utQ values(1,'Square # 01');
insert into utQ values(2,'Square # 02');
insert into utQ values(3,'Square # 03');
insert into utQ values(4,'Square # 04');
insert into utQ values(5,'Square # 05');
insert into utQ values(6,'Square # 06');
insert into utQ values(7,'Square # 07');
insert into utQ values(8,'Square # 08');
insert into utQ values(9,'Square # 09');
insert into utQ values(10,'Square # 10');
insert into utQ values(11,'Square # 11');
insert into utQ values(12,'Square # 12');
insert into utQ values(13,'Square # 13');
insert into utQ values(14,'Square # 14');
insert into utQ values(15,'Square # 15');
insert into utQ values(16,'Square # 16');
insert into utQ values(17,'Square # 17');
insert into utQ values(18,'Square # 18');
insert into utQ values(19,'Square # 19');
insert into utQ values(20,'Square # 20');
insert into utQ values(21,'Square # 21');
insert into utQ values(22,'Square # 22');
insert into utQ values(23,'Square # 23');
insert into utQ values(25,'Square # 25');



/*----utV------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into utV values(1,'Balloon # 01','R');
insert into utV values(2,'Balloon # 02','R');
insert into utV values(3,'Balloon # 03','R');
insert into utV values(4,'Balloon # 04','G');
insert into utV values(5,'Balloon # 05','G');
insert into utV values(6,'Balloon # 06','G');
insert into utV values(7,'Balloon # 07','B');
insert into utV values(8,'Balloon # 08','B');
insert into utV values(9,'Balloon # 09','B');
insert into utV values(10,'Balloon # 10','R');
insert into utV values(11,'Balloon # 11','R');
insert into utV values(12,'Balloon # 12','R');
insert into utV values(13,'Balloon # 13','G');
insert into utV values(14,'Balloon # 14','G');
insert into utV values(15,'Balloon # 15','B');
insert into utV values(16,'Balloon # 16','B');
insert into utV values(17,'Balloon # 17','R');
insert into utV values(18,'Balloon # 18','G');
insert into utV values(19,'Balloon # 19','B');
insert into utV values(20,'Balloon # 20','R');
insert into utV values(21,'Balloon # 21','G');
insert into utV values(22,'Balloon # 22','B');
insert into utV values(23,'Balloon # 23','R');
insert into utV values(24,'Balloon # 24','G');
insert into utV values(25,'Balloon # 25','B');
insert into utV values(26,'Balloon # 26','B');
insert into utV values(27,'Balloon # 27','R');
insert into utV values(28,'Balloon # 28','G');
insert into utV values(29,'Balloon # 29','R');
insert into utV values(30,'Balloon # 30','G');
insert into utV values(31,'Balloon # 31','R');
insert into utV values(32,'Balloon # 32','G');
insert into utV values(33,'Balloon # 33','B');
insert into utV values(34,'Balloon # 34','R');
insert into utV values(35,'Balloon # 35','G');
insert into utV values(36,'Balloon # 36','B');
insert into utV values(37,'Balloon # 37','R');
insert into utV values(38,'Balloon # 38','G');
insert into utV values(39,'Balloon # 39','B');
insert into utV values(40,'Balloon # 40','R');
insert into utV values(41,'Balloon # 41','R');
insert into utV values(42,'Balloon # 42','G');
insert into utV values(43,'Balloon # 43','B');
insert into utV values(44,'Balloon # 44','R');
insert into utV values(45,'Balloon # 45','G');
insert into utV values(46,'Balloon # 46','B');
insert into utV values(47,'Balloon # 47','B');
insert into utV values(48,'Balloon # 48','G');
insert into utV values(49,'Balloon # 49','R');
insert into utV values(50,'Balloon # 50','G');
insert into utV values(51,'Balloon # 51','B');
insert into utV values(52,'Balloon # 52','R');
insert into utV values(53,'Balloon # 53','G');
insert into utV values(54,'Balloon # 54','B');

/*----utB------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into utB values('2003-01-01 01:12:01',1,1,155);
insert into utB values('2003-06-23 01:12:02',1,1,100);
insert into utB values('2003-01-01 01:12:03',2,2,255);
insert into utB values('2003-01-01 01:12:04',3,3,255);
insert into utB values('2003-01-01 01:12:05',1,4,255);
insert into utB values('2003-01-01 01:12:06',2,5,255);
insert into utB values('2003-01-01 01:12:07',3,6,255);
insert into utB values('2003-01-01 01:12:08',1,7,255);
insert into utB values('2003-01-01 01:12:09',2,8,255);
insert into utB values('2003-01-01 01:12:10',3,9,255);
insert into utB values('2003-01-01 01:12:11',4,10,50);
insert into utB values('2003-01-01 01:12:12',5,11,100);
insert into utB values('2003-01-01 01:12:13',5,12,155);
insert into utB values('2003-01-01 01:12:14',5,13,155);
insert into utB values('2003-01-01 01:12:15',5,14,100);
insert into utB values('2003-01-01 01:12:16',5,15,50);
insert into utB values('2003-01-01 01:12:17',5,16,205);
insert into utB values('2003-01-01 01:12:18',6,10,155);
insert into utB values('2003-01-01 01:12:19',6,17,100);
insert into utB values('2003-01-01 01:12:20',6,18,255);
insert into utB values('2003-01-01 01:12:21',6,19,255);
insert into utB values('2003-01-01 01:12:22',7,17,155);
insert into utB values('2003-01-01 01:12:23',7,20,100);
insert into utB values('2003-01-01 01:12:24',7,21,255);
insert into utB values('2003-01-01 01:12:25',7,22,255);
insert into utB values('2003-01-01 01:12:26',8,10,50);
insert into utB values('2003-01-01 01:12:27',9,23,255);
insert into utB values('2003-01-01 01:12:28',9,24,255);
insert into utB values('2003-01-01 01:12:29',9,25,100);
insert into utB values('2003-01-01 01:12:30',9,26,155);
insert into utB values('2003-01-01 01:12:31',10,25,155);
insert into utB values('2003-01-01 01:12:31',10,26,100);
insert into utB values('2003-01-01 01:12:33',10,27,10);
insert into utB values('2003-01-01 01:12:34',10,28,10);
insert into utB values('2003-01-01 01:12:35',10,29,245);
insert into utB values('2003-01-01 01:12:36',10,30,245);
insert into utB values('2003-01-01 01:12:37',11,31,100);
insert into utB values('2003-01-01 01:12:38',11,32,100);
insert into utB values('2003-01-01 01:12:39',11,33,100);
insert into utB values('2003-01-01 01:12:40',11,34,155);
insert into utB values('2003-01-01 01:12:41',11,35,155);
insert into utB values('2003-01-01 01:12:42',11,36,155);
insert into utB values('2003-01-01 01:12:43',12,31,155);
insert into utB values('2003-01-01 01:12:44',12,32,155);
insert into utB values('2003-01-01 01:12:45',12,33,155);
insert into utB values('2003-01-01 01:12:46',12,34,100);
insert into utB values('2003-01-01 01:12:47',12,35,100);
insert into utB values('2003-01-01 01:12:48',12,36,100);
insert into utB values('2003-01-01 01:13:01',4,37,20);
insert into utB values('2003-01-01 01:13:02',8,38,20);
insert into utB values('2003-01-01 01:13:03',13,39,123);
insert into utB values('2003-01-01 01:13:04',14,39,111);
insert into utB values('2003-01-01 01:13:05',14,40,50);
insert into utB values('2003-01-01 01:13:06',15,41,50);
insert into utB values('2003-01-01 01:13:07',15,41,50);
insert into utB values('2003-01-01 01:13:08',15,42,50);
insert into utB values('2003-01-01 01:13:09',15,42,50);
insert into utB values('2003-01-01 01:13:10',16,42,50);
insert into utB values('2003-01-01 01:13:11',16,42,50);
insert into utB values('2003-01-01 01:13:12',16,43,50);
insert into utB values('2003-01-01 01:13:13',16,43,50);
insert into utB values('2003-01-01 01:13:14',16,47,50);
insert into utB values('2003-01-01 01:13:15',17,44,10);
insert into utB values('2003-01-01 01:13:16',17,44,10);
insert into utB values('2003-01-01 01:13:17',17,45,10);
insert into utB values('2003-01-01 01:13:18',17,45,10);
insert into utB values('2003-02-01 01:13:19',18,45,10);
insert into utB values('2003-03-01 01:13:20',18,45,10);
insert into utB values('2003-04-01 01:13:21',18,46,10);
insert into utB values('2003-05-01 01:13:22',18,46,10);
insert into utB values('2003-06-11 01:13:23',19,44,10);
insert into utB values('2003-01-01 01:13:24',19,44,10);
insert into utB values('2003-01-01 01:13:25',19,45,10);
insert into utB values('2003-01-01 01:13:26',19,45,10);
insert into utB values('2003-02-01 01:13:27',20,45,10);
insert into utB values('2003-03-01 01:13:28',20,45,10);
insert into utB values('2003-04-01 01:13:29',20,46,10);
insert into utB values('2003-05-01 01:13:30',20,46,10);
insert into utB values('2003-02-01 01:13:31',21,49,50);
insert into utB values('2003-02-02 01:13:32',21,49,50);
insert into utB values('2003-02-03 01:13:33',21,50,50);
insert into utB values('2003-02-04 01:13:34',21,50,50);
insert into utB values('2003-02-05 01:13:35',21,48,1);
insert into utB values('2000-01-01 01:13:36',22,50,50);
insert into utB values('2001-01-01 01:13:37',22,50,50);
insert into utB values('2002-01-01 01:13:38',22,51,50);
insert into utB values('2002-06-01 01:13:39',22,51,50);
insert into utB values('2003-01-01 01:13:05',4,37,185);

/*
drop table outcomes;
drop table ships;
drop table classes;
drop table battles;
*/
CREATE TABLE Battles (
                         name varchar (20) NOT NULL ,
                         date datetime NOT NULL
);


CREATE TABLE Classes (
                         class varchar (50) NOT NULL ,
                         type varchar (2) NOT NULL ,
                         country varchar (20) NOT NULL ,
                         numGuns tinyint NULL ,
                         bore real NULL ,
                         displacement int NULL
);


CREATE TABLE Ships (
                       name varchar (50) NOT NULL ,
                       class varchar (50) NOT NULL ,
                       launched smallint NULL
);


CREATE TABLE Outcomes (
                          ship varchar (50) NOT NULL ,
                          battle varchar (20) NOT NULL ,
                          result varchar (10) NOT NULL
);


ALTER TABLE Battles ADD
    CONSTRAINT PK_Battles PRIMARY KEY  CLUSTERED
        (
         name
            )   ;


ALTER TABLE Classes ADD
    CONSTRAINT PK_Classes PRIMARY KEY  CLUSTERED
        (
         class
            )   ;


ALTER TABLE Ships ADD
    CONSTRAINT PK_Ships PRIMARY KEY  CLUSTERED
        (
         name
            )   ;


ALTER TABLE Outcomes ADD
    CONSTRAINT PK_Outcomes PRIMARY KEY  CLUSTERED
        (
         ship,
         battle
            )   ;


ALTER TABLE Ships ADD
    CONSTRAINT FK_Ships_Classes FOREIGN KEY
        (
         class
            ) REFERENCES Classes (
                                  class
            ) ;


ALTER TABLE Outcomes ADD
    CONSTRAINT FK_Outcomes_Battles FOREIGN KEY
        (
         battle
            ) REFERENCES Battles (
                                  name
            );


/*----Classes------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Classes values('Bismarck','bb','Germany',8,15,42000);
insert into Classes values('Iowa','bb','USA',9,16,46000);
insert into Classes values('Kongo','bc','Japan',8,14,32000);
insert into Classes values('North Carolina','bb','USA',12,16,37000);
insert into Classes values('Renown','bc','Gt.Britain',6,15,32000);
insert into Classes values('Revenge','bb','Gt.Britain',8,15,29000);
insert into Classes values('Tennessee','bb','USA',12,14,32000);
insert into Classes values('Yamato','bb','Japan',9,18,65000);




/*----Battles------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Battles values('Guadalcanal','1942-11-15 00:00:00');
insert into Battles values('North Atlantic','1941-05-25 00:00:00');
insert into Battles values('North Cape','1943-12-26 00:00:00');
insert into Battles values('Surigao Strait','1944-10-25 00:00:00');
insert into Battles values ('#Cuba62a'   , '1962-10-20');
insert into Battles values ('#Cuba62b'   , '1962-10-25');




/*----Ships------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Ships values('California','Tennessee',1921);
insert into Ships values('Haruna','Kongo',1916);
insert into Ships values('Hiei','Kongo',1914);
insert into Ships values('Iowa','Iowa',1943);
insert into Ships values('Kirishima','Kongo',1915);
insert into Ships values('Kongo','Kongo',1913);
insert into Ships values('Missouri','Iowa',1944);
insert into Ships values('Musashi','Yamato',1942);
insert into Ships values('New Jersey','Iowa',1943);
insert into Ships values('North Carolina','North Carolina',1941);
insert into Ships values('Ramillies','Revenge',1917);
insert into Ships values('Renown','Renown',1916);
insert into Ships values('Repulse','Renown',1916);
insert into Ships values('Resolution','Renown',1916);
insert into Ships values('Revenge','Revenge',1916);
insert into Ships values('Royal Oak','Revenge',1916);
insert into Ships values('Royal Sovereign','Revenge',1916);
insert into Ships values('Tennessee','Tennessee',1920);
insert into Ships values('Washington','North Carolina',1941);
insert into Ships values('Wisconsin','Iowa',1944);
insert into Ships values('Yamato','Yamato',1941);
insert into Ships values('South Dakota','North Carolina',1941);



/*----Outcomes------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
insert into Outcomes values('Bismarck','North Atlantic','sunk');
insert into Outcomes values('California','Surigao Strait','OK');
insert into Outcomes values('Duke of York','North Cape','OK');
insert into Outcomes values('Fuso','Surigao Strait','sunk');
insert into Outcomes values('Hood','North Atlantic','sunk');
insert into Outcomes values('King George V','North Atlantic','OK');
insert into Outcomes values('Kirishima','Guadalcanal','sunk');
insert into Outcomes values('Prince of Wales','North Atlantic','damaged');
insert into Outcomes values('Rodney','North Atlantic','OK');
insert into Outcomes values('Schamhorst','North Cape','sunk');
insert into Outcomes values('South Dakota','Guadalcanal','damaged');
insert into Outcomes values('Tennessee','Surigao Strait','OK');
insert into Outcomes values('Washington','Guadalcanal','OK');
insert into Outcomes values('West Virginia','Surigao Strait','OK');
insert into Outcomes values('Yamashiro','Surigao Strait','sunk');
insert into Outcomes values('California','Guadalcanal','damaged');


drop table if exists Lineups; drop table if exists Games; drop table if exists Players;

create table Players(
                        player_id int primary key, -- номер на футболке
                        first_name varchar(50) not null,
                        last_name varchar(50) not null,
                        nickname varchar(50) not null, -- имя на футболке
                        citizenship varchar(50), -- гражданство, если NULL, то гражданин той страны, где проводится чемпионат
                        dob date not null, -- дата рождения
                        role varchar(20) not null -- амплуа, например, защитник
);

-- Игры
create table Games(
                      game_id int primary key,
                      team varchar(30) not null, -- команда-соперник
                      city varchar(30), -- город, где проводится матч; NULL, если дома
                      goals tinyint, -- голы, которые забил соперник; NULL, если не было забито
                      game_date datetime not null, -- дата/время матча
                      own TINYINT -- aвтоголы, null, если таких не было
);

-- Участие в игре
create table Lineups(
                        start char not NULL, -- 'B' - игрок вышел в стартовом составе, 'S' - в запасе
                        game_id int references games,
                        player_id int references Players,
                        time_in int, -- число минут, проведенных игроком на поле; NULL, если не выходил.
                        goals tinyint, -- число голов, которые игрок забил в матче; NULL, если не забивал
                        cards char(2), -- Y - желтая, Y2 - две желтых, R - красная, YR - желтая+красная; NULL, если карточек нет
                        primary key(game_id, player_id)
);

insert into Games values
(1,'West Ham United',NULL,null,'2018-08-12T13:30:00',null)
                       ,(2,'Crystal Palace','London',null,'2018-08-20T20:00:00',null)
                       ,(3,'Brighton & Hove Albion',NULL,null,'2018-08-25T17:30:00',null)
                       ,(4,'Leicester City','Leicester',1,'2018-09-01T12:30:00',null)
                       ,(5,'Tottenham Hotspur','London',1,'2018-09-15T12:30:00',null)
                       ,(6,'Southampton',null,null,'2018-09-22T15:00:00',1)
                       ,(7,'Chelsea','London',1,'2018-09-29T17:30:00',null)
                       ,(8,'Manchester City',null,null,'2018-10-07T16:30:00',null)
                       ,(9,'Huddersfield Town','Huddersfield',null,'2018-10-20T17:30:00',null)
                       ,(10,'Cardiff City',null,1,'2018-10-27T15:00:00',null)
                       ,(11,'Arsenal','London',1,'2018-11-03T17:30:00',null)
                       ,(12,'Fulham',null,null,'2018-11-11T12:00:00',null)
                       ,(13,'Watford','Watford',null,'2018-11-24T15:00:00',null)
                       ,(14,'Everton',null,null,'2018-12-02T16:15:00',null)
                       ,(15,'Burnley','Burnley',1,'2018-12-05T19:45:00',null)
                       ,(16,'Bournemouth','Bournemouth',null,'2018-12-08T12:30:00',1)
                       ,(17,'Manchester United',null,1,'2018-12-16T16:00:00',null)
                       ,(18,'Wolverhampton Wanderers','Wolverhampton',null,'2018-12-21T20:00:00',null)
                       ,(19,'Newcastle United',NULL,null,'2018-12-26T15:00:00',null)
                       ,(20,'Arsenal',NULL,1,'2018-12-29T17:30:00',null)
                       ,(21,'Manchester City','Manchester',2,'2019-01-03T20:00:00',null)
                       ,(22,'Brighton & Hove Albion','Brighton',null,'2019-01-12T15:00:00',null)
                       ,(23,'Crystal Palace',null,3,'2019-01-19T15:00:00',null)
                       ,(24,'Leicester City',null,1,'2019-01-30T20:00:00',null)
                       ,(25,'West Ham United','London',1,'2019-02-04T20:00:00',null)
                       ,(26,'Bournemouth',null,null,'2019-02-09T15:00:00',null)
                       ,(27,'Manchester United','Manchester',null,'2019-02-24T14:05:00',null)
                       ,(28,'Watford',null,null,'2019-02-27T20:00:00',null)
                       ,(29,'Everton','Liverpool',null,'2019-03-03T16:15:00',null)
                       ,(30,'Burnley',null,2,'2019-03-10T12:00:00',null)
                       ,(31,'Fulham','London',1,'2019-03-17T14:15:00',null)
                       ,(32,'Tottenham Hotspur',null,1,'2019-03-31T16:30:00',1)
                       ,(33,'Southampton','Southampton',1,'2019-04-05T20:00:00',null)
                       ,(34,'Chelsea',null,null,'2019-04-14T16:30:00',null)
                       ,(35,'Cardiff City','Cardiff',null,'2019-04-21T16:00:00',null)
                       ,(36,'Huddersfield Town',null,null,'2019-04-26T20:00:00',null)
                       ,(37,'Newcastle United','Newcastle upon Tyne',2,'2019-05-04T19:45:00',null)
                       ,(38,'Wolverhampton Wanderers',null,null,'2019-05-12T15:00:00',NULL)
;
--
insert into players values(1,'Loris','Karius','Karius','Germany','1993-06-22','GOALKEEPER');
insert into players values(2,'Nathaniel','Clyne','Clyne',NULL,'1991-04-05','DEFENDER');
insert into players values(3,'Fabio Henrique','Tavares','Fabinho','Brazil','1993-10-23','MIDFIELDER');
insert into players values(4,'Virgil','Van Dijk','Virgil','Netherland','1991-07-08','DEFENDER');
insert into players values(5,'Georginio','Wijnaldum','Wijnaldum','Netherland','1990-11-11','MIDFIELDER');
insert into players values(6,'Dejan','Lovren','Lovren','Croatia','1989-07-05','DEFENDER');
insert into players values(7,'James','Milner','Milner',NULL,'1986-01-04','MIDFIELDER');
insert into players values(8,'Naby','Keita','Keita','Guinea','1995-02-10','MIDFIELDER');
insert into players values(9,'Robert','Firmino','Firmino','Brazil','1991-10-02','FORWARD');
insert into players values(10,'Sadio','Mane','Mane','Senegal','1992-04-10','FORWARD');
insert into players values(11,'Mohamed','Salah','M.Salah','Egypt','1992-06-15','FORWARD');
insert into players values(12,'Joe','Gomez','Gomez',NULL,'1997-05-23','DEFENDER');
insert into players values(13,'Alisson','Becker','A.Becker','Brazil','1992-10-02','GOALKEEPER');
insert into players values(14,'Jordan','Henderson','Henderson',NULL,'1990-06-17','MIDFIELDER');
insert into players values(15,'Daniel','Sturridge','Sturridge',NULL,'1989-09-01','FORWARD');
insert into players values(18,'Alberto','Moreno','Moreno','Spain','1992-07-05','DEFENDER');
insert into players values(20,'Adam','Lallana','Lallana',NULL,'1988-05-10','MIDFIELDER');
insert into players values(21,'Alex','Oxlade-Chamberlain','Oxlade-Chamberlain',NULL,'1993-08-15','MIDFIELDER');
insert into players values(22,'Simon','Mignolet','Mignolet','Belgia','1988-03-06','GOALKEEPER');
insert into players values(23,'Xherdan','Shaqiri','Shaqiri','Switzerland','1991-10-10','MIDFIELDER');
insert into players values(24,'Rhian','Brewster','Brewster',NULL,'2000-04-01','FORWARD');
insert into players values(26,'Andy','Robertson','Robertson','Scotland','1994-03-11','DEFENDER');
insert into players values(27,'Divock','Origi','Origi','Belgia','1995-04-18','FORWARD');
insert into players values(29,'Dominic','Solanke','Solanke','Belgia','1997-09-14','FORWARD');
insert into players values(32,'Joel','Matip','Matip','Germany','1991-08-08','DEFENDER');
insert into players values(47,'Nathaniel','Phillips','Phillips',NULL,'1997-03-21','DEFENDER');
insert into players values(48,'Curtis','Jones','Jones',NULL,'2001-01-30','MIDFIELDER');
insert into players values(50,'Lazar','Markovic','Markovic','Serbia','1994-03-02','MIDFIELDER');
insert into players values(53,'Ovie','Ejaria','Ejaria',NULL,'1997-11-18','MIDFIELDER');
insert into players values(62,'Caoimhin','Kelleher','Kelleher','Ireland','1998-11-23','GOALKEEPER');
insert into players values(64,'Rafael','Camacho','Camacho','Portugal','2000-05-22','MIDFIELDER');
insert into players values(66,'Trent','Alexander-Arnold','Alexander-Arnold',NULL,'1998-10-07','DEFENDER');
insert into players values(68,'Pedro','Chirivella','Chirivella','Spain','1997-05-23','MIDFIELDER');
insert into players values(73,'Kamil','Grabara','Grabara','Poland','1999-01-08','GOALKEEPER');
--
insert into Lineups values
('B',1,13,90,null,null)
                         ,('B',1,26,90,null,null)
                         ,('B',1,4,90,null,null)
                         ,('B',1,12,90,null,null)
                         ,('B',1,66,90,null,'Y')
                         ,('B',1,7,90,null,null)
                         ,('B',1,8,90,null,null)
                         ,('B',1,5,90,null,null)
                         ,('B',1,10,82,2,null)
                         ,('B',1,11,87,1,null)
                         ,('B',1,9,69,null,null)

                         ,('S',1,2,NULL,null,null)
                         ,('S',1,23,8,null,null)
                         ,('S',1,15,3,1,null)
                         ,('S',1,3,null,null,null)
                         ,('S',1,1,null,null,null)
                         ,('S',1,20,null,null,null)
                         ,('S',1,14,21,null,null)
--
                         ,('B',2,13,90,null,null)
                         ,('B',2,26,90,null,null)
                         ,('B',2,4,90,null,null)
                         ,('B',2,12,90,null,null)
                         ,('B',2,66,90,null,'Y')
                         ,('B',2,7,67,1,NULL) -- пенальти
                         ,('B',2,8,87,null,null)
                         ,('B',2,5,90,null,null)
                         ,('B',2,10,90,1,null)
                         ,('B',2,11,90,null,null)
                         ,('B',2,9,89,null,null)

                         ,('S',2,18,NULL,null,null)
                         ,('S',2,20,3,null,null)
                         ,('S',2,22,null,null,null)
                         ,('S',2,32,null,null,null)
                         ,('S',2,23,null,null,null)
                         ,('S',2,15,1,null,null)
                         ,('S',2,14,23,null,null)
--
                         ,('B',3,13,90,null,null)
                         ,('B',3,26,90,null,null)
                         ,('B',3,4,90,null,null)
                         ,('B',3,12,90,null,null)
                         ,('B',3,66,89,null,'Y')
                         ,('B',3,7,90,null,null)
                         ,('B',3,8,67,null,null)
                         ,('B',3,5,90,null,null)
                         ,('B',3,10,80,null,null)
                         ,('B',3,11,90,1,null)
                         ,('B',3,9,90,null,null)
                         ,('S',3,18,NULL,null,null)
                         ,('S',3,20,null,null,null)
                         ,('S',3,22,null,null,null)
                         ,('S',3,32,1,null,null)
                         ,('S',3,23,null,null,null)
                         ,('S',3,15,10,null,null)
                         ,('S',3,14,23,null,null)
--
                         ,('B',4,13,90,null,null)
                         ,('B',4,26,90,null,null)
                         ,('B',4,4,90,null,'Y')
                         ,('B',4,12,90,null,null)
                         ,('B',4,66,89,null,null)
                         ,('B',4,7,90,null,'Y')
                         ,('B',4,14,71,null,null)
                         ,('B',4,5,90,null,null)
                         ,('B',4,10,90,1,null)
                         ,('B',4,11,71,null,null)
                         ,('B',4,9,90,1,null)

                         ,('S',4,18,NULL,null,null)
                         ,('S',4,20,null,null,null)
                         ,('S',4,22,null,null,null)
                         ,('S',4,32,1,null,null)
                         ,('S',4,23,19,null,null)
                         ,('S',4,15,10,null,null)
                         ,('S',4,8,19,null,null)
--
                         ,('B',5,13,90,null,null)
                         ,('B',5,26,90,null,null)
                         ,('B',5,4,90,null,null)
                         ,('B',5,12,90,null,null)
                         ,('B',5,66,89,null,null)
                         ,('B',5,7,90,null,null)
                         ,('B',5,8,83,null,null)
                         ,('B',5,5,90,1,null)
                         ,('B',5,10,90,null,null)
                         ,('B',5,11,90,null,null)
                         ,('B',5,9,74,1,null)

                         ,('S',5,18,NULL,null,null)
                         ,('S',5,3,null,null,null)
                         ,('S',5,22,null,null,null)
                         ,('S',5,32,1,null,null)
                         ,('S',5,23,null,null,null)
                         ,('S',5,15,7,null,null)
                         ,('S',5,14,16,null,null)
--
                         ,('B',6,13,90,null,null)
                         ,('B',6,26,90,null,null)
                         ,('B',6,4,55,null,null)
                         ,('B',6,32,90,1,null)
                         ,('B',6,66,90,null,null)
                         ,('B',6,14,90,null,null)
                         ,('B',6,23,45,null,null)
                         ,('B',6,5,70,null,null)
                         ,('B',6,10,90,null,null)
                         ,('B',6,11,90,1,null)
                         ,('B',6,9,90,null,null)
                         ,('S',6,18,NULL,null,null)
                         ,('S',6,8,20,null,null)
                         ,('S',6,22,null,null,null)
                         ,('S',6,12,35,null,null)
                         ,('S',6,3,null,null,null)
                         ,('S',6,15,null,null,null)
                         ,('S',6,7,45,null,null)
--
                         ,('B',7,13,90,null,null)
                         ,('B',7,26,90,null,null)
                         ,('B',7,4,90,null,null)
                         ,('B',7,12,90,null,null)
                         ,('B',7,66,90,null,null)
                         ,('B',7,14,78,null,null)
                         ,('B',7,7,86,null,'Y')
                         ,('B',7,5,90,null,null)
                         ,('B',7,10,90,null,'Y')
                         ,('B',7,11,66,null,null)
                         ,('B',7,9,90,null,null)

                         ,('S',7,18,NULL,null,null)
                         ,('S',7,8,12,null,null)
                         ,('S',7,22,null,null,null)
                         ,('S',7,3,null,null,null)
                         ,('S',7,15,4,1,null)
                         ,('S',7,23,24,null,null)
                         ,('S',7,32,null,null,null)
--
                         ,('B',8,13,90,null,null)
                         ,('B',8,26,90,null,null)
                         ,('B',8,4,90,null,null)
                         ,('B',8,12,90,null,null)
                         ,('B',8,6,90,null,null)
                         ,('B',8,14,90,null,null)
                         ,('B',8,7,29,null,null)
                         ,('B',8,5,90,null,'Y')
                         ,('B',8,10,90,null,null)
                         ,('B',8,11,66,null,null)
                         ,('B',8,9,72,null,null)

                         ,('S',8,66,NULL,null,null)
                         ,('S',8,8,61,null,null)
                         ,('S',8,22,null,null,null)
                         ,('S',8,3,null,null,null)
                         ,('S',8,15,18,null,null)
                         ,('S',8,23,null,null,null)
                         ,('S',8,32,null,null,null)
--
                         ,('B',9,13,90,null,null)
                         ,('B',9,12,90,null,null)
                         ,('B',9,4,90,null,null)
                         ,('B',9,26,90,null,null)
                         ,('B',9,6,90,null,null)
                         ,('B',9,7,77,null,null)
                         ,('B',9,14,45,null,null)
                         ,('B',9,23,90,null,null)
                         ,('B',9,11,90,1,null)
                         ,('B',9,15,90,null,'Y')
                         ,('B',9,20,69,null,'Y')

                         ,('S',9,3,21,null,null)
                         ,('S',9,5,45,null,null)
                         ,('S',9,66,NULL,null,null)
                         ,('S',9,22,null,null,null)
                         ,('S',9,32,null,null,null)
                         ,('S',9,27,null,null,null)
                         ,('S',9,9,13,null,null)
--
                         ,('B',10,13,90,null,null)
                         ,('B',10,6,90,null,null)
                         ,('B',10,66,90,null,null)
                         ,('B',10,18,90,null,null)
                         ,('B',10,4,90,null,null)
                         ,('B',10,3,90,null,null)
                         ,('B',10,20,61,null,null)
                         ,('B',10,5,90,null,null)
                         ,('B',10,9,71,null,null)
                         ,('B',10,10,90,2,null)
                         ,('B',10,11,90,1,null)

                         ,('S',10,26,null,null,null)
                         ,('S',10,7,19,null,null)
                         ,('S',10,23,29,1,null)
                         ,('S',10,15,null,null,null)
                         ,('S',10,32,null,null,null)
                         ,('S',10,22,null,null,null)
                         ,('S',10,12,null,null,null)
--
                         ,('B',11,13,90,null,null)
                         ,('B',11,12,90,null,null)
                         ,('B',11,4,90,null,null)
                         ,('B',11,26,90,null,null)
                         ,('B',11,66,90,null,null)
                         ,('B',11,5,90,null,null)
                         ,('B',11,3,90,null,'Y')
                         ,('B',11,7,90,1,null)
                         ,('B',11,10,90,null,null)
                         ,('B',11,9,80,null,null)
                         ,('B',11,11,89,null,null)
                         ,('S',11,20,null,null,null)
                         ,('S',11,22,null,null,null)
                         ,('S',11,27,null,null,null)
                         ,('S',11,15,null,null,null)
                         ,('S',11,32,1,null,null)
                         ,('S',11,18,null,null,null)
                         ,('S',11,23,10,null,null)
--
                         ,('B',12,13,90,null,null)
                         ,('B',12,26,90,null,null)
                         ,('B',12,4,90,null,null)
                         ,('B',12,66,90,null,null)
                         ,('B',12,12,90,null,'Y')
                         ,('B',12,3,89,null,null)
                         ,('B',12,23,81,1,null)
                         ,('B',12,9,90,null,null)
                         ,('B',12,5,69,null,null)
                         ,('B',12,10,90,null,null)
                         ,('B',12,11,90,1,null)

                         ,('S',12,14,21,null,null)
                         ,('S',12,8,1,null,null)
                         ,('S',12,22,null,null,null)
                         ,('S',12,18,null,null,null)
                         ,('S',12,6,null,null,null)
                         ,('S',12,7,9,null,null)
                         ,('S',12,15,null,null,null)
--
                         ,('B',13,13,90,null,null)
                         ,('B',13,26,90,null,null)
                         ,('B',13,6,90,null,null)
                         ,('B',13,66,90,1,null)
                         ,('B',13,4,90,null,null)
                         ,('B',13,5,90,null,null)
                         ,('B',13,10,90,null,null)
                         ,('B',13,23,74,null,null)
                         ,('B',13,14,82,null,'Y2')
                         ,('B',13,9,89,1,null)
                         ,('B',13,11,86,1,null)
                         ,('S',13,15,null,null,null)
                         ,('S',13,7,16,null,null)
                         ,('S',13,2,null,null,null)
                         ,('S',13,32,1,null,null)
                         ,('S',13,8,null,null,null)
                         ,('S',13,3,4,null,null)
                         ,('S',13,22,null,null,null)
--
                         ,('B',14,13,90,null,null)
                         ,('B',14,66,90,null,null)
                         ,('B',14,26,90,null,null)
                         ,('B',14,12,90,null,'Y')
                         ,('B',14,4,90,null,null)
                         ,('B',14,9,84,null,null)
                         ,('B',14,23,71,null,'Y')
                         ,('B',14,10,90,null,null)
                         ,('B',14,5,90,null,null)
                         ,('B',14,3,90,null,'Y')
                         ,('B',14,11,75,null,null)
                         ,('S',14,32,null,null,null)
                         ,('S',14,18,null,null,null)
                         ,('S',14,22,null,null,null)
                         ,('S',14,7,null,null,null)
                         ,('S',14,27,6,1,null)
                         ,('S',14,15,15,null,null)
                         ,('S',14,8,19,null,null)
--
                         ,('B',15,13,90,null,null)
                         ,('B',15,12,23,null,null)
                         ,('B',15,4,90,null,null)
                         ,('B',15,18,65,null,null)
                         ,('B',15,32,90,null,null)
                         ,('B',15,7,90,1,null)
                         ,('B',15,8,90,null,null)
                         ,('B',15,14,90,null,null)
                         ,('B',15,23,90,1,null)
                         ,('B',15,15,90,null,null)
                         ,('B',15,27,66,null,null)
                         ,('S',15,20,null,null,null)
                         ,('S',15,11,25,null,null)
                         ,('S',15,9,24,1,null)
                         ,('S',15,22,null,null,null)
                         ,('S',15,64,null,null,null)
                         ,('S',15,66,67,null,null)
                         ,('S',15,3,null,null,null)
--
                         ,('B',16,13,90,null,null)
                         ,('B',16,7,90,null,null)
                         ,('B',16,26,90,null,null)
                         ,('B',16,32,90,null,null)
                         ,('B',16,4,90,null,null)
                         ,('B',16,3,90,null,'Y')
                         ,('B',16,23,65,null,null)
                         ,('B',16,5,90,null,null)
                         ,('B',16,8,65,null,null)
                         ,('B',16,11,90,3,null)
                         ,('B',16,9,81,null,null)
                         ,('S',16,14,9,null,null)
                         ,('S',16,27,null,null,null)
                         ,('S',16,15,null,null,null)
                         ,('S',16,20,25,null,null)
                         ,('S',16,22,null,null,null)
                         ,('S',16,10,25,null,null)
                         ,('S',16,66,null,null,null)
--
                         ,('B',17,13,90,null,null)
                         ,('B',17,26,90,null,null)
                         ,('B',17,6,90,null,null)
                         ,('B',17,4,90,null,null)
                         ,('B',17,2,90,null,null)
                         ,('B',17,5,90,null,null)
                         ,('B',17,8,70,null,null)
                         ,('B',17,3,90,null,null)
                         ,('B',17,10,84,1,null)
                         ,('B',17,11,90,null,null)
                         ,('B',17,9,90,null,null)
                         ,('S',17,20,null,null,null)
                         ,('S',17,22,null,null,null)
                         ,('S',17,64,null,null,null)
                         ,('S',17,14,6,null,null)
                         ,('S',17,18,null,null,null)
                         ,('S',17,15,null,null,null)
                         ,('S',17,23,20,2,null)
--
                         ,('B',18,13,90,null,null)
                         ,('B',18,7,90,null,null)
                         ,('B',18,4,90,1,null)
                         ,('B',18,26,90,null,null)
                         ,('B',18,6,90,null,null)
                         ,('B',18,3,90,null,null)
                         ,('B',18,8,58,null,null)
                         ,('B',18,9,76,null,null)
                         ,('B',18,14,90,null,null)
                         ,('B',18,10,87,null,null)
                         ,('B',18,11,90,1,null)
                         ,('S',18,20,32,null,null)
                         ,('S',18,2,3,null,null)
                         ,('S',18,22,null,null,null)
                         ,('S',18,15,null,null,null)
                         ,('S',18,27,null,null,null)
                         ,('S',18,5,24,null,null)
                         ,('S',18,23,null,null,null)
--
                         ,('B',19,13,90,null,null)
                         ,('B',19,6,90,1,null)
                         ,('B',19,4,90,null,null)
                         ,('B',19,26,82,null,null)
                         ,('B',19,66,90,null,null)
                         ,('B',19,9,69,null,null)
                         ,('B',19,10,90,null,null)
                         ,('B',19,14,90,null,null)
                         ,('B',19,23,90,1,null)
                         ,('B',19,5,62,null,null)
                         ,('B',19,11,90,1,null) -- пенальти
                         ,('S',19,8,NULL,null,null)
                         ,('S',19,22,NULL,null,null)
                         ,('S',19,20,NULL,null,null)
                         ,('S',19,2,8,null,null)
                         ,('S',19,27,NULL,null,null)
                         ,('S',19,15,21,null,null)
                         ,('S',19,3,28,1,null)
--
                         ,('B',20,13,90,null,null)
                         ,('B',20,4,90,null,null)
                         ,('B',20,6,90,null,null)
                         ,('B',20,66,90,null,null)
                         ,('B',20,26,83,null,'Y')
                         ,('B',20,10,62,1,null)
                         ,('B',20,23,90,null,null)
                         ,('B',20,3,90,null,null)
                         ,('B',20,9,90,3,null)
                         ,('B',20,5,78,null,null)
                         ,('B',20,11,90,1,null) -- пенальти
                         ,('S',20,22,NULL,null,null)
                         ,('S',20,8,NULL,null,null)
                         ,('S',20,27,NULL,null,null)
                         ,('S',20,14,28,null,null)
                         ,('S',20,2,7,null,null)
                         ,('S',20,20,12,null,null)
                         ,('S',20,15,null,null,null)
--
                         ,('B',21,13,90,null,null)
                         ,('B',21,66,90,null,null)
                         ,('B',21,26,90,null,null)
                         ,('B',21,4,90,null,null)
                         ,('B',21,6,90,null,'Y')
                         ,('B',21,14,90,null,null)
                         ,('B',21,5,86,null,'Y')
                         ,('B',21,7,57,null,null)
                         ,('B',21,11,90,null,null)
                         ,('B',21,10,77,null,null)
                         ,('B',21,9,90,1,null)
                         ,('S',21,3,23,null,null)
                         ,('S',21,23,13,null,null)
                         ,('S',21,22,NULL,null,null)
                         ,('S',21,8,NULL,null,null)
                         ,('S',21,20,null,null,null)
                         ,('S',21,18,NULL,null,null)
                         ,('S',21,15,4,null,null)
--
                         ,('B',22,13,90,null,null)
                         ,('B',22,66,90,null,null)
                         ,('B',22,3,90,null,null)
                         ,('B',22,26,90,null,null)
                         ,('B',22,4,90,null,null)
                         ,('B',22,5,90,null,null)
                         ,('B',22,14,90,null,null)
                         ,('B',22,9,90,null,null)
                         ,('B',22,10,89,null,null)
                         ,('B',22,23,72,null,null)
                         ,('B',22,11,89,1,null)
                         ,('S',22,27,1,null,null)
                         ,('S',22,18,NULL,null,null)
                         ,('S',22,64,null,null,null)
                         ,('S',22,32,null,null,null)
                         ,('S',22,7,18,null,null)
                         ,('S',22,22,NULL,null,null)
                         ,('S',22,8,1,null,null)
--
                         ,('B',23,13,90,null,null)
                         ,('B',23,7,89,null,'Y2')
                         ,('B',23,32,90,null,null)
                         ,('B',23,4,90,null,null)
                         ,('B',23,26,90,null,null)
                         ,('B',23,14,90,null,null)
                         ,('B',23,9,90,1,null)
                         ,('B',23,10,90,1,null)
                         ,('B',23,3,87,null,null)
                         ,('B',23,8,71,null,null)
                         ,('B',23,11,89,2,null)
                         ,('S',23,20,3,null,null)
                         ,('S',23,15,null,null,null)
                         ,('S',23,22,NULL,null,null)
                         ,('S',23,23,19,null,null)
                         ,('S',23,18,NULL,null,null)
                         ,('S',23,27,null,null,null)
                         ,('S',23,64,1,null,null)
--
                         ,('B',24,13,90,null,null)
                         ,('B',24,32,90,null,'Y')
                         ,('B',24,26,90,null,null)
                         ,('B',24,4,90,null,null)
                         ,('B',24,14,90,null,null)
                         ,('B',24,8,66,null,null)
                         ,('B',24,5,90,null,null)
                         ,('B',24,10,90,1,null)
                         ,('B',24,9,82,null,null)
                         ,('B',24,23,67,null,null)
                         ,('B',24,11,90,null,null)
                         ,('S',24,64,null,null,null)
                         ,('S',24,22,NULL,null,null)
                         ,('S',24,20,24,null,null)
                         ,('S',24,3,23,null,null)
                         ,('S',24,27,null,null,null)
                         ,('S',24,15,8,null,null)
                         ,('S',24,6,NULL,null,null)
--
                         ,('B',25,13,90,null,null)
                         ,('B',25,32,90,null,'Y')
                         ,('B',25,26,90,null,null)
                         ,('B',25,4,90,null,null)
                         ,('B',25,7,90,null,null)
                         ,('B',25,3,90,null,null)
                         ,('B',25,8,90,null,null)
                         ,('B',25,20,69,null,null)
                         ,('B',25,11,90,null,null)
                         ,('B',25,9,75,null,null)
                         ,('B',25,10,90,1,null)
                         ,('S',25,22,NULL,null,null)
                         ,('S',25,23,21,null,null)
                         ,('S',25,64,null,null,null)
                         ,('S',25,15,null,null,null)
                         ,('S',25,18,null,null,null)
                         ,('S',25,27,15,null,null)
                         ,('S',25,48,NULL,null,null)
--
                         ,('B',26,13,90,null,null)
                         ,('B',26,32,90,null,'Y')
                         ,('B',26,26,90,null,'Y')
                         ,('B',26,4,90,null,null)
                         ,('B',26,7,90,null,null)
                         ,('B',26,5,77,1,null)
                         ,('B',26,8,90,null,null)
                         ,('B',26,3,90,null,null)
                         ,('B',26,9,89,null,null)
                         ,('B',26,10,87,1,null)
                         ,('B',26,11,90,1,null)
                         ,('S',26,27,3,null,null)
                         ,('S',26,15,1,null,null)
                         ,('S',26,20,null,null,null)
                         ,('S',26,14,null,null,null)
                         ,('S',26,22,NULL,null,null)
                         ,('S',26,66,13,null,null)
                         ,('S',26,64,null,null,null)
--
                         ,('B',27,13,90,null,null)
                         ,('B',27,32,90,null,null)
                         ,('B',27,7,90,null,'Y')
                         ,('B',27,26,90,null,null)
                         ,('B',27,4,90,null,null)
                         ,('B',27,5,90,null,'Y')
                         ,('B',27,14,72,null,null)
                         ,('B',27,3,90,null,null)
                         ,('B',27,9,31,null,null)
                         ,('B',27,10,90,null,null)
                         ,('B',27,11,79,null,null)
                         ,('S',27,15,59,null,null)
                         ,('S',27,22,NULL,null,null)
                         ,('S',27,27,11,null,null)
                         ,('S',27,66,null,null,null)
                         ,('S',27,20,null,null,null)
                         ,('S',27,23,18,null,'Y')
                         ,('S',27,8,null,null,null)
--
                         ,('B',28,13,90,null,null)
                         ,('B',28,66,90,null,null)
                         ,('B',28,26,90,null,null)
                         ,('B',28,4,90,2,null)
                         ,('B',28,32,90,null,null)
                         ,('B',28,7,70,null,null)
                         ,('B',28,5,84,null,'Y')
                         ,('B',28,3,90,null,null)
                         ,('B',28,27,90,1,null)
                         ,('B',28,11,90,null,null)
                         ,('B',28,10,78,2,null)
                         ,('S',28,22,NULL,null,null)
                         ,('S',28,64,null,null,null)
                         ,('S',28,20,12,null,null)
                         ,('S',28,8,6,null,null)
                         ,('S',28,14,20,null,null)
                         ,('S',28,15,null,null,null)
                         ,('S',28,23,null,null,'Y')
--
                         ,('B',29,13,90,null,null)
                         ,('B',29,32,90,null,null)
                         ,('B',29,26,90,null,'Y')
                         ,('B',29,4,90,null,null)
                         ,('B',29,66,90,null,null)
                         ,('B',29,14,90,null,null)
                         ,('B',29,3,90,null,'Y')
                         ,('B',29,5,63,null,'Y')
                         ,('B',29,11,90,null,null)
                         ,('B',29,10,84,null,null)
                         ,('B',29,27,63,null,null)
                         ,('S',29,9,27,null,null)
                         ,('S',29,23,null,null,null)
                         ,('S',29,8,null,null,null)
                         ,('S',29,15,null,null,null)
                         ,('S',29,20,6,null,null)
                         ,('S',29,7,27,null,null)
                         ,('S',29,22,NULL,null,null)
--
                         ,('B',30,13,90,null,'Y')
                         ,('B',30,32,90,null,null)
                         ,('B',30,26,90,null,null)
                         ,('B',30,4,90,null,null)
                         ,('B',30,66,86,null,null)
                         ,('B',30,3,90,null,'Y')
                         ,('B',30,5,68,null,null)
                         ,('B',30,20,77,null,null)
                         ,('B',30,11,90,null,null)
                         ,('B',30,10,90,2,null)
                         ,('B',30,9,90,2,null)
                         ,('S',30,22,NULL,null,null)
                         ,('S',30,27,null,null,null)
                         ,('S',30,6,null,null,null)
                         ,('S',30,14,22,null,null)
                         ,('S',30,23,null,null,null)
                         ,('S',30,8,13,null,null)
                         ,('S',30,15,4,null,null)
--
                         ,('B',31,13,90,null,null)
                         ,('B',31,32,90,null,null)
                         ,('B',31,66,90,null,null)
                         ,('B',31,4,90,null,null)
                         ,('B',31,26,90,null,null)
                         ,('B',31,3,90,null,'Y')
                         ,('B',31,5,90,null,null)
                         ,('B',31,20,72,null,null)
                         ,('B',31,11,89,null,null)
                         ,('B',31,10,90,1,null)
                         ,('B',31,9,72,null,null)
                         ,('S',31,22,NULL,null,null)
                         ,('S',31,27,18,null,null)
                         ,('S',31,6,null,null,null)
                         ,('S',31,18,null,null,null)
                         ,('S',31,23,null,null,null)
                         ,('S',31,7,18,1,null)
                         ,('S',31,15,1,null,null)
--
                         ,('B',32,13,90,null,null)
                         ,('B',32,32,90,null,null)
                         ,('B',32,66,90,null,null)
                         ,('B',32,4,90,null,null)
                         ,('B',32,26,90,null,null)
                         ,('B',32,14,77,null,null)
                         ,('B',32,5,90,null,null)
                         ,('B',32,7,77,null,null)
                         ,('B',32,9,90,1,null)
                         ,('B',32,11,89,null,null)
                         ,('B',32,10,90,null,null)
                         ,('S',32,23,null,null,null)
                         ,('S',32,20,null,null,null)
                         ,('S',32,3,13,null,null)
                         ,('S',32,6,1,null,null)
                         ,('S',32,8,null,null,null)
                         ,('S',32,22,NULL,null,null)
                         ,('S',32,27,13,null,null)
--
                         ,('B',33,13,90,null,null)
                         ,('B',33,4,90,null,null)
                         ,('B',33,26,90,null,'Y')
                         ,('B',33,66,59,null,null)
                         ,('B',33,32,90,null,null)
                         ,('B',33,5,59,null,null)
                         ,('B',33,3,90,null,null)
                         ,('B',33,8,88,1,null)
                         ,('B',33,9,90,null,null)
                         ,('B',33,11,90,1,'Y')
                         ,('B',33,10,90,null,'Y')
                         ,('S',33,23,null,null,null)
                         ,('S',33,27,null,null,null)
                         ,('S',33,6,2,null,null)
                         ,('S',33,22,null,null,null)
                         ,('S',33,7,31,null,null)
                         ,('S',33,14,31,1,'Y')
                         ,('S',33,18,NULL,null,null)
--
                         ,('B',34,13,90,null,null)
                         ,('B',34,4,90,null,null)
                         ,('B',34,26,90,null,null)
                         ,('B',34,66,59,null,null)
                         ,('B',34,32,90,null,null)
                         ,('B',34,14,77,null,null)
                         ,('B',34,8,66,null,null)
                         ,('B',34,3,90,null,null)
                         ,('B',34,9,90,null,null)
                         ,('B',34,11,90,1,null)
                         ,('B',34,10,89,1,null)
                         ,('S',34,5,24,null,null)
                         ,('S',34,23,1,null,null)
                         ,('S',34,27,null,null,null)
                         ,('S',34,6,null,null,null)
                         ,('S',34,22,null,null,null)
                         ,('S',34,7,13,null,null)
                         ,('S',34,15,NULL,null,null)
--
                         ,('B',35,13,90,null,null)
                         ,('B',35,4,90,null,null)
                         ,('B',35,26,90,null,null)
                         ,('B',35,66,86,null,null)
                         ,('B',35,32,90,null,null)
                         ,('B',35,5,90,1,null)
                         ,('B',35,14,90,null,null)
                         ,('B',35,8,71,null,null)
                         ,('B',35,9,90,null,null)
                         ,('B',35,11,90,null,null)
                         ,('B',35,10,90,null,null)
                         ,('S',35,22,null,null,null)
                         ,('S',35,12,4,null,null)
                         ,('S',35,3,4,null,null)
                         ,('S',35,23,null,null,null)
                         ,('S',35,27,null,null,null)
                         ,('S',35,7,15,1,'Y')
                         ,('S',35,15,NULL,null,null)
--
                         ,('B',36,13,90,null,null)
                         ,('B',36,4,90,null,null)
                         ,('B',36,26,90,null,null)
                         ,('B',36,66,88,null,null)
                         ,('B',36,6,90,null,null)
                         ,('B',36,5,73,null,null)
                         ,('B',36,8,90,1,null)
                         ,('B',36,14,90,null,null)
                         ,('B',36,15,73,null,null)
                         ,('B',36,11,90,2,null)
                         ,('B',36,10,90,2,null)
                         ,('S',36,27,null,null,null)
                         ,('S',36,23,17,null,null)
                         ,('S',36,22,null,null,null)
                         ,('S',36,7,null,null,null)
                         ,('S',36,21,17,null,null)
                         ,('S',36,12,2,null,null)
                         ,('S',36,32,null,null,null)
--
                         ,('B',37,13,90,null,null)
                         ,('B',37,4,90,1,null)
                         ,('B',37,26,90,null,null)
                         ,('B',37,66,90,null,null)
                         ,('B',37,6,83,null,null)
                         ,('B',37,5,66,null,null)
                         ,('B',37,3,90,null,null)
                         ,('B',37,14,90,null,null)
                         ,('B',37,15,90,null,null)
                         ,('B',37,11,73,1,null)
                         ,('B',37,10,90,null,null)
                         ,('S',37,22,null,null,null)
                         ,('S',37,12,null,null,null)
                         ,('S',37,21,null,null,null)
                         ,('S',37,7,7,null,'Y')
                         ,('S',37,27,17,1,null)
                         ,('S',37,23,24,null,null)
                         ,('S',37,32,null,null,null)
--
                         ,('B',38,13,90,null,null)
                         ,('B',38,4,90,null,null)
                         ,('B',38,26,84,null,null)
                         ,('B',38,66,90,null,null)
                         ,('B',38,32,90,null,null)
                         ,('B',38,5,88,null,null)
                         ,('B',38,3,90,null,null)
                         ,('B',38,14,90,null,null)
                         ,('B',38,27,64,null,null)
                         ,('B',38,11,90,null,null)
                         ,('B',38,10,90,2,null)
                         ,('S',38,6,null,null,null)
                         ,('S',38,22,null,null,null)
                         ,('S',38,12,6,null,null)
                         ,('S',38,21,2,null,null)
                         ,('S',38,7,26,null,null)
                         ,('S',38,15,null,null,null)
                         ,('S',38,23,null,null,NULL);
--
