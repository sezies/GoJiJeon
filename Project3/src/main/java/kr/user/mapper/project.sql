create table users(
        user_num int not null auto_increment,
        user_id varchar(30) not null,
        user_pw varchar(30) not null,
        user_name varchar(15) not null,
        user_bank varchar(30) not null,
        primary key(user_num)
);

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
