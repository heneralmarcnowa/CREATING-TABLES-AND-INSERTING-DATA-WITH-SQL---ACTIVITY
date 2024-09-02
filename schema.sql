-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Password VARCHAR(255),
    DateAdded TIMESTAMP
);

-- Friends table
CREATE TABLE Friends (
    FriendID INT PRIMARY KEY,
    FriendWhoAdded INT,
    FriendBeingAdded INT,
    IsAccepted BOOLEAN,
    DateAdded TIMESTAMP,
    FOREIGN KEY (FriendWhoAdded) REFERENCES Users(UserID),
    FOREIGN KEY (FriendBeingAdded) REFERENCES Users(UserID)
);

-- Groups table
CREATE TABLE Groups (
    GroupID INT PRIMARY KEY,
    GroupName VARCHAR(100),
    CreatedBy INT,
    DateAdded TIMESTAMP,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID)
);

-- Posts table
CREATE TABLE Posts (
    PostID INT PRIMARY KEY,
    PostDescription VARCHAR(255),
    PostedBy INT,
    IsPublic BOOLEAN,
    IsOnlyForFriends BOOLEAN,
    GroupID INT,
    DatePosted TIMESTAMP,
    FOREIGN KEY (PostedBy) REFERENCES Users(UserID),
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
);

-- Group Membership Requests table
CREATE TABLE GroupMembershipRequests (
    GroupMembershipRequestID INT PRIMARY KEY,
    GroupID INT,
    GroupMemberUserID INT,
    IsGroupMembershipAccepted BOOLEAN,
    DateAccepted TIMESTAMP,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (GroupMemberUserID) REFERENCES Users(UserID)
);



-- Insert data into Users table
INSERT INTO Users(UserID, Username, FirstName, LastName, DateOfBirth, Password, DateAdded) VALUES
(1, 'dbelly0', 'Devan', 'Belly', '1998-01-02', 'uermh75E>?3rRq', '2021-10-30'),
(2, 'lmackibbon1', 'Lynda', 'MacKibbon', '1999-12-04', 'fuzks17J', '2021-09-28'),
(3, 'ddoogan2', 'De', 'Doogan', '2000-11-17', 'xvsuo72', '2024-03-29'),
(4, 'bschollar3', 'Briggs', 'Schollar', '1999-05-12', 'oscqy28/$X', '2021-09-12'),
(5, 'lmordey4', 'Lebbie', 'Mordey', '1999-08-21', 'lzkdn66t', '2022-10-07'),
(6, 'acarreyette5', 'Art', 'Carreyette', '2002-10-24', 'wngfp24vB2''<*q', '2022-03-24'),
(7, 'mbrane6', 'Myrlene', 'Brane', '2004-12-09', 'ezwyn86I=#)`{#', '2022-04-26'),
(8, 'cwattins7', 'Consuela', 'Wattins', '2003-05-27', 'lfgrj01gR+DT', '2020-12-22'),
(9, 'uallner8', 'Ursula', 'Allner', '1998-09-02', 'afath46p/B''*', '2021-02-06'),
(10, 'vgirhard9', 'Vinny', 'Girhard', '1998-06-18', 'cgncb19f', '2023-02-23'),
(11, 'cjillissa', 'Corny', 'Jilliss', '2002-03-02', 'uwkau38Zs)pW', '2023-03-22'),
(12, 'brenwickb', 'Bertrando', 'Renwick', '1999-07-15', 'xlole847`kR', '2020-01-24'),
(13, 'jslimmingc', 'Jesus', 'Slimming', '1999-07-18', 'khhtv02=$YAT5', '2023-07-27'),
(14, 'ccattenachd', 'Callean', 'Cattenach', '2001-12-01', 'ooxkv33', '2021-01-17'),
(15, 'rpallye', 'Reinhold', 'Pally', '2001-08-13', 'conha28,1kC', '2020-07-23'),
(16, 'xfranzenf', 'Xaviera', 'Franzen', '2001-02-22', 'qzcup36bJj3s2G', '2022-07-01'),
(17, 'kfenelong', 'Kari', 'Fenelon', '2001-12-18', 'chouf51', '2021-02-21'),
(18, 'alambarth', 'Ami', 'Lambart', '2004-12-11', 'irgtr09@QS<j4', '2023-03-17'),
(19, 'gcoullingi', 'Gianna', 'Coulling', '1999-12-10', 'xzted41AqfCKI', '2024-07-01'),
(20, 'wheissj', 'Waring', 'Heiss', '1998-08-05', 'jnbym43<A`Z', '2023-02-03');

