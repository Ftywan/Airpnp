-- Forbid any update to OwnerStatus if there already exists a successful bid for the service.
CREATE OR REPLACE FUNCTION forbid_next_bidding()
RETURNS TRIGGER AS $$
DECLARE
		count integer;
BEGIN
		SELECT COUNT(*) INTO count FROM BiddedHost b where b.ownerName = NEW.ownerName 
		and b.petName = NEW.petName and b.startdate = NEW.startdate and b.enddate = NEW.enddate;
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
ON OwnerStatus
FOR EACH ROW
EXECUTE PROCEDURE forbid_next_bidding();


--Forbid any bids below the min_bids indicated by the caretaker for a particular time frame. 
CREATE OR REPLACE FUNCTION  forbid_little_bids()
RETURN TRIGGER AS $$
DECLARE
		count integer;
BEGIN 
		SELECT COUNT(*) INTO count FROM TimeFrame t where t.startdate <= NEW.startdate and t.enddate >= NEW.enddate 
		and NEW.bids < t.minBid;
		IF COUNT > 0 THEN 
				RAISE EXCEPTION 'This bid is too little to be made.';
				RETURN NULL;
		END IF;
		RETURN NEW;
END; $$
LANGUAGE PLPGSQL;

---Check whether the bids is above the min.
CREATE TRIGGER check_for_min_bid
BEFORE INSERT OR UPDATE
ON Bidders
FOR EACH ROW
EXECUTE PROCEDURE forbid_little_bids();


-- Forbid any over capacity bid
CREATE OR REPLACE FUNCTION forbid_over_capacity()
RETURN TRIGGER AS $$
DECLARE 
		count integer;
		capacity integer;
BEGIN
		SELECT COUNT(*) INTO count FROM CareTakerStatus c where (
			SELECT(c.startdate, c.enddate) OVERLAPS (NEW.startdate, NEW.enddate));
		SELECT c1.num INTO capacity FROM Capacity c1;
		IF (NEW.sendingNum + count > capacity) THEN
				RAISE EXCEPTION 'cannot accommodate so many pets.';
				RETURN NULL;
		END IF;
		RETURN NEW;
END; $$
LANGUAGE PLPGSQL

-- check whether the bids can be made according to capacity
CREATE TRIGGER check_for_capacity
BEFORE INSERT OR UPDATE
ON Bidders
FOR EACH ROW
EXECUTE PROCEDURE forbid_over_capacity();








































