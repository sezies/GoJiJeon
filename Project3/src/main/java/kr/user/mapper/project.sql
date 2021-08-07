create table users(
        user_num int not null auto_increment,
        user_id varchar(30) not null unique,
        user_pw varchar(30) not null,
        user_name varchar(15) not null,
        user_bank varchar(30) not null,
        primary key(user_num)
);

-----------------이거 만들분 모집-----------------
create table contacts(
        user_num int not null auto_increment,
        user_id varchar(30) not null unique,
        user_mail varchar(30) not null unique,
		user_opinion VARCHAR(2000) not null
        primary key(user_num)
);


drop table users;
truncate users;

insert into users(user_id,user_pw,user_name,user_bank)
value ('test','123','test','test');

insert into users(user_id,user_pw,user_name,user_bank)
value ('kite','123','KITE','광주');


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
        regist_day TIMESTAMP DEFAULT NOW(),
        primary key(notice_num),
        foreign key(user_num) references users(user_num)
);

	insert into notice(user_num,notice_code,notice_title,pay_day,pay_money,pay_bank,img)
	value (1, '1','test고지서3','2021.03.22','450000','국민은행','C:\Users\smhrd\Desktop\프로젝트3차\test1.jpg');

	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '3', '전기세', '2021.05.24', '30000', '농협', 'car_sample2.jpg')
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '3', '수도세', '2021.06.22', '25000', '광주', 'car_sample3.jpg')
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '3', '전기세', '2021.07.11', '10000', '우리', 'car_sample5.jpg')
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '3', '전기세', '2021.08.42', '25000', '신협', 'car_sample3.jpg')
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '3', '전기세', '2021.09.24', '80000', '부산', 'car_sample3.jpg')
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '3', '수도세', '2021.10.24', '111100', '카카오뱅크', 'car_sample7.jpg')
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '3', '전기세', '2021.11.24', '78200', '토스', 'car_sample10.jpg')
	
select * from notice where user_num='1';
select * from notice;
drop table notice;
select * from notice where user_num='1' order by pay_day desc;
insert into notice(notice_code,img) values('1','car_sample1.jpg')

--이미지 테스트
create table test_img (

img varchar(200) not null

)

select * from test_img;

insert into test_img(img)
values ('car_sample1.jpg')

drop table test_img;

delete from notice where notice_code ='0';
update notice set(user_num) = '1' where(notice_num)='1';
