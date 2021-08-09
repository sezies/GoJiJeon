package kr.user.mapper;

import lombok.Data;

@Data
public class ContactVO {
	private int user_num;
	private int contacts_num;
	private String user_mail;
	private String user_opinion;
}
