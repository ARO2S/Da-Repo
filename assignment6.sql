/* TEAM 08 - ASSIGNMENT 7 */

/* Drop tables if they exist. Add more DROP TABLE statements as you create more tables*/
DROP TABLE IF EXISTS artist CASCADE;
DROP TABLE IF EXISTS band CASCADE;
DROP TABLE IF EXISTS memeber CASCADE;
DROP TABLE IF EXISTS album CASCADE;
DROP TABLE IF EXISTS song CASCADE;

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
year_formed DATE,
) ENGINE = innodb;

CREATE TABLE member (
FOREIGN KEY (artist_id) REFERENCES artist(id),
FOREIGN KEY (band_id) REFERENCES band(id),
joined_date DATE,
leave_date DATE NULL,
) ENGINE = innodb;

CREATE TABLE album (
id INT auto_increment,
pub_year DATE,
title VARCHAR(50) NOT NULL,
publisher VARCHAR(50) NOT NULL,
format VARCHAR(15) NOT NULL,
FOREIGN KEY (band_id) REFERENCES band(id),
PRIMARY KEY (id),
) ENGINE = innodb;

CREATE TABLE song (
FOREIGN KEY (album_id) REFERENCES album(id),
name VARCHAR(30) NOT NULL,
length TIME NOT NULL,
) ENGINE = innodb;

/* Inserting data into tables. Order matters because of foreign keys. */

INSERT INTO # VALUES


INSERT INTO # VALUES


INSERT INTO # VALUES


INSERT INTO # VALUES


/* Insert your own queries to modify the tables, create new tables, insert data, and SELECT data below */
