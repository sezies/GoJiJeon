package kr.user.mapper;

import lombok.Data;

@Data
public class boardVO {

	
	
	private int user_num;
	private String user_id;
	private int board_num;
	private String board_title;
	private String board_content;
	private String board_img;
	private String board_day;
}
