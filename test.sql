SELECT p.PilotId
FROM Pilot p,Aircraft a,certified c
WHere p.PilotId=c.PilotId AND a.AircraftID=c.AircraftID AND a.range>3000

SELECT Pname
FROM Pilot
WHERE Salary>(
              SELECT AVG(Salary)
              FROM Pilot
              );


CREATE table Flight
(
    FlightNo int primary key,
    FROM varchar(20),
    To varchar(20),
    Distance varchar(20),
    Depart_Time Time,
    Arrival_Time Time,
    AircraftID int,
    Foreign Key(AircraftID) references Aircraft(AircraftID)
    ON DELETE CASCADE
);

SELECT p.Pname 
FROM Pilot p, certified c,Flight f
WHERE p.PilotId=c.PilotId AND f.AircraftID=c.AircraftID 
      AND a.AircraftID=123 AND f.from="Delhi" AND f.to="Mumbai";

DELETE FROM certified
WHERE PilotId="P123" AND AircraftID=286;