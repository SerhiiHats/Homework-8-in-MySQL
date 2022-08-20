USE MyFunkDB;

-- Задание 4. Выполните ряд записей вставки в виде транзакции в хранимой процедуре. Если такой сотрудник имеется откатите базу данных обратно. 

DELIMITER |
CREATE PROCEDURE Write_Not_Equals_Employee 
(IN Lname VARCHAR (50), IN Fname VARCHAR (50), IN Mname VARCHAR (50), IN phone VARCHAR (15), 
IN salary DOUBLE, IN title VARCHAR (50), 
IN married VARCHAR (15), IN birthday DATE, IN address VARCHAR (50))
BEGIN
DECLARE Id INT;
	START TRANSACTION;
    INSERT INTO employees (l_name_emp, f_name_emp, m_name_emp, phone_emp) VALUES (Lname, Fname, Mname, phone);
    SET Id = @@identity;
    INSERT INTO position_employee (id_emp, salary_pos, title_pos) VALUES (Id, salary, title);
    INSERT INTO description_employee (id_emp, married_des, birthday_des, address_des) VALUES (Id, married, birthday, address);
		IF EXISTS (SELECT * FROM Employees WHERE l_name_emp= Lname AND f_name_emp = Fname AND m_name_emp = Mname AND Id != Id_emp)
        THEN 
			ROLLBACK;
        END IF;
	COMMIT;		
    END; |   
    
    
    SELECT * FROM employees; |
    
    DELIMITER |
    CALL Write_Not_Equals_Employee ('Камец','Александр','Иванович','+38(098)9635512', 9500.5,'рабочий','married','1987-11-01','Борисполь...'); |
    CALL Write_Not_Equals_Employee ('Блажкова','Оксана','Сергеевна','+38(067)5225200', 12510.0,'менеджер','married','1993-01-07','Киев...'); |
    CALL Write_Not_Equals_Employee ('Лепешкина','Вера','Владимировна','+38(098)7851295', 11433.0,'рабочий','not married','1997-11-25','Киев...'); |
    
	SELECT * FROM employees; |
	SELECT * FROM position_employee; |
	SELECT * FROM description_employee; |
        