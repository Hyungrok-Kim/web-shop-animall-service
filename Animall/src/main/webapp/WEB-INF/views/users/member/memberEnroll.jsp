<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>회원 가입 창</title>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>  
   <style>
            
     /* 메일 인증코드 입력시 나타나는 css */
     .correct{
      color : #997296;
      }
   
     .incorrect{
     color : red;
     }      
     
     /* 중복아이디 존재하지 않는경우 */
     .id_input_re_1{
      color : #997296;
      display : none;
     }
     /* 중복아이디 존재하는 경우 */
     .id_input_re_2{
      color : red;
      display : none;
     }
     
   </style>
</head>
<body>   
<c:import url="../../common/header.jsp" />
   <br />   
   <h3 align="center">회원가입</h3>
   <hr />
   <div id="container">
      
      <section id="content">
         <div id="enroll-container">
            <form name="memberEnrollFrm" action="memberEnrollEnd.do" method="post" onsubmit="return fn_enroll_validate();" >
               <table align="center">
               <div id="userId-container">
               <tr>
               <td style="width : 150px;">
                  <h4>아이디</h4>
               </td>
               <td style="width : 150px;">
                  <div id="userId-container">
                  <input type="text" size="20" name="id" id="id" class="form-control" placeholder="아이디" required="required" >
                  <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
               <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
                  <!-- <span class="guide ok">사용 가능</span>
               <span class="guide error">중복된 아이디</span>
               <span class="guide invalid">4글자 미만</span>
                -->               
                  </div>
               </td>
            
               <td style="width : 90px;">
               <!-- &nbsp;<button type="button" class="idCheck" id="idCheck">중복확인</button>  -->
               </td>
               <td style="width : 110px;">
               </div>
               <h5 style=""></h5>
            </td>            
         </tr>
         <br>
         <tr>
            <td>
               <h4>비밀번호</h4>
            </td>
            <td>
               <input type="password" size="30" width="100px" name="pwd" id="pwd" class="form-control" placeholder="비밀번호" required="required" onkeyup="validate(this)">
            </td>
            <td colspan="2">
               <h5></h5>
            </td>
         </tr>
         <tr>
            <td>
               <h4>비밀번호 확인</h4>
            </td>
            <td>
               <input type="password" size="20" name="pwd2" id="pwd2" class="form-control" placeholder="비밀번호 확인" required="required">
            </td>
            <td colspan="2">
               <h5></h5>
            </td>
         </tr>
         <tr>
            <td>
               <h4>닉네임</h4>
            </td>
            <td>
               <input type="text" size="20" name="nname" id="nname" class="form-control" placeholder="닉네임" required="required">
            </td>
            <td>
               <!-- &nbsp;<button type="button" class="nickCheck" id="nickCheck">중복확인</button>  -->
            </td>
            <td>
               <h5 style=""></h5>
            </td>
         </tr>
         
         <tr>
            <td rowspan="3">
               <h4>주소</h4>
            </td>
            <td>
               <input type="text" size="20" name="zip" id="zip" class="form-control" placeholder="우편번호">
            </td>
                         
            <td>
               &nbsp;<button type="button" class="zipSearch" onclick="execDaumPostcode();">주소검색</button>
            </td>
            
         </tr>
         <tr>            
            <td colspan="2">
               <input type="text" size="20" name="addr1" id="addr1" class="form-control" placeholder="주소">
            </td>
         </tr>
         <tr>            
            <td colspan="2">
               <input type="text" size="20" name="addr2" id="addr2" class="form-control" placeholder="상세주소">
            </td>
         </tr>
         <tr>
            <td>
               <h4>이메일</h4>
            </td>
            <td>
               <input type="text" size="20" name="email" id="email" class="form-control" placeholder="이메일" required="required">               
            </td>
            <td>
               <button type="button" id="codeCheck" name="codeCheck" class="codeCheck">코드발송</button>
            </td>
         </tr>
            <tr>      
            <td>
               <h4>인증번호</h4>
            </td>
            <td colspan="2">
               <input type="text" size="20" name="checkCode" id="checkCode" class="form-control" placeholder="인증번호" required="required">
                <span id="mail_check_input_box_warn"></span>               
            </td>
            </tr>                     
         </table>
   
         
      </div>
      <br />
      <br />
      <div style="text-align: center;">
      <!-- <input type="submit" class="join" value="가입" > -->
      <!-- <input type="reset"  class="cancel" value="취소"> -->
      <button type="submit" class="join" value="가입">가입</button>
      <button type="reset" class="cancel" value="취소">취소</button>
      
      
      <br />
      </div>
      <br />
      </form>               
       <!--아이디 중복검사  -->
       
      <script>       
         
         function validate(){
            var id = $("#id");
            if(id.val().trim().length<4){
               alert("아이디는 최소 4자리이상이어야 합니다.");
               id.focus();
               return false;
            }
            
            //아이디중복체크여부
             if($("#idDuplicateCheck").val()==0){
                 alert("사용가능한 아이디를 입력해주세요.");
                 return false();
             }
            
            return true;
         }
         </script>
         
         <!-- 주소 검색 api -->
         <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
         
         <script>
         
         function execDaumPostcode() {
             new daum.Postcode({
                 oncomplete: function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                     var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                         extraRoadAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if(extraRoadAddr !== ''){
                         extraRoadAddr = ' (' + extraRoadAddr + ')';
                     }
                     // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                     if(fullRoadAddr !== ''){
                         fullRoadAddr += extraRoadAddr;
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                     document.getElementById('addr1').value = fullRoadAddr;
                     document.getElementById('addr2').focus();
                 }
             }).open();
         }
         </script>

         <script>  
         /* 인증번호 이메일 전송 스크립트 */
         var code = "";    
         
         $("#codeCheck").click(function(){
            var checkEmail = $("#email").val();
              
             $.ajax({                 
                 type:"GET",
                 url:"${pageContext.request.contextPath}/mailCheck?checkEmail=" + checkEmail,                 
                 success:function(data){                 
                   code = data;                     
                     
                 }                         
             });
             
         });


         /* 인증번호 비교 */
         $("#checkCode").blur(function(){

               var inputCode = $("#checkCode").val();        // 입력코드    
               var checkResult = $("#mail_check_input_box_warn");

               if(inputCode == code){                            // 일치할 경우, "인증번호가 일치합니다." 출력
                   checkResult.html("인증번호가 일치합니다.");
                   checkResult.attr("class", "correct");        
               } else {                                            // 일치하지 않을 경우, "인증번호를 다시 확인해주세요." 출력
                   checkResult.html("인증번호를 확인해주세요.");
                   checkResult.attr("class", "incorrect");
               }     
             
             
         });

       //아이디 중복검사
         $('#id').on("propertychange change keyup paste input", function(){

        // console.log("keyup 테스트");   
      var id = $('#id').val();         // .id_input에 입력되는 값
      var data = {id : id}            // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
      
      $.ajax({
         type : "post",
         url : "${pageContext.request.contextPath}/memberIdChk",      
         data : data,
         success : function(result){             
            // console.log("성공 여부" + result);
               if(result != 'fail'){
                  $('.id_input_re_1').css("display","inline-block");
                  $('.id_input_re_2').css("display", "none");            
               } else {
                  $('.id_input_re_2').css("display","inline-block");
                  $('.id_input_re_1').css("display", "none");            
               }
            
       }// success 종료      
      }); // ajax 종료                
       });// function 종료
       </script>            
   </section>         
   </div>
      <c:import url="../../common/footer.jsp" />
</body>
</html>