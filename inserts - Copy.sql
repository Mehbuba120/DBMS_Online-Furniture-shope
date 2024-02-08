insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1001,'John Doe','12/03 SK road','Toronto','doe@gmail.com',0161245);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1002,'Michal Collin','2/04 MC road','Edmonton','collin@gmail.com',0161234);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1003,'Kim Namjoon','2/83 NJ road','Seoul','kim@gmail.com',0161266);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1004,'Jeon Jungkook','12/03 jK road','Busan','jk@gmail.com',0161233);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1005,'Light Yeagami','32/03 lLG road','Tokeyo','light@gmail.com',0161243);


insert into categories (category_id,category_title) values (201,'Wooden');
insert into categories (category_id,category_title) values (202,'Antique');
insert into categories (category_id,category_title) values (203,'Vintage');
insert into categories (category_id,category_title) values (204,'LivingRoom_deco');
insert into categories (category_id,category_title) values (205,'Bedroom_deco');


insert into cart (order_id, cust_id, shipping_add) values (301, 1004, 'Busan,South Korea');
insert into cart (order_id, cust_id, shipping_add) values (302, 1002, 'Edmonton,USA');
insert into cart (order_id, cust_id, shipping_add) values (303, 1005, 'Toronto,Canada');
insert into cart (order_id, cust_id, shipping_add) values (304, 1003, 'Busan,South Korea');


insert into products (product_id,product_title,product_cost,category_id,order_id) values (01,'Chair',7000,201,304);
insert into products (product_id,product_title,product_cost,category_id,order_id) values (02,'Sofa',20000,204,302);
insert into products (product_id,product_title,product_cost,category_id,order_id) values (03,'Bed',90000,205,304);
insert into products (product_id,product_title,product_cost,category_id,order_id) values (04,'Table',50000,202,304);
insert into products (product_id,product_title,product_cost,category_id,order_id) values (05,'Mirror',30000,204,301);
insert into products (product_id,product_title,product_cost,category_id,order_id) values (06,'Cradle',40000,201,303);


insert into purchase (cust_id,product_id,purchase_date) values (1004,04,'30-06-2020');
insert into purchase (cust_id,product_id,purchase_date) values (1003,05,'2-10-2022');
insert into purchase (cust_id,product_id,purchase_date) values (1005,04,'10-06-2021');
insert into purchase (cust_id,product_id,purchase_date) values (1004,03,'23-05-2022');
insert into purchase (cust_id,product_id,purchase_date) values (1001,01,'10-06-2021');
insert into purchase (cust_id,product_id,purchase_date) values (1004,06,'4-05-2020');
insert into purchase (cust_id,product_id,purchase_date) values (1002,02,'21-03-2022');


insert into payment (pay_id,pay_method,order_id,amount,pay_date) values (01,'Bkash',301,70000,'23-05-2022');
insert into payment (pay_id,pay_method,order_id,amount,pay_date) values (02,'Bkash',304,30000,'2-10-2022');
insert into payment (pay_id,pay_method,order_id,amount,pay_date) values (03,'Credit_card',301,40000,'4-05-2020');
insert into payment (pay_id,pay_method,order_id,amount,pay_date) values (04,'Visa_card',302,20000,'21-03-2022');
insert into payment (pay_id,pay_method,order_id,amount,pay_date) values (05,'Cash_on_delevery',303,7000,'10-06-2021');



commit;

--LAB 2 & 3


-- showing all tables with data
select *from customer;
select *from products;
select *from categories;
select *from purchase;
select *from cart;
select *from payment;


--adding column
alter table products add column_temp varchar(20);
describe products;
select *from products;


--modifying column data type
alter table products modify column_temp number(10);
describe products;
select *from products;


--rename column
alter table products rename column column_temp to temp_column;
describe products;
select *from products;


--deleting column
alter table products drop column column_temp;
describe products;
select *from products;


--updating a value
update products set product_title='weardrob' where product_id=6;
select *from products;

update products set product_title='cradle' where product_id=6;


--deleting a row
delete from products where product_id=6;
select *from products;

--applying conditions
insert into products (product_id,product_title,product_cost,category_id,order_id) values (06,'Cradle',40000,201,303);

select cust_address from customer where cust_id=1004;

select cust_name,cust_address,cust_email from customer where cust_id=1005;

select cust_name,cust_address,cust_email from customer where cust_id between 1001 and 1003;

select cust_name,cust_address,cust_email from customer where cust_id not between 1001 and 1003;


--comparison search
select cust_name,cust_address,cust_email from customer where cust_id >1001 and cust_id<1003;
select cust_name,cust_address,cust_email from customer where cust_id >1001 or cust_id<1003;

--set membership
select cust_name, cust_address, cust_contact, cust_email from customer where cust_id in (1001,1004);
select cust_name, cust_address, cust_contact, cust_email from customer where cust_id not in (1001,1004);

--ordering by column velue
select cust_name, cust_address, cust_email from customer order by cust_id;
select cust_name, cust_address, cust_email from customer order by cust_id desc;

select product_title, product_cost from products order by category_id;
select product_title, product_cost from products order by product_id,category_id;

