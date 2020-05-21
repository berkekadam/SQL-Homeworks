--CREATING UNIVERSITY TABLE
create table university(
"UniID" serial NOT NULL,
"city" varchar(100),
"address" varchar(100),
"uName" varchar(100),
"e-mailAddress" varchar(100),
"uType" varchar(100),
"yearOfFoundation" int NOT NULL,
CONSTRAINT "pk_UniID" PRIMARY KEY("UniID")
);

--INSERTING DATA TO UNIVERSITY TABLE
insert into university("city","address","uName","e-mailAddress","uType","yearOfFoundation")
values('İstanbul','Sarıyer','İTÜ','itu@edu.tr','state','1773');
insert into university("city","address","uName","e-mailAddress","uType","yearOfFoundation")
values('İstanbul','Ataşehir','İstanbul Yeditepe University','yu@edu.tr','private','1996');
insert into university("city","address","uName","e-mailAddress","uType","yearOfFoundation")
values('İzmir','Buca','DEU','deu@edu.tr','state','1982');
insert into university("city","address","uName","e-mailAddress","uType","yearOfFoundation")
values('İzmir','Balçova','İzmir University','ieu@edu.tr','private','2001');
insert into university("city","address","uName","e-mailAddress","uType","yearOfFoundation")
values('Bursa','Görükle','Uludağ University','buu@edu.tr','state','1975');
insert into university("city","address","uName","e-mailAddress","uType","yearOfFoundation")
values('İzmir','Torbalı','İzmir Technical University','izu@edu.tr','state','2019');

--WRITING UNIVERSITY TABLE
SELECT * FROM university;

