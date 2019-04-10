-- Users table

insert into Users (username, rating, password, numPets, contact_number, address) values ('Alice', 6, '71oJZpQIHR', 2, '6326062455', '320 Lotheville Pass');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Bob', 7, 'SaTJYEoPDSa', 3, '5608495262', '86196 Tennyson Place');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Catherine', 4, '91eh9le', 2, '1878628621', '59 Hagan Lane');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Daisy', 7, 'd8UWFJp', 1, '3114314284', '075 Crowley Junction');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Emma', 6, 'UDtaen19Y', 4, '5739770769', '16 Merry Street');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Ashley', 9, 'LqBHqq', 1, '6287553911', '0846 Ridgeview Court');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Linda', 10, 'YSq3zvEXHv', 1, '4864745813', '4 Rowland Court');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Mary', 8, 'wXfeDnd', 2, '2095797714', '258 Emmet Court');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Sansa', 3, 'AuoND4', 3, '6853374155', '50 Reinke Parkway');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Daenerys', 3, 'GyDtI1UX9gLm', 1, '1888500912', '7 Myrtle Parkway');
insert into Users (username, rating, password, numPets, contact_number, address) values ('JonSnow', 3, 'BFYzHvCr8bwf', 10, '5826298909', '4618 Oak Park');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Arya', 5, 'NzgF59', 6, '3861417769', '07613 Clarendon Parkway');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Cersei', 8, 'rY2wcu6iqB', 5, '6861099773', '8 Mitchell Court');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Tyrion', 5, 'e3N3f7JmsM', 4, '2346335952', '5304 Muir Alley');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Jamie', 5, 'lIYJA4DhO', 4, '6075463911', '985 8th Avenue');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Brienne', 4, 'U2N4FK', 10, '7881672777', '5 Westerfield Drive');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Khal', 10, '5YzqvsO7', 5, '6607882939', '0778 Pleasure Lane');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Theon', 7, 'lRQIG0OJmgM', 1, '5117255545', '2 Lawn Road');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Jorah', 10, 'ChCX876NH5vM', 1, '7427460876', '13 Artisan Street');
insert into Users (username, rating, password, numPets, contact_number, address) values ('Bran', 6, 'FRRrhumD', 6, '7957476774', '5334 Bartillon Court');

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

insert into Services (id, hostName, minBid, startdate, enddate, capacity, status) values (1, 'JonSnow',  300, '12/17/2018', '12/31/2018', 4, 'bidded')
insert into Services (id, hostName, minBid, startdate, enddate, capacity, status) values (2, 'Arya', 400,'10/4/2018', '10/14/2018', 4, 'bidded')
insert into Services (id, hostName, minBid, startdate, enddate, capacity, status) values (3, 'Cersei', 700, '9/6/2018', '9/20/2018', 4, 'bidded')
insert into Services (id, hostName, minBid, startdate, enddate, capacity, status) values (4, 'Tyrion', 1000, '4/29/2018', '7/30/2018',4,  'bidded')

