package kr.user.mapper;

import lombok.Data;

@Data
public class UsersVO {
	private int user_num;
	private String user_id;
	private String user_pw;   
	private String user_name;
	private String user_bank;
}
