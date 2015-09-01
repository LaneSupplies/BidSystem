
delete from Bid_Statuses
delete from Bid_Types
delete from Column_Types
delete from Contact_Types
delete from Deck_Styles
delete from Deck_Types
delete from Drainage_Types
delete from Fascia_Types
delete from Job_Types
delete from Scope_Types
delete from Structure_Types

DBCC CHECKIDENT ('Bid_Statuses', RESEED, 0)
DBCC CHECKIDENT ('Bid_Types', RESEED, 0)
DBCC CHECKIDENT ('Column_Types', RESEED, 0)
DBCC CHECKIDENT ('Contact_Types', RESEED, 0)
DBCC CHECKIDENT ('Deck_Styles', RESEED, 0)
DBCC CHECKIDENT ('Deck_Types', RESEED, 0)
DBCC CHECKIDENT ('Drainage_Types', RESEED, 0)
DBCC CHECKIDENT ('Fascia_Types', RESEED, 0)
DBCC CHECKIDENT ('Job_Types', RESEED, 0)
DBCC CHECKIDENT ('Scope_Types', RESEED, 0)
DBCC CHECKIDENT ('Structure_Types', RESEED, 0)
------------------------------------------------------------

Select * from Bid_Statuses
Select * from Bid_Types
Select * from Column_Types
Select * from Contact_Types
Select * from Deck_Styles
Select * from Deck_Types
Select * from Drainage_Types
Select * from Fascia_Types
Select * from Job_Types
Select * from Scope_Types
Select * from Structure_Types

