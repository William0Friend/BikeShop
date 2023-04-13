USE BikeShop; -- switch to the BikeShop database

-- Disable all foreign key constraints
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'

-- Reset all identity columns to their seed value
EXEC sp_MSForEachTable 'IF OBJECTPROPERTY(object_id(''?''), ''TableHasIdentity'') = 1 BEGIN DBCC CHECKIDENT (''?'', RESEED, 0) END'

-- Delete all data from every table
EXEC sp_MSForEachTable 'DELETE FROM ?'

-- Re-enable all foreign key constraints
EXEC sp_msforeachtable 'ALTER TABLE ? CHECK CONSTRAINT ALL'



"""

USE BikeShop; -- switch to the BikeShop database

-- Disable foreign key constraints that reference the Bike_Brand table
-- (Assuming there are no foreign keys referencing this table)
-- ALTER TABLE TableName NOCHECK CONSTRAINT ALL
-- If there are no foreign keys referencing this table, you can omit this step

-- Reset the identity column of the Bike_Brand table to its seed value
DBCC CHECKIDENT ('Bike_Brand', RESEED, 0)

-- Delete all data from the Bike_Brand table
DELETE FROM Bike_Brand

-- Reset the identity column of the Bike_Brand table again to ensure it starts at 1
DBCC CHECKIDENT ('Bike_Brand', RESEED, 1)

-- Re-enable foreign key constraints that reference the Bike_Brand table
-- (Assuming there are no foreign keys referencing this table)
-- ALTER TABLE TableName CHECK CONSTRAINT ALL
-- If there are no foreign keys referencing this table, you can omit this step

"""