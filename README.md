# CW_ESD

This project is for the ESD module which implements a site for a GP surgery. Please note that it is necessary to establish a database with the correct data before using the site.
This SQL to setup the database is below. 

# SQL for DB

create table users(
	uname varchar(20) primary key,
	passwd varchar(20),
	role varchar(10)
);

create table clients(
	cID int not null primary key
            generated always as identity (start with 1, increment by 1), 
	cName varchar(50),
	cAddress varchar(150),
	cType varchar(10),
	uName varchar(20) references users(uname)
);

create table employee(
	eID int not null primary key
            generated always as identity (start with 1, increment by 1), 
	eName varchar(50),
	eAddress varchar(150),
	uName varchar(20) references users(uname),
	shift varchar(2)
);

create table operations(
    oID int not null primary key
            generated always as identity (start with 1, increment by 1), 
    eID int references employee(eID),
    cID int references clients(cID),
    oDate date,
    oTime time,
    nSlot int,
    charge double
);


create table booking_slots(
    sID int not null primary key
            generated always as identity (start with 1, increment by 1),
    eID int references employee(eID),
    cID int references clients(cID),
    sDate date,
    sTime time
);

create table PRESCRIPTIONS(
    prescription_ID int not null primary key 
			generated always as identity (start with 1, increment by 1), 
    uName varchar(20) references users(uname),
    drug_name varchar(20)
);

create table TEMP_EMPLOYEE(
	eName varchar(50),
	eAddress varchar(150),
	uName varchar(20),
        password varchar(20),
	role varchar(10),
	shift varchar(2)
);

create table TEMP_PRESCRIPTIONS(
    prescription_ID int not null primary key 
			generated always as identity (start with 1, increment by 1), 
    uName varchar(20),
    drug_name varchar(20)
);

create table CONSULTATION_PRICES(
	pType varchar(20),
	pCost decimal(6,2)
);

create table INVOICES(
    iID  int not null primary key generated always as identity (start with 1, increment by 1), 
    eID int references employee(eID),
    cID int references clients(cID),
    consultationCost decimal(6,2),
    operationCost decimal(10,2),
    iPaid boolean,
    datePaid varchar(10)
);

INSERT INTO USERS (UNAME, PASSWD, ROLE) VALUES ('admin1', 'password', 'admin');

INSERT INTO USERS (UNAME, PASSWD, ROLE) VALUES ('johncena420', 'password', 'client');
INSERT INTO CLIENTS (CNAME, CADDRESS, CTYPE, UNAME) VALUES ('john cena', '123 CantSeeStreet', 'Private', 'johncena420');

INSERT INTO USERS (UNAME, PASSWD, ROLE) VALUES ('robsmith509', 'password', 'client');
INSERT INTO CLIENTS (CNAME, CADDRESS, CTYPE, UNAME) VALUES ('Rob Smith', '12 the street', 'NHS', 'robsmith509');

INSERT INTO USERS (UNAME, PASSWD, ROLE) VALUES ('lizbrown234', 'password', 'client');
INSERT INTO CLIENTS (CNAME, CADDRESS, CTYPE, UNAME) VALUES ('Liz Brown', '408 long avenue', 'Private', 'lizbrown234');

INSERT INTO USERS (UNAME, PASSWD, ROLE) VALUES ('davehesitant882', 'password', 'client');
INSERT INTO CLIENTS (CNAME, CADDRESS, CTYPE, UNAME) VALUES ('Dave Hesitant', '66 Mans On Road', 'Private', 'davehesitant882');

INSERT INTO USERS (UNAME, PASSWD, ROLE) VALUES ('jimmyjameson564', 'password', 'client');
INSERT INTO CLIENTS (CNAME, CADDRESS, CTYPE, UNAME) VALUES ('Jimmy Jameson', '99 one hundred street', 'NHS', 'jimmyjameson564');


INSERT INTO USERS (UNAME, PASSWD, ROLE) VALUES ('timfirst167', 'password', 'doctor');
INSERT INTO EMPLOYEE (ENAME, EADDRESS, UNAME, SHIFT) VALUES ('Tim First', '123 Health street', 'timfirst167', 'FT');


INSERT INTO USERS (UNAME, PASSWD, ROLE) VALUES ('janebest191', 'password', 'nurse');
INSERT INTO EMPLOYEE (ENAME, EADDRESS, UNAME, SHIFT) VALUES ('Jane Best', '124 Health street', 'janebest191', 'PT');


INSERT INTO CONSULTATION_PRICES (PTYPE, PCOST) VALUES ('doctor', 100);
INSERT INTO CONSULTATION_PRICES (PTYPE, PCOST) VALUES ('nurse', 10);
INSERT INTO CONSULTATION_PRICES (PTYPE, PCOST) VALUES ('Operation', 1000);