--use distinct 
select distinct (category_id) from products;




--LAb 4

--pattern matching
select order_id, cust_id from cart where  shipping_add like '%Korea';


--aggregate functions
select max(product_cost) from products;
select min(product_cost) from products;
select sum(amount) from payment where order_id=301;
select count (cust_id) from customer;
select count (order_id) from payment where order_id=301;
select count(*) from categories;
select count(distinct(cust_id)) from purchase;
select avg(product_cost) from products;


--group by clause
select cust_id,count(product_id) from purchase group by cust_id order by cust_id;
select category_id, count(product_id) from products where product_cost>7000 group by category_id; 
 
--having clause
select cust_id,count(product_id) from purchase group by cust_id having cust_id>1002;
select cust_id,count(product_id) from purchase group by cust_id having count(product_id)>2;



--LAB 5
select cust_name, cust_id, cust_contact from customer where cust_id in (1002,1003,1005);
select cust_id, product_id from purchase where product_id in (select product_id from products where product_cost>20000);
select cust_id, product_id from purchase where product_id in (select product_id from products where product_cost>20000) order by cust_id;

--set operations
--union
select product_id from products where product_cost<40000 union select product_id from purchase where product_id<2;
select category_id from products where product_cost>40000 union select category_id from categories where category_id>202;

--intersect
select product_id from products where product_cost<40000 intersect select product_id from purchase where product_id>2;
select category_id from products where product_cost>40000 intersect select category_id from categories where category_id<205;

--minus
select category_id from categories minus select category_id from products;



--JOIN

--simple join
select cust_id, product_title, product_cost from purchase p join products pro on p.product_id=pro.product_id;
select cust_id, product_title,p.product_id, product_cost from purchase p join products pro on p.product_id=pro.product_id;
---join multiple tables
select cust_id, c.cust_name, product_title,p.product_id, product_cost from purchase p join products pro on p.product_id=pro.product_id join customer c on p.cust_id=c.cust_id;

--natural join
select cust_id, cust_name, product_title, product_cost from purchase natural join products natural join customer; 
select order_id, cust_id, cust_name, product_title,product_cost, shipping_add from cart natural join products natural join customer;


--cross join
select cart.order_id, product_title, product_cost from cart cross join products;


--outer join
--left outer
select c.category_title, c.category_id, product_title, product_cost from categories c left outer join products p on c.category_id=p.category_id ;
select cust.cust_id,cust_name, order_id,  shipping_add from customer cust left outer join cart c on cust.cust_id=c.cust_id;

--right outer
select pay_id, pay_method, p.order_id, cust_id, shipping_add from cart c right outer join payment p on p.order_id=c.order_id;
select cust.cust_id, cust_name, cust_email, order_id, pay_id, pay_method, pay_date, shipping_add from cart c right outer join customer cust on cust.cust_id=c.cust_id left outer join payment p on c.order_id = p.order_id;


--full outer
select pay_id, p.order_id,cust_id,pay_date, shipping_add from cart c full outer join payment p on p.order_id=c.order_id;
select cust_name, order_id, cust.cust_id, shipping_add from customer cust full outer join cart c on cust.cust_id=c.cust_id;


--self join(max price count)
select p.product_cost from products p minus select p.product_cost from products p join products q on p.product_cost<q.product_cost;



                                                  --------LAB 7, 8 & 9--------

-- finding maximum product cost
set serveroutput on
declare 
max_price products.product_id%type;
begin
select max(product_cost) into max_price from products;
dbms_output.put_line('The maximum price is: ' || max_price);
end;
/


set serveroutput on
declare 
p_date purchase.purchase_date%type;
cust customer.cust_name%type:='Light Yeagami';
price payment.amount%type;
begin
select purchase_date into p_date from purchase,customer 
where purchase.cust_id= customer.cust_id and cust_name=cust;
dbms_output.put_line('Light purchased the table on ' || p_date);
end;
/ 

--discount on price
set serveroutput on
declare
full_price products.product_cost%type;
product_name varchar(20);

discount_price products.product_cost%type;
begin
product_name := 'Bed';
select product_cost into full_price from products where product_title=product_name;
IF full_price <15000 THEN
    discount_price :=full_price;
ELSIF full_price >=15000 and full_price <30000 THEN
     discount_price :=full_price-(full_price*0.25);
ELSIF full_price >=30000 and full_price <50000 THEN
     discount_price :=full_price-(full_price*0.3);
ELSE 
     discount_price :=full_price-(full_price*0.5);
end if;
dbms_output.put_line(product_name || '  Full Price: ' || full_price || '  DIscount Price: ' || round(discount_price,2));
end;
/

--cursor
set serveroutput on
declare 
cursor cur_products is select product_id,product_title,product_cost from products;
product cur_products%rowtype;
begin
open cur_products;
  loop
    fetch cur_products into product;
    exit when cur_products%rowcount >5;
    dbms_output.put_line('ID: '|| product.product_id || ' ' || 'Product_name: ' || product.product_title || ' ' || 'Price: ' || product.product_cost);
    end loop;
    close cur_products;
end;
/ 
















