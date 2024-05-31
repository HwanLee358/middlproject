drop table members;
drop table qna;
drop table product_like;
drop table product_order;
drop table product_info;
drop table product_in_out;
drop table product_review;
drop table product;
drop table category;
drop table wishlist;
drop table basket;
drop table cancel_echange_return;
drop table product_order_info;


alter table qna
modify views number default 0;

alter table qna
modify creation_date default sysdate;


CREATE TABLE MEMBERS (
	user_id	varchar2(30)		NOT NULL,
	user_name	varchar2(50)		NOT NULL,
	user_pw	varchar2(50)		NOT NULL,
	address1	varchar2(50)		NULL,
	address2	varchar2(50)		NULL,
	address3	varchar2(50)		NULL,
	address4	varchar2(50)		NULL,
	user_phone	varchar2(20)		NOT NULL,
	user_email	varchar2(100)		NOT NULL,
	user_resp	varchar2(30)	DEFAULT 'user'
);

CREATE TABLE PRODUCT (
	product_no	number		NOT NULL,
	CATEGORY_NO	NUMBER		NOT NULL,
	product_name	varchar2(100)		NOT NULL,
	product_price	number		NOT NULL,
	product_img	varchar2(200)		NOT NULL,
	product_date	date	DEFAULT sysdate,
	product_detail_img	varchar2(200)		NOT NULL
);

CREATE TABLE product_order (
	order_no	number		NOT NULL,
	user_id	varchar2(30)		NOT NULL,
	product_info_no	number		NOT NULL,
	user_name	varchar2(30)		NOT NULL,
	product_date	date	DEFAULT sysdate,
	user_phone	varchar(20)		NOT NULL,
	user_email	varchar2(100)		NOT NULL,
	address1	varchar2(50)		NOT NULL,
	address2	varchar2(50)		NOT NULL,
	address3	varchar2(50)		NOT NULL,
	address4	varchar2(50)		NULL,
	order_state	varchar2(25)		NOT NULL
);

CREATE TABLE wishlist (
	wishlist_no	number		NOT NULL,
	product_no	number		NOT NULL,
	user_id	varchar2(30)		NOT NULL
);

CREATE TABLE basket (
	basket_no	number		NOT NULL,
	product_info_no	number		NOT NULL,
	user_id	varchar2(30)		NOT NULL,
	product_cnt	number		NOT NULL
);

CREATE TABLE product_review (
	view_no	number		NOT NULL,
	user_id	varchar2(30)		NOT NULL,
	product_no	number		NOT NULL,
	view_score	number		NULL,
	content	varchar2(200)		NOT NULL,
	view_date	date	DEFAULT sysdate,
	review_img	varchar2(200)		NULL
);

CREATE TABLE QNA (
	post_no	number		NOT NULL,
	user_id	varchar2(30)		NOT NULL,
	product_no	number		NOT NULL,
	post_title	varchar2(50)		NOT NULL,
	content	varchar2(100)		NOT NULL,
	creation_date	date		NULL,
	views	number	DEFAULT 0
);

CREATE TABLE cancel_echange_return (
	cancel_echange_return_no	number		NOT NULL,
	user_id	varchar2(30)		NOT NULL,
	order_no	number		NOT NULL,
	order_state	varchar2(50)		NOT NULL,
	receipt_title	varchar2(50)		NOT NULL,
	receipt_date	date	DEFAULT sysdate,
	order_progress	varchar2(50)		NOT NULL,
	completion_date	date		NULL
);

CREATE TABLE CATEGORY (
	CATEGORY_NO	NUMBER		NOT NULL,
	CATEGORY_NAME	VARCHAR2(50)		NOT NULL,
	CATEGORY_NO_REF	NUMBER		NULL
);

CREATE TABLE product_info (
	product_info_no	number		NOT NULL,
	product_no	number		NOT NULL,
	product_color	varchar2(50)		NOT NULL,
	product_size	varchar2(50)		NOT NULL
);

