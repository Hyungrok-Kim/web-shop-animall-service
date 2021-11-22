<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.spring.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 페이지</title>
	<c:import url="../common/header.jsp"/>
	<style>
		div#update-container{width:400px; margin:0 auto; text-align:center;}
		div#update-container input, div#update-container select {margin-bottom:10px;}
	</style>
	</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
	<div id="update-container">
		<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
			<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="userId" id="userId_" value="${member.userId}" readonly required>
			<input type="text" class="form-control" placeholder="이름" name="userName" id="userName" value="${member.userName}" required>
			<input type="number" class="form-control" placeholder="나이" name="age" id="age" value="${member.age}">
			<input type="email" class="form-control" placeholder="이메일" name="email" id="email" value="${member.email}" required>
			<input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" value="${member.phone}" required>
			<input type="text" class="form-control" placeholder="주소" name="address" value="${member.address}" id="address">
			<select class="form-control" name="gender" required>
			  <option value="" disabled selected>성별</option>
			  <option value="M" ${member.gender=='M'?'selected':'' }>남</option>
			  <option value="F" ${member.gender=='F'?'selected':'' }>여</option>
			</select>
			<div class="form-check-inline form-check">
				취미 : &nbsp; 
				<% 
					/* List.contains메소드를 사용하기 위해 String[] => List로 형변환함.  */
					List<String> hobbyList = null;
					String[] hobby = ((Member)session.getAttribute("member")).getHobby();
					if(hobby != null)//이 조건이 없다면,취미체크박스에 하나도 체크하지 않았다면, Array.asList(null)=>NullPointerException 
						hobbyList = Arrays.asList(hobby); 
				%>
				<input type="checkbox" class="form-check-input" name="hobby" id="hobby0" value="운동" <%=hobbyList!=null && hobbyList.contains("운동")?"checked":""%>>
				<label for="hobby0" class="form-check-label" >운동</label>&nbsp;
				<input type="checkbox" class="form-check-input" name="hobby" id="hobby1" value="등산" <%=hobbyList!=null && hobbyList.contains("등산")?"checked":""%>>
				<label for="hobby1" class="form-check-label" >등산</label>&nbsp;
				<input type="checkbox" class="form-check-input" name="hobby" id="hobby2" value="독서" <%=hobbyList!=null && hobbyList.contains("독서")?"checked":""%>>
				<label for="hobby2" class="form-check-label" >독서</label>&nbsp;
				<input type="checkbox" class="form-check-input" name="hobby" id="hobby3" value="게임" <%=hobbyList!=null && hobbyList.contains("게임")?"checked":""%>>
				<label for="hobby3" class="form-check-label" >게임</label>&nbsp;
				<input type="checkbox" class="form-check-input" name="hobby" id="hobby4" value="여행" <%=hobbyList!=null && hobbyList.contains("여행")?"checked":""%>>
				<label for="hobby4" class="form-check-label" >여행</label>&nbsp;
			</div>
			<br />
			<input type="submit" class="btn btn-outline-success" value="수정" >&nbsp;
			<input type="reset" class="btn btn-outline-success" value="취소">&nbsp;
			<input type="button" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/member/memberDelete.do'" value="탈퇴">
		</form>
	</div>
	<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>