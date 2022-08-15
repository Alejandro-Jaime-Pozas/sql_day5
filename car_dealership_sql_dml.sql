--You have been hired by a local car dealership to design and implement the database system for 
--their company. They have sent the attached business rules abour their dealership. Using those 
--business rules, you are asked to complete the following:
--
--- Create an Entity Relationship Diagram (ERD) using lucidchart.com that has all of the entities
--and relationships (cardinal and ordinal) mentioned in the business rules. Feel free to add to 
--it how you see fit (no removing anything though). Once finalized, save the ERD as a PDF 
--(File->Export->PDF) and save to a project folder.
--
--- Using dBeaver and your ERD, create the tables in a database. The client will be unable to see
--your database so you will need to save your DDL statements in a .sql file. (Set up the file 
--where if the client ran every statement from top to bottom in their database it would create 
--the necessary tables with the correct keys, constraints, etc.)
--
--- Once all of the tables are created, each table should have at least 2 rows of data. At least 
--2 of the inserts should come from a stored procedure (you can always add more if you want). 
--Similar to the DDL statements, you will also need to save your DML statemets in a .sql file. 
--You may keep this in the same file as the DDL statements or create a new .sql file.
--Your Final Repository should include the following:
--- 1 Entity Relationship Diagram PDF
--- 1-2 .sql file(s) containing the DDL & DML statements
--
--The project will not be considered turned in until you push to GitHub and share the link to the 
--repository here.


-- insert at least 2 rows per table with data
-- create 2 inserts using PROCEDURE after creating 2 rows of data for each table


--SELECT * FROM car ;
--SELECT * FROM customer ;
--SELECT * FROM salesperson;
--SELECT * FROM mechanic;
--
----FKs
--SELECT * FROM invoice ; 
--SELECT * FROM service_ticket ; 
--SELECT * FROM mechanic_service_ticket; 
--
--SELECT first_name , last_name , make, model, color, year
--FROM invoice i
--JOIN customer cu
--ON cu.customer_id = i.customer_id
--JOIN car c 
--ON c.car_id = i.car_id;

------------------------------------------------------------------------------------
-- car
INSERT INTO car (
	used, 
	make , 
	model , 
	color , 
	"year" 
) VALUES (
	FALSE, 
	'Ferrari',
	'Enzo',
	'Red',
	1998
);

--UPDATE car 
--SET color = 'Orange'
--WHERE car_id = 1;


-- customer
INSERT INTO customer (
	first_name , 
	last_name , 
	email , 
	phone  
) VALUES (
	'Bob', 
	'Hope',
	'b@gmail.com',
	'444-4444'
), (
	'John', 
	'Stewart',
	'j@gmail.com',
	'555-4444'
);
	

-- salesperson
INSERT INTO salesperson (
	first_name , 
	last_name , 
	email , 
	active  
) VALUES (
	'Bob', 
	'Brian',
	'bb@gmail.com',
	TRUE 
), (
	'Bill', 
	'Nye',
	'bn@gmail.com',
	TRUE 
);



-- mechanic
INSERT INTO mechanic (
	first_name , 
	last_name , 
	email , 
	active  
) VALUES (
	'Rafa', 
	'Nadal',
	'rn@gmail.com',
	TRUE 
), (
	'Roger', 
	'Federer',
	'rf@gmail.com',
	FALSE  
);


-- invoice
INSERT INTO invoice (
	amount, 
	car_id ,
	salesperson_id ,
	customer_id 
) VALUES (
	909000,
	1,
	1,
	1
), (
	1250000,
	2,
	1,
	1
);



-- service_ticket
INSERT INTO service_ticket (
	amount,
	service_type ,
	car_id , 
	customer_id 
) VALUES (
	5600.00,
	'oil change standard ',
	1,
	2
), (
	32000.00,
	'break change ',
	2, 
	1
);



-- mechanic_service_ticket
INSERT INTO mechanic_service_ticket (
	mechanic_id,
	service_ticket_id 
) VALUES (
	1,
	2
), (
	2, 
	2
);



CREATE OR REPLACE PROCEDURE add_customer(first_name varchar, last_name varchar, email varchar, phone varchar)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer (first_name, last_name, email, phone)
	VALUES (first_name, last_name, email, phone);
END;
$$;

CALL add_customer('alex', 'jaime', 'aj@gmail.com', '455-4455') ;
CALL add_customer('Betty', 'Lafarve', 'bl@someplace.com', '222-2222');



-- create a more complicated fn here...create a fn takes customer_id as input, outputs total purchases from customer 
--CREATE OR REPLACE FUNCTION customer_spend (id, integer)
--RETURNS integer
--LANGUAGE plpgsql
--AS $$
--	DECLARE sum_amount integer
--BEGIN 
--	SELECT customer_id, sum(amount) INTO sum_amount
--	FROM invoice
--	WHERE customer_id = id;
--	RETURN sum_amount
--END;
--$$;











