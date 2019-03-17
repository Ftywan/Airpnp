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
	location	VARCHAR(100),
	PRIMARY KEY(username)

);
CREATE TABLE PetOwners(
	username 	varchar(100),
	PRIMARY KEY 	(username),
	FOREIGN KEY 	(username) REFERENCES Users
);

CREATE TABLE BiddedHosts(
	ownername		varchar(100),
	hostname		varchar(100),
	petname			varchar(100),
	biddingpoint	INTEGER,
	startdate		DATE REFERENCES TimeFrame,
	enddate			DATE REFERENCES TimeFrame,
	PRIMARY KEY		(ownername, hostname, petname, startdate, enddate),
	FOREIGN KEY		hostname REFERENCES CareTakers(username),
	FOREIGN KEY		petname REFERENCES Pets(username),
	FOREIGN KEY		(hostname,biddingpoint) REFERENCES Bidders(caretakers, bids)
);

-- username = username of the hosts
CREATE TABLE Favorites(
	ownername		varchar(100),
	hostname		varchar(100),
	PRIMARY KEY		(ownername, hostname),
	FOREIGN KEY		(ownername) REFERENCES PetOwners,
	FOREIGN KEY		(hostname)  REFERENCES CareTakers
);

create table CareTakers(
	username	VARCHAR(100),
	housetype	VARCHAR(100) NOT NULL,
	minbid		INTEGER NOT NULL,
	location	VARCHAR(100),
	PRIMARY KEY(username)

);

create table Accommodates(
	petname		VARCHAR(100),
	ownername	VARCHAR(100),
	startdate	DATE REFERENCES TimeFrame,
	enddate		DATE REFERENCES TimeFrame,
	PRIMARY KEY (ownername, petname, startdate, enddate),
	FOREIGN KEY (petname) REFERENCES Pets(name)
	FOREIGN KEY (ownername) REFERENCES Petowners(username)

);

create table TimeFrame(
	caretaker 	VARCHAR(100),
	startdate	DATE,
	enddate		DATE,
	PRIMARY KEY(caretaker, startdate, enddate),
	FOREIGN KEY (caretaker) REFERENCES CareTakers(username)
);

create table Capacity(
	username	VARCHAR(100) REFERENCES CareTakers(username),
	pettype		VARCHAR(100),
	num		INTEGER,
	PRIMARY KEY (username)

);

---to be discussed, the machanism is too complicated
create table Bidders(
	petowners 	VARCHAR(100),
	caretakers	VARCHAR(100),
	bids		INTEGER,
	PRIMARY KEY (petowners, caretakers, bids),
	FOREIGN KEY (petowners) REFERENCES PetOwners(username),
	FOREIGN KEY (caretakers) REFERENCES CareTakers(username)
);