-- Insert data into Friends table
INSERT INTO Friends(FriendID, FriendWhoAdded, FriendBeingAdded, IsAccepted, DateAdded) VALUES
(1, 9, 14, false, '2024-06-18'), (2, 16, 13, false, '2020-07-11'), (3, 10, 15, true, '2022-09-06'),
(4, 17, 1, false, '2022-02-14'), (5, 15, 20, true, '2024-03-29'), (6, 7, 12, false, '2020-08-22'),
(7, 14, 14, true, '2021-08-16'), (8, 15, 15, false, '2020-05-29'), (9, 2, 16, false, '2021-02-28'),
(10, 2, 13, false, '2023-11-27'), (11, 3, 17, true, '2020-06-19'), (12, 2, 7, false, '2020-11-15'),
(13, 14, 14, false, '2024-06-05'), (14, 4, 3, true, '2023-11-10'), (15, 14, 11, false, '2020-03-29'),
(16, 9, 12, false, '2023-02-06'), (17, 20, 20, false, '2022-01-31'), (18, 16, 13, false, '2020-08-13'),
(19, 6, 1, false, '2024-07-25'), (20, 2, 2, false, '2021-07-17'), (21, 10, 19, false, '2020-08-30'),
(22, 3, 2, false, '2020-05-21'), (23, 7, 4, true, '2020-09-02'), (24, 12, 17, true, '2021-12-28'),
(25, 18, 17, true, '2021-07-14'), (26, 4, 13, false, '2022-04-20'), (27, 9, 6, true, '2021-06-29'),
(28, 8, 13, false, '2022-02-19'), (29, 16, 2, true, '2021-05-19'), (30, 4, 18, true, '2022-04-22'),
(31, 3, 12, false, '2023-12-08'), (32, 8, 16, false, '2020-10-08'), (33, 7, 6, true, '2020-06-11'),
(34, 15, 3, true, '2023-06-02'), (35, 3, 1, false, '2021-11-06'), (36, 5, 13, true, '2022-07-21'),
(37, 17, 15, false, '2022-10-18'), (38, 20, 17, true, '2020-06-17'), (39, 11, 18, false, '2023-09-25'),
(40, 14, 11, false, '2024-03-15'), (41, 12, 14, true, '2022-11-29'), (42, 18, 4, false, '2020-06-17'),
(43, 19, 8, true, '2022-09-21'), (44, 9, 9, true, '2024-07-11'), (45, 13, 20, false, '2023-03-15'),
(46, 2, 7, true, '2024-01-13'), (47, 10, 5, true, '2021-03-14'), (48, 4, 19, true, '2024-05-09'),
(49, 1, 12, true, '2021-12-04'), (50, 16, 2, false, '2021-09-08');

-- Insert data into Groups table
INSERT INTO Groups(GroupID, GroupName, CreatedBy, DateAdded) VALUES
(1, 'erat fermentum', 10, '2022-08-19'),
(2, 'integer pede', 1, '2023-09-22'),
(3, 'blandit lacinia', 9, '2021-09-13'),
(4, 'duis consequat', 5, '2023-11-12'),
(5, 'ut erat', 12, '2023-03-04');


