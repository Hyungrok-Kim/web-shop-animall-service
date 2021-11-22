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
  <link rel="stylesheet" href="/resources/plugins/bootstrap/bootstrap.min.css">
  <!-- magnific popup -->
  <link rel="stylesheet" href="/resources/plugins/magnific-popup/magnific-popup.css">
  <!-- Slick Carousel -->      
  <link rel="stylesheet" href="/resources/plugins/slick/slick.css">
  <link rel="stylesheet" href="/resources/plugins/slick/slick-theme.css">
  <!-- themify icon -->        
  <link rel="stylesheet" href="/resources/plugins/themify-icons/themify-icons.css">
  <!-- animate -->             
  <link rel="stylesheet" href="/resources/plugins/animate/animate.css">
  <!-- Aos -->                 
  <link rel="stylesheet" href="/resources/plugins/aos/aos.css">
  <!-- swiper -->              
  <link rel="stylesheet" href="/resources/plugins/swiper/swiper.min.css">
  <!-- Stylesheets -->
  <link href="/resources/css/style.css" rel="stylesheet">
  
  <!--Favicon-->
  <link rel="shortcut icon" href="/resources/images/favicon.png" type="image/x-icon">
  <link rel="icon" href="/resources/images/favicon.png" type="image/x-icon">
	
  <script src="/resources/js/jquery-3.5.1.min.js"></script>

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
body{
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}
.container{
	
	width: 1000px;
	margin: 0 auto;
	
}



ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
		div#update-container{width:400px; margin:0 auto; text-align:center;}
		div#update-container input, div#update-container select {margin-bottom:10px;}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
	
<!-- 주소 검색 api -->
			<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			
			<script>
			function execDaumPostcode() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                extraRoadAddr += data.bname;
			            }
			            // 건물명이 있고, 공동주택일 경우 추가한다.
			            if(data.buildingName !== '' && data.apartment === 'Y'){
			                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			            }
			            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			            if(extraRoadAddr !== ''){
			                extraRoadAddr = ' (' + extraRoadAddr + ')';
			            }
			            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			            if(fullRoadAddr !== ''){
			                fullRoadAddr += extraRoadAddr;
			            }

			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
			            document.getElementById('addr1').value = fullRoadAddr;
			            document.getElementById('addr2').focus();
			        }
			    }).open();
			}
			
    		</script>	

<title>마이페이지</title>
</head>
<body>
<header>
	<c:import url="../common/header.jsp"/>
