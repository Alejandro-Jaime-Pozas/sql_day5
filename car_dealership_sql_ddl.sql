
-- the sort of main object that connects all others is the invoice - customer, salesperson, car and ticket all appear here
-- 6 objects: 
	--	salesperson, 
		--id 
		--first_name
		--last_name
		--email 
		--active t/f 
	--	customer, 
		--id 
		--first_name
		--last_name
		--email 
		--phone 
	--	mechanic, 
		--id 
		--first_name
		--last_name 
		--email 
		--active t/f 
	--	invoice(car sales), 
		--id 
		--amount 
		--datetime
		--REF car_id
		--REF salesperson_id
		--REF customer_id
	--	service_ticket(car service), 
		--id 
		--amount
		--service_type
		--REF mechanic_id
		--REF car_id
		--REF customer_id
		--REF invoice 
	--	car 
		--	car_id
		--	used/NEW 
		--	make 
		--	model 
		--	color 
		--	YEAR 


---------------------------------------------------------------------------------------
-- FIRST CREATE TABLES FOR THOSE WO A FOREIGN KEY....

--car 
CREATE TABLE car (
	car_id SERIAL PRIMARY KEY ,
	used BOOLEAN,
	make VARCHAR,
	model VARCHAR,
	color VARCHAR,
	"year" INTEGER
);




--customer
CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY ,
	first_name varchar , 
	last_name varchar , 
	email varchar , 
	phone varchar
);




--salesperson
CREATE TABLE salesperson (
	salesperson_id SERIAL PRIMARY KEY , 
	first_name varchar, 
	last_name varchar, 
	email varchar,
	active boolean
);



--mechanics
CREATE TABLE mechanic (
	mechanic_id SERIAL PRIMARY KEY, 
	first_name varchar, 
	last_name varchar, 
	email varchar,
	active boolean
);



--invoice
CREATE TABLE invoice (
	invoice_id SERIAL PRIMARY KEY,
	amount numeric(15, 2),
	date timestamp DEFAULT current_timestamp,
	car_id integer NOT NULL,
	salesperson_id integer NOT NULL, 
	customer_id integer NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car (car_id),
	FOREIGN KEY (salesperson_id) REFERENCES salesperson (salesperson_id),
	FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);



--service_ticket
CREATE TABLE service_ticket (
	service_ticket_id SERIAL PRIMARY KEY,
	amount NUMERIC (15, 2),
	service_type varchar,
	car_id integer NOT NULL,
	customer_id integer NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car (car_id),
	FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);



--mechanic_service_ticket
CREATE TABLE mechanic_service_ticket (
	mechanic_id integer NOT NULL,
	service_ticket_id integer NOT NULL,
	FOREIGN KEY (mechanic_id) REFERENCES mechanic (mechanic_id),
	FOREIGN KEY (service_ticket_id) REFERENCES service_ticket (service_ticket_id)
);



--SELECT * FROM car ;
--SELECT * FROM customer ;
--SELECT * FROM salesperson;
--SELECT * FROM mechanic;
--SELECT * FROM invoice ; FK
--SELECT * FROM service_ticket ; FK
--SELECT * FROM mechanic_service_ticket; FK





	
