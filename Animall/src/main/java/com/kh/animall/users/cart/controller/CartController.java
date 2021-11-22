package com.kh.animall.users.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.animall.users.cart.model.service.*;
import com.kh.animall.users.cart.model.vo.Cart;
import com.kh.animall.users.member.model.vo.Member;
import com.kh.animall.users.product.model.vo.Product;
@Controller
public class CartController {

   @Autowired
   CartService cartService;
      
   
   @RequestMapping("/cart/cartList.do")
   public String cartList(HttpSession session, Model model, HttpServletResponse response) {
       Map<String, Object> map=new HashMap<>();
      
       Member member = (Member)session.getAttribute("member");
         
         //로긴 안 했으면 alert후 메인페이지로 가도록
       if(member==null) {
         response.setContentType("text/html; charset=UTF-8");
          PrintWriter out = null;
         try {
            out = response.getWriter();
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
          out.println("<script>alert('로그인 후 이용해주세요.');</script>");
          out.flush();
            return "index";
         }   
       
       int mno= member.getMno();
             
      List<Cart> clist = cartService.selectCartList(mno); //장바구니 목록
      int sumMoney=cartService.sumMoney(mno);//금액 합계
      int shipfee = sumMoney>=50000 ? 0 : 2500; //배송료. 5만원 이상? 무료ㅋ
      map.put("sumMoney", sumMoney); 
      map.put("shipfee", shipfee); //배송료
      map.put("orderPrice", sumMoney+shipfee); //총금액
      map.put("clist", clist); //장바구니 목록 clist도 hashmap에 담아주기
      map.put("count", clist.size());

        model.addAttribute("map", map);      
      return "users/cart/cart";
   }
   
   
   @RequestMapping("/cart/cartInsert.do")
   public String cartInsert (HttpSession session,
                       @RequestParam int amount, 
                       @RequestParam int pno,
                       @ModelAttribute Cart cart, 
                       Product product, Model model, HttpServletResponse response) {
      
      Member member = (Member)session.getAttribute("member");
      
      //장바구니 상품 숫자 count해서 없으면 insert, 있으면 update
      int count = cartService.countCart(cart.getMno(), cart.getPno());
      System.out.println("count결과: "+count);
      
      if(count == 0) {
         cart.setMno(member.getMno());
         cartService.insertCart(cart);
      }else {
         cart.setMno(member.getMno());
         cartService.updateCart(cart);
      }
   
      return "redirect:/product/productSelectOne.do?pno="+pno;
   }
      
   
   @RequestMapping("/cart/cartInsertThis.do")

   public String cartInsertthis (HttpSession session, @RequestParam int amount, 
                                          @RequestParam int pno,
                                          @ModelAttribute Cart cart, 
                                          Product product, Model model, 
                                          HttpServletRequest request, HttpServletResponse response) {
      
      Member member = (Member)session.getAttribute("member");
      
      int count = cartService.countCart(cart.getMno(), cart.getPno());
      //장바구니 count. 상품 없으면 insert 있으면 update
      
      System.out.println("count결과: "+count);
      if(count == 0) {
         cart.setMno(member.getMno());
         cartService.insertCart(cart);
      }else {
         cart.setMno(member.getMno());
         cartService.updateCart(cart);
      }
       
      
          return null;
          
   }
      
      
      
      
   
   
   @RequestMapping("/cart/cartDelete.do")
   public String cartDelete(@RequestParam int cno, 
                      @RequestParam int mno, Model model) {
      cartService.deleteCart(cno);
      
      int result = cartService.deleteCart(cno);
      String loc = "/cart/cartList.do?mno="+mno;
      String msg = "";
      
      if(result == 0) {
         msg = "상품이 삭제되었습니다.";
      }
      else {
         msg = "장바구니 삭제 실패";
      }
      
      model.addAttribute("loc",loc);
      model.addAttribute("msg",msg);
      
      return "common/msg";
   }
   
   
   @RequestMapping("/cart/cartDeleteAll.do")
   public String cartDeleteAll( @RequestParam int mno, Model model) {
      cartService.deleteCartAll(mno);
      
      int result = cartService.deleteCartAll(mno);
      String loc = "/cart/cartList.do?mno="+mno;
      String msg = "";
      
      if(result == 0) {
         msg = "상품이 모두 삭제되었습니다.";
      }
      else {
         msg = "장바구니 삭제 실패";
      }
      
      model.addAttribute("loc",loc);
      model.addAttribute("msg",msg);
      
      return "common/msg";
   }
   
   
   @RequestMapping("/cart/cartUpdate.do")
   public String cartUpdate(@RequestParam int[] amount,
                      @RequestParam int[] cno, HttpSession session) {
      Member member = (Member)session.getAttribute("member");
      int mno=member.getMno();
      for(int i=0; i<cno.length; i++) {
         if(amount[i] <=0) {
            cartService.deleteCart(cno[i]);
         }else {
         
         Cart cart = new Cart();
         cart.setMno(member.getMno());
         cart.setAmount(amount[i]);
         cart.setCno(cno[i]);
         cartService.modifyCart(cart);
         }
      }
      
      
      return "redirect:/cart/cartList.do?mno="+mno;
   }
   
}