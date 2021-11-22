package com.kh.animall.users.member.model.service;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.animall.users.member.model.dao.MemberDAO;
import com.kh.animall.users.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   @Autowired
   MemberDAO memberDAO;
   
   @Autowired
    private JavaMailSender mailSender;
   
   
   @Override
   public int insertMember(Member member) {
      
      return memberDAO.insertMember(member);
   }

   @Override
   public Member selectOneMember(String id) {
      
      return memberDAO.selectOneMember(id);
   }

   @Override
   public int updateMember(Member member) {
      
      return memberDAO.updateMember(member); 
      //받은 member를 memberDAO로 보내준다
   }

   @Override
   public int deleteMember(int mno) {
      return memberDAO.deleteMember(mno);
   }
   
   // 아이디 중복 검사
   @Override
   public int idCheck(String id) throws Exception {
   
   return memberDAO.idCheck(id);
   }
   
   
   // 아이디 찾기
   @Override
   public String find_id(HttpServletResponse response, String email) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      String id = memberDAO.find_id(email);
      
      if (id == null) {
         out.println("<script>");
         out.println("alert('가입된 아이디가 없습니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return null;
      } else {
         return id;
      }
   }
   
   // 이메일 발송
   
   public void send_mail(Member member, String pwd, String div) throws Exception {
      // Mail Server 설정
      String setFrom = "352animall@gmail.com";
        String toMail = member.getEmail();
        String title = "임시 비밀번호 찾기 이메일 입니다.";
        
        String msg = "";
        if(div.equals("find_pw")) {
         msg = "임시 비밀번호 입니다.";
         msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
         msg += "<h3 style='color: #997296;'>";
         msg += member.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
         msg += "<p>임시 비밀번호 : ";
         msg += pwd + "</p></div>";
      } 
        
        /* 메일 발송 코드*/        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(msg,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
   
   }
   
   // 비밀번호 찾기
   @Override
   public void find_pw(HttpServletResponse response, Member member) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      Member tempMember = memberDAO.selectOneMember(member.getId());
      
      // 아이디가 없으면
      if(tempMember == null) {
         
         out.println("<script>");         
         out.println("alert('등록되지 않은 아이디 입니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();                        
      }
      
      // 가입에 사용한 이메일이 아니면      
      else if 
         
      (!tempMember.getEmail().equals(member.getEmail())) {               
         out.println("<script>");         
         out.println("alert('잘못된 이메일 입니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();         
      }
      
      else {
         // 임시 비밀번호 생성
         String pwd = "";
         for (int i = 0; i < 12; i++) {
            pwd += (char) ((Math.random() * 26) + 97);
         }
         String encryptPassword = bcryptPasswordEncoder.encode(pwd);         
         member.setPwd(encryptPassword);
         // 비밀번호 변경
         
         memberDAO.update_pw(member);
         // 비밀번호 변경 메일 발송
         send_mail(member, pwd, "find_pw");
         
         
         out.println("<script>");         
         out.println("alert('이메일로 임시 비밀번호를 발송하였습니다.');");
         out.println("history.go(-2);");
         out.println("</script>");
         out.close();         
         
      }
   }
   
}