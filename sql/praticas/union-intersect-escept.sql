-- union, eescept e intersect

CREATE DATABASE if not exists teste;
USE teste;

CREATE TABLE R (
    A CHAR(2)
);

CREATE TABLE S (
    A CHAR(2)
);

INSERT INTO R(A) VALUES ('a1'),('a2'),('a2'),('a3');
INSERT INTO S(A) VALUES ('a1'),('a1'),('a2'),('a3'),('a4'),('a5');

SELECT 
    *
FROM
    R;
    
SELECT 
    *
FROM
    S;

SHOW TABLES;
-- EXCEPT --> NOT IN
SELECT 
    *
FROM
    S
WHERE
    A NOT IN (SELECT 
            A
        FROM
            R);

-- UNION --> UNION
(SELECT DISTINCT
    R.A
FROM
    R) UNION (SELECT DISTINCT
    S.A
FROM
    S);
    
SELECT DISTINCT R.A from R where R.A IN (SELECT S.A FROM S)