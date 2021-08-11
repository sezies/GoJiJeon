package kr.user.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLEditorKit.Parser;
import javax.xml.ws.Response;

import org.apache.http.HttpConnection;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement.ParseInfo;

import kr.user.mapper.ContactVO;
import kr.user.mapper.GoMapper;
import kr.user.mapper.NoticeVO;
import kr.user.mapper.OAuthToken;
import kr.user.mapper.UsersVO;
import kr.user.mapper.boardVO;
import kr.user.mapper.imgVO;


@Controller
public class GoController {

   // 유저부분
   @Autowired
   GoMapper GoMapper;

   // HandLerMapping : 요청URL <--> Method
   @RequestMapping("/UsersList.do")
   public String UsersList(HttpServletRequest request) {
      // 데이터베이스에서 게시판리스트를 가져오기(Model-DAO-SQL)
      List<UsersVO> list = GoMapper.UsersList();
      request.setAttribute("list", list);
      return "UsersList"; // -->viewResolver --> /WEB-INF/views/boardList.jsp
   }

   @RequestMapping("/UsersListAjax.do")
   public @ResponseBody List<UsersVO> UsersListAjax() {
      // 게시판 리스트를 JSON형식으로 JS클라이언트에게 내려보낸다.
      List<UsersVO> list = GoMapper.UsersListAjax();
      return list; // list->JSON
   }

   /* 회원가입 */
   @RequestMapping("/UsersJoin.do")
   public String UsersJoin(UsersVO vo, RedirectAttributes rttr) {

      System.out.println(vo.getUser_id());

      /* 회원가입 정보를 모두 입력하지 않은 경우 다시 회원가입페이지로 돌아가고, DB에 담기지 않음 */
      if (vo.getUser_id().equals("") || vo.getUser_name().equals("") || vo.getUser_pw().equals("")
            || vo.getUser_bank().equals("")) {
         rttr.addFlashAttribute("msg", false);
         return "redirect:/join_main2.do";
      } else {
         /* 회원가입 정보를 모두 입력한 경우 디비에 데이터가 담기고 로그인페이지로 넘어감 */
         GoMapper.UsersJoin(vo);
         return "login_main2";
      }
   }

   @RequestMapping("/Join.do")
   public String Join() {
      return "join_main2";
   }

   @RequestMapping("/UsersForm.do")
   public String UsersForm() {
      return "UsersForm"; // UsersForm.jsp
   }

   @RequestMapping("/UsersInsert.do")
   public String UsersInsert(UsersVO vo) {
      GoMapper.UsersInsert(vo); // 정장
      return "redirect:/UsersList.do"; // WEB-INF/views//UsersList.do.jsp

   }

   @RequestMapping("/UsersContent.do")
   public String UsersContent(@RequestParam("user_num") int user_num, Model model) { // ?idx=10
      UsersVO vo = GoMapper.UsersContent(user_num);
      model.addAttribute("vo", vo);
      return "UsersContent"; // UsersContent.jsp
   }

