CREATE TABLE CATEGORY (
	CATEGORY_NO	NUMBER		NOT NULL,
	CATEGORY_NAME	VARCHAR2(50)		NOT NULL,
	CATEGORY_NO_REF	NUMBER		NULL
);

select * from category;
create sequence category_seq;
insert into category(category_no, category_name)
values(category_seq.nextval, 'BEST');
insert into category(category_no, category_name)
values(category_seq.nextval, 'NEW');
insert into category(category_no, category_name)
values(category_seq.nextval, 'TOP');
insert into category(category_no, category_name)
values(category_seq.nextval, 'SHIRT/BLOUSE');
insert into category(category_no, category_name)
values(category_seq.nextval, 'KNIT');
insert into category(category_no, category_name)
values(category_seq.nextval, 'OUTER');
insert into category(category_no, category_name)
values(category_seq.nextval, 'PANTS');
insert into category(category_no, category_name)
values(category_seq.nextval, 'SKIRT/DRESS');
insert into category(category_no, category_name)
values(category_seq.nextval, 'BAG/SHOES');
insert into category(category_no, category_name)
values(category_seq.nextval, 'ACC');

insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '니트티/베스트',3);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '셔츠/블라우스',3);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '맨투맨/후드',3);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '티셔츠',3);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '셔츠',4);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '블라우스',4);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '니트',5);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '원피스',5);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '베스트',5);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '자켓/코트',6);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '점퍼/패딩',6);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '가디건',6);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '팬츠',7);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '데님',7);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '슬랙스',7);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '숏팬츠',7);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '스커트',8);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '원피스',8);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '신발',9);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '가방',9);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '쥬얼리',10);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '머플러',10);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '양말',10);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '기타',10);