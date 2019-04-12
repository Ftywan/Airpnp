DROP TYPE IF EXISTS bidding_status CASCADE;
DROP TYPE IF EXISTS service_status CASCADE;
DROP TYPE IF EXISTS bonus_types CASCADE;
DROP TYPE IF EXISTS accommodation_status CASCADE;

DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS Pets CASCADE;
DROP TABLE IF EXISTS CareTakers CASCADE;
DROP TABLE IF EXISTS PetOwners CASCADE;
DROP TABLE IF EXISTS Favorite CASCADE;
DROP TABLE IF EXISTS Wishlist CASCADE;
DROP TABLE IF EXISTS Accommodation CASCADE;
DROP TABLE IF EXISTS Services CASCADE;
DROP TABLE IF EXISTS BiddingStatus CASCADE;
DROP TABLE IF EXISTS SpecialBonus CASCADE;
DROP TABLE IF EXISTS Comment CASCADE;
DROP TABLE IF EXISTS Login CASCADE;
DROP TABLE IF EXISTS Location CASCADE;



CREATE TYPE bidding_status AS ENUM(
	'pending',
	'success',
	'fail'
);


CREATE TYPE service_status AS ENUM(
	'bidded',
	'available'
);


CREATE TYPE bonus_types AS ENUM(
	'walk',
	'shower',
	'beauty'
	'none'
);

CREATE TYPE accommodation_status AS ENUM(
	'completed',
	'sending'
);


-- Users is in BCNF
create table Users(
	username	VARCHAR(100),
	password	VARCHAR(100) NOT NULL,
	numPets		INTEGER DEFAULT 0,
	contact_number DECIMAL(10,0),
	address	VARCHAR(100) UNIQUE,
	PRIMARY KEY (username)
);

-- For website implementation
create table Login(
	username 	VARCHAR(100),
	PRIMARY KEY (username),
	FOREIGN KEY (username) REFERENCES Users(username) ON DELETE CASCADE
);


-- BCNF, for solving deletion anomaly
CREATE TABLE Location(
	address 		VARCHAR(100),
	nearest_mrt 	VARCHAR(100),
	PRIMARY KEY (address),
	FOREIGN KEY (address) REFERENCES Users(address) ON DELETE CASCADE ON UPDATE CASCADE
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


-- BCNF
CREATE TABLE Favorite(
	ownerName		varchar(100),
	hostName		varchar(100),
	PRIMARY KEY		(ownerName, hostName),
	FOREIGN KEY		(ownerName) REFERENCES PetOwners(username) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY		(hostName)  REFERENCES CareTakers(username) ON DELETE CASCADE ON UPDATE CASCADE
);


-- BCNF
create table Services(
	id			SERIAL,
	hostName 	VARCHAR(100),
	minBid		NUMERIC NOT NULL,
	startdate	DATE NOT NULL,
	enddate		DATE NOT NULL,
	capacity  	INTEGER NOT NULL,
	status		service_status DEFAULT 'available',
	PRIMARY KEY (id),
	FOREIGN KEY (hostName) REFERENCES CareTakers(username),
	CONSTRAINT "Service end time must be after start time." CHECK (enddate > startdate)
);


-- use normal form to explain why this table is required
-- BCNF
CREATE TABLE SpecialBonus(
	id				SERIAL,
	bonus		bonus_types,
	PRIMARY KEY		(id, bonus),
	FOREIGN KEY 	(id) REFERENCES Services(id)
);


-- to store the services that the petOwner is interested in
-- BCNF
CREATE TABLE Wishlist(
	id				SERIAL,
	ownerName		VARCHAR(100),
	--minBid			NUMERIC,

	PRIMARY KEY     (id, ownerName), 
	FOREIGN KEY		(ownerName) REFERENCES PetOwners(username) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY  	(id)	REFERENCES	Services(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- store all the accomodation with status shown as 'sending' and 'completed'
-- BCNF
create table Accommodation(
	id			SERIAL,
	hostName	VARCHAR(100),
	ownerName	VARCHAR(100),
	status      accommodation_status DEFAULT 'sending',
	PRIMARY KEY (id),
	FOREIGN KEY (hostName) REFERENCES CareTakers(username),
	FOREIGN KEY (ownerName) REFERENCES PetOwners(username),
	FOREIGN KEY (id) REFERENCES Services(id)
);

---to store the all the valid biddding history with status shown as pending, fail, success.
-- BCNF
create table BiddingStatus(
	id 			SERIAL,
	ownerName 	VARCHAR(100),
	bids		NUMERIC,
	created_at  timestamp DEFAULT current_timestamp,
	status      bidding_status DEFAULT 'pending',
	PRIMARY KEY (id, ownerName, bids),
	FOREIGN KEY (id) REFERENCES Services(id),
	FOREIGN KEY (ownerName) REFERENCES PetOwners(username)
);

-- Full-keyed relation
CREATE TABLE Comment(
	id				SERIAL,
	ownerName		VARCHAR(100),
	content			TEXT,
	PRIMARY KEY 	(id, ownerName, content),
	FOREIGN KEY (id) REFERENCES Services(id),
	FOREIGN KEY (ownerName) REFERENCES PetOwners(username)
);




