CREATE TABLE Customers (
    customerId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO Customers VALUES (1, 'John', 'Doe', 'johndoe@example.com'),
       (2, 'Jane', 'Doe', 'janedoe@example.com'),
       (3, 'Bob', 'Smith', 'bobsmith@example.com'),
       (4, 'Alice', 'Jones', 'alicejones@example.com'),
       (5, 'Joe', 'Brown', 'joebrown@example.com');
CREATE TABLE Orders (
    orderId INT PRIMARY KEY,
    orderDate DATE,
    customerId INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);

INSERT INTO Orders (orderId, orderDate, customerId, amount)
VALUES (1, '2022-01-01', 1, 100.00),
       (2, '2022-01-02', 1, 200.00),
       (3, '2022-01-03', 2, 150.00),
       (4, '2022-01-04', 3, 75.50),
       (5, '2022-01-05', 4, 250.00),
       (6, '2022-01-06', 1, 175.00),
       (7, '2022-01-07', 1, 225.00),
       (8, '2022-01-08', 2, 80.00),
       (9, '2022-01-09', 2, 100.00),
       (10, '2022-01-10', 2, 50.00),
       (11, '2022-01-11', 3, 150.00),
       (12, '2022-01-12', 4, 300.00),
       (13, '2022-01-13', 4, 125.00),
       (14, '2022-01-14', 5, 200.00),
       (15, '2022-01-15', 5, 175.00);


	CREATE TABLE Payments (
    paymentId INT PRIMARY KEY,
    orderId INT,
    amountPaid DECIMAL(10,2),
    paymentDate DATE,
    FOREIGN KEY (orderId) REFERENCES Orders(orderId)
);

INSERT INTO Payments (paymentId, orderId, amountPaid, paymentDate)
VALUES (1, 1, 50.00, '2022-01-01'),
       (2, 1, 75.00, '2022-01-02'),
       (3, 2, 200.00, '2022-01-03'),
       (4, 3, 50.00, '2022-01-04'),
       (5, 3, 30.00, '2022-01-05'),
       (6, 3, 50.00, '2022-01-06'),
       (7, 11, 100.00, '2022-01-07'),
       (8, 12, 250.00, '2022-01-08'),
       (9, 12, 50.00, '2022-01-09'),
       (10, 15, 100.00, '2022-01-10'),
       (11, 15, 75.00, '2022-01-11');

	   select * from customers;
	   select * from orders;
	   select * from payments;
	   	   
--write a query to get : firstName, totalOrderAmount

select customers.firstName , sum(orders.amount) as totalamount from orders left join customers on Customers.customerId = Orders.customerId group by
       Customers.customerId, Customers.firstName;


--write a query to get : firstName, totalOrderAmount, totalPaymentAmount, Balance 

select firstName, sum(amount) as totalamount,
                            sum(amountpaid) as totalamountpaid,
							sum(amount-amountpaid) as balance
							from customers left join orders on Customers.customerId = Orders.customerid 
							left join payments on Customers.customerId = Payments.orderId 
							group by Customers.customerId, Customers.firstName;

--Update previous query -> only those records that have balance > 100, highest balance customer should be first
select firstName, sum(amount) as totalamount,
                            sum(amountpaid) as totalamountpaid,
							sum(amount-amountpaid) as balance
							from customers left join orders on Customers.customerId = Orders.customerid 
							left join payments on Customers.customerId = Payments.orderId 
							group by Customers.customerId, Customers.firstName having sum(amount-                          amountpaid) > 100 order by balance desc;

--write down a query to retrive - OrderDate ,FirstName, OrderId, OrderAmount, AmountPaidAgainstThatOrder, BalanceAmount - Sort by orderDate asc

select orders.orderDate, customers.firstName, Orders.orderId, orders.amount as totalamount, payments.amountpaid, (orders.amount - payments.amountpaid) as balance from orders join Customers on Customers.customerId=
Orders.customerId left join Payments on Orders.orderId = Payments.orderId order by orderDate asc;