package kr.user.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLEditorKit.Parser;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.jdbc.PreparedStatement.ParseInfo;

import kr.user.mapper.GoMapper;
import kr.user.mapper.NoticeVO;
import kr.user.mapper.UsersVO;
import kr.user.mapper.imgVO;



@Controller
public class GoController {

   // 유저부분
       @Autowired	
       GoMapper GoMapper;
	
       
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
      
      
		/* 회원가입 */
      @RequestMapping("/UsersJoin.do")
      public String UsersJoin(UsersVO vo, RedirectAttributes rttr) {
    	  
    	  System.out.println(vo.getUser_id());
    	
    	  
    	  
		/* 회원가입 정보를 모두 입력하지 않은 경우 다시 회원가입페이지로 돌아가고, DB에 담기지 않음 */
    	  if (vo.getUser_id().equals("") || vo.getUser_name().equals("") || vo.getUser_pw().equals("") || vo.getUser_bank().equals("")  )  {
    		  rttr.addFlashAttribute("msg", false);
    		  return "redirect:/join_main2.do";
    	  }
    	  else {
				/* 회원가입 정보를 모두 입력한 경우 디비에 데이터가 담기고 로그인페이지로 넘어감 */
    		  GoMapper.UsersJoin(vo);
    		  return "login_main2";
}
      }
      
      
      
      @RequestMapping("/UsersForm.do")
      public String UsersForm() {
         return "UsersForm"; //UsersForm.jsp
      }
      @RequestMapping("/UsersInsert.do")
      public String UsersInsert(UsersVO vo) {
         GoMapper.UsersInsert(vo); //정장
         return "redirect:/UsersList.do"; //WEB-INF/views//UsersList.do.jsp
         
      }
      @RequestMapping("/UsersContent.do")
      public String UsersContent(@RequestParam("user_num") int user_num, Model model) { //?idx=10
         UsersVO vo=GoMapper.UsersContent(user_num);
         model.addAttribute("vo",vo);
         return "UsersContent"; // UsersContent.jsp
      }
      // 회원 업데이트
      @RequestMapping("/UsersUpdate.do")
      public String UsersUpdate(UsersVO vo,HttpSession session,Model model) {

    	  UsersVO u_vo = null;
    	  if(session.getAttribute("login")!= null){
    	  u_vo = (UsersVO)session.getAttribute("login");
    	  int num =u_vo.getUser_num();
    	  vo.setUser_num(num);   	  
    	  System.out.println(vo.getUser_num()+"user_num");
    	  GoMapper.UsersUpdate(vo);
    	  session.setAttribute("login", vo);
    	  }
          return "redirect:/index_main.do";

      }
      
      
      
      
      @RequestMapping("/UsersDelete.do")
      public String UsersDelete(@RequestParam("user_num") int user_num) {
         GoMapper.UsersDelete(user_num);
         return "redirect:/UsersList.do";
      }
            
      @RequestMapping("/index")
      public String index_main2() {
         return "index_main";
      }
      // 로그인 리스트 불러오기
      @RequestMapping("/index_main.do")
      public String index_main(UsersVO vo,HttpSession session,HttpServletRequest request) {
    	  UsersVO u_vo = null;
    	  if(session.getAttribute("login")!= null){
    	  u_vo = (UsersVO)session.getAttribute("login");
    	  System.out.println(u_vo+"||||로그인 리스트쪽 불러온값");
    	  int num=u_vo.getUser_num();
    	  List<NoticeVO> n_list=GoMapper.NoticeList(num); //1번 고맵퍼
    	  System.out.println(num+"num의값 로그인시 리스트");
    	  request.setAttribute("n_list",n_list);
    	  session.setAttribute("n_list",n_list);
    	  }
    	  
    	  return "index_main";
      }

