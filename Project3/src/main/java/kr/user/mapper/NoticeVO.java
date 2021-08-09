package kr.user.mapper;

import lombok.Data;

@Data
public class NoticeVO {
	private int user_num;
	private int notice_num;   
	private String notice_code;
	private String notice_title;
	private String pay_day;
	private int pay_money;
	private String pay_bank;
	private String img;
	private String regist_day;
}