--CREATING FACULTY TABLE
create table faculty(
"fucID" serial NOT NULL,
"UniID" int NOT NULL,
"fName" varchar(100),
"e-mailAddress" varchar(100),
CONSTRAINT "pk_fucID" PRIMARY KEY("fucID"),
CONSTRAINT "for_key_UniID" FOREIGN KEY("UniID")
REFERENCES university("UniID") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

--INSERTING DATA TO FACULTY TABLE
insert into faculty("UniID","fName","e-mailAddress")
values('1','Engineering','ituen@edu.tr');
insert into faculty("UniID","fName","e-mailAddress")
values('2','Medicine','yumed@edu.tr');
insert into faculty("UniID","fName","e-mailAddress")
values('2','Law','yulaw@edu.tr');
insert into faculty("UniID","fName","e-mailAddress")
values('3','Engineering','deuen@edu.tr');
insert into faculty("UniID","fName","e-mailAddress")
values('3','Law','deulaw@edu.tr');
insert into faculty("UniID","fName","e-mailAddress")
values('3','Medicine','deumed@edu.tr');
insert into faculty("UniID","fName","e-mailAddress")
values('4','Engineering','ieuen@edu.tr');
insert into faculty("UniID","fName","e-mailAddress")
values('4','Medicine','ieulaw@edu.tr');
insert into faculty("UniID","fName","e-mailAddress")
values('5','Medicine','bumed@edu.tr');
insert into faculty("UniID","fName","e-mailAddress")
values('5','Engineering','ulueng@edu.tr');

--WRITING FACULTY TABLE
SELECT * FROM faculty;

--CREATING DEPARTMENT TABLE
create table department(
"depID" serial NOT NULL,
"fucID" int NOT NULL,
"period" integer,
"dName" varchar(100),
"topRankQuota" integer,
"quota" integer,
"minOrder" integer,
"minScore" integer,
"e-mailAddress" varchar(100),
"language" varchar(100),
"eType" varchar(100),
CONSTRAINT "pk_depID" PRIMARY KEY("depID"),
CONSTRAINT "for_key_fucID" FOREIGN KEY("fucID")
REFERENCES faculty("fucID") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

--INSERTING DATA TO DEPARTMENT TABLE
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('1','4','Computer Engineering','2','70','3000','520','ceng@itu.edu.tr','eng','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('1','4','Industry Engineering','1','75','6000','200','ind@itu.edu.tr','eng','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('1','4','Chemical Engineering','3','60','33000','445','che@itu.edu.tr','tur','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('2','6','Medicine','1','70','2000','525','med@iyu.edu.tr','tur','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('3','4','Law','5','50','5000','470','med@yu.edu.tr','tur','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('4','4','Computer Engineering','3','90','30000','450','ceng@deu.edu.tr','eng','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('4','4','Mechine Engineering','0','85','80000','380','me@deu.edu.tr','tur','iö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('4','4','Civil Engineering','2','60','170000','360','civ@deu.edu.tr','tur','iö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('5','4','Law','1','65','12000','418','law@deu.edu.tr','tur','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('6','6','Medicine','1','60','5000','510','med@deu.edu.tr','tur','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('7','4','Computer Engineering','1','50','75000','385','ceng@iu.edu.tr','eng','iö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('7','4','Electrical Electronics Engineering','2','60','80000','370','ee@iu.edu.tr','tur','iö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('8','6','Medicine','5','65','10000','475','med@bu.edu.tr','tur','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('9','6','Medicine','0','85','7000','490','med@bu.edu.tr','tur','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('10','4','Computer Engineering','4','80','56000','410','ceng@bu.edu.tr','tur','öö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('10','4','Industry Engineering','2','90','65000','400','en@bu.edu.tr','tur','iö');
insert into department("fucID","period","dName","topRankQuota","quota","minOrder","minScore","e-mailAddress","language","eType")
values('10','4','Electrical Electronics Engineering','1','60','60000','415','ee@bu.edu.tr','eng','öö');

--WRITING DEPARTMENT TABLE
SELECT * FROM department;

--CREATING STUDENT TABLE
create table student(
"studentID" serial NOT NULL,
"firstdepID" int NOT NULL,
"secdepID" int NOT NULL,
"thrdepID" int NOT NULL,
"sName" varchar(100),
"surname" varchar(100),
"rank" integer,
"exScore" integer,
"ifTopRankHighScool" bit,
CONSTRAINT "pk_studentID" PRIMARY KEY("studentID"),
CONSTRAINT "for_key_firstdepID" FOREIGN KEY("firstdepID")
REFERENCES department("depID") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_secdepID" FOREIGN KEY("secdepID")
REFERENCES department("depID") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_thrdepID" FOREIGN KEY("thrdepID")
REFERENCES department("depID") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

--INSERTING DATA TO STUDENT TABLE
insert into student("firstdepID","secdepID","thrdepID","sName","surname","rank","exScore","ifTopRankHighScool")
values('1','6','3','Damla','Ülkü','20000','470','1');
insert into student("firstdepID","secdepID","thrdepID","sName","surname","rank","exScore","ifTopRankHighScool")
values('5','9','6','Can','Bonomo','11000','420','0');
insert into student("firstdepID","secdepID","thrdepID","sName","surname","rank","exScore","ifTopRankHighScool")
values('6','15','11','Melek','Mosso','60000','415','0');
insert into student("firstdepID","secdepID","thrdepID","sName","surname","rank","exScore","ifTopRankHighScool")
values('4','2','6','Evrencan','Gündüz','6500','500','1');
insert into student("firstdepID","secdepID","thrdepID","sName","surname","rank","exScore","ifTopRankHighScool")
values('1','9','13','Zeynep','Bastık','8000','490','0');

--WRITING STUDENT TABLE
SELECT * FROM student;

--QUERIES

--Q1
SELECT "uName" FROM university WHERE "uName" LIKE 'İ%' AND "yearOfFoundation">1990; 

--Q2
SELECT "uName" FROM university 
WHERE "UniID" IN(SELECT "UniID" FROM faculty WHERE "fName" = 'Engineering') 
AND "UniID" IN(SELECT "UniID" FROM faculty WHERE "fName" = 'Medicine'); 

--Q3
SELECT Count(f."fucID") , u."uType" FROM faculty AS f, university AS u WHERE f."UniID" = u."UniID" GROUP BY u."uType"

--Q4
SELECT U."uName", D."dName" , D."eType"
FROM department AS D,faculty AS F, university AS U 
WHERE D."fucID" = F."fucID" AND F."UniID" = U."UniID" AND D."eType" = 'iö' AND f."fName" = 'Engineering' 

--Q5
SELECT  "uName", "dName", "period", "minScore" FROM department INNER JOIN faculty ON department."fucID"=faculty."fucID"
INNER JOIN university ON faculty."UniID"=university."UniID"
ORDER BY "period" DESC, "minScore" DESC LIMIT 5;

--Q6
SELECT "dName", MostPrefID, COUNT(*) as "Count" 
FROM
(
  SELECT "firstdepID" AS MostPrefID FROM student
  UNION ALL
  SELECT "secdepID" AS MostPrefID FROM student
  UNION ALL
  SELECT "thrdepID" AS MostPrefID FROM student
) damla INNER JOIN department ON damla.MostPrefID = department."depID"
WHERE "period"=4 GROUP BY MostPrefID,"dName" ORDER BY "Count" DESC LIMIT 1

--Q7
SELECT "sName", "surname", "exScore" FROM student 
INNER JOIN department ON "firstdepID"="depID"
WHERE "dName" = 'Ceng' ORDER BY "exScore" DESC 

--Q8
UPDATE faculty
SET "UniID" = (SELECT "UniID" FROM university WHERE "uName" = 'İzmir Technical University')
WHERE "fucID" IN 
(SELECT "fucID" 
FROM faculty INNER JOIN university ON faculty."UniID" = university."UniID" 
WHERE "uName" ='DEU' AND "fName" ='Engineering') 

--CONTROLLING Q8
SELECT * FROM faculty INNER JOIN university ON faculty."UniID" = university."UniID" ORDER BY "fucID"

--Q9
UPDATE department
SET "period" = ("period"+1) WHERE "dName"='Law'

--CONTROLLING Q9
SELECT * FROM department ORDER BY "depID"

--Q10
DELETE FROM university WHERE "uName"='İzmir University'

--CONTROLLING Q10
SELECT * FROM department INNER JOIN faculty ON department."fucID"=faculty."fucID"
INNER JOIN university ON faculty."UniID" = university."UniID" ORDER BY department."depID"

--PLEASE CHECK QUERIES ONE BY ONE.