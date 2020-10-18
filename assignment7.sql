/* TEAM 08 - ASSIGNMENT 7  Andy Ross, Adam Delks, Nicholas Stiner, Trent Winkhart*/

/* Drop tables if they exist. Add more DROP TABLE statements as you create more tables*/

DROP VIEW IF EXISTS amb CASCADE;
DROP TABLE IF EXISTS member CASCADE;
DROP TABLE IF EXISTS song CASCADE;
DROP TABLE IF EXISTS artist CASCADE;
DROP TABLE IF EXISTS album CASCADE;
DROP TABLE IF EXISTS band CASCADE;

/* Create all tables. Order matters due to foreign keys. */

CREATE TABLE artist (
id INT auto_increment,
fname VARCHAR(30) NOT NULL,
lname VARCHAR(30) NOT NULL,
dob DATE,
hometown VARCHAR(50) NOT NULL,
gender VARCHAR(6) NOT NULL CHECK(gender IN ('male', 'female')),
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE band (
id INT auto_increment,
title VARCHAR(50) NOT NULL,
year_formed INT,
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE album (
id INT auto_increment,
band_id INT NOT NULL,
pub_year INT,
title VARCHAR(50) NOT NULL,
publisher VARCHAR(50) NOT NULL,
format VARCHAR(15) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (band_id) REFERENCES band(id)
) ENGINE = innodb;

CREATE TABLE member (
artist_id INT NOT NULL,
band_id INT NOT NULL,
joined_date DATE,
leave_date DATE NULL,
FOREIGN KEY (artist_id) REFERENCES artist(id),
FOREIGN KEY (band_id) REFERENCES band(id)
) ENGINE = innodb;

CREATE TABLE song (
album_id INT NOT NULL,
name VARCHAR(30) NOT NULL,
length VARCHAR(5) NOT NULL,
FOREIGN KEY (album_id) REFERENCES album(id)
) ENGINE = innodb;

/* Inserting data into tables. Order matters because of foreign keys. */

INSERT INTO artist(id, fname, lname, dob, hometown, gender) VALUES
(100, 'David Lee', 'Roth', '1954-10-10', 'Bloomington', 'male'),
(101, 'Eddie', 'Van Halen', '1955-01-26', 'Amsterdam', 'male'),
(102, 'Sammy', 'Hagar', '1947-10-13', 'Salinas', 'male'),
(103, 'Wolfgang Van', 'Halen', '1991-03-16', 'Santa Monica', 'male'),
(104, 'Alex Van', 'Halen', '1953-05-08', 'Amsterdam', 'male'),
(105, 'Michael', 'Anthony', '1954-06-20', 'Chicago', 'male'),
(106, 'Gary', 'Cherone', '1961-07-26', 'Malden', 'male'),
(107, 'Ozzy', 'Osbourne', '1948-12-03', 'Aston', 'male'),
(108, 'Stevie', 'Nicks', '1948-05-26', 'Phoenix', 'female'),
(109, 'Kathleen', 'Hanna', '2002-11-12', 'Portland', 'female');

INSERT INTO band(id, title, year_formed) VALUES
(500, 'Black Sabbath', 1968),
(501, 'Van Halen', 1972),
(502, 'Pink Floyd', 1965),
(503, 'Fleetwood Mac', 1967),
(504, 'Bikini Kill', 1990);

INSERT INTO member(artist_id, band_id, joined_date, leave_date) VALUES
(100, 501, '1972-06-15', '1985-07-25'),
(101, 501, '1972-06-15', CURDATE()),
(102, 501, '1985-06-29', '1995-10-22'),
(102, 503, '1990-08-13', '1999-05-22'),
(103, 501, '1992-06-15', CURDATE()),
(104, 501, '1972-07-12', '1997-10-12',
(104, 501, '2003-12-31', CURDATE()),
(105, 501, '1984-03-20', '1992-12-28'),
(106, 501, '1987-01-23', '1997-02-12'),
(107, 500, '1968-10-31', '1979-03-21'),
(108, 502, '1967-10-10', '1979-02-25'),
(108, 504, '1990-12-23', CURDATE()),
(108, 500, '1968-10-31', '1968-11-01'),
(109, 504, '1990-12-23', CURDATE());

INSERT INTO album(id, pub_year, title, publisher, format, band_id) VALUES
(201, 1970, 'Paranoid', 'Vertigo Records', 'Vinyl', 500),
(202, 1971, 'Master of Reality', 'Vertigo Records', 'Vinyl', 500),
(203, 1971, 'Black Sabbath', 'Vertigo Records', 'Vinyl', 500),
(204, 1978, 'Van Halen', 'Warner Records', 'Vinyl', 501),
(205, 1979, 'Fair Warning', 'Warner Records', 'Vinyl', 501),
(206, 1984, 'MCMLXXXIV', 'Warner Records', 'Vinyl', 501),
(207, 1973, 'The Dark Side of the Moon', 'Harvest Records', 'Vinyl', 502),
(208, 1979, 'The Wall', 'Columbia Records', 'Vinyl', 502),
(209, 1977, 'Animals', 'Columbia Records', 'Vinyl', 502),
(210, 1977, 'Rumours', 'Warner Records', 'Vinyl', 503),
(211, 1975, 'Fleetwood Mac', 'Reprise Records', 'Vinyl', 503),
(212, 1987, 'Tango in the Night', 'Warner Records', 'Vinyl', 503),
(213, 1993, 'Pussy Whipped', 'Kill Rock Stars', 'CD', 504),
(214, 1996, 'Reject All American', 'Kill Rock Stars', 'CD', 504);

INSERT INTO song(album_id, name, length) VALUES
(201, 'Paranoid', '2:48'),
(201, 'Iron Man', '5:55'),
(201, 'Rat Salad', '2:30'),
(202, 'Sweet Leaf', '5:05'),
(202, 'Children of the Grave', '5:15'),
(202, 'Into the Void', '6:13'),
(203, 'Black Sabbath', '6:18'),
(203, 'The Wizard', '4:23'),
(203, 'Wicked World', '4:45'),
(204, "Runnin' with the Devil", '3:36'),
(204, 'You Really Got Me', '2:38'),
(204, 'Ice Cream Man', '3:20'),
(204, "Jamie's Cryin", '3:31'),
(204, 'Atomic Punk', '3:02'),
(205, 'Mean Street', '4:58'),
(205, 'Dirty Movies', '4:08'),
(205, 'Unchanined', '3:29'),
(206, 'Jump', '4:01'),
(206, 'Hot for Teacher', '4:42'),
(206, "I'll Wait", '4:40'),
(207, 'Money', '6:23'),
(207, 'Speak to Me', '1:05'),
(207, 'Time', '6:54'),
(207, 'Us and Them', '7:49'),
(207, 'Eclipse', '2:03'),
(208, 'Mother', '5:35'),
(208, 'Goodbye Blue Sky', '2:47'),
(208, 'Empty Spaces', '2:08'),
(209, 'Dogs', '17:05'),
(209, 'Sheep', '10:19'),
(209, 'Pigs(Three Different Ones)', '11:26'),
(210, 'Dreams', '4:18'),
(210, 'Go Your Own Way', '3:44'),
(210, 'The Chain', '4:30'),
(210, 'Songbird', '2:30'),
(210, 'You Make Loving Fun', '4:29'),
(211, 'Monday Morning', '2:48'),
(211, 'Blue Letter', '2:41'),
(211, 'Over My Head', '3:35'),
(212, 'Big Love', '3:37'),
(212, 'Seven Wonders', '3:38'),
(212, 'Mystified', '3:08'),
(213, 'Blood One', '1:44'),
(213, 'Hamster Baby', '2:20'),
(213, 'Sugar', '2:22'),
(213, 'Rebel Girl', '3:23'),
(213, 'Alien She', '2:43'),
(214, 'Jet Ski', '2:34'),
(214, 'False Start', '3:12'),
(214, 'No Backrub', '1:52');

/* Insert your own queries to modify the tables, create new tables, insert data, and SELECT data below */

/*
SELECT b.title, a.title
FROM band AS b
JOIN album AS a ON b.id=a.band_id
WHERE a.pub_year = 1977;

SELECT a.title
FROM band AS b
JOIN album AS a
WHERE a.pub_year = 1971
AND b.title = 'Black Sabbath';

SELECT s.name
FROM album AS a
JOIN song AS s ON a.id=s.album_id
JOIN band AS b on b.id=a.band_id
WHERE b.id = 502;
*/

/*Queries for assignment8*/
CREATE VIEW amb as
SELECT a.id AS artistID, a.fname, a.lname, a.gender, a.dob, b.id AS bandID, b.title, m.joined_date, m.leave_date
FROM member as m
    JOIN artist AS a ON a.id = m.artist_id
    JOIN band AS b ON b.id = m.band_id;

-- Q1
SELECT (CONCAT(v.fname, ' ', v.lname)) AS Name, v.gender, DATE_FORMAT(v.dob, '%M %D, %Y') AS DoB, v.title
FROM amb as v
JOIN member as m ON m.artist_id = v.artistID
WHERE ((m.leave_date = CURDATE())
AND ((TIMESTAMPDIFF(MONTH, v.dob, CURDATE()) > 480) OR (YEAR(v.dob)) > 2000));

-- Q2
SELECT (CONCAT(v.fname, ' ', v.lname)) AS Name, v.title AS Band_Name, FLOOR(DATEDIFF(m.leave_date, m.joined_date)/365) AS Duration
FROM amb as v
JOIN member as m ON m.artist_id = v.artistID
WHERE m.leave_date = CURDATE();
-- rather than count, use sum
SELECT (CONCAT(v.fname, ' ', v.lname)) AS Name, v.title AS Band_Name, FLOOR(DATEDIFF(m.leave_date, m.joined_date)/365) AS Duration
FROM amb as v
JOIN member as m ON m.artist_id = v.artistID
WHERE v.artistID IN (
  SELECT a1.id
  FROM artist AS a1
  JOIN member AS m ON m.artist_id = a1.id
  JOIN band AS b ON b.id = m.band_id
  WHERE b.id = m.band_id
  GROUP BY a1.id
  HAVING COUNT(a1.id) > 1)
GROUP BY v.artistID, v.bandID;


SELECT (CONCAT(v.fname, ' ', v.lname)) AS Name, v.title AS Band_Name, SUM(FLOOR(DATEDIFF(m.leave_date, m.joined_date)/365)) AS Duration
FROM amb as v
JOIN member as m ON m.artist_id = v.artistID
GROUP BY m.artist_id
HAVING COUNT(m.artist_id)>1;

-- SELECT (CONCAT(v.fname, ' ', v.lname)) AS Name, v.title AS Band_Name, FLOOR(DATEDIFF(m.leave_date, m.joined_date)/365) AS Duration
-- FROM amb as v
-- JOIN member as m ON m.artist_id = v.artistID
-- GROUP BY m.artist_id
-- HAVING COUNT(m.artist_id)>1;

--Q3
SELECT (CONCAT(a.fname, ' ', a.lname)) AS Name, b.title AS Band_Name
FROM artist AS a
JOIN member AS m ON m.artist_id = a.id
JOIN band AS b ON b.id = m.band_id
WHERE a.id NOT IN (
  SELECT a.id
  FROM artist AS a
  WHERE a.gender LIKE 'female'
)ORDER BY Name ASC;

-- Q4
SELECT a.title as Album_Title, b.title AS Band_Name, COUNT(*) AS SongCount
FROM band as b
JOIN album as a ON a.band_id = b.id
JOIN song as s ON s.album_id = a.id
GROUP BY s.album_id
HAVING COUNT(*) < 5;

--Q5
SELECT (CONCAT(a.fname, ' ', a.lname)) AS Name, b.title AS Band, al.title as Album_Title
FROM member AS m
JOIN artist AS a ON a.id = m.artist_id
JOIN band AS b ON m.band_id = b.id
JOIN album AS al ON al.band_id = b.id
WHERE m.artist_id IN (
    SELECT m.artist_id
    FROM member as m
    GROUP BY m.artist_id
    HAVING COUNT(m.artist_id)>1
);
