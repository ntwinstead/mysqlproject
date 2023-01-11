UPDATE employee
SET email =
REPLACE(email, 'renovations', 'dealership');

ALTER TABLE sale
MODIFY salePrice decimal(8, 2) NOT NULL DEFAULT (0.0);

INSERT INTO sale (employeeID, customerID, vehicleID)
VALUES (1, 14, 3), (2, 30, 32), (3, 8, 15), (5, 18, 21), (8, 12, 9), (10, 31, 35);

UPDATE sale
SET salePrice =
( SELECT retail
    FROM vehicle
   WHERE id = 3
)
WHERE vehicleId = 3;

UPDATE sale
SET salePrice =
( SELECT retail
    FROM vehicle
   WHERE id = 32
)
WHERE vehicleId = 32;

UPDATE sale
SET salePrice =
( SELECT retail
    FROM vehicle
   WHERE id = 15
)
WHERE vehicleId = 15;

UPDATE sale
SET salePrice =
( SELECT retail
    FROM vehicle
   WHERE id = 21
)
WHERE vehicleId = 21;

UPDATE sale
SET salePrice =
( SELECT retail
    FROM vehicle
   WHERE id = 9
)
WHERE vehicleId = 9;

UPDATE sale
SET salePrice =
( SELECT retail
    FROM vehicle
   WHERE id = 35
)
WHERE vehicleId = 35;

CREATE VIEW saleView AS
SELECT concat(c.firstname, ' ', c.lastName) AS 'Customer Name',
concat(c.address, ' ', cs.city, ' ', cs.state, ' ', cs.zipCode) AS 'Customer Address',
c.phone AS 'Customer Phone',
c.email AS 'Customer Email',
concat(e.firstname, ' ', e.lastName) AS 'Sales Associate',
e.phone AS 'Sales Associate Phone',
e.email AS 'Sales Associate Email',
v.year AS 'Year',
ma.make AS 'Make',
mo.model AS 'Model',
co.color AS 'Color',
t.type AS 'Type',
v.vin as 'VIN',
s.saleprice AS 'Sale Price'
FROM customer c, employee e, sale s, cityState cs, vehicle v, make ma, model mo, color co, type t
WHERE s.customerID = c.ID
AND s.employeeID = e.ID
AND s.vehicleID = v.ID
AND c.zipCode = cs.zipCode
AND v.make = ma.ID
AND v.model = mo.ID
AND v.color = co.ID
AND v.type = t.ID
ORDER BY v.ID;