    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="UTF-8" />
	<title>ANIMALL</title>
	
	<!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <!-- Bootstrap -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/bootstrap.min.css">
  <!-- magnific popup -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/magnific-popup/magnific-popup.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slick/slick.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slick/slick-theme.css">
  <!-- themify icon -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/themify-icons/themify-icons.css">
  <!-- animate -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/animate/animate.css">
  <!-- Aos -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/aos/aos.css">
  <!-- swiper -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/swiper/swiper.min.css">
  <!-- Stylesheets -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">


  
  <!--Favicon-->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/x-icon">
  <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/x-icon">
  
  <!-- 헤더  -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
  
  <!-- fontawesome 사용 -->
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
  
  <script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
  
  <script>
		$(function(){
			$("a[id]").on("click",function(){
				var ptype = $(this).attr("id");
				console.log("ptype="+ptype);
				location.href = "${pageContext.request.contextPath}/product/productList.do?ptype="+ptype;
			});									
		});
  </script>

</head>

<style>
.preloader {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #fff;
    z-index: 9999;
    display: flex;
    align-items: center;
    justify-content: center;
}

.preloader > img{
    display: flex;
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}


#success:hover{
      
   color : #997296;
   
}
#success {
  font-size: 10px;
  font-family: "Open Sans", sans-serif;
  text-transform: capitalize;
  padding: 16px 44px;
  border-radius: 35px;
  font-weight: 600;
  border: 0;
  position: relative;
  z-index: 1;
  transition: .2s ease;
  }

</style>


<body>
<!-- 로딩 중 표시 -->
<div class="preloader">
   <img src="${pageContext.request.contextPath }/resources/images/loading_dog2.gif" alt="preloader">
</div>


    
    <!-- 글꼴 적용 -->
<div style="font-family: Nanum Gothic">


<!-- nav bar -->

<div class="primeContainer">
	<div class="bigContainer">
   		<div class="logoContainer">
	       <a href="${pageContext.request.contextPath}/index/Load.do">
	          <img src="${pageContext.request.contextPath}/resources/images/cat_dog_logo.png" alt="logo">
	       </a>
	       <div class="logoMargin">
	       </div>
   		</div>
   		<div class="logoBlank">
   		</div>
   		<div class="rightMenuContainer">
   		
   		
   			  <!-- 로그인 처리 -->
            <c:if test="${empty member}">
            <div>
             <div class="rightMenu">
                <a href='${pageContext.request.contextPath}/users/member/memberLoginMain.do'>Login</a>                  
             </div>
             </div>
             
             <div>
             <div class="rightMenu">
                  <a href='${pageContext.request.contextPath}/users/member/memberEnroll.do'>Join</a>
                  
             </div>
             </div>
            </c:if>
            
            
                
                <c:if test="${!empty member}"> <!-- 로그인 시(m이 비어있지 않다면) -->
               <div class="rightMenu">
                  <span>${member.nname} 님</span>
               </div>
               <div class="rightMenu">
                    <a href='${pageContext.request.contextPath}/users/member/memberLogout.do'>Logout</a>
               <!-- <button class="btn btn-outline-success my-2 my-sm-0"
                           type="button"
                           onclick="location.href='${pageContext.request.contextPath}/users/member/memberLogout.do'">로그아웃</button> -->
               </div>      
               </c:if>
               
		    <div>
			    <div class="rightMenu">
			    <c:choose>
					    <c:when test="${member.mtype eq 'ADMIN'}">
					       <a href='${pageContext.request.contextPath}/admin/adminPage.do'>AdminPage</a>
					    </c:when>
					    <c:when test="${member.mtype eq 'USER' or member.mtype eq 'STY'}">
					        <a href='${pageContext.request.contextPath}/mypage/mypage.do'>Mypage</a>
					    </c:when>
					    <c:otherwise>
					        <a href='javascript:void(0);' onclick=" alert('로그인이 필요합니다')">MyPage</a>
					    </c:otherwise>
				</c:choose>
			    </div>
		    </div>
		    <div>
			    <div class="rightMenu" style="border : none;">
			      	<a href='${pageContext.request.contextPath}/cart/cartList.do?mno=${member.mno}'>Cart</a>
			    </div>
		    </div>
   		</div>
   	</div>      
   	
   	
   	
   
    <div class="bigContainer">  
    	<div class="leftMenuContainer">
		    <div class="totalCategory">
		    
		      <button class="dropbtn"><i class="fas fa-bars"></i> Menu</button>
			      <div class="dropdown-content">
			      		<a href="#">Beauty</a>
				        <a href="#">Living</a>
				        <a href="#">Food</a>
				        <a href="${pageContext.request.contextPath }/board/list">AniPic</a>
                        <a href="${pageContext.request.contextPath }/styBoard/list">AniSalon</a> 
				        <a href="#">공지사항</a>
				        <a href="#">마이페이지</a>
				        <a href="#">장바구니</a>
				        <a href="#">FAQ</a>
				        
			      </div>
		    </div>
		    <div>
			    <div class="leftMenu">
			      	<a id="beauty">Beauty</a>
			    </div>
		    </div>
		    <div>
			    <div class="leftMenu">
			      	<a id="living">Living</a>
			    </div>
		    </div>
		    <div>
			    <div class="leftMenu">
			      	<a id="food">Food</a>
			    </div>
		    </div>
		    <div>
                  <div class="leftMenu">
                     <a href="${pageContext.request.contextPath }/board/list">AniPic</a>
                  </div>
            </div>
             <div>
                  <div class="leftMenu">
                     <a href="${pageContext.request.contextPath }/styBoard/list">AniSalon</a>
                  </div>
            </div>
    		<div class="leftMenuBlank">
    		</div>
   		</div>
   		<div class="searchContainer">
	   		<div class="searchMargin">
	   		</div>
	   		<input id="search" name="search">
	 	  	</input>
	 	  	<div class="searchIcon">
	 	  	<i class="fas fa-search"></i>
	   		</div>
   		</div>
   </div> 
</div> 

<!-- /navigation 여기까지 fixed 적용 -->
<!-- 글꼴 적용 -->
</div> 

<!-- position:fixed로 인한 화면 겹침 현상 방지를 위해 -->
<div class="topMargin" style="height : 175px">
</div>
	


<div class="back-to-top" >
<i class="fas fa-arrow-circle-up" id="topButton"></i>       
</div>
	
</body>
</html>
    
