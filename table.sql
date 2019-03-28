create table Users(
	username	VARCHAR(100),
	rating		INTEGER,
	password	VARCHAR(100),
	PRIMARY KEY (username),
	UNIQUE NOT NULL(password)
);

create table Pets(
	petName		VARCHAR(100),
	petType		VARCHAR(100) NOT NULL,
	ownerName	VARCHAR(100),
	PRIMARY KEY (PetName, ownerName),
	FOREIGN KEY (ownerName) REFERENCES PetOwners(username)
);

create table CareTakers(
	username	VARCHAR(100),
	location	VARCHAR(100),
	PRIMARY KEY(username) 
	FOREIGN KEY (username) REFERENCES Users(username)

);
CREATE TABLE PetOwners(
	username 	varchar(100),
	PRIMARY KEY 	(username),
	FOREIGN KEY 	(username) REFERENCES Users(username)
);

-- keep track of the petOwner's bidding history? (including both the succussful and the unsuccussful ones)
CREATE TABLE BiddedHosts(
	ownerName		varchar(100),
	hostName		varchar(100),
	petName			varchar(100),
	biddingPoint	INTEGER,
	startdate		DATE REFERENCES TimeFrame,
	enddate			DATE REFERENCES TimeFrame,
	PRIMARY KEY		(ownerName, hostName, petName, startdate, enddate),
	FOREIGN KEY		hostName REFERENCES CareTakers(username),
	FOREIGN KEY		petName REFERENCES Pets(petName),
	FOREIGN KEY		ownerName REFERENCES PetOwners(username),
	FOREIGN KEY		(hostName,biddingPoint) REFERENCES Bidders(caretakers, bids)
);

-- username = username of the hosts
CREATE TABLE Favorites(
	ownerName		varchar(100),
	hostName		varchar(100),
	PRIMARY KEY		(ownerName, hostName),
	FOREIGN KEY		(ownerName) REFERENCES PetOwners(username),
	FOREIGN KEY		(hostName)  REFERENCES CareTakers(username)
);



create table Accommodates(
	hostName	VARCHAR(100),
	petName		VARCHAR(100),
	ownerName	VARCHAR(100),
	startdate	DATE REFERENCES TimeFrame,
	enddate		DATE REFERENCES TimeFrame,
	PRIMARY KEY (ownerName, petName, startdate, enddate),
	FOREIGN KEY (petName) REFERENCES Pets(petName),
	FOREIGN KEY (ownerName) REFERENCES PetOwners(username),
	FOREIGN KEY (hostName) REFERENCES CareTakers(username)

);

create table TimeFrame(
	hostName 	VARCHAR(100),
	minBid		INTEGER NOT NULL,
	startdate	DATE ,
	enddate		DATE ,
	PRIMARY KEY(hostName, startdate, enddate),
	FOREIGN KEY (hostName) REFERENCES CareTakers(username)
);

create table Capacity(
	hostName	VARCHAR(100) REFERENCES CareTakers(username),
	num		INTEGER NOT NULL,
	PRIMARY KEY (hostName)

);

---to store the winning bids only.
create table Bidders(
	ownerName 	VARCHAR(100),
	hostName	VARCHAR(100),
	bids		INTEGER,
	PRIMARY KEY (ownerName, hostName, bids),
	FOREIGN KEY (ownerName) REFERENCES PetOwners(username),
	FOREIGN KEY (hostName) REFERENCES CareTakers(username)
);

