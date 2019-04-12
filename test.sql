-- Users table
insert into Users (username,  password, numPets, contact_number, address) values ('Alice', '71oJZpQIHR', 2, '6326062455', '320 Lotheville Pass');
insert into Users (username,  password, numPets, contact_number, address) values ('Bob',  'SaTJYEoPDSa', 3, '5608495262', '86196 Tennyson Place');
insert into Users (username,  password, numPets, contact_number, address) values ('Catherine',  '91eh9le', 2, '1878628621', '59 Hagan Lane');
insert into Users (username,  password, numPets, contact_number, address) values ('Daisy',  'd8UWFJp', 1, '3114314284', '075 Crowley Junction');
insert into Users (username,  password, numPets, contact_number, address) values ('Emma',  'UDtaen19Y', 4, '5739770769', '16 Merry Street');
insert into Users (username,  password, numPets, contact_number, address) values ('Ashley', 'LqBHqq', 1, '6287553911', '0846 Ridgeview Court');
insert into Users (username,  password, numPets, contact_number, address) values ('Linda', 'YSq3zvEXHv', 1, '4864745813', '4 Rowland Court');
insert into Users (username,  password, numPets, contact_number, address) values ('Mary',  'wXfeDnd', 2, '2095797714', '258 Emmet Court');
insert into Users (username,  password, numPets, contact_number, address) values ('Sansa', 'AuoND4', 3, '6853374155', '50 Reinke Parkway');
insert into Users (username,  password, numPets, contact_number, address) values ('Daenerys',  'GyDtI1UX9gLm', 1, '1888500912', '7 Myrtle Parkway');
insert into Users (username,  password, numPets, contact_number, address) values ('JonSnow', 'BFYzHvCr8bwf', 10, '5826298909', '4618 Oak Park');
insert into Users (username,  password, numPets, contact_number, address) values ('Arya',  'NzgF59', 6, '3861417769', '07613 Clarendon Parkway');
insert into Users (username,  password, numPets, contact_number, address) values ('Cersei', 'rY2wcu6iqB', 5, '6861099773', '8 Mitchell Court');
insert into Users (username,  password, numPets, contact_number, address) values ('Tyrion',  'e3N3f7JmsM', 4, '2346335952', '5304 Muir Alley');
insert into Users (username,  password, numPets, contact_number, address) values ('Jamie',  'lIYJA4DhO', 4, '6075463911', '985 8th Avenue');
insert into Users (username,  password, numPets, contact_number, address) values ('Brienne',  'U2N4FK', 10, '7881672777', '5 Westerfield Drive');
insert into Users (username,  password, numPets, contact_number, address) values ('Khal',  '5YzqvsO7', 5, '6607882939', '0778 Pleasure Lane');
insert into Users (username,  password, numPets, contact_number, address) values ('Theon', 'lRQIG0OJmgM', 1, '5117255545', '2 Lawn Road');
insert into Users (username,  password, numPets, contact_number, address) values ('Jorah',  'ChCX876NH5vM', 1, '7427460876', '13 Artisan Street');
insert into Users (username,  password, numPets, contact_number, address) values ('Bran',  'FRRrhumD', 6, '7957476774', '5334 Bartillon Court');


--Login
insert into Login (username) values ('Alice');
--insert into Login (username) values ('Bob');
--nsert into Login (username) values ('Ashley');
--insert into Login (username) values ('Daenerys');
--insert into Login (username) values ('Cersei');
--insert into Login (username) values ('Jorah');
--insert into Login (username) values ('Brienne');

