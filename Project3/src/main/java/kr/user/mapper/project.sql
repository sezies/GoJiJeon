drop table board;
drop table notice;
drop table contacts;
drop table users ;


create table users(
        user_num int not null auto_increment,
        user_id varchar(30) not null unique,
        user_pw varchar(30) not null,
        user_name varchar(15) not null,
        user_bank varchar(30) not null,
        primary key(user_num)
);


select * from users;

-----------------이거 만들분 모집-----------------
create table contacts(
        user_num int,
        contacts_num int not null auto_increment,
        user_mail varchar(50) not null,
		user_opinion VARCHAR(2000) not null,
        primary key(contacts_num),
        foreign key(user_num) references users(user_num)
);
drop table contacts;
select * from contacts;
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-Bigdata-3/GoJiJeon.git

drop table users;
truncate users;

insert into users(user_id,user_pw,user_name,user_bank)
value ('test','123','test','test');

insert into users(user_id,user_pw,user_name,user_bank)
value ('kite','123','KITE','광주');


--유저 가데이터
insert into users(user_id,user_pw,user_name,user_bank)
value ('박세욱','123','박세욱','광주');
insert into users(user_id,user_pw,user_name,user_bank)
value ('신현준','123','신현준','농협');
insert into users(user_id,user_pw,user_name,user_bank)
value ('나연호','123','나연호','신한');




select * from users where user_num="";
delete from users where user_num ='2';

drop table notice;

update users set()



create table notice(
        user_num int,
        notice_num int not null auto_increment,
        notice_code varchar(50) not null,
        notice_title varchar(100) not null,
        pay_day varchar(50) not null,
        pay_money int not null,
        pay_bank varchar(30) not null,
        img varchar(200) not null,  
        regist_day TIMESTAMP DEFAULT NOW(),
        primary key(notice_num),
        foreign key(user_num) references users(user_num)
);

