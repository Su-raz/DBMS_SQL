use suraj_38_company;
CREATE TABLE Employee(
     SSN INT  AUTO_INCREMENT PRIMARY KEY,
     Ename VARCHAR(55) NOT NULL,
     Gender char(1)  CHECK (Gender IN('M','F')),
     Bdate Date,
     Address varchar(100),
     Salary decimal(10,2) Default  0.00,
     Ono int,
     Year_of_experence int,
	FOREIGN KEY (Ono) references Office(Onumber)
 );
 
 desc Employee;
 
 create table Project(
 Pnumber  int auto_increment primary key,
 Pname varchar(40) not null unique,
 Plocation varchar(40),
 Onumber int,
CONSTRAINT fk_pro FOREIGN KEY (Onumber) REFERENCES Office(Onumber)
); 


CREATE TABLE Works_on
(
ESSN int,
Pno int,
foreign key(ESSN) references Employee(SSN) on update cascade on delete cascade,
foreign key(Pno) references Project(Pnumber) on update cascade on delete cascade 
);
desc Works_on;
create table Dependents
(
Did int auto_increment primary key,
Dname varchar(50),
Dage int,
SSN int,
foreign key (SSN) references Employee(SSN) on update set null on delete  set null,
constraint age_constraint  check (Dage<16)
);
 desc Dependents;
 
alter table Dependents add column Drelation char(50);
alter table Dependents modify   Drelation varchar(50);

-- 4 ans:
insert into Office(Onumber ,Oname,Country) values(1, 'Suraj_Office_38' ,'USA');
insert into Office(Onumber ,Oname,Country) values( 2,'Suraj_ncell_38' ,'UK');
INSERT INTO Office (Onumber, Oname, Country)
VALUES (3, 'hari_Office_06' , 'Nepal'),
       (4, 'Ram_Ncell_06',  'china'),
       (5, 'Sita_Ncell_06',  'australia');

insert into Employee( SSN , Ename,Gender , Bdate,Address, Salary, Ono,Year_of_experence) values (38 , 'SuraJ', 'M' ,'2024-07-03', "lalitpur-2" , "30000" ,2,3 );
INSERT INTO Employee (SSN , Ename,Gender , Bdate,Address, Salary, Ono,Year_of_experence)
VALUES (39 , 'hari', 'M' ,'2024-08-03', "lamahi-2" , "40000" ,4,7 ),
       (40, 'Ram', 'M' ,'2024-01-03', "ktm-2" , "20000" ,1,10 ),
       (41, 'Sita', 'F' , '1990-05-02' , 'australia' , '10000' ,5 ,4),
       (42, 'pratiksha', 'F' , '2061-05-07' , 'dang' , '100000' ,1 ,7)
       ;
insert into Project(Pnumber,Pname,Plocation,Onumber) values(2*38 ,'Suraj_ProjMDS', 'lalitpur', 1 );
insert into Project(Pnumber, Pname, Plocation, Onumber) values
( 20 ,'Hari_ProjMDS', 'bhaktapur', 2),
( 21 ,'Sita_ProjMDS', 'australia', 3),
( 22 ,'pratiksha_ProjMDS', 'bhaktapur', 4),
( 23 ,'Ram_ProjMDS', 'ktm-2', 5);

insert into Dependents ( Did, Dname , Dage , SSN , Drelation) values( 1, 'himesh' , 15, 38 , 'brother');
insert into Dependents ( Did, Dname , Dage , SSN , Drelation) values( 2, 'yam' , 15, 38 , 'mother');
insert into Dependents (Did , Dname ,Dage , SSN, Drelation) values 
(3,'sima', 10, 39, 'sister'),
(4, 'krinjal', 5, 40 , 'brother'),
(5, 'basu' , 14, 41, 'cousin' );
 update Office 
 Set Oname = 'Suraj_ntc_38'
 where Onumber = 2;
 
 Delete  from Employee
 where SSN = 1;
 
 alter table  Project
change column Plocation  Proj_location  varchar(40);

Drop table Works_on;

alter table Dependents
drop constraint age_constraint