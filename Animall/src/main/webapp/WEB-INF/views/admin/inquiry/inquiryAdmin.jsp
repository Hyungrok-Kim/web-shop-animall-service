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
							<div class="menuContainer_ForMain" 
							onclick="location.href='${pageContext.request.contextPath}/admin/stylist/stylistAdmin.do'">
								<i class="fas fa-cut"></i>&nbsp&nbsp&nbsp
								미용사 관리			
							</div>
							<div class="menuContainer_ForMain" 
							onclick="location.href='${pageContext.request.contextPath}/admin/admit/admitAdmin.do'">
								<i class="fas fa-unlock"></i>&nbsp&nbsp&nbsp
								승인 관리
							</div>
							
							<div class="menuContainer_ForMain" style="background-color : #997296"
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
								<div class="Top_ForMenu">
								</div>
								<div class="Middle_ForMenu">
								</div>
								<div class="Bottom_ForMenu"\>
									<div>
										<c:out value="${pageBar}" escapeXml="false"/>
									</div>
									<div class="Bottom_">
										<div class="deleteButton_botton">
											<label for="form_sub">
												
											</label>
										</div>
										<form method="post" action="${pageContext.request.contextPath}/admin/adminSearch.do">
											<select name="searchOption">
												<option value="all" <c:out value="${map.searchOption == 'all'? 'selected':''}"/>>전체</option>
												<option value="id" <c:out value="${map.searchOption == 'id'? 'selected':''}"/>>ID</option>
												<option value="nname" <c:out value="${map.searchOption == 'nname'? 'selected':''}"/>>닉네임</option>
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