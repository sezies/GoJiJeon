create table users(
        user_num int not null auto_increment,
        user_id varchar(30) not null,
        user_pw varchar(30) not null,
        user_name varchar(15) not null,
        user_bank varchar(30) not null,
        primary key(user_num)
);


drop table users;
truncate users;

insert into users(user_id,user_pw,user_name,user_bank)
value ('test','123','test','test');

select * from users;


drop table notice;

update users set()



create table notice(
        user_num int,
        notice_num int not null auto_increment,
        notice_code int not null,
        notice_title varchar(100) not null,
        pay_day varchar(50) not null,
        pay_money int not null,
        pay_bank varchar(30) not null,
        img varchar(200) not null,  
        regist_day datetime default now(),
        primary key(notice_num),
        foreign key(user_num) references users(user_num)
);

insert into notice(user_num,notice_code,notice_title,pay_day,pay_money,pay_bank,img)
value ('1','2','test고지서','2021.08.02','200000','국민은행','C:\Users\smhrd\Desktop\프로젝트3차\test1.jpg');

select * from notice where user_num='1';
select * from notice;
delete from notice where notice_num ='1';
update notice set(user_num) = '1' where(notice_num)='1';
