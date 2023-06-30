CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    Sex VARCHAR(1),
    First_name VARCHAR(10),
    Mid_name VARCHAR(10),
    Last_name VARCHAR(10),
    Mobile_no VARCHAR(10),
    E_mail VARCHAR(15),
    Address VARCHAR(18),
    Membership_type VARCHAR(10),
    DOB DATE
);

CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    E_mail VARCHAR(20),
    Mobile_no VARCHAR(20),
    First_name VARCHAR(10),
    Mid_name VARCHAR(10),
    Last_name VARCHAR(10),
    Phone_no VARCHAR(11)
);

CREATE TABLE Trainers (
    TrainerId INT PRIMARY KEY,
    First_name VARCHAR(10),
    Mid_name VARCHAR(10),
    Last_name VARCHAR(10),
    Address VARCHAR(18),
    E_mail VARCHAR(15),
    Age INT,
    Sex VARCHAR(2),
    Phone_no VARCHAR(12)
);

CREATE TABLE Login (
    LoginID INT PRIMARY KEY,
    Login_password VARCHAR(10),
    Member_id INT,
    Trainer_id INT,
    Admin_id INT,
    FOREIGN KEY(Member_id) REFERENCES Member(MemberID),
    FOREIGN KEY(Trainer_id) REFERENCES Trainers(TrainerId),
    FOREIGN KEY(Admin_id) REFERENCES Admin(AdminID)
);

CREATE TABLE Payments (
    BillNO INT PRIMARY KEY,
    Amount_paid FLOAT(10),
    Member_id INT,
    FOREIGN KEY(Member_id) REFERENCES Member(MemberID)
);

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    Class_name VARCHAR(5),
    Class_time TIME,
    Member_id INT,
    FOREIGN KEY(Member_id) REFERENCES Member(MemberID)
);

CREATE TABLE Taker (
    Id INT PRIMARY KEY,
    Member_id INT,
    Classes_id INT,
    FOREIGN KEY(Member_id) REFERENCES Member(MemberID),
    FOREIGN KEY(Classes_id) REFERENCES Classes(ClassID)
);

CREATE TABLE Manages (
    Id INT PRIMARY KEY,
    Trainer_id INT,
    Classes_id INT,
    FOREIGN KEY(Trainer_id) REFERENCES Trainers(TrainerId),
    FOREIGN KEY(Classes_id) REFERENCES Classes(ClassID)
);
