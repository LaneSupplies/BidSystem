Insert into Lane.dbo.Bid_Statuses
select [Status], Created_By, Create_Date from [Lane-Backup].dbo.Bid_Statuses

Insert into Lane.dbo.Bid_Types
select Name, Code, Created_By, Create_Date from [Lane-Backup].dbo.Bid_Types

Insert into Lane.dbo.Column_Types
select Name, Created_By, Create_Date from [Lane-Backup].dbo.Column_Types

Insert into Lane.dbo.Contact_Types
select Name, Created_By, Create_Date from [Lane-Backup].dbo.Contact_Types

Insert into Lane.dbo.Deck_Styles
select Name, Created_By, Create_Date from [Lane-Backup].dbo.Deck_Styles

Insert into Lane.dbo.Drainage_Types
select Name, Created_By, Create_Date from [Lane-Backup].dbo.Drainage_Types

Insert into Lane.dbo.Fascia_Types
select Name, Created_By, Create_Date from [Lane-Backup].dbo.Fascia_Types

Insert into Lane.dbo.Job_Types
select Name, Code, Created_By, Create_Date from [Lane-Backup].dbo.Job_Types

Insert into Lane.dbo.Scope_Types
select Name, Code, Created_By, Create_Date from [Lane-Backup].dbo.Scope_Types

Insert into Lane.dbo.Structure_Types
select Name, Created_By, Create_Date from [Lane-Backup].dbo.Structure_Types

--Insert into Lane.dbo.Colors
--select Name, Created_By, Create_Date, ColorText from [Lane-Backup].dbo.Colors


