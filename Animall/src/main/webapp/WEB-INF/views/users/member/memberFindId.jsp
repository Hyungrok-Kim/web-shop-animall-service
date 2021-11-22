<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<style>

form {
  background: #fff;
  padding: 0 0 4em 2em;
  max-width: 400px;
  margin: 50px auto 0;
  border-radius: 2px;
}

form h4 {
  margin: 0 0 50px 0;
  padding: 10px;
  text-align: center;
  font-size: 20px;
  color: #666666;
  border-bottom: solid 1px #e5e5e5;
}

form p {
  margin: 0 0 3em 0;
  position: relative;
}

form input {
  display: block;
  box-sizing: border-box;
  width: 110%;
  outline: none;
  margin: 0;
}
form input[type="text"],
form input[type="password"] {
  background: #fff;
  border: 1px solid #dbdbdb;
  font-size: 1.6em;
  padding: .8em .5em;
  border-radius: 2px;
  width: 400px;
}
form input[type="text"]:focus,
form input[type="password"]:focus {
  background: #fff;
}

form span {
  display: block;
  background: #997296;
  padding: 2px 5px;
  color: white;
}

form input[type="submit"] {
  background: rgba(148, 186, 101, 0.7);
  box-shadow: 0 3px 0 0 rgba(123, 163, 73, 0.7);
  border-radius: 2px;
  border: none;
  color: #fff;
  cursor: pointer;
  display: block;
  font-size: 2em;
  line-height: 1.6em;
  margin: 2em 0 0;
  outline: none;
  padding: .8em 0;
  text-shadow: 0 1px #68B25B;
}
form input[type="submit"]:hover {
  background: #94af65;
  text-shadow: 0 1px 3px rgba(70, 93, 41, 0.7);
}
form label {
  position: absolute;
  left: 8px;
  top: 12px;
  color: #999;
  font-size: 16px;
  display: inline-block;
  padding: 4px 10px;
  font-weight: 400;
  background-color: rgba(255, 255, 255, 0);
  -moz-transition: color 0.3s, top 0.3s, background-color 0.8s;
  -o-transition: color 0.3s, top 0.3s, background-color 0.8s;
  -webkit-transition: color 0.3s, top 0.3s, background-color 0.8s;
  transition: color 0.3s, top 0.3s, background-color 0.8s;
}

form label.floatLabel {
  top: -13px;
  background-color: rgba(255, 255, 255, 0.8);
  font-size: 14px;
}

.login_sorting{
    margin-top: 50px;
}
.login_btn{
   margin-top: -20px;
    text-align: right;
}
.snsicon{
   margin-bottom: 10px;
}
.button1 {
    background: #997296;
    
    cursor: pointer;
}
button {
    background: none;
    border: none;
    cursor: pointer;
}

.button1 {width: 110%;}

.findpw p input[type="text"] {height: 15px;}
.findpw p input::placeholder{font-size: 10px;}
</style>

</head>
<c:import url="../../common/header.jsp" />
<link rel="stylesheet">
<body>
          <form action="find_id.do" method="post">
              <h4>아이디 찾기</h4>                  
                  <p>
                     <label for="email" class="floatLabel">이메일</label>
                     <input type="text" class="user_email"name="email" id="email" maxlength="25" placeholder="1234@example.com" required="required" />
                  </p>
                  
                  <div class="login_sorting">
                     <button class ="button1" type="submit"><span>아이디 찾기</span></button>
                   </div>
                
         </form>

<c:import url="../../common/footer.jsp" />

</body>
</html>