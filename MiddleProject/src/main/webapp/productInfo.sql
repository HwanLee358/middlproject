
insert into product_info
values(PRODUCT_INFO_NO_SEQ.nextval, 1, 'Red', 'Large');
insert into product_info
values(PRODUCT_INFO_NO_SEQ.nextval, 1, 'Red', 'Medium');
insert into product_info
values(PRODUCT_INFO_NO_SEQ.nextval, 1, 'Red', 'Small');
insert into product_info
values(PRODUCT_INFO_NO_SEQ.nextval, 1, 'Green', 'Large');
insert into product_info
values(PRODUCT_INFO_NO_SEQ.nextval, 1, 'Green', 'Medium');
insert into product_info
values(PRODUCT_INFO_NO_SEQ.nextval, 1, 'Green', 'Small');
insert into product_info
values(PRODUCT_INFO_NO_SEQ.nextval, 1, 'Blue', 'Large');
insert into product_info
values(PRODUCT_INFO_NO_SEQ.nextval, 1, 'Blue', 'Medium');
insert into product_info
values(PRODUCT_INFO_NO_SEQ.nextval, 1, 'Blue', 'Small');

-- 제품번호마다 바꿔서 미리 입력해 두어야 옵션클릭시 데이터 입력됩니다
insert into product_info
select product_info_no_seq.nextval, 9, product_color, product_size
from product_info
where product_no = 1;

select * from product_info;
