package kr.user.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.user.mapper.NoticeVO;
import kr.user.mapper.UsersVO;



@Controller
public class GoController {

	// 유저부분
	
		@Autowired
		private kr.user.mapper.GoMapper GoMapper;
		
		// HandLerMapping : 요청URL <--> Method
		@RequestMapping("/UsersList.do")
		public String UsersList(HttpServletRequest request){
			// 데이터베이스에서 게시판리스트를 가져오기(Model-DAO-SQL)
			List<UsersVO> list=GoMapper.UsersList();		
			request.setAttribute("list",list);
			return "UsersList"; //  -->viewResolver --> /WEB-INF/views/boardList.jsp
		}
		@RequestMapping("/UsersListAjax.do")
		public @ResponseBody List<UsersVO> UsersListAjax() {
	    //게시판 리스트를 JSON형식으로 JS클라이언트에게 내려보낸다.
			List<UsersVO> list = GoMapper.UsersListAjax();
			return list; // list->JSON
		}
		@RequestMapping("/UsersForm.do")
		public String UsersForm() {
			return "UsersForm"; //UsersForm.jsp
		}
		
		
		/* 회원가입 */
		@RequestMapping("/UsersInsert.do")
		public String UsersInsert(UsersVO vo) {
			GoMapper.UsersInsert(vo); //정장
			return "login_main2"; //WEB-INF/views//UsersList.do.jsp
			
		}
		
		/* 로그인 */
		@RequestMapping("/UsersLogin.do")
		public String UsersLogin(UsersVO vo) {
			GoMapper.UsersLogin(vo); //정장
			return "index_main"; //WEB-INF/views//UsersList.do.jsp
			
		}
		
		
		
		
		
		@RequestMapping("/UsersContent.do")
		public String UsersContent(@RequestParam("user_num") int user_num, Model model) { //?idx=10
			UsersVO vo=GoMapper.UsersContent(user_num);
			model.addAttribute("vo",vo);
			return "UsersContent"; // UsersContent.jsp
		}
		@RequestMapping("/UsersUpdate.do")
		public String UsersUpdate(UsersVO vo) {
			GoMapper.UsersUpdate(vo);
			return "redirect:/UsersList.do";
		}
		@RequestMapping("/UsersDelete.do")
		public String UsersDelete(@RequestParam("user_num") int user_num) {
			GoMapper.UsersDelete(user_num);
			return "redirect:/UsersList.do";
		}
		
		@RequestMapping("/index_main.do")
		public String index_main() {
			return "index_main";
		}
		
		@RequestMapping("/login_main.do")
		public String login_main() {
			return "login_main";
		}
		
		@RequestMapping("/login_main2.do")
		public String login_main2() {
			return "login_main2";
		}
		
		@RequestMapping("/join_main.do")
		public String join_main() {
			return "join_main";
		}
		
		@RequestMapping("/join_main2.do")
		public String join_main2() {
			return "join_main2";
		}
		
		@RequestMapping("/bill_upload.do")
		public String bill_upload() {
			return "bill_upload";
		}
	

		// 노티스부분
		//@Autowired
			@RequestMapping("/NoticeList.do")
			public String NoticeList(HttpServletRequest request){
				// 데이터베이스에서 게시판리스트를 가져오기(Model-DAO-SQL)
				List<NoticeVO> list=GoMapper.NoticeList();		
				request.setAttribute("list",list);
				return "NoticeList"; //  -->viewResolver --> /WEB-INF/views/boardList.jsp
			}
			@RequestMapping("/NoticeListAjax.do")
			public @ResponseBody List<NoticeVO> NoticeListAjax() {
		    //게시판 리스트를 JSON형식으로 JS클라이언트에게 내려보낸다.
				List<NoticeVO> list = GoMapper.NoticeListAjax();
				return list; // list->JSON
			}
			@RequestMapping("/NoticeForm.do")
			public String NoticeForm() {
				return "NoticeForm"; //NoticeForm.jsp
			}
			@RequestMapping("/NoticeInsert.do")
			public String NoticeInsert(NoticeVO vo) {
				GoMapper.NoticeInsert(vo); //정장
				return "redirect:/NoticeList.do"; //WEB-INF/views//UsersList.do.jsp
				
			}
			@RequestMapping("/NoticeContent.do")
			public String NoticeContent(@RequestParam("notice_num") int notice_num, Model model) { //?idx=10
				NoticeVO vo=GoMapper.NoticeContent(notice_num);
				model.addAttribute("vo",vo);
				return "NoticeContent"; // NoticeContent.jsp
			}
			@RequestMapping("/NoticeUpdate.do")
			public String NoticeUpdate(NoticeVO vo) {
				GoMapper.NoticeUpdate(vo);
				return "redirect:/NoticeList.do";
			}
			@RequestMapping("/NoticeDelete.do")
			public String NoticeDelete(@RequestParam("notice_num") int notice_num) {
				GoMapper.NoticeDelete(notice_num);
				return "redirect:/NoticeList.do";
			}
	 
	
	
}
