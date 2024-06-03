
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




