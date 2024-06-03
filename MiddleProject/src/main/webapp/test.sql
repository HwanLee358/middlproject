create sequence product_info_no_seq;

insert into product_info
values(product_info_no_seq.nextval, 1, 'ivory', 'free');
insert into product_info
values(product_info_no_seq.nextval, 2, 'blue', 'free');



create sequence basket_seq;

insert into basket
values(basket_seq.nextval, 1, 'user01', 2);
insert into basket
values(basket_seq.nextval, 2, 'user01', 1);