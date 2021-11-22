<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>

	function validate(){
		var pcontent = $("[name=pcontent]").val();
		if(pcontent.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}

	function productDelete(){
		var ptype = document.getElementById('ptype').value;
		var pno = document.getElementById('pno').value;
	
		var result = Swal.fire({
			title : '제품을 삭제하시겠습니까?',
			icon:'warning',
			showCancelButton:true,
			confirmButtonColor:'#3085d6',
			cancelButtonColor:'#d33',
			confirmButtonText:'제품 삭제',
			cancelButtonText:'취소'
			}).then((result) => {
				if(result.isConfirmed){
					Swal.fire(
						'제품이 삭제되었습니다.'
							)

					location.href = "${pageContext.request.contextPath}/product/productDelete.do?pno="+pno+"&ptype="+ptype;
				
				}
			})	
	}	

</script>
	
	<style>
	
	.product_upper_area{
	padding:30px;
	}

	.product_image_area{
	width:500px;
	height:550px;
	
	display:inline-block;
	}
	
	.product_text_area{
	float:right;
	width:400px;
	height:500px;
	margin-right:100px;
	}
	
	.image_big_area{
	width:500px;
	height:450px;
	}
	
	.image_big_area>img{
	width:500px;
	height:450px;
	}
	
	.image_small_area{
	width:500px;
	height:100px;
	margin:0px 0px;
	}
	
	.image_small_area > ol{
	margin:0px 0px;
	}
	.image_small_area > ol > li ,
	.image_small_area > ol > li > img{
	width:100px;
	height:100px;
	display:inline-block;
	float: right;
	}
	
	.btn_area{
	width:1000px;
	padding-top:30px;
	padding-left:20%;
	display:inline-block;
	}
	
	.btn_area > ol > li{
	display:inline-block;
	padding: 10px 10px;
	}
	.btn1{
	height:50px;
	width:200px;
	background: grey;
	color: black;
	font-weight:bold;
	text-align:center;
	border:none;
	opacity:50%;
	}
	
	.btn2{
	height:50px;
	width:200px;
	background: #997296;
	color: snow;
	font-weight:bold;
	text-align:center;
	border:none;
	}
	


	</style>
	
</head>
<body>
	<c:import url="../../common/header.jsp" />

	<div class="container">
		<form name="productInsertForm" action="${pageContext.request.contextPath}/product/productEndUpdate.do" method="post">

			<div class="product_upper_area">

				<div class="product_image_area">
					<div class="image_big_area">
					<img id="pimage1area" src="${pageContext.request.contextPath}/resources/productUpFiles/${imageList.get(0).changename}" />
					</div>
					<div class="image_small_area">
						<ol>
							<li class="image_small_area1">
								<img id="pimage2area" src="${pageContext.request.contextPath}/resources/productUpFiles/${imageList.get(1).changename}" />
							</li>
							<li class="image_small_area2">
								<img id="pimage3area" src="${pageContext.request.contextPath}/resources/productUpFiles/${imageList.get(2).changename}"/>
							</li>
							<li class="image_small_area3">
								<img id="pimage4area" src="${pageContext.request.contextPath}/resources/productUpFiles/${imageList.get(3).changename}"/>
							</li>
						</ol>
					</div>
				</div>
				
				<div class="product_text_area">
					<div class="product_name">
						<input type="hidden" id="pno" name="pno" value="${product.pno}" />
						<h4>제품명</h4>
						<input type="text" id="pname" name="pname" value="${product.pname}" required/>
					</div>
					<hr />
					<div class="product_content">
						<textarea name="pcontent" id="pcontent" placeholder="제품상세설명"	required>${product.pcontent}</textarea>
					</div>
				
					<hr />
					<div class="product_price">
						<h4>제품 가격</h4>
						<input type="number" id="pprice" name="pprice" value="${product.pprice}" required />
					</div>
					<hr />
					<div class="ptype">
						<h4>제품 타입</h4>
						<input type="text" id="ptype" name="ptype" value="${product.ptype}" readonly/>
					</div>
					<hr />
					<div class="product_pguide">
						<textarea name="pguide" id="pguide" placeholder="구매안내"	required>${product.pguide}</textarea>
					</div>
				</div>
				
				<div class="btn_area">
					<ol>
						<li>
							<button type="submit" class="btn1" onsubmit="return validate();">수정하기</button>
						</li>
						<li>
							<input type="button" value="제품 삭제하기" id="" class="btn2" onclick="productDelete();"/>
						</li>
					</ol>
				</div>
			</div>
			
	
		</form>

		<div class="product_lower_area"></div>

	</div>


	<c:import url="../../common/footer.jsp" />
	
	
</body>
</html>