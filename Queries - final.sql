
-------------------------------------LAB 2&3 ---------------------------------------------


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
alter table products drop column temp_column;
describe products;
select *from products;


--updating a value
update products set product_title='wardrobe' where product_id=6;
select *from products;

update products set product_title='cradle' where product_id=6;


--deleting a row
delete from products where product_id=6;
select *from products;

insert into products (product_id,product_title,product_cost,category_id,order_id) values (06,'Cradle',40000,201,303);

--applying conditions
select cust_address from customer where cust_id=1004;

select cust_name,cust_address,cust_email from customer where cust_id=1005;

--calculated field
select (product_cost/5) as product_cost_divided_by_five from products;

--range
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




----------------------------------LAb 4-------------------------------------------------

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



----------------------------------------LAB 5------------------------------------------------

--sub query
select cust_name, cust_id, cust_contact from customer where cust_id in (1002,1003,1005);
select cust_id, product_id from purchase where product_id in (select product_id from products where product_cost>20000);
select cust_id, product_id from purchase where product_id in (select product_id from products where product_cost>20000) order by cust_id;

--set operations
--union all (without eliminating the duplicates)
select product_id,product_title,product_cost,order_id from products where category_id = 201 
union all select product_id, product_title, product_cost, order_id from products  where order_id in 
(select p.order_id from payment p, cart c 
where p.order_id=c.order_id and c.shipping_add='Busan,South Korea');

--union (eliminate the duplicates)
select product_id,product_title,product_cost,order_id from products where category_id = 201 
union select pro.product_id, pro.product_title, pro.product_cost, pro.order_id from products pro where pro.order_id in 
(select p.order_id from payment p, cart c 
where p.order_id=c.order_id and c.shipping_add='Busan,South Korea');

select product_id from products where product_cost<40000 union select product_id from purchase where product_id<2;
select category_id from products where product_cost>40000 union select category_id from categories where category_id>202;

--intersect
select product_id,product_title,product_cost,order_id from products where category_id = 201 
intersect select pro.product_id, pro.product_title, pro.product_cost, pro.order_id from products pro where pro.order_id in 
(select p.order_id from payment p, cart c 
where p.order_id=c.order_id and c.shipping_add='Busan,South Korea');

select product_id from products where product_cost<40000 intersect select product_id from purchase where product_id>2;
select category_id from products where product_cost>40000 intersect select category_id from categories where category_id<205;

--minus
select category_id from categories minus select category_id from products;

--precedence of set operations (union implemented first)
select product_id,product_title,product_cost,order_id from products where category_id = 201 
union select pro.product_id, pro.product_title, pro.product_cost, pro.order_id from products pro where pro.order_id in 
(select p.order_id from payment p, cart c 
where p.order_id=c.order_id and c.shipping_add='Busan,South Korea')
intersect select product_id,product_title,product_cost,order_id from products where category_id=204;

--JOIN

--simple join
select cust_id, product_title, product_cost from purchase p join products pro on p.product_id=pro.product_id;
select cust_id, product_title,p.product_id, product_cost from purchase p join products pro on p.product_id=pro.product_id;
---join multiple tables
select cust_id, c.cust_name, product_title,p.product_id, product_cost from purchase p join products pro on p.product_id=pro.product_id join customer c on p.cust_id=c.cust_id;

--natural join
select cust_id, cust_name, product_title, product_cost from purchase natural join products natural join customer; 
select order_id, cust_id, cust_name, product_title,product_cost, shipping_add from cart natural join products natural join customer;
select product_id, product_title, product_cost, order_id,shipping_add from products natural join cart;


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


--self join
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


--procedure
--(insert a new customer in the customer table)
create or replace procedure add_cust(
custid customer.cust_id%type, custname customer.cust_name%type, custadd customer.cust_address%type,
custcity customer.cust_city%type, custemail customer.cust_email%type, custnum customer.cust_contact%type)
is
begin
insert into customer (cust_id, cust_name, cust_address, cust_city,cust_email,cust_contact)
values (custid,custname,custadd,custcity,custemail,custnum);
commit;
end add_cust;
/
set serveroutput on
begin
add_cust(1011,'Harry Porter','31/07 HP road','Fork','harry@gmail.com',0161236);
end;
/
select * from customer;


--minimum cost
create or replace PROCEDURE minimum_cost
(x in number, y in number, z out number)
is 
begin
   if x < y then
      z:= x; 
   else
      z:= y; 
   end if; 
end minimum_cost;  
/ 
set serveroutput on
declare
a products.product_cost%type;
b products.product_cost%type;
x products.product_cost%type;
product1 products.product_title%type:='Bed';
product2 products.product_title%type:='Cradle';
product products.product_title%type;
begin
select products.product_cost into a from products where product_title=product1;
select products.product_cost into b from products where product_title=product2;
minimum_cost(a,b,x);
select product_title into product from products where product_cost=x;
dbms_output.put_line('The minimum cost between '|| product1 || ' and ' || product2 
|| ' is ' || x || ' and the product is ' || product);
end;
/

--function
create or replace function average_cost return number
is
avg_cost products.product_cost%type;
begin
select avg(product_cost) into avg_cost from products;
return avg_cost;
end;
/
set serveroutput on
begin
dbms_output.put_line('Average product_cost is ' || average_cost);
end;
/

--average bill
create or replace function average_bill(ord_id in number) return number
is 
avg_bill payment.amount%type;
begin
select avg(amount) into avg_bill from payment where order_id= ord_id;
return avg_bill;
end;
/
set serveroutput on
declare
o_id payment.order_id%type:=301;
begin
dbms_output.put_line('Average bill of order_id ' || o_id || ' is ' || average_bill(o_id));
end;
/


--Trigger (checking the price before insertion)
create or replace trigger check_price before insert or update on products
for each row
declare
cost_min number := 1000;
cost_max number :=1000000;
begin
if :new.product_cost > cost_max or :new.product_cost < cost_min then
raise_application_error (-20000, 'The price of the new product is too small or large');
end if;
end check_price;
/

--(value between the range)
insert into products (product_id,product_title,product_cost,category_id,order_id) 
values (07,'Wardrobe',140000,201,301);     
select *from products;       

 --(value outside the range)
insert into products (product_id,product_title,product_cost,category_id,order_id) 
values (07,'Wardrobe',1400000,201,301);    
select *from products;



--Transaction management

--RollBack

insert into products (product_id,product_title,product_cost,category_id,order_id) 
values (08,'Cupboard',14000,202,304); 
savepoint cont_8;

insert into products (product_id,product_title,product_cost,category_id,order_id) 
values (09,'ShowCase',64000,201,302); 
savepoint cont_9;

select * from products;

delete from products;             
select * from products;

rollback to cont_8;               
select * from products;

rollback;                      
select *from products;


--date
select sysdate FROM dual;
select current_date FROM dual;
select systimestamp from dual;




--extra (VIEW)
create view details as 
select cust_id,cust_name,cust_address
from customer ;
select *from details;


create view product_details as 
select p.product_title, c.category_title, p.product_cost 
from products p, categories c 
where p.category_id=c.category_id;
select *from pro_details;
drop view product_details;

--update
update details
set
cust_name='Messi'
where
cust_id=1011;
select *from details;
drop view details;