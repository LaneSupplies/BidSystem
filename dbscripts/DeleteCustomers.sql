
select * from Bids
select * from Sites
select * from Customer
select * from Addresses
select * from Contact_Info
select * from Sales_Persons

delete from Bids
delete from Sites
delete from Customer
delete from Addresses
delete from Contact_Info
delete from Sales_Persons

DBCC CHECKIDENT ('Bids', RESEED, 0)
DBCC CHECKIDENT ('Sites', RESEED, 0)
DBCC CHECKIDENT ('Addresses', RESEED, 0)
DBCC CHECKIDENT ('Contact_Info', RESEED, 0)
DBCC CHECKIDENT ('Sales_Persons', RESEED, 0)

------------------------------------------------------------


select * from Bids

select * from Bid_Notes

