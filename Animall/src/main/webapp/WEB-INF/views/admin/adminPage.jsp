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

<c:import url="common/adminHeader.jsp"/>

</head>
<body style="margin : 0;">
	<div class="firstPrimeContainer_ForMain">
	 <div class="secondPrimeContainer_ForMain">
	 
	 
					<div class="bigContainer_ForMain1">
					  		<div style="background-color : #997296">
								<img src="${pageContext.request.contextPath}/resources/images/logoForAdmin2.png" alt=""
								onclick="location.href='${pageContext.request.contextPath}/admin/adminPage.do'"/>
							</div>
							<div class="menuContainer_ForMain" style="background-color : #997296"
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
				
				<c:import url="common/topMenu.jsp"/> <%-- 위에 탑 메뉴 임포트 --%>
				
				<div class="middleContainer_ForMainMain">
						
						
						 		<div class="leftContainer_ForMainMain">
									<div class="profileContainer_ForMain">
										<div class="profile_ImageBox" id="profile_ImageBox">
											<img id="profile_Image" 
											src="${pageContext.request.contextPath}/resources/images/test2.jpg" alt="" />
										</div>
										<div style="margin-top : 15px; color:#353535; font-size : 20pt; 
										margin-bottom : 10px;">
											Daniel 대표이사
										</div>
										<div style="color : gray; font-weight : bold;">
											교육본부
										</div>
										<div class="profile_ms">
											<div class="profile_s">
												<div>오늘의 일정</div><div style="color : gray;">1</div>
											</div>
											<div class="profile_m">
												<div>오늘 온 메일</div><div style="color : gray;">0</div>
											</div>
										</div>
									</div>
									
									<div class="bottomBox_Container">
										<div class="firstLine_Container">
											<div>
												<i class="far fa-envelope"></i> 메일 관리
											</div>
											<div>
												<i class="far fa-clock"></i> 일정 관리
											</div>
										</div>
										<div class="secondLine_Container">
											<div>
												<i class="far fa-address-book"></i> 연락처 관리
											</div>
											<div>
												<i class="fas fa-toolbox"></i> 도구 모음
											</div>
										</div>
									</div>
									
								</div>
								<div class="rightContainer_ForMainMain">
										<div class="rightContainer_top">
											ANIMALL 최근글
										</div>
										<div style =" color : gray; margin-bottom : 15px;" >
											Animall 세미나 & 회의
										</div>
										<div class="rightContainer_middle">
											<img src="${pageContext.request.contextPath}/resources/images/semina.jpg" alt=""/>
											
											<div class="rightImage_Container">
												<img src="${pageContext.request.contextPath}/resources/images/talk.jpg" alt=""/>
												<img src="${pageContext.request.contextPath}/resources/images/semina2.jpg"
												style="border-top : 4px solid white;" alt="" />
											</div>
											
										</div>
										<div class="rightContainer_bottom">
										    	  <i class="fas fa-angle-left"></i>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										    	  <i class="fas fa-angle-right"></i>
										</div>
								</div>
						
						
						
				</div>
		</div>
	</div>
</div>

<c:import url="common/adminFooter.jsp"/>

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/adminMain.js"></script> 
</body>
</html>