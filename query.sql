-- https://stackoverflow.com/questions/12662534/how-to-filter-a-mysql-database-with-user-input-on-a-website-and-then-spit-the-fi

-- login page
select 1 from Users U
where U.username=%s;

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

-- when an owner adds his pet
insert into Pets
where ownerName=%s; 

update Users
set numPets=numPets+1
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

select * from Services S
where S.startdate=%s
and S.enddate=%s;

select * from Services S
where S.num=%s;

select * from Services S
where S.minBid=%s -- lowPrice
and S.mindBid=%s; --highPrice

-- my listing
select * from Services S
where S.hostName=%s;

insert into Services S
values (input1,input2,input3....);

-- history
select * from BiddingStatus
where status='succeed';

select * from Accommodated A
where A.hostName=%s; --input name 

select * from Not_completed_accommodation 
where hostName=%s;

-- update status in biddingHistory
update BiddingStatus
set status='succeed'
where ownerName=%s 
and hostName=%s
and startdate=%s
and enddate=%s;

-- delete other biddings
update BiddingStatus
set status='fail'
where hostName=%s
and hostName<>%s
and startdate=%s
and enddate=%s;

-- delete posts
delete from Services
where hostName=%s
and startdate=%s
and enddate=%s;


-- cancel other biddings 
delete from BiddingStatus 
where ownerName=%s
and hostName<>%s -- bidding winner's name
and petName in 
	(select petName from Pets where ownerName=%s)
and status='pending'
;

-- insert into not_completed_accommodation
insert into not_completed_accommodation
values (input1, input2, input3...);

-- when payment is made
delete from Not_completed_accommodation
where hostName=%s
and petName=%s
and ownername=%s
and startdate=%s
and enddate=%s;

update Accommodated A
where hostName=%s
and petName=%s
and ownername=%s
and startdate=%s
and enddate=%s;

update Pets
set status='home'
where ownerName=%s
and petName=%s;

-- pet owner view
--1. the overall view with all the services displayed.
select * from Services


--2. the specific view about a particular service after they select a specific services
with maxBid as(
	select hostName, max(bids) as max_bid, count(*) as total_num
	from BiddingStatus
	where hostname=%s
	and startdate=%s
	and enddate=%s
)
select s.hostName, s.startdate, s.enddate, s.minBid, u.location, 
	s.capacity, M.max_bid, M.total_num
from (Services s left join Users u on s.hostName = u.username) 
	left join maxBid M on M.hostName = s.hostname
where s.hostName = %s
and s.startdate=%s
and s.enddate=%s;



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


-- list of bidders
select ownerName, bids from BiddingStatus

-- sorting algo:
select ownerName from BiddingStatus
where hostName=%s
and ownerName=%s
and status='pending'
and startdate=input3
and enddate=%s;

with Num as 
	(select ownerName, count(petName) as petCount
	 from BidingStatus
	 group by ownerName, bids
	 having hostName=%s
	)
select (Bidding BS left join Num N on BS.ownerName=N.ownerName) 
		left join Users U on BS.ownerName=U.userName
order by bids desc, petCount, U.rating desc, BS.created_at
limit 1;

-- care taker view:
-- time domain
select startdate, enddate
from Services S
where S.hostName=%s;

-- username
select username from Users where username=%s;

-- select all bidders with their information
select distinct ownername, bids, rating 
from Not_completed_accommodation N left join Users U 
	on N.hostName=U.username
where N.hostName=%s
and N.startdate=%s
and enddate=%s;



