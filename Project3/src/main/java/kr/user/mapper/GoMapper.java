package kr.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface GoMapper {
	// 유저 맵퍼
	public List<UsersVO> UsersList();
	public void UsersInsert(UsersVO vo); // insert~ SQL
	public UsersVO UsersContent(int idx); // select~ SQL
	public void UsersUpdate(UsersVO vo); // update~ SQL	
	public void UsersDelete(int idx); // delete~ SQL
	public List<UsersVO> UsersListAjax(); // ajax SQL
	
	/* 회원가입 */
	public void UsersJoin(UsersVO vo);
	
	public UsersVO UsersLogin(UsersVO vo); // select~ SQL
	
	// 노티스 맵퍼패
	
	public List<NoticeVO> NoticeList(int num);
	public void NoticeInsert(NoticeVO vo); // insert~ SQL
	public NoticeVO NoticeContent(int user_num); // select~ SQL
	public void NoticeUpdate(NoticeVO vo); // update~ SQL	
	public void NoticeDelete(int idx); // delete~ SQL
	public List<NoticeVO> NoticeListAjax(); // ajax SQL
	
	// 고지서 셀렉터
	public List<NoticeVO> NoticeSelect(String user_num);
	
	
	/* 이미지 */
	public void imageInsert(imgVO vo);
	public List<imgVO> imageSelect();
	
	
	// 그래프 테스트
	public List<NoticeVO> testlist(int num);
	
}
