CREATE database lab4;

CREATE TABLE customers(
    customer_id INTEGER,
    cust_name VARCHAR(55),
    city VARCHAR(55),
    grade INTEGER,
    salesman_id INTEGER
);
CREATE TABLE orders(
    ord_no INTEGER,
    purch_amt DOUBLE PRECISION,
    ord_date DATE,
    customer_id INTEGER,
    salesman_id INTEGER
);
INSERT INTO customers VALUES (3002,'Nick Rimando','New York',100,5001),
                             (3005,'Graham Zusi','California',200,5002),
                             (3001,'Brad Guzan','London',0,5005),
                             (3004,'Fabian Johns','Paris',300,5006),
                             (3007,'Brad Davis','New York',200,5001),
                             (3009,'Geoff Camero','Berlin',100,5003),
                             (3008,'Julian Green','London',300,5002);

INSERT INTO orders VALUES (70001,150.5,'2012-10-05',3005,5002),
                          (70009,270.65,'2012-09-10',3001,5005),
                          (7002,65.26,'2012-10-05',3002,5001),
                          (7004,110.5,'2012-08-17',3009,5003),
                          (70007,948.5,'2012-09-10',3005,5002),
                          (70005,2400.6,'2012-07-27',3007,5001),
                          (7008,5760,'2012-09-10',3002,5001);


SELECT sum(purch_amt) FROM orders;

SELECT  avg(purch_amt) FROM orders;

SELECT  count(cust_name) FROM customers;

SELECT min(purch_amt) FROM orders;

SELECT * FROM customers WHERE cust_name LIKE '%b';

SELECT * FROM orders  WHERE customer_id  IN(SELECT customers.customer_id FROM customers WHERE city = 'New York');

SELECT * FROM customers WHERE customer_id IN(SELECT customer_id FROM orders WHERE purch_amt > 10);

SELECT sum(grade) FROM customers;

SELECT*FROM customers WHERE cust_name IS NOT NULL;

SELECT max(grade) FROM customers;