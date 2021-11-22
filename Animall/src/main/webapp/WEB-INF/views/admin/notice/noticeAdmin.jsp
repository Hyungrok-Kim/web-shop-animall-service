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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

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
							
							<div class="menuContainer_ForMain" 
							onclick="location.href='${pageContext.request.contextPath}/admin/inquiry/inquiryAdmin.do'">
								<i class="fas fa-question-circle"></i>&nbsp&nbsp&nbsp
								문의 관리
							</div>
							<div class="menuContainer_ForMain" style="background-color : #997296"
							onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeAdmin.do'">
								<i class="fas fa-exclamation-circle"></i>&nbsp&nbsp&nbsp
								공지사항 관리
							</div>
					
			 </div>
	 		<div class="bigContainer_ForMain2">
			
			<c:import url="../common/topMenu.jsp"/> <%-- 위에 탑 메뉴 임포트 --%>
			
			<div class="middleContainer_ForMain">
								<div class="Top_ForMenu">
									<div style="width:40px;"></div>
									<div style="width:220px;">번호</div>
									<div style="width:220px;">제목</div>
									<div style="width:220px;">작성자</div>
									<div style="width:220px;">작성일</div>
								</div>
								<form action=""
								 style="width:100%; display : flex; justify-content : center;">
									<div class="Middle_ForMenu">
										
										<c:if test="${empty map}">
										<c:forEach var="b" items="${noticeList}">
											<div class="memberInfoList">
												<div style="width : 40px;">
													
												</div>
												<div style="width:220px;">${b.nno}</div>
												<div style="width:220px;">${b.ntitle}</div>
												<div style="width:220px;">${b.nname}</div>
												<div style="width:220px;">${b.ndate}</div>
												
											</div>
										</c:forEach>
										</c:if>
										<c:if test="${!empty map}">
										<c:forEach var="b" items="${map.list}">
											<div class="memberInfoList">
												<div style="width : 40px;">
										
												</div>
												<div style="width:220px;">${b.nno}</div>
												<div style="width:220px;">${b.ntitle}</div>
												<div style="width:220px;">${b.nname}</div>
												<div style="width:220px;">${b.ndate}</div>
												
											</div>
										</c:forEach>
										</c:if>
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
											<button id="notice_Write">
												글쓰기
											</button>
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

<div class="primeContainer_forRayer" id="noticeWriter">
<div class="dimedContainer_forRayer" id="write_form__bg">
</div>
		<form id='write_form' role='form' method='post' enctype='multipart/form-data'
		 action="${pageContext.request.contextPath}/admin/notice/noticeWrite.do">
		

			<div class="bigContainer_forRayer" id="write_form_box">
				<div class="formContainer_forRayer2">
					<input type="text" value="${member.mno}" name="mno" style="display:none;" />
					<div style="width : 900px; height : 50px; background-color : #F6F6F6; border-radius : 10px 10px 0px 0px ;">
					</div>
					<div style="height : 70px; overflow:hidden;">
					<fieldset style="border : 1px solid lightgray; width : 850px; height : 70px;">
						<legend style=" margin-left : 30px; width : 80px; padding : 0px 10px 0px 10px; font-size : 13pt;">subject</legend>
						<input type="text" style="width : 800px; height : 30px; border : none; padding-left : 10px;
						outline : none" name="ntitle"/>
					</fieldset>
					</div>
					<div style="border-radius : 0px 0px 10px 10px; margin-bottom : 20px;">
							<textarea id="noticeEditor" name="ncontent"></textarea>
					</div>
					<div>
						<input class="noticeSave" type="submit" value="저장" />
					</div>
					<div class="closeButton_forRayer" id="noticeWriter_close_button">
						<i class="fas fa-times" style="font-size : 20px;"></i>
					</div>
				</div>
			</div>
		</form>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/noticeAdmin.js"></script>

<c:import url="../common/adminFooter.jsp"/>
</body>
</html>