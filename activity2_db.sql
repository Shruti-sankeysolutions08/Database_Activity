CREATE DATABASE DemoDB;
USE DemoDB;



CREATE TABLE emp (
    ID INT PRIMARY KEY,           
    Name VARCHAR(100),            
    Age INT,                      
    IsActive BOOLEAN DEFAULT TRUE,          
    JoiningDate DATE,             
    Address VARCHAR(255),         
    Salary DECIMAL(18, 2)        
);

-- Create a stored procedure to insert data
DELIMITER //

CREATE PROCEDURE Insertdata1(
    IN p_ID INT,
    IN p_Name VARCHAR(100),
    IN p_Age INT,
    IN p_IsActive BOOLEAN,
    IN p_JoiningDate DATE,
    IN p_Address VARCHAR(255),
    IN p_Salary DECIMAL(18, 2)
)
BEGIN
    INSERT INTO emp (ID, Name, Age, IsActive, JoiningDate, Address, Salary)
    VALUES (p_ID, p_Name, p_Age, p_IsActive, p_JoiningDate, p_Address, p_Salary);
END //

DELIMITER ;


CALL Insertdata1(1, 'John Doe', 30, 1, '2023-01-01', '1234 Elm Street', 50000.00);
CALL Insertdata1(2, 'Jane Smith', 28, 1, '2024-05-12', '5678 Oak Avenue', 60000.00);



DELIMITER //

CREATE PROCEDURE ReadData()
BEGIN
    SELECT * FROM emp;
END //

DELIMITER ;

CALL ReadData();


DELIMITER //

CREATE PROCEDURE UpdateData(
    IN p_ID INT,
    IN p_Name VARCHAR(100),
    IN p_Age INT,
    IN p_IsActive BOOLEAN,
    IN p_JoiningDate DATE,
    IN p_Address VARCHAR(255),
    IN p_Salary DECIMAL(18, 2)
)
BEGIN
    UPDATE emp
    SET Name = p_Name,
        Age = p_Age,
        IsActive = p_IsActive,
        JoiningDate = p_JoiningDate,
        Address = p_Address,
        Salary = p_Salary
    WHERE ID = p_ID;
END //

DELIMITER ;



CALL UpdateData(1, 'John Doe', 31, 1, '2023-01-01', '1234 Elm Street', 55000.00);


DELIMITER //

CREATE PROCEDURE DeleteData1(
    IN p_ID INT
)
BEGIN
    DELETE FROM emp WHERE ID = p_ID;
END //

DELIMITER ;

CALL DeleteData1(2);

CALL Insertdata1(3, 'Alice Brown', 25, 1, '2022-11-23', '7890 Pine Road', 45000.00);

CALL ReadData();

CALL UpdateData(3, 'Alice Brown', 26, 1, '2022-11-23', '7890 Pine Road', 48000.00);

CALL DeleteData1(3);