CREATE TABLE product_order_info (
	order_info_no	number		NOT NULL,
	order_no	number		NOT NULL,
	product_cnt	number		NOT NULL,
	product_price	varchar2(50)		NOT NULL
);

ALTER TABLE MEMBERS ADD CONSTRAINT PK_MEMBERS PRIMARY KEY (
	user_id
);

ALTER TABLE PRODUCT ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	product_no
);

ALTER TABLE product_order ADD CONSTRAINT PK_PRODUCT_ORDER PRIMARY KEY (
	order_no
);

ALTER TABLE wishlist ADD CONSTRAINT PK_WISHLIST PRIMARY KEY (
	wishlist_no,
	product_no,
	user_id
);

ALTER TABLE basket ADD CONSTRAINT PK_BASKET PRIMARY KEY (
	basket_no,
	product_info_no,
	user_id
);

ALTER TABLE product_review ADD CONSTRAINT PK_PRODUCT_REVIEW PRIMARY KEY (
	view_no,
	user_id
);

ALTER TABLE QNA ADD CONSTRAINT PK_QNA PRIMARY KEY (
	post_no,
	user_id,
	product_no
);

ALTER TABLE cancel_echange_return ADD CONSTRAINT PK_CANCEL_ECHANGE_RETURN PRIMARY KEY (
	cancel_echange_return_no,
	user_id,
	order_no
);

ALTER TABLE CATEGORY ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (
	CATEGORY_NO
);

ALTER TABLE product_info ADD CONSTRAINT PK_PRODUCT_INFO PRIMARY KEY (
	product_info_no,
	product_no
);

ALTER TABLE product_order_info ADD CONSTRAINT PK_PRODUCT_ORDER_INFO PRIMARY KEY (
	order_info_no,
	order_no
);

ALTER TABLE wishlist ADD CONSTRAINT FK_PRODUCT_TO_wishlist_1 FOREIGN KEY (
	product_no
)
REFERENCES PRODUCT (
	product_no
);

ALTER TABLE wishlist ADD CONSTRAINT FK_MEMBERS_TO_wishlist_1 FOREIGN KEY (
	user_id
)
REFERENCES MEMBERS (
	user_id
);

ALTER TABLE basket ADD CONSTRAINT FK_product_info_TO_basket_1 FOREIGN KEY (
	product_info_no
)
REFERENCES product_info (
	product_info_no
);

ALTER TABLE basket ADD CONSTRAINT FK_MEMBERS_TO_basket_1 FOREIGN KEY (
	user_id
)
REFERENCES MEMBERS (
	user_id
);

ALTER TABLE product_review ADD CONSTRAINT FK_MEMBERS_TO_product_review_1 FOREIGN KEY (
	user_id
)
REFERENCES MEMBERS (
	user_id
);

ALTER TABLE QNA ADD CONSTRAINT FK_MEMBERS_TO_QNA_1 FOREIGN KEY (
	user_id
)
REFERENCES MEMBERS (
	user_id
);

ALTER TABLE QNA ADD CONSTRAINT FK_PRODUCT_TO_QNA_1 FOREIGN KEY (
	product_no
)
REFERENCES PRODUCT (
	product_no
);

ALTER TABLE cancel_echange_return ADD CONSTRAINT FK_MEMBERS_TO_cancel_echange_return_1 FOREIGN KEY (
	user_id
)
REFERENCES MEMBERS (
	user_id
);

ALTER TABLE cancel_echange_return ADD CONSTRAINT FK_product_order_TO_cancel_echange_return_1 FOREIGN KEY (
	order_no
)
REFERENCES product_order (
	order_no
);

ALTER TABLE product_info ADD CONSTRAINT FK_PRODUCT_TO_product_info_1 FOREIGN KEY (
	product_no
)
REFERENCES PRODUCT (
	product_no
);

ALTER TABLE product_order_info ADD CONSTRAINT FK_product_order_TO_product_order_info_1 FOREIGN KEY (
	order_no
)
REFERENCES product_order (
	order_no
);

