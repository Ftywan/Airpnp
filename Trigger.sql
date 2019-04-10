DROP TRIGGER IF EXISTS check_for_further_bidding on BiddingStatus; 
DROP TRIGGER IF EXISTS check_for_min_bid on BiddingStatus; 
DROP TRIGGER IF EXISTS check_for_capacity on BiddingStatus; 



-- Forbid any update to OwnerStatus if there already exists a successful bid for the service.
CREATE OR REPLACE FUNCTION forbid_next_bidding()
RETURNS TRIGGER AS $$
DECLARE
		count integer;
BEGIN
		with newtime as (select s.id as newid, s.startdate as newstart, s.enddate as newend from Services s where s.id = NEW.id)
		SELECT COUNT(*) INTO count 
			FROM BiddingStatus b join Services s on s.id = b.id full join newtime n on b.id = n.newid
				WHERE b.ownerName=NEW.ownerName and
				b.status = 'success' and

				((s.startdate >= n.newstart and s.enddate <= n.newend) 
						or (s.startdate <= n.newend and n.newend <= s.enddate) 
						or (n.newstart >= s.startdate and n.newstart <= s.enddate));
		If count>0 THEN
				RAISE EXCEPTION 'This service is confirmed. No further bidding on this service is allowed.';
				RETURN NULL;
		END IF;
		RETURN NEW;
END; $$
LANGUAGE PLPGSQL;

-- Check whether the new bidding is created/updated after checking that there is no duplicate bidding on the already exist services.
CREATE TRIGGER check_for_further_bidding
BEFORE INSERT OR UPDATE
ON BiddingStatus
FOR EACH ROW
EXECUTE PROCEDURE forbid_next_bidding();




--Forbid any bids below the min_bids indicated by the caretaker for a particular time frame. 
CREATE OR REPLACE FUNCTION  forbid_little_bids()
RETURNS TRIGGER AS $$
DECLARE
		count integer;
		
BEGIN 
		SELECT COUNT(*) INTO count FROM Services s WHERE NEW.id=s.id and NEW.bids < s.minBid;
		IF count > 0 THEN 
				RAISE EXCEPTION 'This bid is too little to be made.';
				RETURN NULL;
		END IF;
		RETURN NEW;
END; $$
LANGUAGE PLPGSQL;

---Check whether the bids is above the min.
CREATE TRIGGER check_for_min_bid
BEFORE INSERT OR UPDATE
ON BiddingStatus
FOR EACH ROW
EXECUTE PROCEDURE forbid_little_bids();


-- Forbid any over capacity bid
CREATE OR REPLACE FUNCTION forbid_over_capacity()
RETURNS TRIGGER AS $$
DECLARE 
		cap integer;
		num integer;
BEGIN
		SELECT u.numPets INTO num FROM Users u where NEW.ownerName = u.username;
		SELECT s.capacity INTO cap FROM Services s where NEW.id = s.id;
		IF num > cap THEN
				RAISE EXCEPTION 'cannot accommodate so many pets.';
				RETURN NULL;
		END IF;
		RETURN NEW;
END; $$
LANGUAGE PLPGSQL;

-- check whether the bids can be made according to capacity
CREATE TRIGGER check_for_capacity
BEFORE INSERT 
ON BiddingStatus
FOR EACH ROW
EXECUTE PROCEDURE forbid_over_capacity();








