</header>
<div class="container">
	
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">회원 정보</li>
		<li class="tab-link" data-tab="tab-2">미용사 프로필</li>
		<li class="tab-link" data-tab="tab-3">주문 내역</li>	
	</ul>


	<div id="tab-1" class="tab-content current">
				<form id="update-container" action="${ pageContext.request.contextPath }/member/memberUpdate" method="post" enctype="multipart/form-data">
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="id" name="id" readonly value="${ member.id }"> 
					</p>
		
					<p>
						<label>현재 비밀번호</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password"  value="" required>
					</p>
					<p>
						<label>새 비밀번호</label> 
						<input class="w3-input" id="new_pw" name="new_pw" type="password" value="" required>
					</p>
					<p>
						<label>새 비밀번호 확인</label> 
						<input class="w3-input" id="con_pw" name="con_pw" type="password" value="" required>
					</p>
					<p>
						<label>닉네임</label> 
						<input class="w3-input" id="nname" name="nname" type="text"  placeholder="닉네임" value="${member.nname}" required>
					</p>
					<p>
						<label>이메일</label> 
						<input class="w3-input" type="text" id="email" name="email" value="${ member.email }" required> 
					</p>
					<tr>
            <td rowspan="3">
               <p>주소</p>
            </td>
            <td>
               <input type="text" size="20" name="zip" id="zip" class="form-control" value="${member.zip }">
            </td>
                         
            <td>
               &nbsp;<button type="button" class="zipSearch" onclick="execDaumPostcode();">주소검색</button>
            </td>
            <br>
            <br>
         	</tr>
         	<tr>
  
            <td colspan="2">
               <input type="text" size="20" name="addr1" id="addr1" class="form-control" placeholder="${member.addr1 }">
            </td>
         </tr>
         <tr>
            
            <td colspan="2">
               <input type="text" size="20" name="addr2" id="addr2" class="form-control" placeholder="${member.addr2 }">
            </td>
         </tr>
					
					<p class="w3-center">
						<button type="submit" id="updateBtn" disabled class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" >정보 수정</button>
					</p>
					
		
				</form>
				
				<form id="update-container" action="${pageContext.request.contextPath }/users/member/memberDelete.do" method="post" enctype="multipart/form-data">
					<p class="w3-center">
						<input type="hidden" name="mno" value="${member.mno}" />
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원 탈퇴</button>
					</p>
				</form>
				
	</div>
	
	<div id="tab-2" class="tab-content">
			<form id="update-container" action="${pageContext.request.contextPath }/stylist/stylistUpdateEnd.do" method="post" enctype="multipart/form-data">
				<p> 
				<input type="hidden" style="border: none; border-bottom:1px solid black" name="mno" value="${ member.mno }">
					<c:if test="${!empty stylist and stylist.ispre != 'Y' }">일반 : <button type="button" class="btn btn-sm btn-primary" onclick="premiumUp();">프리미엄 이용권 구매</button></c:if>
					<c:if test="${!empty stylist and stylist.ispre == 'Y' }">프리미엄</c:if> 
				</p>
				<p>
					<label>가게 명</label> : ${ stylist.shopname }
				</p>
				<p>
					<label>가게 주소</label> : ${ stylist.shopaddress }
				</p>
				<p>
					<label>미용사</label> : ${ stylist.styname }
				</p>
				<p>
					<label>가게 연락처</label> : ${ stylist.shopphone }
				</p>
				<p>
					<label>미용사 연락처</label> : ${ stylist.cellphone }
				</p>
				<p>
					<label>자격증 번호</label> : <input type="text" name="certifino" value="${ stylist.certifino }"/>
				</p>
				<p>
					<label>사업자 등록증 사진 <sub>(클릭 시 이미지 변경이 가능합니다)</sub></label>
				      <div id="certImgArea">
				      	<img id="certImg" width="70" height="70" src="${pageContext.request.contextPath }/resources/stylistUpload/${stylist.certImg}"/>
				      </div>
			      	<input type="file" id="certImgFile" name="certImgFile" pattern=".gif,.png,.jpg,.jpeg" accept="image/*,.gif,.png,.jpg,.jpeg"  onchange="loadImg(this);">
			      	<br>
			      	* 3MB이하, GIF/PNG/JPG 형식의 이미지 파일 최대 1개까지 등록 가능합니다.
			      	<br><br>
					* 파일명은 한글, 숫자, 영문 외 문자열을 입력하실 수 없습니다.
				</p>
				<p>
					 <button class="btn btn-sm btn-danger" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage.do'">뒤로 가기</button> 
					 &nbsp;&nbsp;&nbsp;
					 <button class="btn btn-sm btn-success" type="submit">프로필 수정 요청</button>
				</p>
			</form>
			
		</div>
	
	<div id="tab-3" class="tab-content">
				<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col" colspan="2">상품 정보</th>
      <th scope="col">주문날짜</th>
      <th scope="col">주문번호</th>
      <th scope="col">상품금액</th>
      <th scope="col">상품수량</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="order">
	<tr>
      <th scope="row">
      	<c:if test="${ order.changename == null }">
      		<img src="${pageContext.request.contextPath }/resources/images/logo.png">
      	</c:if>
      	<c:if test="${ order.changename != null }">
      		<img src="${pageContext.request.contextPath }/resources/productUpFiles/${ order.changename }">
      	</c:if>
      </th>
      <th>
      	<h3>${ order.pname }</h3>
      	<span>${ order.pcontent }</span>
      </th>
      <td>${ order.paydate }</td>
      <td>${ order.preno }</td>
      <td>${ order.pprice }</td>
      <td>${ order.payamount }</td>
   	</tr>
  </c:forEach>
  </tbody>
