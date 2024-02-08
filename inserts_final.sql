insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1001,'John Doe','12/03 SK road','Toronto','doe@gmail.com',0161245);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1002,'Michal Collin','2/04 MC road','Edmonton','collin@gmail.com',0161234);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1003,'Kim Namjoon','2/83 NJ road','Seoul','kim@gmail.com',0161266);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1004,'Jeon Jungkook','12/03 jK road','Busan','jk@gmail.com',0161233);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1005,'Light Yeagami','32/03 lLG road','Tokeyo','light@gmail.com',0161243);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1006,'Bella Swan','9/03 BS road','LA','belaa@gmail.com',0193243);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1007,'Tylor Swift','12/03 TS road','Las Vegas','swift@gmail.com',01093243);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1008,'Jimin Park','32/07 PJ road','Ilsan','jimin@gmail.com',0160243);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1009,'Humaira Khan','122/03 HG road','Kashmir','hm@gmail.com',0191243);
insert into customer (cust_id,cust_name,cust_address,cust_city,cust_email,cust_contact) values (1010,'Kim Taehyung','23/03 V road','Deagu','kv@gmail.com',0162143);



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
insert into purchase (cust_id,product_id,purchase_date) values (1010,05,'24-12-2022');
insert into purchase (cust_id,product_id,purchase_date) values (1008,03,'21-06-2022');
insert into purchase (cust_id,product_id,purchase_date) values (1010,02,'30-12-2022');



insert into payment (pay_id,pay_method,order_id,amount,pay_date) values (01,'Bkash',301,70000,'23-05-2022');
insert into payment (pay_id,pay_method,order_id,amount,pay_date) values (02,'Bkash',304,30000,'2-10-2022');
insert into payment (pay_id,pay_method,order_id,amount,pay_date) values (03,'Credit_card',301,40000,'4-05-2020');
insert into payment (pay_id,pay_method,order_id,amount,pay_date) values (04,'Visa_card',302,20000,'21-03-2022');
insert into payment (pay_id,pay_method,order_id,amount,pay_date) values (05,'Cash_on_delevery',303,7000,'10-06-2021');




commit;




