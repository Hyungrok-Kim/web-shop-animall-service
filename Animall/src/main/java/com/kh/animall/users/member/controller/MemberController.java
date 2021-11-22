package com.kh.animall.users.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.animall.users.member.model.service.MemberService;
import com.kh.animall.users.member.model.vo.Member;
import com.kh.animall.users.stylist.model.service.StylistService;
import com.kh.animall.users.stylist.model.vo.MyStylist;

//@SessionAttributes(value= { "member" })
@Controller
public class MemberController {
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
    @Autowired
    private JavaMailSender mailSender;
   
   @Autowired
   private MemberService memberService;
   
   @Autowired
   private StylistService stylistService;
   
   /*회원가입(enroll) 페이지로 이동 */
   
   @RequestMapping("users/member/memberEnroll.do") //해당 값이 들어오면   
   public String memberEnroll() {
      
      // System.out.println("member/memberEnroll.do 접근 확인");
      
      return "users/member/memberEnroll";  //memberEnroll.jsp로 리턴
            
   }
   
   @RequestMapping("users/member/memberEnrollEnd.do")
   public String memberEnrollEnd(Member member, Model model) {
      
      
      
      member.setEmail(member.getEmail()); //email
      member.setAddress(member.getAddr1()+member.getAddr2()+" "+member.getZip()); //주소(카카오API) 합치기
      String plainPassword = member.getPwd();
      System.out.println("memberEnroll : " + member);
      
      String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
      
      System.out.println("원문 : " + plainPassword);
      System.out.println("암호문 : " + encryptPassword);
      member.setPwd(encryptPassword);
      

      try {
 
      int result = memberService.insertMember(member);
      

      String loc="/";
      String msg = "";
      
      if(result > 0) msg = "회원가입 성공!";
      else msg = "회원가입 실패!";
      
      model.addAttribute("loc", loc);
      model.addAttribute("msg", msg);
      } catch (Exception e) {
         System.out.println("회원가입 에러 발생");
         e.printStackTrace();
 
      }
      
      return "common/msg";
      
   }
   
   // 로그인버튼 누르고 페이지 이동 
   @RequestMapping("users/member/memberLoginMain.do")
   public String memberLoginMain() {
   return "users/member/memberLoginMain";  //memberFindId.jsp로 리턴
         
   }
   
   // 로그인 페이지 에서 로그인 
   @RequestMapping("users/member/memberLogin.do")
   public String memberLogin(
            @RequestParam String id,
            @RequestParam String pwd,
            HttpSession session,
            Model model
         ) {
      
      // System.out.println("로그인 기능 접근!");
      
      Member member = memberService.selectOneMember(id);
                  
      String loc = "/";
      String msg = "";
      
      MyStylist sty = null;
      
      if( member == null) {
         msg = "존재하지 않는 아이디입니다.";
      } else {
         
         if( bcryptPasswordEncoder.matches(pwd, member.getPwd())) {
            
            msg = "로그인 성공!";
            session.setAttribute("member", member);
            
            if(member.getMtype().equals("STY")) {
            	sty = stylistService.selectOneStylist(member.getMno());
            	session.setAttribute("stylist", sty);
            }else {
            	session.setAttribute("stylist", null);  	
            }
            
         } else {
            msg = "비밀번호가 틀렸습니다.";
         }         
      }
      
      model.addAttribute("loc", loc);
      model.addAttribute("msg", msg);
      
      return "common/msg";
   }
   
   
   /*
   // 2번 방법 (어노테이션 선언 방식)
   @RequestMapping("users/member/memberLogin.do")
   public String memberLogin(
            @RequestParam String id,
            @RequestParam String pwd,
            Model model
         ) {
      
      // 반환 화면 처리
      
      String loc = "/";
      String msg = "";
      
      
      Member m = memberService.selectOneMember(id);
      
      if ( m == null ) {
         msg = "존재하지 않는 아이디입니다.";
      } else {
         
         if( bcryptPasswordEncoder.matches(pwd, m.getPwd()) ) {
            msg = "로그인에 성공하였습니다!";
            model.addAttribute("member", m);
            // @SessionAttributes 에 등록된 'member'로 인식하면서
            // 자동으로 세션 영역에 해당 객체를 저장한다.
         } else {
            msg = "비밀번호가 일치하지 않습니다.";
         }
      }
      
      model.addAttribute("msg", msg);
      model.addAttribute("loc", loc);
      
      return "common/msg";
      
   }
   */
   
   @RequestMapping("users/member/memberLogout.do")
   public String memberLogout(HttpSession session) {
      
   session.invalidate(); 
      
   
   return "redirect:/";
   
   }
   
   
    /* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String checkEmail) throws Exception{
        
        /* 데이터 확인 */
       System.out.println("이메일 데이터 전송확인 " + checkEmail);
       

        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
 
        