--Location
insert into Location (address, nearest_mrt) values ('320 Lotheville Pass', 'Woodlands');
insert into Location (address, nearest_mrt) values ('86196 Tennyson Place', 'Kent Ridge');
insert into Location (address, nearest_mrt) values ('59 Hagan Lane', 'Jurong East');
insert into Location (address, nearest_mrt) values ('075 Crowley Junction', 'Simei');
insert into Location (address, nearest_mrt) values ('16 Merry Street', 'Raffles Place');
insert into Location (address, nearest_mrt) values ('0846 Ridgeview Court', 'Admiralty');
insert into Location (address, nearest_mrt) values ('4 Rowland Court', 'Clementi');
insert into Location (address, nearest_mrt) values ('258 Emmet Court', 'Pioneer');
insert into Location (address, nearest_mrt) values ('50 Reinke Parkway', 'Chinese Garden');
insert into Location (address, nearest_mrt) values ('7 Myrtle Parkway', 'Bedok');
insert into Location (address, nearest_mrt) values ('4618 Oak Park', 'Choa Chu Kang');
insert into Location (address, nearest_mrt) values ('07613 Clarendon Parkway', 'Yio Chu Kang');
insert into Location (address, nearest_mrt) values ('8 Mitchell Court', 'City Hall');
insert into Location (address, nearest_mrt) values ('5304 Muir Alley', 'Esplanade');
insert into Location (address, nearest_mrt) values ('985 8th Avenue', 'Somerset');
insert into Location (address, nearest_mrt) values ('5 Westerfield Drive', 'Simei');
insert into Location (address, nearest_mrt) values ('0778 Pleasure Lane', 'Raffles Place');
insert into Location (address, nearest_mrt) values ('2 Lawn Road', 'City Hall');
insert into Location (address, nearest_mrt) values ('13 Artisan Street', 'Woodlands');
insert into Location (address, nearest_mrt) values ('5334 Bartillon Court', 'Bedok');


-- PetOwners
insert into PetOwners (username) values ('Alice');
insert into PetOwners (username) values ('Bob');
insert into PetOwners (username) values ('Catherine');
insert into PetOwners (username) values ('Daisy');
insert into PetOwners (username) values ('Emma');
insert into PetOwners (username) values ('Ashley');
insert into PetOwners (username) values ('Linda');
insert into PetOwners (username) values ('Mary');
insert into PetOwners (username) values ('Sansa');
insert into PetOwners (username) values ('Daenerys');

-- Pets
insert into Pets (petName, petType, ownerName) values ('Alice1', 'A', 'Alice');
insert into Pets (petName, petType, ownerName) values ('Alice2', 'B', 'Alice');
insert into Pets (petName, petType, ownerName) values ('Bob1', 'B', 'Bob');
insert into Pets (petName, petType, ownerName) values ('Bob2', 'C', 'Bob');
insert into Pets (petName, petType, ownerName) values ('Bob3', 'D', 'Bob');
insert into Pets (petName, petType, ownerName) values ('Catherine1', 'E', 'Catherine');
insert into Pets (petName, petType, ownerName) values ('Catherine2', 'F', 'Catherine');
insert into Pets (petName, petType, ownerName) values ('Daisy1', 'G', 'Daisy');
insert into Pets (petName, petType, ownerName) values ('Emma1', 'F', 'Emma');
insert into Pets (petName, petType, ownerName) values ('Emma2', 'G', 'Emma');
insert into Pets (petName, petType, ownerName) values ('Emma3', 'A', 'Emma');
insert into Pets (petName, petType, ownerName) values ('Emma4', 'C', 'Emma');
insert into Pets (petName, petType, ownerName) values ('Ashley1', 'R', 'Ashley');
insert into Pets (petName, petType, ownerName) values ('Linda1', 'T', 'Linda');
insert into Pets (petName, petType, ownerName) values ('Mary1', 'Y', 'Mary');
insert into Pets (petName, petType, ownerName) values ('Mary2', 'Y', 'Mary');
insert into Pets (petName, petType, ownerName) values ('Sansa1', 'T', 'Sansa');
insert into Pets (petName, petType, ownerName) values ('Sansa2', 'Y', 'Sansa');
insert into Pets (petName, petType, ownerName) values ('Sansa3', 'I', 'Sansa');
insert into Pets (petName, petType, ownerName) values ('Daenerys1', 'P', 'Daenerys');

-- CareTakers
insert into CareTakers (username) values ('JonSnow');
insert into CareTakers (username) values ('Arya');
insert into CareTakers (username) values ('Cersei');
insert into CareTakers (username) values ('Tyrion');
insert into CareTakers (username) values ('Jamie');
insert into CareTakers (username) values ('Brienne');
insert into CareTakers (username) values ('Khal');
insert into CareTakers (username) values ('Theon');
insert into CareTakers (username) values ('Jorah');
insert into CareTakers (username) values ('Bran');


