# Movie Theater SQL Database
# Garland, Alen, Kazim

#1. (5 points) Write SQL statements to create tables for your database application. Pick suitable data
# types for each attribute. For each table, specify primary key and indicate foreign key if any.

create table Movie(
	Movie_ID varchar(20) Primary Key,
    Title varchar(100),
	Duration time, 
    Release_Date date,
    M_Language varchar(100),
    Genre varchar(100),
    M_Description varchar(1000)
);

create table Rating(
	Rating_ID varchar(20) Primary Key,
    Movie_ID varchar(20),
    Rating decimal(2,1),
    Rating_Description varchar(1000),
    Foreign Key (Movie_ID) references Movie(Movie_ID)
);

create table Shows(
	Show_ID varchar(20) Primary Key,
    Show_Date date,
    Start_time time,
    End_time time,
    Movie_ID varchar(20),
    Foreign Key (Movie_ID) references Movie(Movie_ID)
);

create table Customer(
	Customer_ID varchar(20) Primary Key,
    C_Name varchar(100),
    C_Password varchar(100),
    Email varchar(100), 
    Phone varchar(20)
);

create table Booking(
	Booking_ID varchar(20) Primary Key,
    Number_Of_Seats int,
    Customer_ID varchar(20),
    Show_ID varchar(20),
    Foreign Key (Customer_ID) references Customer(Customer_ID),
    Foreign Key (Show_ID) references Shows (Show_ID)
);
    
create table Payments(
	Payment_ID varchar(20) Primary Key,
    Amount decimal (4,2),
    Pay_Timestamp datetime,
    Pay_Method varchar (100),
    Booking_ID varchar(20),
    Foreign Key (Booking_ID) references Booking(Booking_ID)
);

create table Seats(
	Seat_ID varchar(20) Primary Key,
    Seat_Status varchar(20),
    Price decimal(4,2),
    Show_ID varchar(20),
    Booking_ID varchar(20),
    Foreign Key (Show_ID) references Shows(Show_ID),
    Foreign Key (Booking_ID) references Booking(Booking_ID)
);

# 2. (5 points) Write SQL statements to populate each table in your database with at least 10 records.