-- Insert data into Posts table
INSERT INTO Posts(PostID, PostDescription, PostedBy, IsPublic, IsOnlyForFriends, GroupID, DatePosted) VALUES
(1, 'Donec quis orci eget orci vehicula condimentum.', 14, false, false, 5, '2023-02-02'),
(2, 'Integer a nibh.', 8, false, true, 5, '2023-07-30'),
(3, 'Phasellus in felis.', 2, true, false, 2, '2020-02-14'),
(4, 'Cras non velit nec nisi vulputate nonummy.', 3, true, true, 2, '2022-02-20'),
(5, 'Suspendisse potenti.', 2, false, true, 2, '2020-10-22'),
(6, 'Vivamus vestibulum sagittis sapien.', 12, true, true, 1, '2023-11-25'),
(7, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 14, true, true, 1, '2020-10-26'),
(8, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 9, true, false, 3, '2022-07-02'),
(9, 'In hac habitasse platea dictumst.', 12, false, true, 5, '2020-04-04'),
(10, 'Nulla ut erat id mauris vulputate elementum.', 1, true, true, 2, '2023-05-08'),
(11, 'Nulla ut erat id mauris vulputate elementum.', 14, false, true, 2, '2024-02-03'),
(12, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 20, false, false, 5, '2021-03-24'),
(13, 'Nulla mollis molestie lorem.', 5, false, false, 4, '2023-08-24'),
(14, 'Curabitur in libero ut massa volutpat convallis.', 18, true, true, 1, '2020-11-30'),
(15, 'In sagittis dui vel nisl.', 19, false, true, 5, '2022-10-29'),
(16, 'Integer ac leo.', 17, true, true, 4, '2020-07-14'),
(17, 'Maecenas rhoncus aliquam lacus.', 8, false, true, 2, '2024-05-20'),
(18, 'Vivamus vestibulum sagittis sapien.', 17, true, false, 4, '2021-04-27'),
(19, 'In hac habitasse platea dictumst.', 12, false, true, 1, '2022-02-24'),
(20, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 4, true, false, 2, '2021-09-15'),
(21, 'Aenean fermentum.', 7, false, false, 3, '2020-11-01'),
(22, 'Pellentesque viverra pede ac diam.', 8, false, false, 4, '2022-04-17'),
(23, 'Aenean sit amet justo.', 1, false, false, 1, '2021-04-07'),
(24, 'Curabitur convallis.', 5, false, true, 1, '2022-05-04'),
(25, 'Phasellus in felis.', 14, false, true, 4, '2023-12-06'),
(26, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1, true, true, 3, '2022-05-06'),
(27, 'Maecenas rhoncus aliquam lacus.', 11, true, true, 5, '2021-11-26'),
(28, 'Ut tellus.', 14, false, true, 2, '2023-08-24'),
(29, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 15, false, false, 2, '2023-02-04'),
(30, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 2, false, false, 1, '2022-03-07'),
(31, 'Fusce posuere felis sed lacus.', 16, false, true, 1, '2020-12-10'),
(32, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 11, false, false, 2, '2022-05-30'),
(33, 'Etiam pretium iaculis justo.', 14, true, false, 1, '2023-01-31'),
(34, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 6, false, true, 3, '2022-08-22'),
(35, 'Pellentesque eget nunc.', 2, true, true, 4, '2021-01-31'),
(36, 'Phasellus id sapien in sapien iaculis congue.', 20, true, true, 5, '2024-07-14'),
(37, 'Aenean auctor gravida sem.', 8, false, true, 3, '2020-04-30'),
(38, 'Donec vitae nisi.', 4, false, false, 2, '2021-09-21'),
(39, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 10, true, true, 4, '2022-09-09'),
(40, 'Morbi ut odio.', 19, true, false, 5, '2024-07-19'),
(41, 'Integer ac neque.', 12, true, false, 1, '2023-06-19'),
(42, 'Nunc purus.', 16, false, false, 3, '2023-12-15'),
(43, 'Vivamus tortor.', 5, false, true, 4, '2023-06-01'),
(44, 'Fusce posuere felis sed lacus.', 9, false, false, 2, '2020-01-24'),
(45, 'Vestibulum rutrum rutrum neque.', 1, false, true, 1, '2021-03-17'),
(46, 'In eleifend quam a odio.', 17, true, false, 5, '2024-07-26'),
(47, 'Aenean fermentum.', 3, true, true, 2, '2022-04-18'),
(48, 'Proin risus.', 7, true, false, 3, '2024-01-20'),
(49, 'Proin risus.', 18, false, true, 4, '2024-06-13'),
(50, 'Duis consequat dui nec nisi volutpat eleifend.', 13, true, true, 1, '2022-11-14');

-- Insert data into GroupMembershipRequests table
INSERT INTO GroupMembershipRequests(GroupMembershipRequestID, GroupID, GroupMemberUserID, IsGroupMembershipAccepted, DateAccepted) VALUES
(1, 4, 14, true, '2022-12-05'),
(2, 3, 15, true, '2020-02-07'),
(3, 2, 17, true, '2020-02-10'),
(4, 5, 7, false, '2023-12-12'),
(5, 5, 5, true, '2022-11-23'),
(6, 5, 20, false, '2022-04-10'),
(7, 2, 5, false, '2021-03-02'),
(8, 4, 7, false, '2024-06-26'),
(9, 5, 3, false, '2020-07-06'),
(10, 2, 10, false, '2024-02-22'),
(11, 2, 7, true, '2021-01-23'),
(12, 4, 11, false, '2021-05-28'),
(13, 4, 5, false, '2021-10-27'),
(14, 2, 10, true, '2020-03-01'),
(15, 2, 4, true, '2023-12-30'),
(16, 1, 17, true, '2022-07-24'),
(17, 3, 20, false, '2021-06-19'),
(18, 5, 7, true, '2022-12-28'),
(19, 5, 19, false, '2024-06-26'),
(20, 3, 2, true, '2021-04-15');