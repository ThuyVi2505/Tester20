create database BTDay1;
use BTDay1;
/*Table 1 */
create table Department (
	DepartmentID int primary key auto_increment,
    DepartmentName varchar(100)
);
/*Table 2 */
Create table position (
	PositionID int primary key auto_increment,
    PositionName enum('Dev','Test','Scrum Mater','PM')
);
/*Table 3 */
create table account (
	AccountID int primary key auto_increment,
    Email varchar(255) not null,
    Username varchar(100) not null,
    Fullname varchar(100) not null,
    Deparment_ID int,
    Position_ID int,
    CreateDate timestamp
    
   /*foreign key (Deparment_ID) references department(DepartmentID),
   foreign key (Position_ID) references position(PositionID)*/
);

/*Table 4 */
create table groupp(
	GroupID int primary key auto_increment,
    GroupName varchar(100),
    CreatorID int,
    CreateDate timestamp,
    
    foreign key (CreatorID) references account(AccountID)
    
);
/*Table 5 */
create table groupAccount(
	Group_ID int,
    AccountID int,
    JoinDate timestamp,
    
    foreign key (Group_ID) references groupp(GroupID),
    foreign key (AccountID) references account(AccountID)
);
/*Table 6 */
create table typequestion (
	TypeID int primary key auto_increment,
    TypeName enum('Essay','Multiple-Choice')
);
/*Table 7 */
create table categoryQuestion(
	CategoryID int primary key auto_increment ,
    CategoryName varchar(100)
);

/*Table 8 */
create table question(
	QuestionID int primary key auto_increment,
    Content text,
    Category_ID int,
    Type_ID int,
    Creator_ID int,
    CreateDate timestamp 
    
    /*foreign key (Category_ID) references categoryQuestion(CategoryID),
    foreign key (Type_ID) references typequestion(TypeID),
	foreign key (Creator_ID) references account(AccountID)*/
);
/*Table 9 */
create table answerid(
	AnswerID int primary key auto_increment,
    Content text,
    Question_ID int,
    isCorrect BOOLEAN,
	foreign key (Question_ID) references question(QuestionID)
);
/*Table 10 */
create table exam(
	ExamID int primary key auto_increment,
    Cod int not null,
    Title varchar(100),
    Category_ID int,
    Duration date,
    Creator_ID int,
    CreateDate timestamp,
    foreign key (Category_ID) references categoryQuestion(CategoryID),
    foreign key (Creator_ID) references account(AccountID)
);
/*Table 11*/
create table examquestion(
	Exam_ID int,
    Question_ID int,
	foreign key (Exam_ID) references exam(ExamID),
    foreign key (Question_ID) references question(QuestionID)
);





