insert into Services (id, hostName, minBid, startdate, enddate, capacity, status) values (21,'JonSnow', 920, '4/18/2019', '4/21/2019', 5, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (22,'JonSnow', 497, '5/3/2019', '5/10/2019', 5, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (23,'JonSnow', 681, '5/15/2019', '5/24/2019', 3, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (24, 'Arya', 956.95, '5/5/2019', '5/16/2019', 2, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (25, 'Arya', 877.58, '5/24/2019', '5/25/2019', 2, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (26, 'Cersei', 214.78, '4/22/2019', '4/25/2019', 2, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (27, 'Tyrion', 355.96, '5/30/2019', '6/19/2019', 6, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (28, 'Tyrion', 455.7, '4/17/2019', '4/26/2019', 6, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (29,'Tyrion', 910.9, '6/6/2019', '6/19/2019', 4,'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (30, 'Jamie', 286.93, '5/5/2019', '5/29/2019', 1, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (31, 'Jamie', 565.05, '5/20/2019', '5/24/2019', 10, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (32, 'Jamie', 596.98, '4/29/2019', '5/1/2019', 3, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (33, 'Brienne', 777.33, '4/28/2019', '4/30/2019', 2, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (34, 'Brienne', 153.69, '5/17/2019', '5/27/2019', 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (35, 'Khal', 260.83, '6/14/2019', '6/20/2019', 1, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (36, 'Theon', 355.37, '4/30/2019', '5/1/2019', 1, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (37, 'Jorah', 528.38, '5/7/2019', '5/24/2019', 7, 'bidded');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (38, 'Jorah', 61.14, '4/27/2019', '5/6/2019', 3, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (39, 'Jorah', 219.14, '5/9/2019', '5/20/2019', 7, 'available');
insert into Services (id,hostName, minBid, startdate, enddate, capacity, status) values (40, 'Jorah', 669.57, '4/20/2019', '4/24/2019', 3, 'available');





-- Wishlist(done)

insert into Wishlist (id,ownerName) values (21, 'Alice');
insert into Wishlist (id,ownerName) values (22, 'Bob');
insert into Wishlist (id,ownerName) values (23, 'Catherine');
insert into Wishlist (id,ownerName) values (24, 'Emma');
insert into Wishlist (id,ownerName) values (26, 'Ashley');
insert into Wishlist (id,ownerName) values (30, 'Bob');
insert into Wishlist (id,ownerName) values (30, 'Linda');
insert into Wishlist (id,ownerName) values (30, 'Linda');
insert into Wishlist (id,ownerName) values (34, 'Mary');
insert into Wishlist (id,ownerName) values (37, 'Sansa');
insert into Wishlist (id,ownerName) values (37, 'Sansa');
insert into Wishlist (id,ownerName) values (38, 'Emma');
insert into Wishlist (id,ownerName) values (38, 'Catherine');
insert into Wishlist (id,ownerName) values (29, 'Bob');




---accommodation(done)
insert into Accommodation (id, hostName,  ownerName, status, rating) values (1, 'JonSnow',  'Alice', 'completed', 10);
insert into Accommodation (id, hostName, ownerName, status, rating) values (2, 'Arya', 'Alice', 'completed', 9);
insert into Accommodation (id, hostName, ownerName, status, rating) values (3, 'Cersei',  'Bob', 'completed', 9);
insert into Accommodation (id, hostName, ownerName, status, rating) values (4, 'Tyrion', 'Catherine', 'completed',10);
insert into Accommodation (id, hostName,  ownerName, startdate, enddate) values (21, 'Jamie',  'Daisy', 'sending', 10);
insert into Accommodation (id, hostName,  ownerName, startdate, enddate) values (25, 'Arya',  'Linda', 'sending', 10);
insert into Accommodation (id, hostName, ownerName, startdate, enddate) values (27, 'Tyrion',  'Emma', 'sending', 10);
insert into Accommodation (id, hostName,  ownerName, startdate, enddate) values (30'Jamie', 'Emma', 'sending', 10);
insert into Accommodation (id, hostName, ownerName, startdate, enddate) values (34, 'Brienne', 'Ashley', 'sending', 10);
insert into Accommodation (id, hostName,  ownerName, startdate, enddate) values (36, 'Theon',  'Linda', 'sending', 10);
insert into Accommodation (id, hostName,  ownerName, startdate, enddate) values (37, 'Jorah',  'Mary', 'sending', 10);




--Bidding Status
insert into BiddingStatus (id, ownerName, bids,  created_at, status) values (1, 'Alice', 714.06, '2018-10-01 5:01:35', 'success');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (3, 'Bob',  800, '2018-8-01 19:03:03', 'success',);
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (2, 'Alice', , 529.84,  '2018-10-01 7:58:56','success');
insert into BiddingStatus (id,ownerName, bids,  created_at, status) values (4, 'Catherine',  1000, '2018-03-29 3:18:35', 'success');
insert into BiddingStatus (id,ownerName, bids,  created_at, status) values (21, 'Daisy', 950,  '2019-03-29 23:34:46', 'success');
insert into BiddingStatus (id,ownerName, bids,  created_at, status) values (25, 'Linda', 900,  '2019-03-28 13:14:24', 'success');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (27, 'Emma',  400, '2018-03-29 1:14:12', 'success');
insert into BiddingStatus (id,ownerName, bids,  created_at, status) values (30, 'Emma', 300.27,  '2019-03-30 5:05:12', 'success');
insert into BiddingStatus (id,ownerName, bids,  created_at, status) values (34, 'Ashley', 200, '2019-04-05 22:20:12', 'success');
insert into BiddingStatus (id,ownerName, bids,  created_at, status) values (36, 'Linda', 456.67,  '2019-04-10 13:56:12', 'success');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values (37, 'Mary', 600.77,  '2019-04-05 9:47:12', 'success');

-- 下面的还没改，需要add pending and fail statis record
insert into BiddingStatus (id,ownerName, bids, created_at, status) values ('Catherine', 'Cersei', 322.95, '2018-08-25 4:55:12', 'fail','9/6/2018', '9/20/2019');
insert into BiddingStatus (id,ownerName, bids,  created_at, status) values ('Ashley', 'Jamie', 271.98,  '2018-11-15 11:41:12', 'fail','11/27/2018', '11/28/2018');
insert into BiddingStatus (id,ownerName, bids, created_at, status) values ('Ashley', 'Brienne', 676.34, '2018-10-01 12:50:12', 'fail','10/13/2018', '10/23/2018');
insert into BiddingStatus (id,ownerName, bids,  created_at, status) values ('Daenerys', 'Brienne', 195.19,  '2018-10-01 12:29:12', 'fail','10/13/2018', '10/23/2018');

insert into BiddingStatus (ownerName, hostName, bids,  created_at, status) values ('Bob', 'Cersei', 567.89, '2018-08-25 5:31:24', 'success','9/6/2018', '9/20/2018');
insert into BiddingStatus (ownerName, hostName, bids, created_at, status) values ('Bob', 'Cersei', 378.90,  '2018-08-25 6:21:12', 'success','3/1/2019', '3/7/2019');
insert into BiddingStatus (ownerName, hostName, bids,  created_at, status) values ('Catherine', 'Tyrion', 123.56,  '2018-04-20 19:25:12', 'success', '4/29/2018', '7/30/2018');
insert into BiddingStatus (ownerName, hostName, bids,  created_at, status) values ('Daisy', 'Jamie', 358.09, '2018-11-20 1:42:12', 'success','11/27/2018', '11/28/2018');
insert into BiddingStatus (ownerName, hostName, bids, created_at, status) values ('Emma', 'Jamie',  257.98,  '2018-12-01 18:14:12', 'success','3/12/2018', '3/18/2018');
insert into BiddingStatus (ownerName, hostName, bids, created_at, status) values ('Emma', 'Jamie', 145.32, '2018-03-20 19:43:12' , 'success','3/24/2018', '3/27/2018');
insert into BiddingStatus (ownerName, hostName, bids, created_at, status) values ('Emma', 'Jamie', 367.81,  '2018-07-15 15:32:12', 'success','7/30/2018', '8/3/2018');
insert into BiddingStatus (ownerName, hostName, bids,  created_at, status) values ('Ashley', 'Jamie', 168.70, '2018-11-09 21:23:12', 'success', '11/12/2018', '11/16/2018');
insert into BiddingStatus (ownerName, hostName, bids,  created_at, status) values ('Ashley', 'Jamie', 246.80, '2018-04-27 21:34:12', 'success', '5/1/2018', '6/22/2018');
insert into BiddingStatus (ownerName, hostName, bids,  created_at, status) values ('Linda', 'Brienne', 137.42, '2018-09-01 20:32:12', 'success', '9/11/2018', '9/15/2018');
insert into BiddingStatus (ownerName, hostName, bids, created_at, status) values ('Mary', 'Brienne', 931.80, '2018-10-05 21:45:12','success','10/13/2018', '10/23/2018');

insert into BiddingStatus (ownerName, hostName, bids, created_at, status,startdate, enddate) values ('Mary', 'JonSnow', 1000,  '2019-04-15 21:24:12', 'pending', '4/17/2019', '4/21/2019');
insert into BiddingStatus (ownerName, hostName, bids,created_at, status,startdate, enddate) values ('Linda', 'JonSnow', 1000,  '2019-04-15 21:24:12', 'pending', '4/17/2019', '4/21/2019');
insert into BiddingStatus (ownerName, hostName, bids, created_at, status,startdate, enddate) values ('Ashley', 'JonSnow', 513.21,  '2019-05-01 16:32:12', 'pending', '5/3/2019', '5/10/2019');





