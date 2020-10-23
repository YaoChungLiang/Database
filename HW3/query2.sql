-- PRAGMA foreign_keys = ON;

CREATE TABLE Carriers(
    cid varchar(7) primary key,
    name varchar(83)
);

CREATE TABLE Months(
    mid int primary key,
    month varchar(9)
);

CREATE TABLE Weekdays(
    did int primary key,
    day_of_week varchar(9)
);

CREATE TABLE Flights(
    fid int primary key,
    month_id int REFERENCES MONTHS(mid),        -- 1 - 12
    day_of_month int,    -- 1 - 31
    day_of_week_id int REFERENCES WEEKDAYS(wid),  -- 1 - 7
    carrier_id varchar(7) REFERENCES CARRIERS(did),
    flight_num int,
    origin_city varchar(34), 
    origin_state varchar(47), 
    dest_city varchar(34), 
    dest_state varchar(46), 
    departure_delay int, -- in mins
    taxi_out int,        -- in mins
    arrival_delay int,   -- in mins
    canceled int,        -- 1 means canceled
    actual_time int,     -- in mins
    distance int,        -- in miles
    capacity int, 
    price int            -- in $          
   
);
