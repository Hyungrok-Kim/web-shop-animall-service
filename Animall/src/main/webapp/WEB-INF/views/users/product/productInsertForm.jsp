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
<script>

	function validate(){
		var pcontent = $("[name=pcontent]").val();
		if(pcontent.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}

    $(function(){
        $('#pimage1area').click(function(){
           $('#pimage1').click();
        });
        
        $('#pimage2area').click(function(){
           $('#pimage2').click();
        });
        
        $('#pimage3area').click(function(){
           $('#pimage3').click();
        });
        
        $('#pimage4area').click(function(){
           $('#pimage4').click();
        });

        $('#pimage5area').click(function(){
           $('#pimage5').click();
        });
        
        $('input[type="file"]').hide();
     });
     
     function imageLoad(img, num){
        if(img.files && img.files[0]) {
           
           var reader = new FileReader();
           
           reader.onload = function(e){
              
              switch(num){
              case 1 : $('#pimage1area').attr('src', e.target.result);
                     break;
              case 2 : $('#pimage2area').attr('src', e.target.result);
                     break;
              case 3 : $('#pimage3area').attr('src', e.target.result);
                     break;
              case 4 : $('#pimage4area').attr('src', e.target.result);
                     break;
              case 5 : $('#pimage5area').attr('src', e.target.result);
             		 break;
              }
           }
           
           reader.readAsDataURL(img.files[0]);
           
        }   
     }
	</script>
	
	<style>
	
	.product_upper_area{
	padding:30px;
	}
	
	.product_upper_area{
	
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
	padding-left:70%;
	}
	
	.productInsertBtn{
	height:50px;
	width:200px;
	background: #997296;
	color: snow;
	font-weight:bold;
	text-align:center;
	}
	
	.detail_info_area{
	margin-top:30px;
	width:100%;
	height:1000px;
	border: 1px solid #e5e5e5;
	}
	
	.detail_info_area > img{
	width:100%;
	height:100%;
	}
	


	</style>
	
</head>
<body>
	<c:import url="../../common/header.jsp" />

	<div class="container">
		<form name="productInsertForm" action="${pageContext.request.contextPath}/product/productFormEnd.do" method="post" enctype="multipart/form-data">

			<div class="product_upper_area">

				<div class="product_image_area">
					<div class="image_big_area">
					<input type="file" name="pimage" id="pimage1" onchange="imageLoad(this,1);"/>
					<img id="pimage1area" alt="" />
					</div>
					<div class="image_small_area">
						<ol>
							<li class="image_small_area1">
								<input type="file" name="pimage" id="pimage2" onchange="imageLoad(this,2);" />
								<img id="pimage2area" alt="" />
							</li>
							<li class="image_small_area2">
								<input type="file" name="pimage" id="pimage3" onchange="imageLoad(this,3);"/>
								<img id="pimage3area" alt=""/>
							</li>
							<li class="image_small_area3">
								<input type="file" name="pimage" id="pimage4" onchange="imageLoad(this,4);"/>
								<img id="pimage4area" alt=""/>
							</li>
						</ol>
					</div>
				</div>
				
				<div class="product_text_area">
					<div class="product_name">
						<h4>제품명</h4>
						<input type="text" id="pname" name="pname" />
					</div>
					<hr />
					<div class="product_content">
						<textarea name="pcontent" id="pcontent" placeholder="제품상세설명"	required></textarea>
					</div>
				
					<hr />
					<div class="product_price">
						<h4>제품 가격</h4>
						<input type="number" id="pprice" name="pprice" />
					</div>
					<hr />
					<div class="ptype">
						<h4>제품 타입</h4>
						<input type="text" id="ptype" name="ptype" value="${ptype}" readonly/>
					</div>
					<hr />
					<div class="product_pguide">
						
						<textarea name="pguide" id="pguide" placeholder="구매안내"	required></textarea>
					</div>
				</div>
				
				<div class="detail_info_area">
					<input type="file" name="pimage" id="pimage5" onchange="imageLoad(this,5);"/>
					<img id="pimage5area" alt=""/>
				</div>
				<br />
				<div class="btn_area">
					<button type="submit" class="productInsertBtn" onsubmit="return validate();">상품등록</button>
				</div>
			</div>
			
	
		</form>

		<div class="product_lower_area"></div>

	</div>


	<c:import url="../../common/footer.jsp" />
	
	
</body>
</html>