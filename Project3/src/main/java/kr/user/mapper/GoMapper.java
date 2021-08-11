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
	public List<NoticeVO> NoticeListAjax(int n_num); // ajax SQL
	public int NoticeSelect_notice_num();
	public int NoticeSelect_pay_money(int user_num);
	// 고지서 셀렉터
	public List<NoticeVO> NoticeSelect(String user_num);
	public NoticeVO NoticeOne(String notice_num);
	
	
	// 커뮤니티
	public boardVO comm_contents(String board_num);
	
	/* 이미지 */
	public void imageInsert(imgVO vo);
	public List<imgVO> imageSelect();
	
	
	// 그래프 테스트
	public List<NoticeVO> testlist(int num);
	public void bill_upload2(NoticeVO n_vo);
	
	
	
	// 글쓰기 insert
	public void comInsert(boardVO vo);
	// 글쓰기 select
	@Select("select * from board order by board_num desc")
	public List<boardVO> communityList();
	// 글쓰기 에이젝스
	public boardVO boardListOne(int board_num);
	//회원탈퇴
	
	public void delete2(UsersVO vo);
	// 문의사항 적기
	public void contactInsert(ContactVO vo); 

	
	
	// 아이디 중복체크
	public UsersVO ID_Check(String user_id);
	
	// 카카오톡 회원 DB찾기
	public UsersVO kaselect(String user_id);
	
	
}
