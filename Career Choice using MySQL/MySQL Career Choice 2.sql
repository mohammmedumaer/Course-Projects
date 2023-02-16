/* Once a student is passed out from a Institute or College, he/she is known as Alumni of the Institute. Alumni’s career growth plays important role in Institute’s ranking and other networking activities. In this project, career choices of alumni of two Universities will be analyzed with respect to their passing year as well as the course they completed. 

Dataset: Six .csv file (Alumni record of College A and College B) Higher Studies, Self Employed and Service/Job record 

College_A_HS ~ Higher Studies Record of College A
College_A_SE ~ Self Employed Record of College A
College_A_SJ ~ Service/Job Record of College A
College_B_HS ~ Higher Studies Record of College B
College_B_SE ~ Higher Studies Record of College B
College_B_SJ ~ Higher Studies Record of College B

Tasks to be performed */
#  1.Create new schema as alumni
CREATE DATABASE alumni;

# 2.Import all.csv files into MySQL
# all files imported into Mysql --

#3.Run SQL command to see the structure of six tables --
USE alumni;
DESC College_A_HS;
DESC College_A_SE;
DESC College_A_SJ;
DESC College_B_HS;
DESC College_B_SE;
DESC College_B_SJ;

# 4.Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python.
-- Please refer ipynb file --

# 5.Import first 1500 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) into MS Excel.
-- files imported in ms-excel(Please refer excel sheet)

# 6.Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values. 

CREATE VIEW College_A_HS_V AS
    SELECT 
        *
    FROM
        college_a_hs
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND HSDegree IS NOT NULL
            AND EntranceExam IS NOT NULL
            AND Institute IS NOT NULL
            AND Location IS NOT NULL;

-- 7.Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values.

CREATE VIEW College_A_SE_V AS
    SELECT 
        *
    FROM
        College_A_SE
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Location IS NOT NULL;

-- 8.Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.

CREATE VIEW College_A_SJ_V AS
    SELECT 
        *
    FROM
        College_A_SJ
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Designation IS NOT NULL
            AND Location IS NOT NULL;

-- 9.Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values.

CREATE VIEW College_B_HS_V AS
    SELECT 
        *
    FROM
        College_B_HS
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND HSDegree IS NOT NULL
            AND EntranceExam IS NOT NULL
            AND Institute IS NOT NULL
            AND Location IS NOT NULL;

-- 10.Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values.

CREATE VIEW College_B_SE_V AS
    SELECT 
        *
    FROM
        College_B_SE
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Location IS NOT NULL;

-- 11.Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values.

CREATE VIEW College_B_SJ_V AS
    SELECT 
        *
    FROM
        College_B_SJ
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Designation IS NOT NULL
            AND Location IS NOT NULL;

# 12.Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 

DELIMITER $
CREATE PROCEDURE V1()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_A_HS_V;
END $
DELIMITER ;

CALL V1();

DELIMITER $
CREATE PROCEDURE V2()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_A_SE_V;
END $
DELIMITER ;

CALL V2();

DELIMITER $
CREATE PROCEDURE V3()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_A_SJ_V;
END $
DELIMITER ;

CALL V3();

DELIMITER $
CREATE PROCEDURE V4()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_B_HS_V;
END $
DELIMITER ;

CALL V4();

DELIMITER $
CREATE PROCEDURE V5()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_A_SE_V;
END $
DELIMITER ;

CALL V5();

DELIMITER $
CREATE PROCEDURE V6()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_B_SJ_V;
END $
DELIMITER ;

CALL V6();

# 13.Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) into MS Excel and make pivot chart for location of Alumni. 
-- pivotchart created--(refer exdcel sheet)

# 14.Write a query to create procedure get_name_collegeA using the cursor to fetch names of all students from college A.

DELIMITER $$
CREATE PROCEDURE get_name_collegeA(INOUT n TEXT(20000))
BEGIN
	DECLARE finished INT DEFAULT 0;
    DECLARE namelist VARCHAR(400) DEFAULT '';
    
    DECLARE namedetails CURSOR FOR
		SELECT 
    Name
FROM
    College_A_HS 
UNION SELECT 
    Name
FROM
    College_A_SE 
UNION SELECT 
    Name
FROM
    College_A_SJ;
        
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished =1;
    
    OPEN namedetails;
    getname:
    LOOP
		FETCH namedetails INTO namelist;
        IF finished = 1 THEN 
			LEAVE getname;
		END IF;
        
        SET n = concat(namelist,';',n);
	END LOOP getname;
    CLOSE namedetails;
END$$
DELIMITER ;

SET @l=' ';
CALL get_name_collegeA(@l);
SELECT @l student_names_get_name_collegeA;

# 15.Write a query to create procedure get_name_collegeB using the cursor to fetch names of all students from college B.

DELIMITER $$
CREATE PROCEDURE get_name_collegeB(INOUT n TEXT(20000))
BEGIN
	DECLARE finished INT DEFAULT 0;
    DECLARE namelist VARCHAR(400) DEFAULT '';
    
    DECLARE namedetails CURSOR FOR
		SELECT Name FROM College_B_HS
		UNION
		SELECT Name FROM College_B_SE
		UNION
		SELECT Name FROM College_B_SJ;
        
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished =1;
    
    OPEN namedetails;
    getname:
    LOOP
		FETCH namedetails INTO namelist;
        IF finished = 1 THEN 
			LEAVE getname;
		END IF;
        
        SET n = concat(namelist,';',n);
	END LOOP getname;
    CLOSE namedetails;
END$$
DELIMITER ;

SET @l=' ';
CALL get_name_collegeB(@l);
SELECT @l student_names_get_name_collegeB;

-- 16.Calculate the percentage of career choice of College A and College B Alumni
-- (w.r.t Higher Studies, Self Employed and Service/Job)
-- Note: Approximate percentages are considered for career choices.
SELECT (1157 + 1016 + 5633) Total_No_of_alumni_College_A;

SELECT 
    'Higher_studies' career_choice,
    COUNT(*) No_of_students,
    COUNT(*) / 7806 * 100 Percentage
FROM
    College_A_HS 
UNION SELECT 
    'Self Employed' career_choice,
    COUNT(*) No_of_students,
    COUNT(*) / 7806 * 100 Percentage
FROM
    College_A_SE 
UNION SELECT 
    'Service/Job' career_choice,
    COUNT(*) No_of_students,
    COUNT(*) / 7806 * 100 Percentage
FROM
    College_A_SJ;

SELECT (199 + 201 + 1859) Total_no_of_alumni_College_B;

SELECT 
    'Higher_studies' career_choice,
    COUNT(*) No_of_students,
    COUNT(*) / 2259 * 100 Percentage
FROM
    College_B_HS 
UNION SELECT 
    'Self Employed' career_choice,
    COUNT(*) No_of_students,
    COUNT(*) / 2259 * 100 Percentage
FROM
    College_B_SE 
UNION SELECT 
    'Service/Job' career_choice,
    COUNT(*) No_of_students,
    COUNT(*) / 2259 * 100 Percentage
FROM
    College_B_SJ;
