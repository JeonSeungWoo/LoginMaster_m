drop table simpleLogin;

CREATE TABLE simpleLogin(
userId varchar(200) primary key,
userPw varchar(600),
userNm varchar(200),
email varchar(300),
address varchar(200),
phoneNumber varchar(12)
);


select * from simpleLogin;

insert into simpleLogin( userId,userPw,userNm,email,address,phoneNumber)
values ('id','pw','nm','email','address','01099822815');





