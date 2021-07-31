package kr.user.mapper;

import java.util.List;

public interface GoMapper {
	// 유저 맵퍼
	public List<UsersVO> UsersList();
	public void UsersInsert(UsersVO vo); // insert~ SQL	
	public UsersVO UsersContent(int idx); // select~ SQL
	public void UsersUpdate(UsersVO vo); // update~ SQL	
	public void UsersDelete(int idx); // delete~ SQL
	public List<UsersVO> UsersListAjax(); // ajax SQL
	public UsersVO UsersLogin(UsersVO vo); //login SQL
	
	
	
	// 노티스 맵퍼
	public List<NoticeVO> NoticeList();
	public void NoticeInsert(NoticeVO vo); // insert~ SQL
	public NoticeVO NoticeContent(int idx); // select~ SQL
	public void NoticeUpdate(NoticeVO vo); // update~ SQL	
	public void NoticeDelete(int idx); // delete~ SQL
	public List<NoticeVO> NoticeListAjax(); // ajax SQL
}
