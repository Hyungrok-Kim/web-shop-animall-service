<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.carttable{
   display:flex;
   height:50vh;
   justify-content: center;
   align-items: center;
   margin:100px;
   
}

#emptybasket{
    width: 100%; height: 100%;
    max-width: 300px;
    max-height: 300px;
    display: block;
}

#cartimg{
   margin: 3px;
   width: 100px;
   height: 100px;
}

h2{
   position:absolute;
   top:220px;
   left:810px;
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
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   function deleall(){
      var mno= "${member.mno}";
      if(confirm("장바구니를 비우시겠습니까?")==true){
      location.href="${pageContext.request.contextPath}/cart/cartDeleteAll.do?mno="+mno;      
      }
   };
</script>


<title>장바구니</title>
    

</head>
<body>
<c:import url="../../common/header.jsp"/>


<div class="carttable">
<h2>${member.nname}님의 장바구니</h2><br><br>
<c:choose>
    <c:when test="${map.count == 0 }">
    <!--map의 count가 0일때 which means 장바구니 비었을 때-->
    <!-- map에 자료가 아무것도 없다면 -->
        <figure>
            <img id="emptybasket" alt="빈 장바구니" src="${pageContext.request.contextPath}/resources/images/emptybasket.png"/>
            <figcaption><h3>장바구니가 비었습니다.</h3></figcaption>
       </figure>
    </c:when>
    
    <c:otherwise>
    <!-- map.count가 0이 아닐때, 즉 자료가 있을때 -->
    <!-- form의 id를 form1로 하고, method 방식을 post로 한다. 그리고 update.do페이지로 이동시킨다. -->
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
                        <input type="hidden" name="pno" value="${row.pno}"/>
                        <input type="hidden" name="mno" value="${row.mno}"/>
                   <input type="hidden" name="cno" value="${row.cno}">
                            
                                
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
                        장바구니 금액 합계 :
                        <fmt:formatNumber value="${map.sumMoney}"
                            pattern="#,###,###" /><br>
                        배송료 : ${map.shipfee}<br>
                        총합계 : <fmt:formatNumber value="${map.orderPrice}"
                            pattern="#,###,###" />
                    </td>
                </tr>
            </table>
            <input type="hidden" name="count" value="${map.count}">
            <button type="submit" id="btnUpdate" class="btn mt-4">수정</button>
            <button type="button" id="dall" onclick="deleall();" class="btn mt-4">장바구니 비우기</button>
            <button type="button" id="pay" onclick="location.href='${pageContext.request.contextPath}/order/orderList.do?mno=${member.mno}' "class="btn btn-primary mt-4 orderOpen">주문하기</button>
        </form>
    </c:otherwise>
</c:choose>
</div>
<c:import url="../../common/footer.jsp"/>
</body>
</html>