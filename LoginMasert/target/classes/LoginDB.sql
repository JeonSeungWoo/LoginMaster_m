drop table tbl_login;

CREATE TABLE tbl_login(
userId varchar(200) primary key,
userPw varchar(600),
userNm varchar(200),
email varchar(300),
address varchar(200)
);


select * from tbl_login;

insert into tbl_login( userId,userPw,userNm,email,address)
values ('id','pw','nm','email','address');