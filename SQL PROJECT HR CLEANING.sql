CREATE DATABASE PROJECT;
USE PROJECT;

SELECT * FROM HR;

ALTER TABLE HR CHANGE COLUMN ï»¿id EMP_ID VARCHAR(20) NULL;

SELECT BIRTHDATE FROM HR;
DESCRIBE HR;
SET SQL_SAFE_UPDATES=0;

UPDATE HR 
SET BIRTHDATE = CASE
    WHEN BIRTHDATE LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(BIRTHDATE, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN BIRTHDATE LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(BIRTHDATE, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE HR MODIFY COLUMN BIRTHDATE  DATE;

UPDATE HR 
SET HIRE_DATE = CASE
    WHEN HIRE_DATE LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(HIRE_DATE, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN HIRE_DATE LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(HIRE_DATE, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE HR MODIFY COLUMN HIRE_DATE DATE;



UPDATE HR
SET TERMDATE = DATE(STR_TO_DATE(TERMDATE, '%Y-%m-%d %H:%i:%s UTC'))
WHERE TERMDATE IS NOT NULL AND TERMDATE != '';

UPDATE HR SET TERMDATE = NULL WHERE TERMDATE = '';


ALTER TABLE HR MODIFY COLUMN TERMDATE DATE;


ALTER TABLE HR ADD COLUMN AGE INT;
UPDATE HR
SET AGE = timestampdiff(YEAR,BIRTHDATE, CURDATE());

DELETE FROM HR WHERE AGE < 0; 
SELECT min(age) AS YOUNGEST,max(age) AS OLDEST FROM HR;

SELECT * FROM HR;

SELECT COUNT(*) FROM HR WHERE TERMDATE > CURDATE();

SELECT distinct LOCATION FROM HR;






