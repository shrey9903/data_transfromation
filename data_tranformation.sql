create database p2;
use p2;
create table customers(
customer_id varchar(20) primary key not null,
first_name varchar(20),
last_name varchar(20),
email varchar(100),
registration_date date
);

INSERT INTO customers (customer_id, first_name, last_name, email, registration_date) VALUES
('C001', 'Amit', 'Sharma', 'amit.sharma@gmail.com', '2026-01-10'),
('C002', 'Priya', 'Patel', 'priya.patel@gmail.com', '2026-01-15'),
('C003', 'Rahul', 'Verma', 'rahul.verma@gmail.com', '2026-02-01'),
('C004', 'Sneha', 'Reddy', 'sneha.reddy@gmail.com', '2026-02-10'),
('C005', 'Arjun', 'Singh', 'arjun.singh@gmail.com', '2026-02-20');

select * from customers;

create table fields(
order_id int primary key not null,
customer_id varchar(20),
orderDate date,
total_amount decimal(10,2),
foreign key (customer_id) references customers(customer_id)
);

INSERT INTO fields (order_id, customer_id, orderDate, total_amount) VALUES
(101, 'C001', '2026-03-01', 1500.50),
(102, 'C002', '2026-03-05', 2300.75),
(103, 'C003', '2026-03-10', 999.99),
(104, 'C004', '2026-03-15', 1750.25),
(105, 'C005', '2026-03-20', 3200.00);

select * from fields;

create table employees(
employee_id int primary key not null,
firstname varchar(20),
lastname varchar(20),
department varchar(20),
hire_date date,
salary decimal(10,2)
);



INSERT INTO employees (employee_id, firstname, lastname, department, hire_date, salary) VALUES
(1, 'Raj', 'Mehta', 'HR', '2022-01-15', 45000.00),
(2, 'Neha', 'Shah', 'Finance', '2021-06-20', 55000.50),
(3, 'Amit', 'Patel', 'IT', '2023-03-10', 60000.75),
(4, 'Sneha', 'Iyer', 'Marketing', '2020-11-05', 48000.25),
(5, 'Karan', 'Verma', 'Sales', '2022-08-18', 52000.00);

select * from employees;

select customers.first_name, customers.last_name, fields.order_id, fields.total_amount from customers inner join fields on customers.customer_id=fields.customer_id;

select customers.first_name, fields.order_id, fields.total_amount from customers left join fields on customers.customer_id=fields.customer_id;

select customers.first_name, fields.order_id, fields.total_amount from customers right join fields on customers.customer_id=fields.customer_id;

select * from customers c left join fields f on c.customer_id=f.customer_id
union
select * from customers c right join fields f on c.customer_id=f.customer_id;

select distinct customer_id from fields where total_amount>(select avg(total_amount) from fields);

select * from employees where salary>(select avg(salary) from employees);

select order_id, year(orderDate) as order_year, month(orderDate) as order_month from fields;

select order_id, datediff(curdate(),orderDate) as Difference_days from fields; 

select order_id, date_format(orderDate,'%d-%b-%Y') as changedDate from fields;

select concat(first_name,' ',last_name) as full_name from customers;

select replace(first_name,'Amit','Shrey') from customers;

select upper(first_name) as upper_first, lower(last_name) as lower_last from customers;

select trim(email) from customers;

select order_id, total_amount, sum(total_amount) over (order by order_id) as running_total from fields;

select order_id, total_amount, rank() over (order by total_amount desc) as Orderrank from fields;

select order_id, total_amount , case when total_amount> 1000 then '10% discount' 
when total_amount>500 then '5% discount' 
else 'No discount'
end as discount
from fields;

SELECT firstname, salary,
CASE WHEN salary >= 70000 THEN 'High'
WHEN salary >= 50000 THEN 'Medium'
ELSE 'Low'
END AS SalaryCategory FROM employees;