-- Favorite
insert into Favorite (ownerName, hostName) values ('Alice', 'Bran');
insert into Favorite (ownerName, hostName) values ('Bob', 'Bran');
insert into Favorite (ownerName, hostName) values ('Catherine', 'Jorah');
insert into Favorite (ownerName, hostName) values ('Catherine', 'Theon');
insert into Favorite (ownerName, hostName) values ('Daisy', 'Khal');
insert into Favorite (ownerName, hostName) values ('Daenerys', 'Khal');
insert into Favorite (ownerName, hostName) values ('Emma', 'Brienne');
insert into Favorite (ownerName, hostName) values ('Emma', 'Jamie');
insert into Favorite (ownerName, hostName) values ('Ashley', 'Cersei');
insert into Favorite (ownerName, hostName) values ('Linda', 'Jamie');
insert into Favorite (ownerName, hostName) values ('Linda', 'Brienne');
insert into Favorite (ownerName, hostName) values ('Linda', 'Arya');
insert into Favorite (ownerName, hostName) values ('Mary', 'Arya');
insert into Favorite (ownerName, hostName) values ('Sansa', 'Arya');
insert into Favorite (ownerName, hostName) values ('Emma', 'Arya');
insert into Favorite (ownerName, hostName) values ('Daenerys', 'JonSnow');
insert into Favorite (ownerName, hostName) values ('Daenerys', 'Arya');
insert into Favorite (ownerName, hostName) values ('Sansa', 'Brienne');
insert into Favorite (ownerName, hostName) values ('Alice', 'Jorah');
insert into Favorite (ownerName, hostName) values ('Mary', 'Tyrion');





