CREATE DATABASE quiz;

CREATE TABLE movie(
    mID INTEGER PRIMARY KEY,
    title VARCHAR(255),
    year INTEGER,
    director VARCHAR(255)
);

CREATE TABLE reviewer(
    rID INTEGER PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE rating(
    rID INTEGER REFERENCES reviewer,
    mID INTEGER REFERENCES movie,
    stars INTEGER,
    ratingDate DATE
);
-- 6
SELECT title, avg(stars) AS average FROM movie INNER JOIN rating USING(mID) GROUP BY mID ORDER BY average DESC, title;

-- 7
SELECT title, min(stars) FROM movie INNER JOIN rating USING(mID) GROUP BY mID ORDER BY title;

-- 8
SELECT name FROM reviewer INNER JOIN rating USING(rID) WHERE ratingDate IS NULL;

-- 9
CREATE MATERIALIZED VIEW non_rated AS SELECT title FROM movie WHERE mID NOT IN(SELECT mID FROM rating);

-- 10
CREATE ROLE just_role;
GRANT SELECT, UPDATE ON non_rated TO just_role;



-- 1 C
CREATE TABLE R(
    A INTEGER,
    B INTEGER
);

CREATE TABLE S(
    B INTEGER,
    C INTEGER,
    D INTEGER
);

INSERT INTO R(A,B) VALUES (1,2),
                          (3,4),
                          (5,6);

INSERT INTO S(B,C,D) VALUES (2,4,6),
                            (4,6,8),
                            (4,7,9);
SELECT * FROM R NATURAL INNER JOIN S; -- (1,2,4,6) (3,4,6,8) (3,4,7,9)

DROP TABLE S;
DROP TABLE R;

-- 2 D
CREATE TABLE R(
    A INTEGER,
    B INTEGER,
    C INTEGER
);

CREATE TABLE S(
    A INTEGER,
    B INTEGER,
    C INTEGER
);

INSERT INTO R(A,B,C) VALUES (1,2,3),
                            (4,2,3),
                            (4,5,6),
                            (2,5,3),
                            (1,2,6);

INSERT INTO S(A,B,C) VALUES (2,5,3),
                            (2,5,4),
                            (4,5,6),
                            (1,2,3);
SELECT * FROM R INTERSECT SELECT * FROM S; -- (2,5,3) (4,5,6) (1,2,3)

-- 3 D. Aplly.sID have the less date, Student.GPA has a few date to, they both just need to have integer, it easy to use them by index

-- 4 B. 2 only, because there need to be not null
CREATE TABLE borrower(
    customer_name VARCHAR(255),
    loan_number INTEGER
);
CREATE TABLE loan(
    loan_number INTEGER,
    amount INTEGER
);
CREATE VIEW loan_info AS SELECT customer_name, amount FROM borrower, loan WHERE borrower.loan_number = loan.loan_number;
INSERT INTO Borrower VALUES ('Johnson', null);
INSERT INTO Loan VALUES (null,1900);

INSERT INTO Borrower VALUES ('Johnson', 1209);
INSERT INTO Loan VALUES (1209,1900);

SELECT * FROM loan_info;
/* 5 A. min(c) > b 9 > 4,3,3,4 True
     B. avg(a) < b (1+2+3+4)/4 = 2.5 < 4,3,3,4 True
     C. sum(b) <= c 4+3+3+4 = 14 <= 9,14,15,16 False (9 < 14)
     D. c-b > a 10,12,13,5 > 1,2,3,4 True
    Answer is C
   */