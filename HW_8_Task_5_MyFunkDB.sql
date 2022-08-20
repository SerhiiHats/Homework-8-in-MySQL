-- Задание 5. Создайте триггер, который будет удалять записи со 2-й и 3-й таблиц перед удалением записей из таблиц сотрудников (1-й таблицы), чтобы не нарушить целостность данных. 

USE MyFunkDB;


DELIMITER |
CREATE TRIGGER Delete_employee_cascade BEFORE DELETE ON Employees
FOR EACH ROW
BEGIN
DELETE FROM Description_employee AS d WHERE d.Id_emp = OLD.Id_emp;
DELETE FROM Position_employee AS p WHERE p.Id_emp = OLD.Id_emp;
END;
|   
    

DELETE FROM Employees WHERE Id_emp = 3; |
DELETE FROM Employees WHERE Id_emp = 7; |
    
        
SELECT * FROM Employees; |
SELECT * FROM Position_employee; |
SELECT * FROM Description_employee; |
        