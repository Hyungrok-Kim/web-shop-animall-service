<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <title>상품</title>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		function productInsertForm(){
			var ptype = document.getElementById('ptype').value;
			location.href = "${pageContext.request.contextPath}/product/productInsertForm.do?ptype="+ptype;
		}		

		function showDetail() {
			$(".card-img-wrapper").on("click",function(){
				var pno = $(this).attr("id");
				location.href = "${pageContext.request.contextPath}/product/productSelectOne.do?pno="+pno;
			});
		}

	
		$(function(){
			//console.log($start);
			var ptype = '${ptype}';
			
			//console.log(ptype);
	
			var $productList = $('.forProductList'),
			$start = 0,
			$end = 6,
			$count = 0;
			elements =[];
			$now = 0;

			var keyword = '${keyword}';
			//console.log(keyword);

			$('#loadmore').on('click',function(){

				elements.length = 0;
				
				$.ajax({
					url : '${pageContext.request.contextPath}/product/productMoreList.do?ptype='+ptype+'&keyword='+keyword,
					type: 'get',
					success:function(data){
						//console.log(data);
						//console.log(data.length);
							if(data.length <= 6){
								$('#loadmore').hide();

								for(var i = $start; i < data.length; i++){
									var itemHTML=
												  '<div class="col-lg-4 col-sm-6 mb-5">' + 
												  	'<div class="card text-center productList">' +
												  	  '<h4 class="card-title pt-3">' + data[i].pname + '</h4><hr />' +
												  		'<div class="card-img-wrapper" id="' + data[i].pno + '">' +
												  		   '<img class="card-img-top rounded-0 productListImage" src="${pageContext.request.contextPath}/resources/productUpFiles/' + data[i].changename + '"></div>'
														+ '<div class="card-body p-0">' + 	
														'<p class="card-text mx-2 mb-0">' + data[i].pcontent + '</p>' +
													     '<p class="card-text mx-2 mb-0">' + data[i].pprice + '원' + '</p>' +
													     '<button type="button"  name="'+data[i].pno+'" onclick="insertthis(this);" class="btn btn-secondary translateY-25 basket">' +													     '<img src="${pageContext.request.contextPath}/resources/images/basketIcon2.png" alt="" />' +
													     '</a></div></div></div>';
													     
								     elements.push($(itemHTML).get(0));	  

								     $count += 1;                  
								}
									
								$productList.append(elements);

							}else{
					
								for(var i = $start; i < $end; i++){
									var itemHTML=
												  '<div class="col-lg-4 col-sm-6 mb-5">' + 
												  	'<div class="card text-center productList">' +
												  	  '<h4 class="card-title pt-3">' + data[i].pname + '</h4><hr />' +
												  		'<div class="card-img-wrapper" id="' + data[i].pno + '">' +
												  		   '<img class="card-img-top rounded-0 productListImage" src="${pageContext.request.contextPath}/resources/productUpFiles/' + data[i].changename + '"></div>'
														+ '<div class="card-body p-0">' + 	
														'<p class="card-text mx-2 mb-0">' + data[i].pcontent + '</p>' +
													     '<p class="card-text mx-2 mb-0">' + data[i].pprice + '원' + '</p>' +
													     '<button type="button"  name="'+data[i].pno+'" onclick="insertthis(this);" class="btn btn-secondary translateY-25 basket">' +													     '<img src="${pageContext.request.contextPath}/resources/images/basketIcon2.png" alt="" />' +
													     '</a></div></div></div>';
													     
								     elements.push($(itemHTML).get(0));	  
	
								     $count += 1;                  
								 }
	
								 console.log(elements);
	
								 $productList.append(elements);
	
								 $start = $end;
	
								 if((data.length-$start) < 6){
									$end += (data.length-$start);
								 }else{
									$end += 6;
								 }
								 
								 
								 if($start < data.length){
									$('#loadmore').show();
								 }else{
									$('#loadmore').hide();
			
								 }
							 
							}
							
						showDetail();
						
					}
				
				    });
			});		
			
			$('#loadmore').click();	
			
		});

		

	</script>
	
	<c:choose>
      <c:when test="${!empty member}">
         <script>
        function insertthis(obj) {
         var pno = $(obj).attr("name");
         
         location.href = "${pageContext.request.contextPath}/cart/cartInsertThis.do?mno=${member.mno}&amount=1&pno="+pno;
         alert('장바구니에 상품이 담겼습니다.')
         location.reload();
   }
       </script>
       </c:when>
       <c:when test="${empty member}">
       <script>
         function insertthis(obj){
         location.href="${pageContext.request.contextPath}"
         alert("로그인 후 이용하세요.")
             }
       </script>
       </c:when>
     </c:choose>
	
	<style>
	.btn2{
		height:50px;
		width:100px;
		background: #997296;
		color: snow;
		font-weight:bold;
		text-align:center;
		border:none;
		border-radius:5px;
		float:right;
	}
	
	.card-img-wrapper > .productListImage{
		width:100%;
		height:100%;
	}
	
	.productList .basket{
		display:none;
	}
	
	.productList:hover .basket{
		display:block;
	}
	
	.btn{
		width:150px;
		margin:auto;
	}
	
	.btn_area > input[id='loadmore']{
		margin-left:21%;
		position:absolute;
	}
	
	.input-wrapper > #keyword{
		width:90%;
		display:inline-block;
	}
	
	.search_btn{
		border-radius:5px;
		background: #e5e5e5;
		width:35px;
		height:35px;
		border:none;
	}


	
	</style>
</head>

<body>

  	<c:import url="../../common/header.jsp"/>


<!-- Search Form -->
<div class="search-form">
    <a href="#" class="close" id="searchClose">
        <i class="ti-close"></i>
    </a>
    <div class="container">
      
    </div>
</div>


<!-- /navigation --> 

<section class="section">
    <div class="container">

            <div class="col-lg-10 mx-auto">
                <h3>Search Here</h3>
                <div class="input-wrapper">
                    <input type="search" class="form-control" name="search" id="keyword" placeholder="제품을 검색하세요!">
                    <button type="button" class="search_btn" onclick="search();">
                        <i class="ti-search"></i>
                    </button>
                </div>
            </div>
            <br /><br />
            <!-- 
            <div class="product_order_view">
            	<select id="product_order">
            		<option value="pno">최신순</option>
            		<option value="pprice">가격순</option>
            	</select>
            </div>
             -->
        <div class="row forProductList">
        	<!-- for문 시작 전 ptype먼저 넘겨주고 -->
        	<input type="hidden" id="ptype" name="ptype" value="${ptype}" readonly/>
            <!-- 제품들 for문 시작 -->
            
  		    <!-- 제품들 for문 끝 -->
  		</div>  
  		<div class="btn_area">
				<c:if test="${!empty member and member.mtype eq 'ADMIN'}">  		    
					<input type="button" value="상품등록" id="" class="btn2" onclick="productInsertForm();"/>
				</c:if>
					<input type="button" value="더보기" id="loadmore" class="btn2"/>
  	   </div>
  	</div>   
</section>

<script>
	function search(){
		var ptype = '${ptype}';
		console.log(ptype);
		location.href="${pageContext.request.contextPath}/product/productSearch.do?ptype="+ptype+"&keyword="+$('#keyword').val();
	}
</script>

	
	<c:import url="../../common/footer.jsp"/>

</body>
</html>