insert into Movie(Movie_ID, Title, Duration, Release_Date, M_Language, Genre, M_Description)
values ('Movie-00001', 'The Shawshank Redempiton', '2:22:00', '1994-09-22', 'English', 'Drama', 'Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.'), 
('Movie-00002', 'The Godfather', '2:55:00', '1972-03-24', 'English', 'Crime, Drama', 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.'),
('Movie-00003', 'The Godfather Part II', '3:22:00', '1974-12-20', 'English', 'Crime, Drama', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.'),
('Movie-00004', 'The Dark Night', '2:32:00', '2008-07-18', 'English', 'Action, Crime, Drama', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.'),
('Movie-00005', '12 Angry Men', '1:36:00', '1957-04-10', 'English', 'Crime, Drama', 'The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.'),
('Movie-00006', 'Schnidlers List', '3:15:00', '1994-02-04', 'English', 'Biography, Drama, History', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.'),
('Movie-00007', 'Pulp Fiction', '2:34:00', '1994-10-14', 'English', 'Crime, Drama', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.'),
('Movie-00008', 'The Good, the Bad and the Ugly', '2:58:00', '1967-12-29','English', 'Adventure, Western', 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.'),
('Movie-00009', 'Forest Gump', '2:22:00', '1994-07-06', 'English', 'Drama, Romance', 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.'),
('Movie-00010', 'Parasite', '2:12:00', '2019-10-11', 'Korean', 'Drama, Thriller', 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.');

insert into Rating( Rating_ID, Movie_ID, Rating, Rating_Description)
values ('Rate-00001', 'Movie-00001', 9.3, 'I have lost count of the number of times I have seen this movie, but it is more than 20. It has to be one of the best movies ever made. It made me take notice Morgan Freeman and Tim Robbins like I had never noticed any actors before.'),
('Rate-00002', 'Movie-00002', 9.2, 'A masterclass in film making, is The Godfather a contender for the best film of all time? I would argue the case that it is, this is the ultimate gangster movie.'),
('Rate-00003', 'Movie-00003', 9.0, 'One of the all time greats. Or probably the alone greatest thing ever made in the history of cinematography. This movie is both "prequel" and "sequel" of the first godfather movie. I have never watched anything like this in my entire life.'),
('Rate-00004', 'Movie-00004', 9.0, 'Confidently directed, dark, brooding, and packed with impressive action sequences and a complex story, The Dark Knight includes a career-defining turn from Heath Ledger as well as other Oscar worthy performances'),
('Rate-00005', 'Movie-00005', 9.0, 'This film deserves to be on anyone list of top films. My problem is that it is so perfect, so seamlessly polished, it is hard to appreciate the individual excellences.'),
('Rate-00006', 'Movie-00006', 9.5, 'Movie brought to life this great man who really should not be forgotten, and thanks to Steven Spielberg, I think he will be remembered for generations to come.'),
('Rate-00007', 'Movie-00007', 8.9, 'This is Tarantinos masterpiece, theres no other way to say it. It has arguably one of the smartest scripts I have ever seen.'),
('Rate-00008', 'Movie-00008', 8.8, 'This film, in my opinion, is not only the greatest spaghetti western of all time. It is the greatest movie of all time. Period. Regardless of genre.'),
('Rate-00009', 'Movie-00009', 8.8, 'I really just love this movie and it has such a special place in my heart. The performances are just so unforgettable and never get out of your head.'),
('Rate-00010', 'Movie-00010', 8.5, 'This movie is a gosh darn masterpiece. It will make you belly laugh, it will chill you to the bone, and it will make you shed a tear. This movie will stay with you long after the credits are over.' );	

insert into Shows(Show_ID, Show_Date, Start_time, End_time, Movie_ID)
values('Shows-00001', '2022-01-01', '9:00:00', '12:00:00', 'Movie-00001'),
('Shows-00002', '2022-01-01', '13:00:00', '17:00:00','Movie-00002'),
('Shows-00003', '2022-01-01', '20:00:00', '23:00:00', 'Movie-00003'),
('Shows-00004', '2022-01-02', '9:00:00', '12:00:00', 'Movie-00004'),
('Shows-00005', '2022-01-02', '13:00:00', '17:00:00', 'Movie-00005'),
('Shows-00006', '2022-01-02', '20:00:00', '23:00:00', 'Movie-00006'),
('Shows-00007', '2022-01-03', '9:00:00', '12:00:00', 'Movie-00007'),
('Shows-00008', '2022-01-03', '13:00:00', '17:00:00', 'Movie-00008'),
('Shows-00009', '2022-01-03', '20:00:00', '23:00:00', 'Movie-00009'),
('Shows-00010', '2022-01-04', '9:00:00', '12:00:00', 'Movie-00010');

insert into Customer(Customer_ID, C_Name, C_Password, Email, Phone)
values('Cust-00001', 'Adam Johnson', 'password123', 'ajohnson@gmail.com', '206-444-0001'),
('Cust-00002', 'Eva Smith', '12345678', 'esmith@gmail.com', '206-444-0002'),
('Cust-00003', 'Anna Washington', 'abcdefgh', 'awashington@gmail.com', '206-444-0003'),
('Cust-00004', 'Eric Alonzo', 'drowssap', 'ealonzo@gmail.com', '206-444-0004'),
('Cust-00005', 'Bo Ek', 'zxywvu', 'bek@gmail.com', '206-444-0005' ),
('Cust-00006', 'Danny Goss', '246810', 'dgoss@gmail.com', '206-444-0006'),
('Cust-00007', 'Mike White', '13579', 'mwhite@gmail.com', '206-444-0007'),
('Cust-00008', 'Emily Young', '87654321', 'eyoung@gmail.com', '206-444-0008'),
('Cust-00009', 'Cathy Lee', '10101010', 'clee@gmail.com', '206-444-0009'),
('Cust-00010', 'Ben Woo', '55555555', 'bwoo@gmail.com', '206-444-0010');

insert into Booking(Booking_ID, Number_Of_Seats, Customer_ID, Show_ID)
values('Book-00001', 2, 'Cust-00001', 'Shows-00010'),
('Book-00002', 1, 'Cust-00003', 'Shows-00001'),
('Book-00003', 10, 'Cust-00003', 'Shows-00004'),
('Book-00004', 5, 'Cust-00004', 'Shows-00002'),
('Book-00005', 3, 'Cust-00005', 'Shows-00003'),
('Book-00006', 1, 'Cust-00006', 'Shows-00001'),
('Book-00007', 1, 'Cust-00006', 'Shows-00005'),
('Book-00008', 4, 'Cust-00006', 'Shows-00006'),
('Book-00009', 10, 'Cust-00009', 'Shows-00007'),
('Book-00010', 2, 'Cust-00010', 'Shows-00007');

insert into Payments(Payment_ID, Amount, Pay_Timestamp, Pay_Method, Booking_ID)
values ('Pays-00001', 20.00, '2022-01-30 11:00:00', 'Credit Card', 'Book-00001'),
('Pays-00002', 10.10, '2022-01-05 12:00:00', 'Debit Card', 'Book-00002'),
('Pays-00003', 99.99, '2022-01-10 10:00:00', 'Debit Card', 'Book-00003'),
('Pays-00004', 50.50, '2022-01-20 13:00:00', 'Credit Card', 'Book-00004'),
('Pays-00005', 33.25, '2022-01-11 23:00:00', 'Cash', 'Book-00005'),
('Pays-00006', 10.00, '2022-01-12 01:00:00', 'Cash', 'Book-00006'),
('Pays-00007', 10.10, '2022-01-22 10:00:00', 'Check', 'Book-00007'),
('Pays-00008', 44.50, '2022-01-31 14:00:00', 'Credit Card', 'Book-00008'),
('Pays-00009', 89.99, '2022-01-16 12:00:00', 'Credit Card', 'Book-00009'),
('Pays-00010', 20.00, '2022-01-04 16:00:00', 'Apple Pay', 'Book-00010');

insert into Seats(Seat_ID, Seat_Status, Price, Show_ID, Booking_ID)
values ('Seat-AA-00001', 'Full', 20.00, 'Shows-00010', 'Book-00001'),
('Seat-AA-00031', 'Full', 10.10, 'Shows-00001', 'Book-00002'),
('Seat-AA-00005', 'Empty', 99.99, 'Shows-00004', 'Book-00003'),
('Seat-BB-00010', 'Empty', 50.50, 'Shows-00002', 'Book-00004'),
('Seat-CC-00002', 'Full', 33.25, 'Shows-00003', 'Book-00005'),
('Seat-AA-00004', 'Full', 10.00, 'Shows-00001', 'Book-00006'),
('Seat-AA-00008', 'Full', 10.10, 'Shows-00005', 'Book-00007'),
('Seat-BB-00111', 'Empty', 44.50, 'Shows-00006', 'Book-00008'),
('Seat-DD-00020', 'Full', 89.99, 'Shows-00007', 'Book-00009'),
('Seat-EE-00050', 'Empty', 20.00, 'Shows-00007', 'Book-00010');

# This is the SQL statment to display the Ratings and Movie Showings of each Moive
select * from Rating join Movie using (Movie_ID) join Shows using (Movie_ID);

# This is the SQL statment to display the average rating of the movies and the average cost of a seat
select avg(Rating) as 'Average Movie Rating (out of 10)', 
avg(Price) as 'Average Moive Seat Cost ($)' from Rating join Movie join Shows join Seats;

# This is the SQL statment to display the highest rated moives
select Title from Rating join Movie where Rating = (select max(Rating) from Rating);

# This is the SQL statment to display which seats are full for which movie
select Seat_ID, Title, Seat_Status from Seats natural join Shows natural join Movie group by Seat_ID having Seat_Status = 'Full';

# This is the SQL statment to display which customers have booked seats or not
select * from Customer left join Booking on Customer.Customer_ID = Booking.Customer_ID;
