create table Users(
	username	VARCHAR(100),
	rating		INTEGER,
	password	VARCHAR(100),
	numPets		INTEGER,
	PRIMARY KEY (username),
	UNIQUE NOT NULL(password)
);

create table Pets(
	petName		VARCHAR(100),
	petType		VARCHAR(100) NOT NULL,
	ownerName	VARCHAR(100),
	PRIMARY KEY (PetName, ownerName),
	FOREIGN KEY (ownerName) REFERENCES PetOwners(username) ON DELETE CASCADE
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

-- keep track of the petOwner's successful bidding history
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
	FOREIGN KEY		(ownerName) REFERENCES PetOwners(username) ON DELETE CASCADE,
	FOREIGN KEY		(hostName)  REFERENCES CareTakers(username) ON DELETE CASCADE
);


-- store all the completed services
create table Accommodated(
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


-- store the services that are about to happen and the ones that are currently going on
create table Not_completed_accommodation(
	hostName	VARCHAR(100),
	petName		VARCHAR(100),
	ownerName	VARCHAR(100),
	startdate	DATE REFERENCES TimeFrame,
	enddate		DATE REFERENCES TimeFrame,
	PRIMARY KEY (ownerName, petName, startdate, enddate),
	FOREIGN KEY (petName) REFERENCES Pets(petName),
	FOREIGN KEY (ownerName) REFERENCES PetOwners(username),
	FOREIGN KEY (hostName) REFERENCES CareTakers(username)

)


-- to store the availability of careTakers
create table TimeFrame(
	hostName 	VARCHAR(100),
	minBid		INTEGER NOT NULL,
	startdate	DATE ,
	enddate		DATE ,
	PRIMARY KEY(hostName, startdate, enddate),
	FOREIGN KEY (hostName) REFERENCES CareTakers(username),
	CONSTRAINT "Service end time must be after start time." CHECK (enddate > startdate)
);

-- to store the capacity of pets
create table Capacity(
	hostName	VARCHAR(100) REFERENCES CareTakers(username),
	num		INTEGER NOT NULL,
	PRIMARY KEY (hostName),
	CONSTRAINT "Capacity has to be grater than 0" CHECK (num > 0)

);

---to store the valid daily bidding history. clear at the end of the day. 
---max is selected to update Not_completed_accommodation and BiddedHosts.
create table Bidders(
	ownerName 	VARCHAR(100),
	hostName	VARCHAR(100),
	bids		INTEGER,
	petName 	VARCHAR(100),
	PRIMARY KEY (ownerName, hostName, bids, petName),
	FOREIGN KEY (ownerName) REFERENCES PetOwners(username),
	FOREIGN KEY (hostName) REFERENCES CareTakers(username),
	FOREIGN KEY (petName) REFERENCES Pets(PetName)
);

