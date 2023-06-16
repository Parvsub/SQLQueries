Create database CFP;
use CFP;
create table contact(contactid int primary key identity(1,1), FirstName varchar(50) not null, Lastname varchar(50) null,
                     address varchar(75));
create table addressdetails1(contactid int , city varchar(50), state varchar(50), dob date not null, weight int,
                    foreign key (contactid) references contact(contactid));
/*add operation*/
insert into contact values('Praveen','Kumar','prav@gmail.com'),('Mohan','reddy','mohan@gmail.com'),('likitha','','liki@gmail.com'),
                           ('sruthi','pavuluru','shruthi@gmail.com');
insert into addressdetails1 values('1','mysore','karnataka','1997-11-26','60'),('2','vizag','AP','1995-09-23','65'),('3','chennai','tamilnadu','2023-08-23','70'),('1','new delhi','delhi','2022-07-30',56),
                          ('3','thiruvanthapuram','kerala','2000-06-23','50'),('4','agra','uttarpradesh','2022-02-10','10'),('2','mumbai','maharashtra','2010-03-10','15');
select * from contact;
select * from addressdetails1;

/* Deletion operation*/
delete from addressdetails1 where contactid=1;
delete from contact where address='prav@gmail.com';
delete from addressdetails1 where city='vizag';

/* Update Operation*/
update contact set LastName='Bodapati' where address='mohan@gmail.com';
update addressdetails1 set city ='Bengaluru' where contactid=1;

/* Basic Queries*/
select count(*) as states from addressdetails1;
select count(*) as address from contact;
select min(weight) as weigth from addressdetails1;
select max(weight) as weigth from addressdetails1;
select min(firstname) as firstname from contact;
select max(city) as cities from addressdetails1;
select max(state) as states from addressdetails1;
select min(city) as cities from addressdetails1;
select min(state) as states from addressdetails1;
select avg(weight) as totalweight from addressdetails1;
select firstname,lastname,address,city,state from contact left join  addressdetails1 on contact.contactid= addressdetails1.contactid; 
