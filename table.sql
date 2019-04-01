DROP TYPE IF EXISTS bidding_status CASCADE;
DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS Pets CASCADE;
DROP TABLE IF EXISTS CareTakers CASCADE;
DROP TABLE IF EXISTS PetOwners CASCADE;
DROP TABLE IF EXISTS Favorite CASCADE;
DROP TABLE IF EXISTS Wishlist CASCADE;
DROP TABLE IF EXISTS Accommodated CASCADE;
DROP TABLE IF EXISTS Not_completed_accommodation CASCADE;
DROP TABLE IF EXISTS Services CASCADE;
DROP TABLE IF EXISTS BiddingStatus CASCADE;



CREATE TYPE bidding_status AS ENUM(
	'pending',
	'succeed',
	'fail'

);


create table Users(
	username	VARCHAR(100),
	rating		NUMERIC,
	password	VARCHAR(100) NOT NULL,
	numPets		INTEGER,
	location 	VARCHAR(500),
	cantact_number INTEGER,
	verification_qn VARCHAR(500),
	answer 		VARCHAR(500),
	PRIMARY KEY (username)
);

CREATE TABLE PetOwners(
	username 	varchar(100),
	PRIMARY KEY 	(username),
	FOREIGN KEY 	(username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE
);

--- A week entity
create table Pets(
	petName		VARCHAR(100),
	petType		VARCHAR(100) NOT NULL,
	ownerName	VARCHAR(100),
	PRIMARY KEY (PetName, ownerName),
	FOREIGN KEY (ownerName) REFERENCES PetOwners(username) ON DELETE CASCADE ON UPDATE CASCADE
);

-- The ISA satisfies overlap constraints but does not stisfies convering constraints
create table CareTakers(
	username	VARCHAR(100),
	PRIMARY KEY(username),
	FOREIGN KEY (username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE Favorite(
	ownerName		varchar(100),
	hostName		varchar(100),
	PRIMARY KEY		(ownerName, hostName),
	FOREIGN KEY		(ownerName) REFERENCES PetOwners(username) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY		(hostName)  REFERENCES CareTakers(username) ON DELETE CASCADE ON UPDATE CASCADE
);


-- to store the availability of careTakers
create table Services(
	hostName 	VARCHAR(100),
	minBid		NUMERIC NOT NULL,
	startdate	DATE ,
	enddate		DATE ,
	capacity  	INTEGER,
	PRIMARY KEY (hostName, startdate, enddate),
	FOREIGN KEY (hostName) REFERENCES CareTakers(username),
	CONSTRAINT "Service end time must be after start time." CHECK (enddate > startdate)
);

-- to store the services that the petOwner is interested in
CREATE TABLE Wishlist(
	ownerName		VARCHAR(100),
	hostName		VARCHAR(100),
	--minBid			NUMERIC,
	startdate		DATE,
	enddate			DATE,
	PRIMARY KEY     (ownerName, hostName), 
	FOREIGN KEY		(ownerName) REFERENCES PetOwners(username) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY  	(hostName, startdate, enddate)	REFERENCES	Services(hostName, startdate, enddate) ON DELETE CASCADE ON UPDATE CASCADE
);


-- store all the completed services
create table Accommodated(
	hostName	VARCHAR(100),
	petName		VARCHAR(100),
	ownerName	VARCHAR(100),
	startdate	DATE,
	enddate		DATE,
	PRIMARY KEY (ownerName, petName, startdate, enddate),
	FOREIGN KEY (ownerName, petName) REFERENCES Pets(ownerName,petName),
	FOREIGN KEY (hostName, startdate, enddate) REFERENCES Services(hostName, startdate, enddate)
);


-- store the services that are about to happen and the ones that are currently going on
create table Not_completed_accommodation(
	hostName	VARCHAR(100),
	petName		VARCHAR(100),
	ownerName	VARCHAR(100),
	startdate	DATE,
	enddate		DATE,
	PRIMARY KEY (ownerName, petName, startdate, enddate),
	FOREIGN KEY (ownerName, petName) REFERENCES Pets(ownerName,petName),
	FOREIGN KEY (hostName, startdate, enddate) REFERENCES Services(hostName, startdate, enddate) 
);

-- to store the capacity of pets
--create table Capacity(
--	hostName	VARCHAR(100) REFERENCES CareTakers(username),
--	num		INTEGER NOT NULL,
--	PRIMARY KEY (hostName),
--	CONSTRAINT "Capacity has to be grater than 0" CHECK (num > 0)

--);

---to store the all the valid biddding history with status shown as pending, fail, success.
create table BiddingStatus(
	ownerName 	VARCHAR(100),
	hostName	VARCHAR(100),
	bids		NUMERIC,
	petName 	VARCHAR(100),
	created_at timestamp DEFAULT current_timestamp,
	status     bidding_status DEFAULT 'pending',
	startdate	DATE,
	enddate		DATE,
	PRIMARY KEY (ownerName, hostName, bids, petName),
	FOREIGN KEY (ownerName, petName) REFERENCES Pets(ownerName, petName),
	FOREIGN KEY (hostName, startdate,enddate) REFERENCES Services(hostName, startdate,enddate)
);

