
delete from Sales_Person_Contact_Text
delete from Sales_Persons
delete from Addresses where Address_ID in (select Address_ID from Sales_Persons)
delete from Contact_Text where Contact_Text_ID in (select Contact_Text_ID from Sales_Person_Contact_Text)
------------------------------------------------------------

select * from Addresses
select * from Contact_Text
select * from Sales_Person_Contact_Text
select * from Sales_Persons