      /* 로그인 2*/
      @RequestMapping("/UsersLogin.do")
      public String UsersLogin(UsersVO vo,HttpSession session,Model model,HttpServletResponse response,RedirectAttributes rttr,HttpServletRequest request) throws IOException {         
               
         if(session.getAttribute("UsersLogin")!=null) {
            session.removeAttribute("UsersLogin");
         }
         UsersVO u_vo=GoMapper.UsersLogin(vo);
         
         if(u_vo!=null) {
            session.setAttribute("login", u_vo);
            System.out.println("세션넘기기성공");
            // 고지서 부르기 
            
            //
            return "redirect:/index_main.do";
         }else {
            System.out.println("세션넘기기실패");
            //로그인 실패시 문구
            rttr.addFlashAttribute("msg", false);
            //로그인 실패시 alert창
//            response.setContentType("text/html; charset=UTF-8");
//            PrintWriter out = response.getWriter();
//
//            out.println("<script language='javascript'>");
//            out.println("alert('회원정보가 잘못입력 되었습니다.')");
//            out.println("</script>");
//
//            out.flush();
            
            return "redirect:/login_main2.do";
         }
      }
      /* 로그아웃 */
      @RequestMapping("/UsersLogout.do")
      public String UsersLogout(HttpSession session) {
         session.invalidate();
         System.out.println("로그아웃성공");
         return "redirect:/index_main.do"; 
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
      
      
      
      
      // 이미지 이름 저장 하는 메소드
      @RequestMapping("/bill_upload2.do")
      public String bill_upload2(HttpSession session,NoticeVO vo) {
    	 String img =vo.getImg();
    	 System.out.println(img+"테스트 이미지 값 가져오기");
    	 session.setAttribute("img", img);
    	 
    	 
    	  
    	  
         return "bill_upload2";
      }
      
      
      
      
      
      @RequestMapping("/bill_manager.do")
      public String bill_manager() {
         return "bill_manager";
      }
      // 월별 분석 하는부분
      @RequestMapping("/bill_graph.do")
      public String bill_graph(UsersVO vo,HttpSession session,HttpServletRequest request) {
       	 UsersVO u_vo = null;
      	  if(session.getAttribute("login")!= null){
      	  u_vo = (UsersVO)session.getAttribute("login");
      	  System.out.println(u_vo+"||||로그인 리스트쪽 불러온값");
      	  int num=u_vo.getUser_num();
      	  
      	  // 비용과 날짜를 통한 리스트 불러오기 
      	  List<NoticeVO> t_list=GoMapper.testlist(num); //1번 고맵퍼
      	  session.setAttribute("t_list",t_list);
      	  System.out.println("t_list를 세션에 담았습니다"+t_list);
      	  }	  
         return "bill_graph";
      }
      
      @RequestMapping("/contact.do")
      public String contact() {
         return "contact";
      }
      
      @RequestMapping("/community.do")
      public String community() {
    	  
         return "community";
      }
      
      @RequestMapping("/mypage_main.do")
      public String mypage_main() {
         return "mypage_main";
      }
      
      
      
		/* 고지서 클릭시 고지서 번호를 받아와 select-where 행 하나 뽑아와서 객체에 남아서 내보내기 */
      @RequestMapping("/bill_contents.do")
      public String bill_contents(HttpServletRequest request, @RequestParam("notice_num") String notice_num, Model model) {
    	  
    	  System.out.println("고지서 번호 : " + notice_num);
    	  
    	  NoticeVO vo = GoMapper.NoticeOne(notice_num);
    	  
    	  model.addAttribute("vo", vo);
    	  
         return "bill_contents";
      }
      
      @RequestMapping("/comm_contents.do")
      public String comm_contents() {
         return "comm_contents";
      }
   

      // 노티스부분
      //@Autowired
      
      
      
      
      //고지서 리스트 불러오기 기능
         @RequestMapping("/NoticeList.do")
         public String NoticeList(HttpServletRequest request, @RequestParam("user_num") String user_num){
            // 데이터베이스에서 게시판리스트를 가져오기(Model-DAO-SQL)
        	 
        	 System.out.println("유저넘버 = " + user_num);
        	 
        	List<NoticeVO> list =  GoMapper.NoticeSelect(user_num);
        	
        	request.setAttribute("list", list);
            

            return "bill_manager"; //  -->viewResolver --> /WEB-INF/views/boardList.jsp
         }

         
         //github.com/2021-SMHRD-KDT-Bigdata-3/GoJiJeon.git
         @RequestMapping("/NoticeListAjax.do")
         public @ResponseBody List<NoticeVO> NoticeListAjax(NoticeVO n_vo,HttpSession session) {
          //게시판 리스트를 JSON형식으로 JS클라이언트에게 내려보낸다.
        	 int n_num = n_vo.getNotice_num();
        	 System.out.println("이쪽으로옴 번호"+n_vo.getNotice_num());
        	 
            List<NoticeVO> c_list = GoMapper.NoticeListAjax(n_num);
            System.out.println("이쪽으로옴 c_list에 담긴내용"+c_list);
            //session.setAttribute("c_list",c_list);
            return c_list; // list->JSON
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