create table organizator(
"orgid" serial NOT NULL,
"orgusername" varchar(7),
"password" varchar(100),
CONSTRAINT "pk_orgid" PRIMARY KEY("orgid")
);

insert into organizator("orgusername","password")
values('ieee','ieee')
insert into organizator("orgusername","password")
values('deu','deu')
insert into organizator("orgusername","password")
values('berke','berke')

create table organization(
"organizationid" serial NOT NULL,
"orgid" int NOT NULL,
"name" varchar(100),
"phone" integer,
"email" varchar(100),
"chargedpersonnel" integer,
"address" varchar(100),
CONSTRAINT "pk_organizationid" PRIMARY KEY("organizationid"),
CONSTRAINT "for_key_orgid" FOREIGN KEY("orgid")
REFERENCES organizator("orgid") match simple
);

insert into organization("orgid","name","phone","email","chargedpersonnel","address")
values(1,'IEEE DEU',551,'ieeedokuzeylul@gmail.com',200,'Tınaztepe Campus')
insert into organization("orgid","name","phone","email","chargedpersonnel","address")
values(2,'Dokuz Eylül Üniversitesi',703,'ieeedokuzeylul@gmail.com',4000,'İzmir')
insert into organization("orgid","name","phone","email","chargedpersonnel","address")
values(3,'Event Agency',1588,'event@agency.com',40,'Ankara')

create table category(
"categoryid" serial NOT NULL,
"name" varchar(100),
CONSTRAINT "pk_categoryid" PRIMARY KEY("categoryid")
);

insert into category("categoryid","name")
values(1,'technology');
insert into category("categoryid","name")
values(2,'Academic');
insert into category("categoryid","name")
values(3,'Others');

create table events(
"eventid" serial NOT NULL,
"organizationid" int NOT NULL,
"name" varchar(100),
"quota" integer,
"description" varchar(100),
"discountrate" integer,
"address" varchar(100),
"city" varchar(100),
"county" varchar(100),
"startdate" date,
"enddate" date,
"price" integer,
"num_of_participants" integer,
"categoryid" int NOT NULL,
CONSTRAINT "pk_eventid" PRIMARY KEY("eventid"),
CONSTRAINT "for_key_organizationid" FOREIGN KEY("organizationid")
REFERENCES organization("organizationid") match simple,
CONSTRAINT "for_key_categoryid" FOREIGN KEY("categoryid")
REFERENCES category("categoryid") match simple
);


insert into events("organizationid","name","quota","description","discountrate","address","city","county","startdate","enddate","price","num_of_participants","categoryid")
values(1,'DETECH',800,'deuteknolojikonferansı',0,'Tınaztepe','İzmir','Buca','2019-02-20','2019-02-23',0,750,1)

insert into events("organizationid","name","quota","description","discountrate","address","city","county","startdate","enddate","price","num_of_participants","categoryid")
values(1,'AESS',10,'havacılıkkonferansı',0,'Tınaztepe','İzmir','Buca','2019-05-18','2019-05-18',0,2,1)

insert into events("organizationid","name","quota","description","discountrate","address","city","county","startdate","enddate","price","num_of_participants","categoryid")
values(1,'EMBS',800,'biyomühendislik',20,'Tınaztepe','İzmir','Buca','2019-03-23','2019-03-23',100,3,1)

insert into events("organizationid","name","quota","description","discountrate","address","city","county","startdate","enddate","price","num_of_participants","categoryid")
values(2,'Academeet',100,'akademisyenler',0,'Külliye','Ankara','Beştepe','2019-02-20','2019-02-23',0,50,2)

insert into events("organizationid","name","quota","description","discountrate","address","city","county","startdate","enddate","price","num_of_participants","categoryid")
values(2,'Academeet',100,'akademisyenler',0,'Külliye','Ankara','Beştepe','2019-05-19','2019-05-19',0,50,2)

insert into events("organizationid","name","quota","description","discountrate","address","city","county","startdate","enddate","price","num_of_participants","categoryid")
values(2,'PMI Summit',800,'deuteknolojikonferansı',10,'YAşar Üni','İzmir','Bornova','2019-02-20','2019-02-23',200,150,2)

insert into events("organizationid","name","quota","description","discountrate","address","city","county","startdate","enddate","price","num_of_participants","categoryid")
values(3,'Piknik',50,'sosyal',0,'Mesire Yeri','İstanbul','Silivri','2019-02-20','2019-02-23',0,2,3)

create table member(
"memberid" serial NOT NULL,
"lastevent" varchar(100),
"name" varchar(100),
"surname" varchar(100),
"username" varchar(100),
"password" varchar(100),
"email" varchar(100),
"membershipType" varchar(100),
"birthdate" date,
"applied_discount_rate" integer, --can be increased by the extra discounts that can be added from events table's discount rate attribute
"eventCount" integer,
CONSTRAINT "pk_memberid" PRIMARY KEY("memberid")
);

insert into member("lastevent","name","surname","username","password","email","membershipType","birthdate","applied_discount_rate","eventCount")
values('DETECH','Berke','Kadam','berke','123','berke@gmail','standard','1997-06-05',0,3);

insert into member("lastevent","name","surname","username","password","email","membershipType","birthdate","applied_discount_rate","eventCount")
values('DETECH','Ekrem','Imamoglu','berke','123','berke@gmail','standard','2000-06-05',0,3);

insert into member("lastevent","name","surname","username","password","email","membershipType","birthdate","applied_discount_rate","eventCount")
values('null','Okan','Öztürkmenoğlu','berke','123','berke@gmail','standard','1990-06-05',15,0);

insert into member("lastevent","name","surname","username","password","email","membershipType","birthdate","applied_discount_rate","eventCount")
values('PMI Summit','Göksu','Tüysüzoğlu','berke','123','berke@gmail','standard','1990-05-06',15,1);


-- QUERIES

select * from events where city = 'İzmir' --1st query

select * from events where num_of_participants = (select max(num_of_participants) from events) --1st part of 2nd query

SELECT SUM(price * num_of_participants) AS max FROM events;
 --2nd part of 1st query


SELECT eventid FROM events GROUP BY count(categoryid)  --3rd query

select lastevent from member where birthdate between '1994-01-01' and '2001-01-01' --4th query

select * from events where num_of_participants < 3 --5th query

select * from member m where m.eventCount >= 3
UPDATE member SET membershipType = "gold" where eventCount >= 3 --6th query

DELETE FROM events e USING organization o WHERE o.organizationid = e.organizationid and o.name = 'Dokuz Eylül Üniversitesi' and e.startdate = '2019-05-19' and e.categoryid = 2
select * from events order by eventid --7th query

select m.email from member m,events e where m.lastevent = e.name 
where name as maxname from events where price = (select max(price) from events))
 --8th query

update events set discountrate = 20 WHERE city SIMILAR TO 'İ%' --9th query
select * from events

delete from member where eventCount == 0 --10th query
select * from member


-- there is a problem about eventCount column. I can see it in DB but queries don't work
-- query list can be a problem when tried to run altogether. query by query is the best method.