        /* 이메일 보내기 */
        String setFrom = "352animall@gmail.com";
        String toMail = checkEmail;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        /* 메일 발송 코드*/        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
 
        String num = Integer.toString(checkNum);
        return num;
    }
    
        
    // 아이디 중복 검사
       @RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
       @ResponseBody
       public String memberIdChkPOST(String id) throws Exception{
          
          //logger.info("memberIdChk() 진입");
         
         int result = memberService.idCheck(id);
         
         // logger.info("결과값 = " + result);
         
         if(result != 0) {
            
            return "fail";   // 중복 아이디가 존재
            
         } else {
            
            return "success";   // 중복 아이디 x
            
         }   
          
          
       } // memberIdChkPOST() 종료   
    
    
       /* 아이디 찾기 폼으로 이동 */
      
      @RequestMapping("users/member/memberFindId.do") //해당 값이 들어오면   
      public String memberFindId() {
         
         // System.out.println("member/memberEnroll.do 접근 확인");
         
         return "users/member/memberFindId";  //memberFindId.jsp로 리턴
               
      }
   

   
      // 아이디 찾기
      @RequestMapping(value = "users/member/find_id.do", method = RequestMethod.POST)
      public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model model) throws Exception{
         model.addAttribute("id", memberService.find_id(response, email));
         return "users/member/find_id";
      }
      
      
      /* (아이디) / 비밀번호 찾기- 비밀번호 찾기 폼으로 이동 
      @RequestMapping("users/member/memberFindPwd.do") //해당 값이 들어오면   
      public String memberFindPwd() {
         
         // System.out.println("member/memberEnroll.do 접근 확인");
         
         return "users/member/memberFindPwd";  //memberFindId.jsp로 리턴
               
      }
      */
      
      /* 로그인창에서, 비밀번호 찾기폼으로 이동 */
      @RequestMapping(value = "users/member/memberFindPwd.do")
      public String memberFindPwd() throws Exception{         
      return "users/member/memberFindPwd";  //memberFindId.jsp로 리턴
      
      }
      
      /* 비밀번호 찾기폼에서 비밀번호 찾기 누르기 이동 */

      @RequestMapping(value = "users/member/find_pw.do", method = RequestMethod.POST)
      public void find_pw(Member memberVo, HttpServletResponse response) throws Exception{
         memberService.find_pw(response, memberVo);
      }
            
      
      @RequestMapping("/users/member/memberDelete.do")
      public String memberDelete(HttpSession session, Model model, @RequestParam int mno) {
         
    	 System.out.println("mno :" + mno);
    	  
         int result = memberService.deleteMember(mno);
         
         if( result > 0 )session.invalidate(); 
         
         String loc = "/";
         String msg = "";
         
         if( result > 0 ) msg = "회원 탈퇴 성공!!";
         else msg = "회원 탈퇴 실패!";
         
         model.addAttribute("loc", loc);
         model.addAttribute("msg", msg);
         
         
         return "common/msg";
      }
      

      @RequestMapping(value = "mypage/mypage.do")
      public String mypage() throws Exception{
         return "/mypage/mypage";
      }
      
      
      
      @RequestMapping(value = "mypage/memberInfo.do")
      public String memberInfo() throws Exception{
         return "/mypage/memberInfo";
      }

      // return type이 void인 경우 uri를 jsp로 forword하는 정보 사용한다.
         // 요청은 get방식으로 글쓰기 폼
      @RequestMapping(path = "/mypage/memberInfo", method = RequestMethod.GET)
      public void memberInfoForm() {
            
      }

         
         
         
       @RequestMapping(value="/member/memberUpdate", method = RequestMethod.POST)
         public String memberUpdate(Member member, Model model,  @RequestParam("old_pw") String old_pw,  @RequestParam("new_pw") String new_pw, HttpSession session) {
            System.out.println("컨트롤러 접근 확인 ");
            String loc = "/";
            String msg = "";
            
            // 1. 현재 비밀번호가 / old_pw == 지금로그인한 비밀번호
            Member m = memberService.selectOneMember(member.getId());
            System.out.println("변경 전 : " + m);
            
            if( bcryptPasswordEncoder.matches(old_pw, m.getPwd()) ) {
               
               // 2. old_pw --> new_pw
               String encryptPassword = bcryptPasswordEncoder.encode(new_pw);
               member.setPwd(encryptPassword);
               member.setAddress(member.getZip() + member.getAddr1() + member.getAddr2());
               
               memberService.updateMember(member);
               
               System.out.println("변경 후 : " + member);
               
               model.addAttribute("member", memberService.selectOneMember(member.getId()));
               
               msg = "회원정보 변경이 완료되었습니다.";
            } else {
               msg = "회원정보 변경이 완료되었습니다.";
            }
            
            model.addAttribute("msg", msg);
            model.addAttribute("loc", loc);
            
            return "common/msg";
         }
      
          
}