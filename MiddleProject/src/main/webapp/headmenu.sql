drop sequence category_seq;
create sequence category_seq;

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
values(category_seq.nextval, '셔츠',1);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '블라우스',1);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '니트',2);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '원피스',2);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '베스트',2);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '자켓/코트',3);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '점퍼/패딩',3);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '가디건',3);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '팬츠',4);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '데님',4);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '슬랙스',4);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '숏팬츠',4);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '스커트',5);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '원피스',5);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '신발',6);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '가방',6);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '쥬얼리',7);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '머플러',7);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '양말',7);
insert into category(category_no, category_name, category_no_ref)
values(category_seq.nextval, '기타',7);