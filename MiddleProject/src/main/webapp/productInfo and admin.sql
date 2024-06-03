
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

DECLARE
    v_product_no NUMBER := 1;
BEGIN
    FOR i IN 2..101 LOOP
        INSERT INTO product_info (product_info_no, product_no, product_color, product_size)
        SELECT product_info_no_seq.NEXTVAL, i, product_color, product_size
        FROM product_info
        WHERE product_no = v_product_no;
    END LOOP;
END;

select * from product_info;


select * from members;

alter table qna
DROP CONSTRAINT FK_MEMBERS_TO_QNA_1;

ALTER TABLE qna
ADD CONSTRAINT FK_MEMBERS_TO_QNA_1
FOREIGN KEY (USER_ID)
REFERENCES MEMBERS (USER_ID)
ON DELETE CASCADE;

alter table basket
DROP CONSTRAINT FK_MEMBERS_TO_BASKET_1;

ALTER TABLE basket
ADD CONSTRAINT FK_MEMBERS_TO_BASKET_1
FOREIGN KEY (USER_ID)
REFERENCES MEMBERS (USER_ID)
ON DELETE CASCADE;

alter table wishlist
DROP CONSTRAINT FK_MEMBERS_TO_WISHLIST_1;

ALTER TABLE wishlist
ADD CONSTRAINT FK_MEMBERS_TO_WISHLIST_1
FOREIGN KEY (USER_ID)
REFERENCES MEMBERS (USER_ID)
ON DELETE CASCADE;

select * from members;

insert into members (user_id,user_name,user_pw,address1,address2,address3,address4,user_phone,user_email,user_resp)
values('admin','관리자','1234',12345,'대구시어쩌고','저쩌고동','몇백몇호','010-0100-0100','QWER@qwer','Admin');
insert into members (user_id,user_name,user_pw,address1,address2,address3,address4,user_phone,user_email,user_resp)
values('aaa','회원a','1234',12345,'대구시어쩌고','저쩌고동','몇백몇호','010-0100-0100','QWER@qwer','user');
insert into members (user_id,user_name,user_pw,address1,address2,address3,address4,user_phone,user_email,user_resp)
values('bbb','회원b','1234',12345,'대구시어쩌고','저쩌고동','몇백몇호','010-0100-0100','QWER@qwer','user');
insert into members (user_id,user_name,user_pw,address1,address2,address3,address4,user_phone,user_email,user_resp)
values('ccc','회원c','1234',12345,'대구시어쩌고','저쩌고동','몇백몇호','010-0100-0100','QWER@qwer','user');



create sequence qna_seq;


