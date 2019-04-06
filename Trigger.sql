DROP TRIGGER IF EXISTS check_for_further_bidding on BiddingStatus; 
DROP TRIGGER IF EXISTS check_for_min_bid on BiddingStatus; 
DROP TRIGGER IF EXISTS check_for_capacity on BiddingStatus; 



-- Forbid any update to OwnerStatus if there already exists a successful bid for the service.
CREATE OR REPLACE FUNCTION forbid_next_bidding()
RETURNS TRIGGER AS $$
DECLARE
		count integer;
BEGIN
		SELECT COUNT(*) INTO count FROM Not_completed_accommodation n where n.ownerName = NEW.ownerName 
		and NEW.petName in (select petName from Not_completed_accommodation) and ((n.startdate <= NEW.startdate and n.enddate >= NEW.enddate) or (n.startdate < NEW.enddate and NEW.enddate < n.enddate) or (NEW.startdate > n.startdate and NEW.startdate < n.enddate));
		If count > 0 THEN
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
		SELECT COUNT(*) INTO count FROM Services s where s.startdate <= NEW.startdate and s.enddate >= NEW.enddate 
		and NEW.bids < s.minBid;
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
		count integer;
BEGIN
		SELECT COUNT(*) INTO count FROM Services s where (
			s.capacity < count(NEW.petName));
		IF count > 0  THEN
				RAISE EXCEPTION 'cannot accommodate so many pets.';
				RETURN NULL;
		END IF;
		RETURN NEW;
END; $$
LANGUAGE PLPGSQL;

-- check whether the bids can be made according to capacity
CREATE TRIGGER check_for_capacity
BEFORE INSERT OR UPDATE
ON BiddingStatus
FOR EACH ROW
EXECUTE PROCEDURE forbid_over_capacity();








