---Services(done)
insert into Services (id, hostName, minBid, startdate, enddate, capacity, status) values (1, 'JonSnow',  300, '12/17/2018', '12/31/2018', 4, 'bidded');
insert into Services (id, hostName, minBid, startdate, enddate, capacity, status) values (2, 'Arya', 400,'10/4/2018', '10/14/2018', 4, 'bidded');
insert into Services (id, hostName, minBid, startdate, enddate, capacity, status) values (3, 'Cersei', 700, '9/6/2018', '9/20/2018', 4, 'bidded');
insert into Services (id, hostName, minBid, startdate, enddate, capacity, status) values (4, 'Tyrion', 991, '4/29/2018', '7/30/2018',4,  'bidded');
insert into Services (id, hostName, minBid, startdate, enddate, capacity, status) values (21,'JonSnow', 920, '4/18/2019', '4/21/2019', 5, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (22,'JonSnow', 497, '5/3/2019', '5/10/2019', 5, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (23,'JonSnow', 681, '5/15/2019', '5/24/2019', 3, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (24, 'Arya', 956.95, '5/5/2019', '5/16/2019', 2, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (25, 'Arya', 877.58, '5/24/2019', '5/25/2019', 4, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (26, 'Cersei', 214.78, '4/22/2019', '4/25/2019', 2, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (27, 'Tyrion', 355.96, '5/30/2019', '6/19/2019', 6, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (28, 'Tyrion', 455.7, '4/17/2019', '4/26/2019', 6, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (29,'Tyrion', 910.9, '6/6/2019', '6/19/2019', 4,'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (30, 'Jamie', 286.93, '5/5/2019', '5/29/2019', 1, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (31, 'Jamie', 565.05, '5/20/2019', '5/24/2019', 10, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (32, 'Jamie', 596.98, '4/29/2019', '5/1/2019', 3, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (33, 'Brienne', 777.33, '4/28/2019', '4/30/2019', 2, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (34, 'Brienne', 153.69, '5/17/2019', '5/27/2019',7, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (35, 'Khal', 260.83, '6/14/2019', '6/20/2019', 1, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (36, 'Theon', 355.37, '4/30/2019', '5/1/2019', 1, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (37, 'Jorah', 528.38, '5/7/2019', '5/24/2019', 7, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (38, 'Jorah', 61.14, '4/27/2019', '5/6/2019', 3, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (39, 'Jorah', 219.14, '5/9/2019', '5/20/2019', 7, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (40, 'Jorah', 669.57, '4/20/2019', '4/24/2019', 3, 'available');


--SpecialBonus
insert into SpecialBonus (id, bonus) values (1, 'walk');
insert into SpecialBonus (id, bonus) values (1, 'shower');
insert into SpecialBonus (id, bonus) values (2, 'walk');
insert into SpecialBonus (id, bonus) values (3, 'shower');
insert into SpecialBonus (id, bonus) values (4, 'beauty');
insert into SpecialBonus (id, bonus) values (21, 'beauty');
insert into SpecialBonus (id, bonus) values (26, 'walk');
insert into SpecialBonus (id, bonus) values (30, 'shower');
insert into SpecialBonus (id, bonus) values (32, 'beauty');
insert into SpecialBonus (id, bonus) values (38, 'walk');
insert into SpecialBonus (id, bonus) values (40, 'shower');
insert into SpecialBonus (id, bonus) values (22, 'beauty');
insert into SpecialBonus (id, bonus) values (32, 'shower');
insert into SpecialBonus (id, bonus) values (33, 'walk');
insert into SpecialBonus (id, bonus) values (35, 'beauty');
insert into SpecialBonus (id, bonus) values (36, 'walk');
insert into SpecialBonus (id, bonus) values (37, 'beauty');
insert into SpecialBonus (id, bonus) values (39, 'shower');


-- Wishlist(done)
insert into Wishlist (id,ownerName) values (21, 'Alice');
insert into Wishlist (id,ownerName) values (22, 'Bob');
insert into Wishlist (id,ownerName) values (23, 'Catherine');
insert into Wishlist (id,ownerName) values (24, 'Emma');
insert into Wishlist (id,ownerName) values (26, 'Ashley');
insert into Wishlist (id,ownerName) values (30, 'Bob');
insert into Wishlist (id,ownerName) values (30, 'Linda');
insert into Wishlist (id,ownerName) values (31, 'Linda');
insert into Wishlist (id,ownerName) values (34, 'Mary');
insert into Wishlist (id,ownerName) values (37, 'Sansa');
insert into Wishlist (id,ownerName) values (38, 'Sansa');
insert into Wishlist (id,ownerName) values (38, 'Emma');
insert into Wishlist (id,ownerName) values (38, 'Catherine');
insert into Wishlist (id,ownerName) values (29, 'Bob');




---accommodation(done)
insert into Accommodation (id, hostName,  ownerName, status) values (1, 'JonSnow',  'Alice', 'completed');
insert into Accommodation (id, hostName, ownerName, status) values (2, 'Arya', 'Alice', 'completed');
insert into Accommodation (id, hostName, ownerName, status) values (3, 'Cersei',  'Bob', 'completed');
insert into Accommodation (id, hostName, ownerName, status) values (4, 'Tyrion', 'Catherine', 'completed');
insert into Accommodation (id, hostName,  ownerName, status) values (21, 'Jamie',  'Daisy', 'sending');
insert into Accommodation (id, hostName,  ownerName, status) values (25, 'Arya',  'Linda', 'sending');
insert into Accommodation (id, hostName, ownerName, status) values (27, 'Tyrion',  'Emma', 'sending');
insert into Accommodation (id, hostName,  ownerName, status) values (30, 'Jamie', 'Emma', 'sending');
insert into Accommodation (id, hostName, ownerName, status) values (34, 'Brienne', 'Ashley', 'sending');
insert into Accommodation (id, hostName,  ownerName, status) values (36, 'Theon',  'Linda', 'sending');
insert into Accommodation (id, hostName,  ownerName, status) values (37, 'Jorah',  'Mary', 'sending');




--Bidding Status
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (1, 'Alice', 714.06, '2018-10-01 5:01:35', 'success');
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (3, 'Bob',  800, '2018-8-01 19:03:03', 'success');
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (2, 'Alice', 529.84,  '2018-10-01 7:58:56','success');
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (4, 'Catherine', 1000, '2018-03-29 3:18:35', 'success');
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (21, 'Daisy', 950,  '2019-03-29 23:34:46', 'success');
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (25, 'Linda', 900,  '2019-03-28 13:14:24', 'success');
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (27, 'Emma',  400, '2018-03-29 1:14:12', 'success');
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (30, 'Daenerys', 300.27,  '2019-03-30 5:05:12', 'success');
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (34, 'Ashley', 200, '2019-04-05 22:20:12', 'success');
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (36, 'Linda', 456.67,  '2019-04-10 13:56:12', 'success');
insert into BiddingStatus (id, ownerName, bids, created_at, status) values (37, 'Mary', 600.77,  '2019-04-05 9:47:12', 'success');

insert into BiddingStatus (id,ownerName, bids, created_at, status) values (1, 'Catherine', 322.95, '2018-08-25 4:55:12', 'fail');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (1, 'Emma', 371.98, '2018-09-15 11:41:12', 'fail');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (3, 'Linda', 776.34, '2018-07-28 12:50:12', 'fail');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (3, 'Mary', 795.19, '2018-07-29 12:29:12', 'fail');
--insert into BiddingStatus (id,ownerName, bids, created_at, status) values (2, 'Alice', 500.98, '2018-09-25 5:31:24', 'fail');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (2, 'Bob', 490.78,  '2018-09-25 6:21:12', 'fail');
--insert into BiddingStatus (id,ownerName, bids, created_at, status) values (4, 'Daisy', 923.56,  '2018-03-25 19:25:12', 'fail');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (4, 'Sansa', 991, '2018-03-26 1:42:12', 'fail');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (21, 'Sansa',  945.98,  '2019-03-28 18:14:12', 'fail');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (25, 'Emma', 898.32, '2019-03-27 19:43:12' , 'fail');
--insert into BiddingStatus (id,ownerName, bids, created_at, status) values (27, 'Emma', 389.81,  '2018-03-28 15:32:12', 'fail');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (30, 'Ashley', 289.70, '2019-03-29 21:23:12', 'fail');
--insert into BiddingStatus (id,ownerName, bids, created_at, status) values (34, 'Ashley', 198.80, '2019-03-27 21:34:12', 'fail');
--insert into BiddingStatus (id,ownerName, bids, created_at, status) values (36, 'Linda', 455.42, '2019-04-09 20:32:12', 'fail');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (37, 'Sansa', 598.80, '2019-04-04 21:45:12','fail');

insert into BiddingStatus (id,ownerName, bids, created_at, status) values (22, 'Mary', 500,  '2019-04-15 21:24:12', 'pending');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (22, 'Linda', 501,  '2019-04-15 21:25:12', 'pending');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (40, 'Ashley', 708.21,  '2019-04-15 16:32:12', 'pending');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (40, 'Bob', 766.21,  '2019-04-15 16:32:12', 'pending');


--Comment
insert into Comment (id, ownerName, content) values (1, 'Alice', 'Hi');
insert into Comment (id, ownerName, content) values (3, 'Bob', 'How much');
insert into Comment (id, ownerName, content) values (2, 'Alice', 'Ok');
insert into Comment (id, ownerName, content) values (21, 'Daisy', 'Alright');
insert into Comment (id, ownerName, content) values (25, 'Linda', 'See you');
insert into Comment (id, ownerName, content) values (27, 'Emma', 'See you there');
insert into Comment (id, ownerName, content) values (30, 'Ashley', 'where are you');
insert into Comment (id, ownerName, content) values (34, 'Linda', 'where do you live');
insert into Comment (id, ownerName, content) values (36, 'Mary', 'where do you live');
insert into Comment (id, ownerName, content) values (37, 'Catherine', 'hi');
insert into Comment (id, ownerName, content) values (22, 'Emma', 'I am waiting at');
insert into Comment (id, ownerName, content) values (25, 'Ashley', 'We are there');
insert into Comment (id, ownerName, content) values (40, 'Mary', 'See you tmr');
insert into Comment (id, ownerName, content) values (40, 'Mary', '6pm?');
insert into Comment (id, ownerName, content) values (40, 'Bob', 'can confirm?');



