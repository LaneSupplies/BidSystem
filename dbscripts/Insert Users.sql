select * from UserProfile
select * from webpages_Membership
select * from webpages_OAuthMembership
select * from webpages_Roles
select * from webpages_UsersInRoles


--insert into UserProfile
--select UserName, Email, FirstName, LastName, [Role] from [Lane-Backup].dbo.UserProfile

insert into webpages_Membership
select * from [Lane-Backup].dbo.webpages_Membership

insert into webpages_OAuthMembership
select * from [Lane-Backup].dbo.webpages_OAuthMembership

insert into webpages_Roles
select RoleName from [Lane-Backup].dbo.webpages_Roles

insert into webpages_UsersInRoles
select * from [Lane-Backup].dbo.webpages_UsersInRoles

