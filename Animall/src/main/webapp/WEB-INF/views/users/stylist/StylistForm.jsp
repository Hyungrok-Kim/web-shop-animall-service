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
	<style>
	#certImgArea {
		width:70px;
		height:70px;
		border:2px dashed darkgray;
		text-align:center;
		display:table-cell;
		vertical-align:middle;
	}
	#certImgArea:hover {
		cursor:pointer;
	}
	</style>
</head>

<body>

<header>
	<c:import url="../../common/header.jsp"/>
</header>
  
<!-- blog -->
<section class="section bg-gray">
  <div class="container">
  <form action="${pageContext.request.contextPath}/stylist/stylistFormEnd.do" method="post" enctype="multipart/form-data">
    <div class="row justify-content">
	<input type="hidden" name="mno" value="${member.mno }" />    
  <div class="col-3 text-center">
        <b style="font-size:14pt; color:#AA80B5; margin-bottom:20px;">신청인 정보</b>
        <br>
      </div>
      <div class="col-9 text-center">
      </div>
     </div>
     <div class="row justify-content">
     <div class="col-1">
     </div> 
      <div class="col-3 text-center">
        이름
      </div>
      <div class="col-4">
      	<input type="text" style="border: none; border-bottom:1px solid black"
      	       name="styname">
      </div>
      <div class="col-4">
     </div> 
     <div class="col-1">
     </div> 
      <div class="col-3 text-center">
        자격증번호
      </div>
      <div class="col-4">
      	<input type="text" style="border: none; border-bottom:1px solid black"
      	       name="certifino">
      </div>
      <div class="col-4">
     </div> 
     <div class="col-1">
     </div> 
      <div class="col-3 text-center">
        핸드폰 번호
      </div>
      <div class="col-4">
      	<input type="text" style="border: none; border-bottom:1px solid black"
      	       name="cellphone">
      </div>
      <div class="col-4">
     </div>
    </div>
    <hr>
    <div class="row justify-content">
     <div class="col-1">
     </div> 
      <div class="col-3 text-center">
        가게명
      </div>
      <div class="col-4">
      	<input type="text" style="border: none; border-bottom:1px solid black"
      	       name="shopname">
      </div>
      <div class="col-4">
     </div> 
      <div class="col-1">
     </div> 
      <div class="col-3 text-center">
        가게연락처
      </div>
      <div class="col-4">
      	<input type="text" style="border: none; border-bottom:1px solid black"
      	       name="shopphone">
      </div>
      <div class="col-4">
     </div> 
      <div class="col-1">
     </div> 
      <div class="col-3 text-center">
        사업자명
      </div>
      <div class="col-4">
      	<input type="text" style="border: none; border-bottom:1px solid black"
      	       name="bsname">
      </div>
      <div class="col-4">
     </div> 
     <div class="col-1">
     </div> 
      <div class="col-3 text-center">
        가게 주소
      </div>
      <div class="col-4">
      	<input type="text" style="border: none; border-bottom:1px solid black"
      	       name="shopaddress" id="shopaddress">
      	<input type="button" name="find_addr" onclick="searchAddr();" value="주소찾기">
      </div>
      <div class="col-4">
     </div> 
     <div class="col-1">
     </div> 
      <div class="col-3 text-center">
        사업자 등록번호
      </div>
      <div class="col-4">
      	<input type="text" style="border: none; border-bottom:1px solid black"
      	       name="bsno">
      </div>
      <div class="col-4">
     </div> 
     <div class="col-1">
     </div> 
      <div class="col-3 text-center">
        사업자 등록증 첨부
      </div>
      <div class="col-4">
	      <div id="certImgArea">
	      	<img id="certImg" width="70" height="70" />
	      </div>
      	<input type="file" id="certImgFile" name="certImgFile" pattern=".gif,.png,.jpg,.jpeg" accept="image/*,.gif,.png,.jpg,.jpeg"  onchange="loadImg(this);">
      	<br>
      	* 3MB이하, GIF/PNG/JPG 형식의 이미지 파일 최대 1개까지 등록 가능합니다.
      	<br><br>
		* 파일 명은 한글, 숫자, 영문 외 문자열을 입력하실 수 없습니다.
      </div>
      <div class="col-4">
     </div> 
    </div>
    <div class="row justify-content-center">
    <div class="col-2 text-center">
    </div>
      <div class="col-3 text-center">
        개인정보 수집 및 이용동의 <span style="color:red;">(필수)</span>
      </div>
      <div class="col-7 text-center">
        동의 <input type="checkbox" id="acceptBtn" onchange="acceptConfirmFn();"/>
      </div>
      <div data-bs-spy="scroll" class="col-5 text-center well" data-bs-offset="0" tabindex="0" style="border-radius:12deg;">
      <p class="">개인정보보호법에 따라 animall에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 
      개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 
      불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
      </p>
      </div>
      <div class="col-12 text-center">
      미용사 신청 완료 후 관리자 승인은 2~3일내로 이루어집니다.
      </div>
      <div class="col-12 text-center">
	      <button type="reset">취소</button>
	      <button type="submit" id="formConfirmBtn" disabled>미용사 신청</button>
      </div>
    </div>
    </form>
  </div>

<footer>
	<c:import url="../../common/footer.jsp" />
</footer>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="/resources/js/jquery-3.5.1.min.js"></script>


  <script>
	$(function(){
		$("a[id]").on("click",function(){
			var ptype = $(this).attr("id");
			console.log("ptype="+ptype);
			location.href = "${pageContext.request.contextPath}/product/productList.do?ptype="+ptype;
		});									
	});

	function acceptConfirmFn(){
		if($('#acceptBtn').prop('checked') == true){
			$('#formConfirmBtn').prop('disabled', false);
		} else {
			$('#formConfirmBtn').prop('disabled', true);
		}
	};
	
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