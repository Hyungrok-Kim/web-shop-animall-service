<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animall 관리자 페이지</title>

<c:import url="../common/adminHeader.jsp"/>

</head>
<body style="margin : 0;">
	<div class="firstPrimeContainer_ForMain">
	 <div class="secondPrimeContainer_ForMain">
					<div class="bigContainer_ForMain1">
					  		<div style="background-color : #997296">
								<img src="${pageContext.request.contextPath}/resources/images/logoForAdmin2.png" alt=""
								onclick="location.href='${pageContext.request.contextPath}/admin/adminPage.do'"/>
							</div>
							<div class="menuContainer_ForMain"
							onclick="location.href='${pageContext.request.contextPath}/admin/adminPage.do'" >
								<i class="fas fa-th-large"></i>&nbsp&nbsp&nbsp
								메인
							</div>
							<div class="menuContainer_ForMain" 
							onclick="location.href='${pageContext.request.contextPath}/admin/member/memberAdmin.do'">
								<i class="fas fa-user"></i>&nbsp&nbsp&nbsp
								회원 관리
							</div>
							<div class="menuContainer_ForMain"  style="background-color : #997296"
							onclick="location.href='${pageContext.request.contextPath}/admin/stylist/stylistAdmin.do'">
								<i class="fas fa-cut"></i>&nbsp&nbsp&nbsp
								미용사 관리			
							</div>
							<div class="menuContainer_ForMain" 
							onclick="location.href='${pageContext.request.contextPath}/admin/admit/admitAdmin.do'">
								<i class="fas fa-unlock"></i>&nbsp&nbsp&nbsp
								승인 관리
							</div>
							
							<div class="menuContainer_ForMain" 
							onclick="location.href='${pageContext.request.contextPath}/admin/inquiry/inquiryAdmin.do'">
								<i class="fas fa-question-circle"></i>&nbsp&nbsp&nbsp
								문의 관리
							</div>
							<div class="menuContainer_ForMain"  
							onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeAdmin.do'">
								<i class="fas fa-exclamation-circle"></i>&nbsp&nbsp&nbsp
								공지사항 관리
							</div>
					
			 </div>
	 		<div class="bigContainer_ForMain2">
			
			<c:import url="../common/topMenu.jsp"/> <%-- 위에 탑 메뉴 임포트 --%>
			
			<div class="middleContainer_ForMain">
								<div class="Top_ForMenu2">
								<div style="width:31px;"></div>
									<div>미용사번호</div>
									<div>회원번호</div>
									<div>사업자번호</div>
									<div>사업자명</div>
									<div>미용사명</div>
									<div>생년월일</div>
									<div>휴대전화</div>
									<div>가게명</div>
									<div>가게번호</div>
									<div>가게주소</div>
									<div>프리미엄</div>
									<div>자격증번호</div>
									
								</div>
								<form action="${pageContext.request.contextPath}/admin/stylistDelete.do"
								 style="width:100%; display : flex; justify-content : center;">
									<div class="Middle_ForMenu">
										
										<c:forEach var="s" items="${stylistList}">
											<div class="memberInfoList2">
												<input id="checkBox_ForMember${s.styno}" type="checkbox"
												 name="styno" value="${s.styno}" style="display : none;"/>
												<label for="checkBox_ForMember${s.styno}"></label>
												<div>${s.styno}</div>
												<div>${s.mno}</div>
												<div>${s.bsno}</div>
												<div>${s.bsname}</div>
												<div>${s.styname}</div>
												<div>${s.birth}</div>
												<div>${s.cellphone}</div>
												<div>${s.shopname}</div>
												<div>${s.shopphone}</div>
												<div>${s.shopaddress}</div>
												<div>${s.ispre}</div>
												<div>${s.certifino}</div>
											</div>
										</c:forEach>
									</div>
									<input id="form_sub" type="submit" style="display : none;">
												
									</input>
								</form>
								<div class="Bottom_ForMenu"\>
									<div>
										<c:out value="${pageBar}" escapeXml="false"/>
									</div>
									<div class="Bottom_">
										<div class="deleteButton_botton">
											<label for="form_sub">
												회원전환
											</label>
										</div>
										<form method="post" action="${pageContext.request.contextPath}/admin/memberSearch.do">
											<select name="searchOption">
												<option value="all" <c:out value="${map.searchOption == 'all'? 'selected':''}"/>>전체</option>
												<option value="stylist" <c:out value="${map.searchOption == 'stylist'? 'selected':''}"/>>미용사명</option>
												<option value="phone" <c:out value="${map.searchOption == 'phone'? 'selected':''}"/>>휴대전화</option>
												<option value="shop" <c:out value="${map.searchOption == 'shop'? 'selected':''}"/>>가게명</option>
												<option value="address" <c:out value="${map.searchOption == 'address'? 'selected':''}"/>>주소</option>
												<option value="stylistno" <c:out value="${map.searchOption == 'stylistno'? 'selected':''}"/>>미용사번호</option>
												
											</select>
											<input class="searchBox" type="text" name="keyword"/>
											<input class="searchButton" value="검색" type="submit"></input>
										</form>
										<div class="deleteButton_blank"></div>
									</div>
								</div>
			</div>
	</div>
	</div>
</div>


<c:import url="../common/adminFooter.jsp"/>
</body>
</html>