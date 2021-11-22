<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<style>


form {
  background: #fff;
  padding: 0 0 4em 2em;
  max-width: 400px;
  margin: 50px auto 0;
  border-radius: 2px;
}


h5 {
  margin: 0 0 50px 0;
  padding: 10px;
  text-align: center;
  font-size: 30px;
  font-color : #997296;
  border-bottom: solid 1px #e5e5e5;
}

#resultId {
       color : #997296;
      padding-left: 35px;
      font-size: 20px;
      width: 400px;
      height: 10%;
      /*border: 1px solid red;*/
      
      vertical-align:middle;
  }
}
.login_sorting{
    margin-top: -20px;
    margin-left: 50px;
}
 #bottomBtn{                           /*하단 버튼 3개*/    
    margin-right: 50px;
    width: 140px;
    height: 30px;
    background-color: white;
    color: #997296;
    border: 1px solid #997296;
  }
  
   #main{                            /*기본 바탕 부분 div*/
      width: 700px;
      height: 100px;
      /*border: 1px solid red;*/
      
      align-items: center;
      
  }
    #mainLogo{                        /*로그인 타이틀*/
      width: 700px;
      height: 100px;
      /*border: 1px solid red;*/
      display: flex;
      
  }
  
  #bottomBtn:hover{                     /*하단 버튼 오버*/
    width: 140px;
    height: 30px;
    background-color: #997296;
    color: white;
    border: 1px solid #997296;
    cursor: pointer;
  }
    #loginTitle{
    color: #4E266D; /* 마켓컬리 색깔*/
    font-size: 20px;
    font-weight: bold;
    padding-left : 50px;
  }
  
</style>

</head>
<c:import url="../../common/header.jsp" />
<link rel="stylesheet">
<body>
      <form action="find_id.do" method="post">
                          
             <!--  <h5 style="text-align:center">아이디 찾기</h3> -->
             <form action="" method="post">
          <div id="mainLogo"> <span id="loginTitle"></span> </div>                      
         <div id="resultId">            
            
                                     
            회원님의 아이디는 '${ id }' 입니다.
             <br>
             
             
             <br>
             <br>
             <br>
             <br>
         </div>  
         <br>
         <br>
         <div id="mainLine" style="clear: both;"></div>     
           <div id="main" >                
             
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <button id="bottomBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/users/member/memberLoginMain.do'">로그인 하기</button>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <button id="bottomBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/users/member/memberFindPwd.do'">비밀번호 찾기</button>
             </div>
                               
                              
</form>
<c:import url="../../common/footer.jsp" />
</body>
</html>