<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <!--아임포트 가져오기-->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 
 <style>
 .orderArea{
   display:flex;
   height:30vh;
   justify-content: center;
   align-items: center;
   margin:30px;}
   
 .cartArea{
   display:flex;
   height:40vh;
   justify-content: center;
   align-items: center;
   margin:80px;
   
}
#cartimg{
   margin: 3px;
   width: 100px;
   height: 100px;
}
h3{
   text-align:center;
}
h4{
   position:absolute;
   top:200px;
   left:480px;
   text-align: center;
}

a:link{
   text-decoration:none;
   color:black;
}
a:visited{
   text-decoration:none;
   color:black;
}
#pay{
 text-align:center;
}
 </style>
 <script>
 window.onload = function(){
    var IMP = window.IMP; // 생략가능
    IMP.init('imp71822824');  // 가맹점 식별 코드
    console.log('들어왔음')}
    
   function deleall(){
      var mno= "${member.mno}";
      if(confirm("장바구니를 비우시겠습니까?")==true){
      location.href="${pageContext.request.contextPath}/cart/cartDeleteAll.do?mno="+mno;      
      }
   };
</script>
<title>주문</title>
</head>
<body>
<c:import url="../../common/header.jsp"/>
   <div class="cartArea">
   <h4>주문서</h4>
   <form id="form1" name="form1" method="post"
        action="${pageContext.request.contextPath}/cart/cartUpdate.do">
            <table width="1000px" style="table-layout: fixed">
                <tr align="center" font-size=15px;>
                    <th width="13%"></th>
                    <th>상품명</th>
                    <th width="15%">단가</th>
                    <th width="15%">수량</th>
                    <th width="15%">금액</th>
                    <th width="4%">&nbsp;</th>
                </tr>
                <!-- map에 있는 list출력하기 위해 forEach문을 사용해 row라는 변수에 넣는다. -->
            <c:forEach var="row" items="${map.clist}">
                <tr align="center">
                    <td><a href="${pageContext.request.contextPath}/product/productSelectOne.do?pno=${row.pno}">
                    <img id="cartimg" src="${pageContext.request.contextPath}/resources/productUpFiles/${row.changename}"></a></td>
                    <td>
                    <a href="${pageContext.request.contextPath}/product/productSelectOne.do?pno=${row.pno}">${row.pname}</a></td>
                    
                    <td><fmt:formatNumber value="${row.pprice}"
                            pattern="#,###,###" /></td>
                            <!-- fmt:formatNumber 태그는 숫자를 양식에 맞춰서 문자열로 변환해주는 태그이다 -->
                            <!-- 여기서는 금액을 표현할 때 사용 -->
                            <!-- ex) 5,000 / 10,000 등등등-->
                            
                    <td><input type="number" name="amount" 
                              style="width:50px;"
                               value="<fmt:formatNumber value="${row.amount}"
                                 pattern="#,###,###" />">
                                  <!-- 물건의 개수 (amount)를 fmt태그를 사용해서 패턴의 형식에 맞춰서 문자열로 변환함 -->
                    <!--1,000 / 5,000 등등~  -->
                        <input type="hidden" id="pno" name="pno" value="${row.pno}"/>
                        <input type="hidden" id="mno" name="mno" value="${row.mno}"/>
                   <input type="hidden" id="cno" name="cno" value="${row.cno}">       
                    </td>
                    <td><fmt:formatNumber value="${row.money}"
                            pattern="#,###,###" /></td>
                    <td> <a href= "${pageContext.request.contextPath}/cart/cartDelete.do?cno=${row.cno}&mno=${row.mno}"
                       onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
               <!-- 삭제 버튼을 누르면 delete.do로 장바구니 개별 id (삭제하길원하는 장바구니 id)를 보내서 삭제한다. -->
                    </td>
                </tr>
            </c:forEach>
                <tr>
                    <td colspan="6" align="right">
                        상품 금액 :
                        <fmt:formatNumber value="${map.sumMoney}"
                            pattern="#,###,###" /> &nbsp;+&nbsp;
                        배송료 : ${map.shipfee}&nbsp;+&nbsp;
                        총합계 : <fmt:formatNumber value="${map.orderPrice}"
                            pattern="#,###,###" />
                    </td>
                </tr>
            </table>
            <input type="hidden" name="count" value="${map.count}">
            <button type="submit" id="btnUpdate" class="btn mt-1">수정</button>
            <button type="button" id="dall" onclick="deleall();" class="btn mt-1">장바구니 비우기</button>
        </form>
   </div>
      <h3>주문자 정보</h3>
         <div class="orderArea">
               <table border="0" summary="">
               <caption>주문자 정보 입력</caption>
                     <tbody>
                     
                  <tr>
                     <td>
                        <input type="text" size="20" name="orderer" id="orderer" class="form-control" placeholder="이름" required="required">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="text" size="20" name="orderphone" id="orderphone" class="form-control" placeholder="연락처" required="required">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="text" size="20" name="email" id="email" class="form-control" placeholder="이메일" required="required">
                     </td>
                     <td>
                        <select name="domain" id="domain" class="btn btn-default form-control" style="width : 130px; background : none;">
                           <option value="none" >- 선택 -</option>
                           <option value="self" >- 직접입력 -</option>
                           <option value="@naver.com" >@naver.com</option>
                           <option value="@gmail.com" >@gmail.com</option>
                           <option value="@hanmail.net" >@hanmail.net</option>
                           <option value="@nate.com" >@nate.com</option>
                        </select>
                     </td>
                     <td>
                        <h5></h5>
                     </td>
                  </tr>
                  
               </tbody>   
               
            </table>
         </div>
         <br><br>
      <h3>배송지 정보</h3><br>
         <div class="orderArea">
            <table border="0" summary="">
               <caption>배송지 정보 입력</caption>
                     <tbody>
                    
                  <tr>
                     <td>
                        <input type="text" size="20" name="receiver" id="receiver" class="form-control" placeholder="이름" required="required">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="text" size="20" name="recephone" id="recephone" class="form-control" placeholder="연락처" required="required">
                     </td>
                  </tr>
                  <tr>   
                     <td>
                        <input type="text" size="20" name="oaddr3" id="oaddr3" class="form-control" placeholder="우편번호">
                     </td>
                     <td>
                        &nbsp;<button type="button" class="btn btn-default" onclick="execDaumPostcode();">주소검색</button>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <input type="text" size="20" name="oaddr1" id="oaddr1" class="form-control" placeholder="주소">
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <input type="text" size="20" name="oaddr2" id="oaddr2" class="form-control" placeholder="상세주소">
                     </td>
                  </tr>
               
               </tbody>   
            </table>
         </div>
         <div id="pay">
            <button type="button" class="btn btn-primary mt-4" onclick="requestPay()">결제</button>
         </div>
         <br><br>
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
                     document.getElementById('oaddr3').value = data.zonecode; //5자리 새우편번호 사용
                     document.getElementById('oaddr1').value = fullRoadAddr;
                     document.getElementById('oaddr2').focus();
                 }
             }).open();
         }

         function requestPay() {
            var amount="${map.orderPrice}";
            var email=document.getElementById("email").value+document.getElementById("domain").value;
            var name=document.getElementById("orderer").value;
            var tel=document.getElementById("orderphone").value;
            var addr=document.getElementById("oaddr1").value+document.getElementById("oaddr2").value;
            var zip=document.getElementById("oaddr3").value;
            var Y='Y';
            console.log('여까진 잘됨');
               IMP.request_pay({
                  pg : 'inicis', // 결제방식
                  pay_method : "card",   // 결제 수단
                  merchant_uid : 'merchant_' + new Date().getTime(),
                    name : 'Animall 상품결제',   // order 테이블에 들어갈 주문명 혹은 주문 번호
                  amount : amount,   // 결제 금액
                  buyer_email : $("#email").val()+$("#domain").val(),   // 구매자 email
                    buyer_name :  $("#orderer").val(),   // 구매자 이름
                  buyer_tel :  $("#orderphone").val(),   // 구매자 전화번호
                  buyer_addr :  $("#oaddr3").val()+","+$("#oaddr1").val()+","+$("#oaddr2").val()   // 구매자 주소
                   }, function(rsp) {
                     if ( rsp.success ) { // 성공시
                        $.ajax({
                           url : "${pageContext.request.contextPath}/order/insertOrder.do",
                           type : "post",
                           async: false,
                           data : {
                              imp_uid: rsp.imp_uid,
                              merchant_uid: rsp.merchant_uid,
                              mno: $("#mno").val(),
                              pno: $("#pno").val(),
                               address: $("#oaddr3").val()+","+$("#oaddr1").val()+","+$("#oaddr2").val(),
                               receiver: $("#receiver").val(),
                               recephone: $("#recephone").val(),
                               orderphone: $("#orderphone").val(),
                               paystatus: Y
                           }
                        })
                        alert('결제 완료! 구매해주셔서 감사합니다.');
                        location.href="/animall";
                  } else { // 실패시
                     console.log('실패했니');
                     console.log(rsp);
                    }   
                   }
            )};
          </script>      
<c:import url="../../common/footer.jsp"/>

</body>
</html>