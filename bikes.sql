CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);


--4 models of bikes, but they might add more

--bikes table
--  id = code = fly, haul,skin bud
--  cost
-- actual name (full_name)
--


-- id serial   order# int  model varchar date date with timestamp note Varchar(x)
--order table
    -- primary -- order # SERIAL  #discount?
    --    ORDER#1  haul  12/5/23  what was the price at the time it was sold, and if it was sold for less than the listed price
--id 1  ordernumber 6 dates fly kickstand
--id 2 order numberr 6 dates haul NULL



-- price 500 600 700

-- id:serial date - model price


--join date = order date

CREATE TABLE price (
    id SERIAL PRIMARY KEY,
    date TIMESTAMP WITH TIME ZONE,
    bike_model VARCHAR(40) REFERENCES bikes,

);


CREATE TABLE bikes (
    id name VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(40),
    cost numeric REFERENCES price

);


CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_number NOT NULL NUMERIC,
    bike_model NOT NULL VARCHAR(40) REFERENCES bikes,
    date_created NOT NULL NUMERIC REFERENCES price
    note VARCHAR(50)
    purchased_by NOT NULL VARCHAR(25) REFERENCES customers
);