-- 고지서 가데이터 ( 유저 1~3번까지 )
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '관리비', '1월달 관리비', '2021.01.24', '78900', '농협', 'car_sample2.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '관리비', '2월달 관리비', '2021.02.22', '85650', '광주', 'car_sample3.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (1, '관리비', '3월달 관리비', '2021.03.11', '90650', '우리', 'car_sample5.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (1, '관리비', '4월달 관리비', '2021.04.12', '120260', '신협', 'car_sample3.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (1, '관리비', '5월달 관리비', '2021.05.24', '90520', '부산', 'car_sample3.jpg');
	
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (1, '자동차세', '11월달 자동차세', '2020.11.24', '95025', '토스', 'car_sample10.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (1, '자동차세', '5월달 자동차세', '2020.05.24', '156120', '부산', 'car_sample3.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (1, '지방세', '12월달 지방세', '2020.12.24', '12600', '카카오뱅크', 'car_sample7.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (1, '지방세', '12월달 지방세', '2019.12.24', '14120', '토스', 'car_sample5.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (1, '주민세', '12월달 주민세', '2020.12.24', '12050', '신협', 'car_sample7.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (1, '주민세', '6월달 지방세', '2019.06.24', '1330', '토스', 'car_sample3.jpg');
	
	
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '관리비', '1월달 관리비', '2021.01.24', '78900', '농협', 'car_sample2.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '관리비', '2월달 관리비', '2021.02.22', '85650', '광주', 'car_sample3.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '관리비', '3월달 관리비', '2021.03.11', '90650', '우리', 'car_sample5.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '관리비', '4월달 관리비', '2021.04.12', '120260', '신협', 'car_sample3.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '관리비', '5월달 관리비', '2021.05.24', '90520', '부산', 'car_sample3.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '자동차세', '11월달 자동차세', '2020.11.24', '95025', '토스', 'car_sample10.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '자동차세', '5월달 자동차세', '2020.05.24', '156120', '부산', 'car_sample3.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '지방세', '12월달 지방세', '2020.12.24', '12600', '카카오뱅크', 'car_sample7.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '지방세', '12월달 지방세', '2019.12.24', '14120', '토스', 'car_sample5.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '주민세', '12월달 주민세', '2020.12.24', '12050', '신협', 'car_sample7.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (2, '주민세', '6월달 지방세', '2019.06.24', '1330', '토스', 'car_sample3.jpg');
	
	
	
	
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '관리비', '1월달 관리비', '2021.01.24', '78900', '농협', 'car_sample2.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '관리비', '2월달 관리비', '2021.02.22', '85650', '광주', 'car_sample3.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '관리비', '3월달 관리비', '2021.03.11', '90650', '우리', 'car_sample5.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '관리비', '4월달 관리비', '2021.04.23', '120260', '신협', 'car_sample3.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '관리비', '5월달 관리비', '2021.05.24', '90520', '부산', 'car_sample3.jpg');
	
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '자동차세', '11월달 자동차세', '2020.11.24', '95025', '토스', 'car_sample10.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '자동차세', '5월달 자동차세', '2020.05.24', '156120', '부산', 'car_sample3.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '지방세', '12월달 지방세', '2020.12.24', '12600', '카카오뱅크', 'car_sample7.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '지방세', '12월달 지방세', '2019.12.24', '14120', '토스', 'car_sample5.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '주민세', '12월달 주민세', '2020.12.24', '12050', '신협', 'car_sample7.jpg');
	
	insert into notice(user_num, notice_code, notice_title, pay_day, pay_money, pay_bank, img)
	value (3, '주민세', '6월달 지방세', '2019.06.24', '1330', '토스', 'car_sample3.jpg');
	
	
	
	
	
	
select pay_money, user_num from notice order by pay_day desc;
	
select * from notice where user_num='1';
select * from notice;
drop table notice;
select * from notice where user_num='1' order by pay_day desc limit 1;
insert into notice(notice_code,img) values('1','car_sample1.jpg')

--이미지 테스트
create table test_img (

img varchar(200) not null

)

select * from test_img;

insert into test_img(img)
values ('car_sample1.jpg')

drop table test_img;

delete from notice where notice_code ='과태료';
update notice set(user_num) = '1' where(notice_num)='1';






-- 게시판 board

create table board(
        user_num int,
        user_id varchar(30),
        board_num int not null auto_increment,
        board_title varchar(100) not null,
        board_content varchar(500) not null,
        board_img varchar(200) not null,  
        board_day TIMESTAMP DEFAULT NOW(),
        primary key(board_num),
        foreign key(user_num) references users(user_num),
        foreign key(user_id) references users(user_id)
);



	insert into board(board_title, board_content, board_img)
	value ('고지서관련 질문', '이사한지 얼마안됐는데요. 이 건물이 cmb단체가입이되어있는 건물입니다. 관리비는 따로 안내고 그냥 제가 쓴 전기세 수도세 등만 내면됩니다. 그런데 집주인분께서 인터넷비용은 내주시는데 tv는 제가 내야한다고 해서요. 그럼 tv이용료가 전기세나 수도세 고지서에 같이 오는건가요? ', 'car_sample3.jpg');
	
	insert into board(board_title, board_content, board_img)
	value ('도시가스 고지서', '제가 경기도에서 자취를 하는데 2달 전 까지만 해도 가스 고지서가 매달 잘 나오더니 저번 달 부터 갑자기 가스 고지서가 안나오더라고요? 그래서 뭔가 불안하네요..', 'car_sample7.jpg');
	
	insert into board(board_title, board_content, board_img)
	value ('원룸 전기세 고지서 질문이요!', '어제 제이름으로 전기세, 집주인분 이름으로 심야 전기 고지서가 두개가 날라왔는데 둘다 10월23일자부터 12월 23일까지 기간이 적혀있더라고요.
제 이름으로 날라온 전기세는 기본 2천원 정도이구요.
그리고 저는 원룸을 12월 19일에 입주했고 심야 전기 난방을 5일밖에 안 쓴셈인데 2만7천원이 나왔어요 집주인한테 얘기하니깐 제가 입주하기 전에 15일에 입주하는줄 알고 두밤 정도 돌렸다가 끄고 다시 제가 입주하기 하루 전날 18일에 난방을 돌렸다 이러시더라구요 그리고 만원은 자기가 내주신다고만 하는데 이게 맞나요..?전 난방을 5일 쓴셈이고
나머지 돈을 부담을 하는거는 먼가 부당한거 같기도해서 제가 잘못된건지 듣고싶네요ㅠ', 'car_sample10.jpg');
	
	insert into board(board_title, board_content, board_img)
	value ('고지서 전입 전출 질문', '안녕하세요
12월 계약인 집을 이번에 사정으로 방을 내놓고 본가로 들어왔는데요
아직까지 방이 안나가서 그대로 월세 주고 있습니다.
제가 전입신고를 원룸으로 해놔서 고지서나 전기세우편이 다 거기로 가는데 이거 본가로 받을 수 있는 방법있나요? 아니면 다시 본가로 전입신고를 해야하나요?', 'car_sample3.jpg');
	
	insert into board(board_title, board_content, board_img)
	value ('전기세 고지서', '6월 11일에 이사를 왔는데 고지서가 아직 안왔어요. 전기세를 6/11~6/30일까지 전기세를 내는건가요? 아니면 6/11~7/10일까지의 전기세를 납부하는 걸까요?
전자라면 고지서가 안왔는데 한전에 연락을 해봐야할까요?
난방비는 어떻게 되는지도 알려주세요!ㅠㅠ', 'car_sample5.jpg');
	
	insert into board(board_title, board_content, board_img)
	value ('관리비 고지서', ' 원룸에 살고 있는데 처음부터 고지서 있는지 없는지 확인도 안하고 주인이 얼마나왔다고 하면
그냥 드리고 했는데 원래 원룸은 전기세나 난방비등의 고지서가 따로 없나여?

한 6개월전 최초입주때 3만원정도냈었는데 이번달에 따블이상으로 나왔습니다.

인터넷이나 수도는 무료이고 전기세 난방비만 내면된다고 하셨거든요.

체감상 실제 쓴양보다 많이 받는다는 생각도 들고 지금 몇달째 계속 관리비가 늘어나고 있거든요. ', 'car_sample2.jpg');





delete from board where user_num ='3';

select * from board;


drop table board;



