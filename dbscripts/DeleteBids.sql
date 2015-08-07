
delete from Bids
delete from Bid_Notes
delete from Bid_To_Notes
delete from Canopies
delete from Bid_Canopies

DBCC CHECKIDENT ('Bids', RESEED, 0)
DBCC CHECKIDENT ('Canopies', RESEED, 0)
DBCC CHECKIDENT ('Bid_Notes', RESEED, 0)
------------------------------------------------------------

select * from Bids
select * from Bid_Notes
select * from Bid_To_Notes
select * from Canopies
select * from Bid_Canopies

