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
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>  
<style>          
  form {
  background: #fff;
  padding: -10em 20em -20em -20em;  
  margin: 50px 600px 0;
  border-radius: 2px;
  }
   	  
   #leftText {                        /*아이디, 비밀번호 글씨 부분*/
    width: 150px;
    height: 40px;
    /*border: 1px solid black;*/    
    display: flex;                  /*div를 float를 사용했기 때문에 정렬을 위해서 flex로 설정*/
    justify-content: left;          /*horizontal left */
    align-items: center;            /*상하 정렬*/
    font-size: 15px;                /*글씨 사이즈*/
    font-weight: bold;
    /*margin-top: 10px;*/
  }
  #inputText{                       /*텍스트 입력 부분*/
    width: 180px;
    height: 40px;
    /*border: 1px solid black;*/
    display: flex;
    font-size: 20px;
    justify-content: left;
    vertical-align: middle;
  }
  #securityText{                    /*보안접속 부분*/
    align-items: center;
    font-size: 12px;
  }

  #main{                            /*기본 바탕 부분 div*/
      width: 700px;
      height: 100px;
      /*border: 1px solid red;*/
      display: flex;
      align-items: center;
      justify-content: center;
  }
  #mainLogo{                        /*로그인 타이틀*/
      width: 700px;
      height: -50px;
      /*border: 1px solid red;*/
      display: flex;
      align-items: center;
      justify-content: center;
  }
  #main2Left{                       /*로그인 div를 넣을 div*/
      padding-left: 100px;
      width: 400px;
      height: 100%;
      /*border: 1px solid red;*/
      display: inline-block;
      vertical-align:middle;
  }
  .main2Right{                      /*로그인 버튼을 넣을 div*/
      width: 200px;
      height: 120px;
      /*border: 1px solid red;*/
      display: flex;
      float : left;
  }
  #loginTitle{
    color: #997296; 
    font-size: 40px;
    font-weight: bold;
  }
  #button{                             /*로그인 버튼*/
    width: 80px;
    height: 80px;
    text-align: center;
    background-color: #997296;
    color: white;
    border: 1px solid #4e266d;
  }
  #button:hover{                        /*로그인 버튼 오버*/
    background-color: white;
    color: #997296;
    cursor: pointer;
  }
  #bottomBtn{                           /*하단 버튼 3개*/
    margin-right: 10px;
    width: 140px;
    height: 30px;
    background-color: white;
    color: #997296;
    border: 1px solid #997296;
  }
  #bottomBtn:hover{                     /*하단 버튼 오버*/
    width: 140px;
    height: 30px;
    background-color: #997296;
    color: white;
    border: 1px solid #997296;
    cursor: pointer;
  }
  #mainLine{ 								/* 하단 구분선 */
    width: 700px;
    height: 50px;
    border-bottom: 1.5px solid #997296;
  }

  </style>
</head>
<link rel="stylesheet">
<body>   
   <br />   
	<c:import url="../../common/header.jsp" />
	<form action="${pageContext.request.contextPath}/users/member/memberLogin.do" method="post">
	<div id="mainLogo"> <span id="loginTitle">로그인</span> </div>
	
     <div id="main2Left" style="float: left;" >
            <!-- 로그인 입력 부분-->
            <div style="float:left" id="leftText">
                <span>아이디</span>
            </div>
            <div style="float: left;" id="inputText">
                <input type="text"  name="id"
										placeholder="" required>
            </div>
            <div style="clear: both; float: left; height: 5px;"></div>
            <div style="clear: both;float: left;" id="leftText">
                <span>비밀번호</span>
            </div>
            <div style="float: left;" id="inputText">
                <input type="password"  name="pwd"
										placeholder="" required>
            </div>
            <div style="clear: both;float: left;" id="leftText">
            
            </div>                
            </div>	
    <br>
    <br>
    <br>
     <div class="main2Right">
     <button type="submit" id="button">로그인</button>
     </div>
    	 </form>
    	 <form action="">
      <div id="mainLine" style="clear: both;"></div>     
     <div id="main" >              
        <button id="bottomBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/users/member/memberFindId.do'">아이디 찾기</button>
        <button id="bottomBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/users/member/memberFindPwd.do'">비밀번호 찾기</button>
    </form>
        </div>          
                          
</body>
<c:import url="../../common/footer.jsp" />
</html>