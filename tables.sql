--drop table payment;
--drop table purchase;
--drop table products;
--drop table cart;
--drop table customer;
--drop table categories;
--drop table employee;

drop table payment;
drop table purchase;
drop table products;
drop table cart;
drop table categories;
drop table customer;
drop table employee;



create table categories(
category_id     number(10)     not null,
category_title  varchar(20),
primary key (category_id)
);


create table customer(
cust_id         number(10)     not null,
cust_name       varchar(20)    not null,
cust_address    varchar(20) ,
cust_city       varchar(20),
cust_email      varchar(20)    not null,
cust_contact    number(20),
primary key (cust_id)
);


create table cart(
order_id      number(10)      not null,
shipping_add varchar(20)     not null,
cust_id      number(10)      not null,
primary key (order_id),
foreign key(cust_id) references customer on delete cascade
);


create table products(
product_id      number(10)     not null,
product_title   varchar(20)    not null,
product_cost    number(10)     not null,
category_id     number(10)     not null,
order_id         number(10)     not null,
primary key (product_id),
foreign key (category_id) references categories on delete cascade,
foreign key (order_id) references cart        on delete cascade 
);


create table purchase(
purchase_date varchar(10),
cust_id       number(10)       not null,
product_id    number(10)       not null,
foreign key(cust_id) references customer on delete cascade,
foreign key(product_id) references products on delete cascade
);


create table payment(
pay_id       number(10)     not null,
pay_method   varchar(20)    not null,
amount       number(10),
order_id      number(10)     not null,
pay_date      varchar(10),
primary key(pay_id),
foreign key (order_id) references cart on delete cascade
);

create table employee(
employee_name   varchar(20)    not null,
employee_contact number(20)    not null,
employee_id      number(10)    not null,
primary key (employee_id)
);


describe customer;
describe products;
describe categories;
describe cart;
describe purchase;
describe payment;