</table>

			
		</div>
	
	
</div>
	
<footer>
	<c:import url="../common/footer.jsp" />
</footer>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(function(){
	$("a[id]").on("click",function(){
		var ptype = $(this).attr("id");
		console.log("ptype="+ptype);
		location.href = "${pageContext.request.contextPath}/product/productList.do?ptype="+ptype;
	});									
});
$(function(){
	if(${msg ne null}){
		alert('${msg}');
	};
	
	$("#update-container").submit(function(){
		
		if ($("#new_pw").val().length < 8) {
			alert("비밀번호는 8자 이상으로 설정해야 합니다.");
			$("#new_pw").val("").focus();
			return false;
		}else if($.trim($("#new_pw").val()) !== $("#new_pw").val()){
			alert("공백은 입력이 불가능합니다.");
			return false;
		}
		
	});
	
	$("#con_pw").blur(function(){
		var p1=$("#new_pw").val(), p2=$("#con_pw").val();
		if(p1!=p2){
			alert("패스워드가 일치하지 않습니다.");
			$("#new_pw").focus();
		} else {
			$('#updateBtn').prop('disable', false);
		}
	});
});

$(document).ready(function(){

$('ul.tabs li').click(function(){
	var tab_id = $(this).attr('data-tab');

	$('ul.tabs li').removeClass('current');
	$('.tab-content').removeClass('current');

	$(this).addClass('current');
	$("#"+tab_id).addClass('current');
});

	

});
$(function(){
	$('.preloader').css('display', 'none');
	var tabIndex = '${tabIndex}';
	if(tabIndex == 2){
		$('[data-tab=tab-2]').click();
	} else if (tabIndex == 3 ){
		$('[data-tab=tab-3]').click();
	} else if (tabIndex == 4 ){
		$('[data-tab=tab-4]').click();
	} else if (tabIndex == 5 ){
		$('[data-tab=tab-5]').click();
	}
});
function goPage(url){
			location.href=url;
};
//----------------------- iamport 시작
		var IMP = window.IMP; // 생략가능

		$(function() {
			IMP.init('imp49697267');
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		function premiumUp() {
			// 문서 로딩될 때 바로 호출
			var preConfirm = window.confirm("프리미엄 이용권을 구매하시겠습니까?");
			if( preConfirm ){
				IMP.request_pay({
					pg : 'kakaopay',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
					name : '주문명: 프리미엄 이용권 구매',
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
							data : {
								buyer_no : '${stylist.mno}'
							}, success : function(data){
								if(data =='결제 성공!'){
									alert("프리미엄 전환 성공!");
								} else {
									alert("프리미엄 전환 실패!, 관리자에게 문의 하세요");
								}
								location.href="${pageContext.request.contextPath}/mypage/memberInfo.do";
							}
						});
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});	
			}
		};
		//----------------------- iamport 끝
		// 참조 API : http://postcode.map.daum.net/guide
	function searchAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#shopaddress').val(data.zonecode +", " + fullAddr);
            }
        }).open();
    };

 // 사진 게시글 미리보기 기능 구현
	$(function(){
		$('#certImgArea').click(function(){
			$('#certImgFile').click();
		});
		
		$('#certImgFile').hide();
	})
	
	function loadImg(img){
		if(img.files && img.files[0]) {
			
			var reader = new FileReader();
			
			reader.onload = function(e){
				
				$('#certImg').attr('src', e.target.result);
			}
			
			reader.readAsDataURL(img.files[0]);
		}	
	}
	</script>
</body>
</html>