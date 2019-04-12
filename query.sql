-- https://stackoverflow.com/questions/12662534/how-to-filter-a-mysql-database-with-user-input-on-a-website-and-then-spit-the-fi

-- login page
select * from Login L;

delete from Login;

-- sign up page (without data)
insert into Users
values (username, password, location, no. of pets...);

insert into Pets
values (name, owner, size...);

-- my account
-- delete pet record
delete from Pets
where ownername=%s
and petName=%s;

-- delet account
delete from Users
where username=%s;

-- change password
update password
set password=%s
where username=%s
and verification_qn=%s;

-- favourite account
select * from Favourite;

-- Main Page
select * from Services
order by minBid asc;

select * from Services
order by minBid desc;

select * from Services S left join Users U 
	on S.hostName=U.username
order by U.rating
;

select * from Services S
where S.hostName in(
	select hostName
	from Favourite
	);

-- select posts with time availability covers the required time slot
select * from Services S
where S.startdate<=%s
and S.enddate>=%s;

-- select greater capacity
select * from Services S
where S.capacity>=%s;

-- my listing
select * from Services S
where S.hostName=%s;

insert into Services S
values (input1,input2,input3....);

-- My biddings: shows the current bidding
select * from BiddingStatus
where ownername=%s and status='pending';

-- My history
-- as pet owner
select * from Accommodation
where ownerName=%s;

-- as a caretaker 
select * from Accommodation
where hostName=%s;


-- completed service
select * from Accommodation A
where A.hostName=%s
and A.status='completed';

select * from Accommodation A
where A.hostName=%s
and A.status='sending';


-- when payment is made
update Accommodation A
set status='completed'
and id=%s;


-- pet owner view
--1. the overall view with all the services displayed.
select * from Services


--2. the specific view about a particular service after they select a specific services
with UserLocation as(
	select C.username, U.contact_number, L.address, L.nearest_mrt
	from CareTakers C left join 
		(Users U left join Location L on U.address=L.address) on C.username=U.username
)
,
maxBid as(
	select id, max(bids) as current_max, count(*) as total_num
	from BiddingStatus
	group by id
	having id=%s)
,
ServicesWithBonus as(
	select S.id, S.hostName, S.minBid, S.startdate, S.enddate, S.capacity, SB.bonus
	from Services S left join SpecialBonus SB on S.id=SB.id)

select SWB.id, exists(select * from Favorite where ownerName=%s and 
		 hostName=(select S.hostName from Services S where S.id=%s)), 
			SWB.hostName, UL.address, UL.nearest_mrt, SWB.capacity, SWB.startdate,
			  SWB.enddate, SWB.minBid, M.current_max, SWB.bonus, UL.contact_number
from (ServicesWithBonus SWB left join UserLocation UL on SWB.hostName=UL.username) 
				 left join maxBid M on SWB.id=M.id
where SWB.id=%s;

-- the specific view without loggin in
with UserLocation as(
	select C.username, L.address, L.nearest_mrt
	from CareTakers C left join 
		(Users U left join Location L on U.address=L.address) on C.username=U.username
)
,
maxBid as(
	select id, max(bids) as current_max, count(*) as total_num
	from BiddingStatus
	group by id
	having id=%s)
,
ServicesWithBonus as(
	select S.id, S.hostName, S.minBid, S.startdate, S.enddate, S.capacity, SB.bonus
	from Services S left join SpecialBonus SB on S.id=SB.id)

select SWB.id, SWB.hostName, UL.address, UL.nearest_mrt, SWB.capacity, SWB.startdate,
			  SWB.enddate, SWB.minBid, M.current_max, SWB.bonus, UL.contact_number
from (ServicesWithBonus SWB left join UserLocation UL on SWB.hostName=UL.username) 
				 left join maxBid M on SWB.id=M.id
where SWB.id=%s;


--display a petOwner's current bidding information
select *
from BiddingStatus b
where b.ownerName = %s and b.status = 'pending'

--check whether it is a favourite user, the fisrt %s is the hostName and the second is the  
SELECT 1   
from  PetOwners p
where %s in ( 
 select f.hostName
 from Favourite f
 where p.ownerName = %s
)

---insert into wishlist
insert into Wishlist
values (input1, input2...);

select * from Wishlist;

select W.id, S.hostName, S.minBid, S.startdate, S.enddate, S.capacity, S.status, W.ownerName
from Services S right join Wishlist W on S.id=W.id
where W.ownerName=%s;

-- list of bidders
select ownerName, bids from BiddingStatus

-- sorting algo, used when caretaker use our algo to select the winning bidder
select ownerName
from BiddingStatus BS left join Users U on BS.ownerName=U.username
order by BS.bids desc, U.numPets, U.rating desc, BS.created_at
limit 1;


-- care taker view:
-- time domain
select startdate, enddate
from Services S
where S.hostName=%s;

-- username
select username from Users where username=%s;

-- select all bidders with their information
select BS.ownername, bids, rating 
from BiddingStatus BS left join Users U on BS.hostName=U.username
where BS.id=%s;

-- Transaction
-- 1. when you add one more pet, update the Users' profile
Begin transaction;
insert into Pets
values (petName, petType, ownerName...);

update Users
set numPets=numPets+1
where username=%s;
commit;

-- 2. After bidding, update status => insert the id into Accommodation
-- update status for the winning bidder
BEGIN TRANSACTION;
update BiddingStatus
set status='success'
where ownerName=%s
and id=%s
and status='pending';

-- update other biddings status
update BiddingStatus
set status='fail'
where id=%s
and ownerName<>%s
and status='pending';

-- update status in Service
update Services
set status='bidded'
where id=%s;

-- insert into Accommodation
insert into Accommodation
values (hostName, id, ownerName, status, rating);
COMMIT;



with UserLocation as(
 select C.username, L.address, L.nearest_mrt
 from CareTakers C left join 
  (Users U left join Location L on U.address=L.address) on C.username=U.username
)
,
maxBid as(
 select id, max(bids) as current_max, count(*) as total_num
 from BiddingStatus
 group by id
 having id=24)

select exists(select * from Favorite where ownerName='Alice'), S.hostName, UL.address, 
UL.nearest_mrt, S.capacity, S.startdate, S.enddate, S.minBid, M.current_max
from (Services S left join UserLocation UL on S.hostName=UL.username) 
     left join maxBid M on S.id=M.id
where S.id=24;



