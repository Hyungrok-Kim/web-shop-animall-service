<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <title>ANIMALL</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/carousel.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rayer.css" />
  
  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <!-- Bootstrap -->
  <link rel="stylesheet" href="resources/plugins/bootstrap/bootstrap.min.css">
  <!-- magnific popup -->
  <link rel="stylesheet" href="resources/plugins/magnific-popup/magnific-popup.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="resources/plugins/slick/slick.css">
  <link rel="stylesheet" href="resources/plugins/slick/slick-theme.css">
  <!-- themify icon -->
  <link rel="stylesheet" href="resources/plugins/themify-icons/themify-icons.css">
  <!-- animate -->
  <link rel="stylesheet" href="resources/plugins/animate/animate.css">
  <!-- Aos -->
  <link rel="stylesheet" href="resources/plugins/aos/aos.css">
  <!-- swiper -->
  <link rel="stylesheet" href="resources/plugins/swiper/swiper.min.css">
  <!-- Stylesheets -->
  <link href="resources/css/style.css" rel="stylesheet">
  
  <!--Favicon-->
  <link rel="shortcut icon" href="resources/images/favicon.png" type="image/x-icon">
  <link rel="icon" href="resources/images/favicon.png" type="image/x-icon">
	
  <script src="resources/js/jquery-3.5.1.min.js"></script>

  <script>
		$(function(){
			$("a[id]").on("click",function(){
				var ptype = $(this).attr("id");
				console.log("ptype="+ptype);
				location.href = "${pageContext.request.contextPath}/product/productList.do?ptype="+ptype;
			});									
		});
  </script>
<style type="text/css">
h1{
text-align:center;
color: black;
}


hr{
color: black;
width: 80%;
}


.parent{
    width: 200px;
    
    margin: 10px auto;
    display: flex; 
}

.first {
    border: 1px solid purple;
    flex:1;
    width:30%;
    box-sizing: border-box;
}

.second{
    border: 1px solid purple;
    flex:1;
    margin: 0px 5%;
    width:30%;
    box-sizing: border-box;
}

.third{
    border: 1px solid purple;
    flex:1;
    width:30%;
    box-sizing: border-box;
}

.fourth {
    border: 1px solid purple;
    flex:1;
    width:30%;
    box-sizing: border-box;
}

.fifth{
    border: 1px solid purple;
    flex:1;
    margin: 0px 5%;
    width:30%;
    box-sizing: border-box;
}

.sixth{
    border: 1px solid purple;
    flex:1;
    width:30%;
    box-sizing: border-box;
}
</style>
</head>

<body>

<header>
	<c:import url="../common/header.jsp"/>
</header>
  <script type="text/javascript">
	$(function(){
		$('.preloader').css('display', 'none');
	});
	function goPage(url){
				location.href=url;
	};
</script>
<!-- blog -->
<section class="section bg-gray">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 text-center">
        <h1>My Page 마이페이지</h1>
			<hr>
			
			<div class="test1">
				<c:if test="${ !member.mtype.equals('STY') }">
					<h4>미용사 신청을 하고 미용 커뮤니티에 프로필을 남겨주세요! </h4>
				</c:if>
				<c:if test="${!empty stylist and stylist.ispre != 'Y' }">일반</c:if>
				<c:if test="${!empty stylist and stylist.ispre == 'Y' }">프리미엄</c:if>
			</div>
			<hr>
			<div class="parent">
				<div class="first" ><a href="memberInfo"><span>회원정보</span></a></div>
				
				<div class="second" >
					<c:if test="${member.mtype.equals('STY') }">
					<a href="${pageContext.request.contextPath }/stylist/stylistView.do"><span>미용사프로필</span></a>
					</c:if><c:if test="${ !member.mtype.equals('STY') }">
					<button type="button" class="sty" onclick="goPage('${pageContext.request.contextPath }/stylist/stylistForm.do')">미용사 신청</button>
					</c:if>
				</div>
				<div class="third" ><a href="${pageContext.request.contextPath }/order/myOrderList.do?mno=${member.mno}"><span>주문 내역</span></div>
			</div>
			
      </div>
    </div>
  </div>
</section>
<!-- /blog -->

<footer>
	<c:import url="../common/footer.jsp" />
</footer>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
		var IMP = window.IMP; // 생략가능

		$(function() {
			IMP.init('imp49697267');
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		function premiumUp() {
			// 문서 로딩될 때 바로 호출
			
				IMP.request_pay({
					pg : 'html5_inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
					name : '주문명: 프리미엄 등급 전환',
					amount : 380000,
					buyer_email : '${member.email}',
					buyer_name : '${stylist.styname}',
					buyer_tel : '${stylist.cellphone}',
					buyer_addr : '${stylist.shopaddress}',
					buyer_postcode : '0'
				}, function(rsp) {
					if (rsp.success) {
						//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						$.ajax({
							url : "${pageContext.request.contextPath}/stylist/premiumUpgrade.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
							type : 'POST',
							dataType : 'json',
							data : {
								buyer_no : '${stylist.mno}'
							}
						});
						location.href="${pageContext.request.contextPath}/mypage/memberInfo.do";
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
		});
	</script>
</body>
</html>