   // 회원 업데이트
   @RequestMapping("/UsersUpdate.do")
   public String UsersUpdate(UsersVO vo, HttpSession session, Model model) {

      UsersVO u_vo = null;
      if (session.getAttribute("login") != null) {
         u_vo = (UsersVO) session.getAttribute("login");
         int num = u_vo.getUser_num();
         vo.setUser_num(num);
         System.out.println(vo.getUser_num() + "user_num");
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
   public String index_main(UsersVO vo, HttpSession session, HttpServletRequest request) {
      UsersVO u_vo = null;
      if (session.getAttribute("login") != null) {
         u_vo = (UsersVO) session.getAttribute("login");
         int num = u_vo.getUser_num();
         List<NoticeVO> n_list = GoMapper.NoticeList(num); // 1번 고맵퍼
         request.setAttribute("n_list", n_list);
         session.setAttribute("n_list", n_list);
      }

      return "index_main";
   }

   /* 로그인 2 */
   @RequestMapping("/UsersLogin.do")
   public String UsersLogin(UsersVO vo, HttpSession session, Model model, HttpServletResponse response,
         RedirectAttributes rttr, HttpServletRequest request) throws IOException {

      if (session.getAttribute("UsersLogin") != null) {
         session.removeAttribute("UsersLogin");
      }
      UsersVO u_vo = GoMapper.UsersLogin(vo);

      if (u_vo != null) {
         session.setAttribute("login", u_vo);
         System.out.println("세션넘기기성공");
         // 고지서 부르기

         //
         return "redirect:/index_main.do";
      } else {
         System.out.println("세션넘기기실패");
         // 로그인 실패시 문구
         rttr.addFlashAttribute("msg", false);
         // 로그인 실패시 alert창
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
      // 세션 삭제
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

   // 회원 탈퇴 부분
   @RequestMapping("/delete.do")
   public String delete() {
      return "delete";
   }

   // 회원 탈퇴 부분
   @RequestMapping("/delete2.do")
   public String delete2(UsersVO vo, HttpSession session, RedirectAttributes rttr, HttpServletResponse response) {
      UsersVO u_vo = null;
      if (session.getAttribute("login") != null) {
         u_vo = (UsersVO) session.getAttribute("login");
      }
      if (u_vo.getUser_id().equals(vo.getUser_id()) && u_vo.getUser_pw().equals(vo.getUser_pw())) {
         GoMapper.delete2(vo);
         System.out.println("회원탈퇴 성공");
         session.invalidate();
         return "redirect:/index_main.do";
      } else {
         System.out.println("회원탈퇴 실패");
         rttr.addFlashAttribute("msg", false);
         return "redirect:/delete.do";
      }

   }

   // 이미지 이름 저장 하는 메소드
   @RequestMapping("/bill_upload2.do")
   public String bill_upload2(MultipartHttpServletRequest mhsr, HttpSession session, HttpServletRequest request)
         throws IOException {
//         String path = "C:/Users/smhrd/git/GoJiJeon/Project3/src/main/webapp/resources/img";

         mhsr.setCharacterEncoding("UTF-8");
         String path = mhsr.getSession().getServletContext().getRealPath("/resources/img");
         
         
         
         Map returnObject = new HashMap();
         try {
            // MultipartHttpServletRequest 생성 
            Iterator iter = mhsr.getFileNames();
            System.out.println(iter);
            MultipartFile mfile = null;
            String fieldName = "";
            List resultList = new ArrayList();
            
          // 값이 나올때까지 
              while (iter.hasNext()) { 
                  fieldName = (String) iter.next(); // 내용을 가져와서 
                  mfile = mhsr.getFile(fieldName); 
                  String origName; 
//                  origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
                  origName = new String(mfile.getOriginalFilename()); //한글꺠짐 방지 
                  
                  request.setCharacterEncoding("utf-8");
                  request.setAttribute("img", origName);;
                  session.setAttribute("path", path);
                  System.out.println("경로입니다"+path);
                  System.out.println("origName: " + origName);
                  // 파일명이 없다면 
                  if ("".equals(origName)) {
                      continue; 
                  } 
                  
                  String saveFileName = origName;
                  
                  System.out.println("saveFileName : " + saveFileName);
                  
                  // 설정한 path에 파일저장 
                  File serverFile = new File(path + File.separator + saveFileName);
                  mfile.transferTo(serverFile);
                  
                  Map file = new HashMap();
                  file.put("origName", origName); file.put("sfile", serverFile);
                  resultList.add(file);
              }
              
              returnObject.put("files", resultList); 
              returnObject.put("params", mhsr.getParameterMap()); 
              } catch(Exception e) {
                 e.printStackTrace();
         }
         return "bill_upload2";
      }
      
   @RequestMapping("/bill_manager.do")
   public String bill_manager() {
      return "bill_manager";
   }

   // 월별 분석 하는부분
   @RequestMapping("/bill_graph.do")
   public String bill_graph(UsersVO vo, HttpSession session, HttpServletRequest request) {
      UsersVO u_vo = null;
      if (session.getAttribute("login") != null) {
         u_vo = (UsersVO) session.getAttribute("login");
         System.out.println(u_vo + "||||로그인 리스트쪽 불러온값");
         int num = u_vo.getUser_num();

         // 비용과 날짜를 통한 리스트 불러오기
         List<NoticeVO> t_list = GoMapper.testlist(num); // 1번 고맵퍼
         session.setAttribute("t_list", t_list);
         int recently_money = GoMapper.NoticeSelect_pay_money(num);
         request.setAttribute("recently_money", recently_money);
      }
      return "bill_graph";
   }

   @RequestMapping("/contact.do")
   public String contact() {
      return "contact";
   }

   // 문의사항 적기
   @RequestMapping("/contactInsert.do")
   public String contactInsert(ContactVO vo, HttpServletResponse response) throws IOException {
      if (vo.getUser_mail().equals("") || vo.getUser_opinion().equals("")) {
         System.out.println("이쪽으로 들어옴111111111");
         return "contact";
      } else {

         GoMapper.contactInsert(vo);
         System.out.println("문의 잘저장됨" + vo);
         return "contact";
      }

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
   public String bill_contents(HttpServletRequest request, @RequestParam("notice_num") String notice_num,
         Model model) {

      System.out.println("고지서 번호 : " + notice_num);

      NoticeVO vo = GoMapper.NoticeOne(notice_num);

      model.addAttribute("vo", vo);

      return "bill_contents";
   }

   @RequestMapping("/comm_contents.do")
   public String comm_contents(@RequestParam("board_num") String board_num, Model model) {
      System.out.println("게시판번호 : " + board_num);

      boardVO vo = GoMapper.comm_contents(board_num);

      model.addAttribute("vo", vo);

      return "comm_contents";
   }

   // 노티스부분
   // @Autowired

   // 고지서 리스트 불러오기 기능
   @RequestMapping("/NoticeList.do")
   public String NoticeList(HttpServletRequest request, @RequestParam("user_num") String user_num) {
      // 데이터베이스에서 게시판리스트를 가져오기(Model-DAO-SQL)

      System.out.println("유저넘버 = " + user_num);

      List<NoticeVO> list = GoMapper.NoticeSelect(user_num);

      request.setAttribute("list", list);

      return "bill_manager"; // -->viewResolver --> /WEB-INF/views/boardList.jsp
   }

   // github.com/2021-SMHRD-KDT-Bigdata-3/GoJiJeon.git
   @RequestMapping("/NoticeListAjax.do")
   public @ResponseBody List<NoticeVO> NoticeListAjax(NoticeVO n_vo, HttpSession session) {
      // 게시판 리스트를 JSON형식으로 JS클라이언트에게 내려보낸다.
      int n_num = n_vo.getNotice_num();
      System.out.println("이쪽으로옴 번호" + n_vo.getNotice_num());

      List<NoticeVO> c_list = GoMapper.NoticeListAjax(n_num);
      System.out.println("이쪽으로옴 c_list에 담긴내용" + c_list);
      // session.setAttribute("c_list",c_list);
      return c_list; // list->JSON
   }

   @RequestMapping("/NoticeForm.do")
   public String NoticeForm() {
      return "NoticeForm"; // NoticeForm.jsp
   }

// 값집어넣기
   @RequestMapping("/NoticeInsert.do")
   public String NoticeInsert(NoticeVO vo, HttpServletRequest req, 
  		 @RequestParam("notice_json") String notice_json) throws Exception {
  	int notice_num = GoMapper.NoticeSelect_notice_num();
  	String notice_json_name = vo.getUser_num()+"_"+notice_num;
      GoMapper.NoticeInsert(vo); //정장
      JSONParser parser = new JSONParser();
      Object test_notice = parser.parse(notice_json);
      JSONObject notice_json_conv = (JSONObject) test_notice;
//      JsonObject notice_json = (JsonObject) req.getAttribute("notice_json");
      initialize(notice_json_name);
		insert_firebase(notice_json_conv, notice_json_name);
		System.out.println("firebase 서버 저장 완료");
      return "redirect:/index_main.do"; //WEB-INF/views//UsersList.do.jsp
      
   }

   // 값집어넣기
   @RequestMapping("/NoticeContent.do")
   public String NoticeContent(@RequestParam("notice_num") int notice_num, Model model) { // ?idx=10
      NoticeVO vo = GoMapper.NoticeContent(notice_num);
      model.addAttribute("vo", vo);
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

   // 글쓰기 페이지로 이동
   @RequestMapping("/comWrite.do")
   public String comWrite() {
      System.out.println("여기까지는 오나?");
      return "com_wirte";
   }

   // 글 작성 저장 insert
   @RequestMapping("/comInsert.do")
   public String comInsert(boardVO vo) {
      GoMapper.comInsert(vo);
      return "redirect:communityList.do";
   }

   // 글 리스트
   @RequestMapping("/communityList.do")
   public String communityList(HttpServletRequest request) {
      List<boardVO> list = GoMapper.communityList();
      request.setAttribute("list", list);

      System.out.println("잘가니?");
      return "community";
   }

   // 글 리스트 클릭시 에이젝스
   @RequestMapping("/boardListOne.do")
   public @ResponseBody boardVO boardListOne(@RequestParam("board_num") int board_num, Model model) {
      boardVO vo = GoMapper.boardListOne(board_num);
      model.addAttribute("vo", vo);
      return vo; // UsersContent.jsp
   }

   // 아이디 중복체크

   @RequestMapping("/ID_Check.do")
   public @ResponseBody String ID_Check(@RequestParam("user_id") String user_id) {
      System.out.println(user_id + "이곳이 유저아이디값을 받아온값");
      if (user_id.equals("")) {
         return "2";
      } else {
         UsersVO vo = GoMapper.ID_Check(user_id);
         if (vo == null) {
            System.out.println("중복아이디없음");
            return "0";
         } else {
            System.out.println("이미있는아이디");
            return "1";
         }
      }
   }

   // 카카오톡 연동
   @RequestMapping("/kakao.do")
   public String kakao(@RequestParam String code,OAuthToken ot,UsersVO u_vo,HttpSession session) {
      // 카카오톡 코드르 받아옴
      System.out.println(code + "카카오톡 코드");
      RestTemplate rt = new RestTemplate();
      // httpHeader 오브젝트 생성
      HttpHeaders headers = new HttpHeaders();
      // 현재 http 형식이 key-value 형식임을 알린다
      headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
      // httpBoddy 오브젝트 생성
      MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
      params.add("grant_type", "authorization_code");
      params.add("client_id", "ecb5b19528bf0b940b476be09249a694");
      params.add("redirect_uri", "http://localhost:8081/controller/kakao.do");
      // 방금 받은 코드임
      params.add("code", code);
      // body data와 header값을 가지고 있는 하나의 httpEntity가 된다
      // body값 header 값을 둘다 하나로 마든다
      HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
      // http 요청하기 post방식으로 - response변수의 응답받음
      ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
            kakaoTokenRequest, String.class);
   
      //문자열 정리해주기
      String  json = response.getBody();
      System.out.println("json값"+json);
      String data[]=json.split(",");      
      String access_token[] = data[0].split(":");
      String token_type[] = data[1].split(":");
      String refresh_token[] = data[2].split(":");
      String expires_in[] = data[3].split(":");
      String scope[] = data[4].split(":");
      String refresh_token_expires_in[]=data[5].split(":");
      
      String a = access_token[1].replace("\"","");
      String t = token_type[1].replace("\"","");
      String r = refresh_token[1].replace("\"","");
      String e = expires_in[1].replace("\"","");
      int e1 = Integer.parseInt(e);
      String s = scope[1].replace("\"","");
      String re = refresh_token_expires_in[1].replace("\"","");
      re = re.replace("}","");
      int re2 = Integer.parseInt(re);
       ot.setAccess_token(a);      
       ot.setToken_type(t);
       ot.setRefresh_token(r);      
       ot.setExpires_in(e1);   
       ot.setScope(s);       
       ot.setRefresh_token_expires_in(re2);
      
      
       RestTemplate rt2 = new RestTemplate(); // httpHeader 오브젝트 생성
        HttpHeaders headers2 = new HttpHeaders();        
        headers2.add("Authorization","Bearer"+" "+ot.getAccess_token()); // 현재 http형식이 key -value 형식임을 알린다
        headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8"); 
        System.out.println(headers2+"헤드안에 들어간값");
        
        //body data와 header값을 가지고 있는 하나의 httpEntity가 된다 // body값 header 값을 둘다 하나로마든다
        
        HttpEntity<MultiValueMap<String, String>> kakaoProfile = new HttpEntity<>(headers2); 
        
        ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", 
             HttpMethod.POST,
             kakaoProfile, 
             String.class); //회원 정보까지 조회하는게 response2.getbodey()
        System.out.println(response2.getBody()+"출력해줘 카톡내용 제발 !!!!!!");
        // 받은 내용값 슬라이싱 하기...
        String want = response2.getBody();
        String want_data[]=want.split(",");
        String nick[] = want_data[2].split(":");
        String email[] = want_data[9].split(":");
        String nick_name = nick[2].replace("\"","");
        nick_name = nick_name.replace("}", "");
        String e_mail = email[1].replace("\"","");
        e_mail = e_mail.replace("}", "");
        System.out.println(nick_name+"카카오톡에서 가져온값들");
        System.out.println(e_mail+"카카오톡에서 가져온값들");
        // 가져온값을 DB,세션에 에 담는다
        u_vo.setUser_id(e_mail);
        u_vo.setUser_pw("1111");
        u_vo.setUser_name(nick_name);
        u_vo.setUser_bank("등록하셔야합니다.");
        session.setAttribute("ka_uvo", u_vo);
        
        
        // 카카오톡 필요없으니 여기서 바로 연결을 끊어버린다
        RestTemplate rt3 = new RestTemplate(); // httpHeader 오브젝트 생성
        HttpHeaders headers3 = new HttpHeaders();        
        headers3.add("Authorization","Bearer"+" "+ot.getAccess_token()); // 현재 http형식이 key -value 형식임을 알린다
        headers3.add("Content-type","application/x-www-form-urlencoded;charset=utf-8"); 
        
        HttpEntity<MultiValueMap<String, String>> kakaologout = new HttpEntity<>(headers3); 
        
        ResponseEntity<String> response3 = rt3.exchange("https://kapi.kakao.com/v1/user/unlink", 
             HttpMethod.POST,
             kakaologout, 
             String.class); 
        
        
        
        
               
       // ObjectMapper objectMapper2 = new ObjectMapper(); // 여기다가 json으로 담아낼 예정
      //  kakaoProfileVO p_vo= null;
        
      //  try { p_vo = objectMapper2.readValue(response2.getBody(),p_vo.getClass());
        
       // }catch(JsonParseException e) { e.printStackTrace();
       // }catch(JsonMappingException e) { e.printStackTrace(); }catch(IOException e) {
       // e.printStackTrace(); } //카카오 프로파일에 모든정보를 매퍼로 담는과정이다.
       
      return "redirect:/kaselect.do";
   }
   //카카오 로그인하느 부분
   @RequestMapping("/kakao_login.do")
   public String kakao_login() {
      StringBuffer loginUrl = new StringBuffer();
      loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
      loginUrl.append("ecb5b19528bf0b940b476be09249a694");
      loginUrl.append("&redirect_uri=");
      loginUrl.append("http://localhost:8081/controller/kakao.do");
      loginUrl.append("&response_type=code");

      return "redirect:" + loginUrl.toString();
   }
   
   @RequestMapping("/kaselect.do")
   public String kaselect(HttpSession session,UsersVO u_vo) {
   
   UsersVO   vo = (UsersVO)session.getAttribute("ka_uvo");
   UsersVO new_vo=GoMapper.kaselect(vo.getUser_id());
   System.out.println(new_vo+"검색하고온 값");
   if(new_vo==null) {
      // 회원가입
      System.out.println("박");
      
      GoMapper.UsersInsert(vo);      
      System.out.println("카카오톡 회원가입완료 or 로그인성공");
      
      UsersVO kvo=GoMapper.kaselect(vo.getUser_id());
      System.out.println("kaselect 하고온 값"+kvo);
      session.setAttribute("login", kvo);
      
      return "redirect:/index_main.do"; 
      
   }else {
      //로그인
      
      System.out.println("정");
      UsersVO kvo=GoMapper.kaselect(vo.getUser_id());
      session.setAttribute("login", kvo);
      System.out.println("카카오톡 로그인 성공");
      return "redirect:/index_main.do"; 
   }
   
      
      
   }
   
 //==========================================삐빅 FireBase 구간입니다==========================================
   
   public static String insert_firebase(JSONObject notice_json, String notice_json_name) throws Exception{
  	 Firestore firestore = FirestoreClient.getFirestore();
       // 추가할 데이터의 필드 명
       ApiFuture<WriteResult> apiFuture = firestore.collection("notice").document(notice_json_name).set(notice_json);
       return apiFuture.get().getUpdateTime().toString();
   }
   
   public static void initialize(String test) {
       try {
           String path = GoController.class.getResource("").getPath();
           System.out.println(path);
           
           FileInputStream serviceAccount = new FileInputStream(path+"notice_firebase.json");
           
           FirebaseOptions options = new FirebaseOptions.Builder()
                                           .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                                           .setDatabaseUrl("https://gojijeon-d98c9-default-rtdb.firebaseio.com")
                                           .build();
           if(FirebaseApp.getApps().isEmpty()) {
           FirebaseApp.initializeApp(options);
           }
           System.out.println("성공");
           } catch (Exception e) {
               e.printStackTrace();
           }
   }
}