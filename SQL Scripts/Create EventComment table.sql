Create Table EventComment (
CommentId int IDENTITY(1,1) PRIMARY KEY,
Title varchar(255),
Body varchar(500),
EventDate Date, 
Author Varchar (300),
PostingTime DateTime,
Event_FKid varchar(255)
);