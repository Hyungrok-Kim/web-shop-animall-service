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

<script>
function memberWarn(mno, val){
		console.log(val);
		
		
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/memberWarn.do',
			data : { mno : mno, val : val}, 
			dataType : 'json',
			success : function(data){
				
				console.log(data);
		
				
			},
			error : function(error){
				
				console.log("error");
			}
		});

		location.reload();

}

  

  </script>
  



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
							<div class="menuContainer_ForMain" style="background-color : #997296"
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
			
			<c:import url="../common/topMenu.jsp"/> <%-- 위에 탑 메뉴 임포트 --%>
			
			<div class="middleContainer_ForMain">
								<div class="Top_ForMenu">
									<div style="width:40px;"></div>
									<div>ID</div>
									<div>닉네임</div>
									<div>이메일</div>
									<div>주소</div>
									<div>가입일</div>
									<div>경고주기</div>
								</div>
								<form action="${pageContext.request.contextPath}/admin/memberDelete.do"
								 style="width:100%; display : flex; justify-content : center;">
									<div class="Middle_ForMenu">
										
										<c:if test="${empty map}">
										<c:forEach var="b" items="${memberList}">
											<div class="memberInfoList">
												<div style="width : 40px;">
													<input id="checkBox_ForMember${b.mno}" type="checkbox"
													 name="mno" value="${b.mno}" style="display : none;"/>
													<c:if test="${b.warn == '경고'}">
														<label for="checkBox_ForMember${b.mno}"></label>
													</c:if>
												</div>
												<div>${b.id}</div>
												<div>${b.nname}</div>
												<div style="justify-content : flex-start;">${b.email}</div>
												<div>${b.address}</div>
												<div>${b.joinDate}</div>
												<div>
													<select name="value" onchange="memberWarn(${b.mno}, value)"
													style="width : 60px;">
														<option value="0">${b.warn}</option>
														<option value="1">경고</option>
														<option value="2">정상</option>
													</select>
												</div>
											</div>
										</c:forEach>
										</c:if>
										<c:if test="${!empty map}">
										<c:forEach var="b" items="${map.list}">
											<div class="memberInfoList">
												<div style="width : 40px;">
													<input id="checkBox_ForMember${b.mno}" type="checkbox"
													 name="mno" value="${b.mno}" style="display : none;"/>
													<c:if test="${b.warn == '경고'}">
														<label for="checkBox_ForMember${b.mno}"></label>
													</c:if>
												</div>
												<div>${b.id}</div>
												<div>${b.nname}</div>
												<div style="justify-content : flex-start;">${b.email}</div>
												<div>${b.address}</div>
												<div>${b.joinDate}</div>
												<div>
													<select name="value" onchange="memberWarn(${b.mno}, value)"
													style="width : 60px;">
														<option value="0">${b.warn}</option>
														<option value="1">경고</option>
														<option value="2">정상</option>
													</select>
												</div>
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
											<label for="form_sub">
												삭제
											</label>
										</div>
										<form method="post" action="${pageContext.request.contextPath}/admin/memberSearch.do">
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

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin.js"></script> 
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<c:import url="../common/adminFooter.jsp"/>
</body>
</html>