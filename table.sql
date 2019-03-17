create table Users(
	username	VARCHAR(100),
	numpets		INTEGER,
	rating		INTEGER,
	password	VARCHAR(100),
	PRIMARY KEY (username),
	UNIQUE NOT NULL(password)
);

create table Pets(
	name		VARCHAR(100),
	animaltype	VARCHAR(100),
	weight		INTEGER,
	owner		VARCHAR(100) NOT NULL,
	PRIMARY KEY (name),
	FOREIGN KEY (owner) REFERENCES PetOwners
);

create table CareTakers(
	username	VARCHAR(100),
	housetype	VARCHAR(100) NOT NULL,
	minbid		INTEGER NOT NULL,
	location	?????
	PRIMARY KEY(username),

);
create table accommodates(
	petname
	ownername
	startdate
	enddate

);

create table TimeFrame(
	caretaker 	VARCHAR(100),
	startdate	DATE,
	enddate		DATE,
	PRIMARY KEY(caretaker, startdate, enddate),
	FOREIGN KEY (caretaker) REFERENCES CareTakers(username)
);

