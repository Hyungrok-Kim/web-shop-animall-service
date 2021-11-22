    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <title>ANIMALL</title>
  <!-- css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/carousel.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rayer_submit.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rayer_update.css" />
  
  <script>
  function productUpdateList(pno){

// 	  	함수는 중복해서 존재해도 실행되지만
// 		addEventListner의 경우 id를 찾아서 실행하기 때문에 중복된 id가 여러개인 경우 가장 첫번째 id를 찾고 끝나버린다.

		$('#primeContainer_forRayer2').css("visibility","visible");
		
		$.ajax({
			url : '${pageContext.request.contextPath}/index/productUpdateList.do',
			data : { pno : pno}, 
			dataType : 'json',
			success : function(data){
				
				console.log(data);
				
				$('#btitle2').val(data['PNAME']);		
				$('#bprice2').val(data.PPRICE);
				$('#bsale2').val(data.SALE);
				$('#bsaleprice2').val(data.SALEPRICE);
				$('#bexplain2').val(data.PEXPLAIN);	
				$('#bproductlevel2').val(data.PRODUCTLEVEL)
				
				$('#nameBox2').val(data.ORIGINNAME);
				$('#write_form2_pno').val(data.PNO);
 				
				
				
			},
			error : function(error){
				
				console.log("error");
			}
		});

}

  
  

  </script>
  
</head>

<body>
  
<header>
	<%@ include file="common/header.jsp"%>
</header>

<!-- 캐러셀 -->

<section style="display : flex; justify-content : center;">
  <div class="carousel-container">
  <i class="fas fa-arrow-right" id="nextBtn"></i>
  <i class="fas fa-arrow-left" id="prevBtn"></i>
  	<div class="carousel-slide">
  	<img src="${pageContext.request.contextPath}/resources/images/banner/pet_food_banner3.png" id="lastClone" alt="" />
  		<img src="${pageContext.request.contextPath}/resources/images/banner/cat_dog_banner3.png" alt="" />
  		<img src="${pageContext.request.contextPath}/resources/images/banner/christmas_banner3.png" alt="" />
  		<img src="${pageContext.request.contextPath}/resources/images/banner/pet_food_banner3.png" alt="" />
  	<img src="${pageContext.request.contextPath}/resources/images/banner/cat_dog_banner3.png" id="firstClone" alt="" />
  	</div>
  </div>
  

</section>

<!--                                              이 상품 어때요? 부분                                  -->
<!-- --------------------------------------------------------------------------------------------- -->
<section>
<div style="font-family: Nanum Gothic">
<div class="primeContainer_ForIndexProduct">
	<div class="bigContainer_ForIndexProduct1">
	        <h3 class="">이 상품 어때요?</h3>
	</div>
	
	<div class="bigContainer_ForIndexProduct2">
	
	<c:forEach var="b" items="${productList}" begin="0" end="3">
		<div style="display : flex; flex-direction : column">
			<div class="imgContainer_ForIndexProduct">
				<a href="#">
					<img src="${ pageContext.request.contextPath }/resources/boardUpload/${b.changename}" alt="" />
				</a>
			</div>
			<div class="productContainer_ForIndexProduct">
				<p style ="height : 10px; font-size : 13pt; color : black; font-weight : 550;">${b.pname}</p>
				<p style ="height : 10px; font-size : 13pt; color : black;">${b.pprice}원</p>
			</div>
			<div style="display : flex; justify-content : center;" >
			<c:if test="${member.mtype eq 'ADMIN'}">
				<input type="button" class="deleteButton_forindexProduct" value="삭제" 
				       onclick="location.href='${pageContext.request.contextPath}/index/ProductDelete.do?pno=${b.pno}'"/>
				
				
				<input type="button" class="updateButton_forindexProduct" value="수정" onclick="productUpdateList(${b.pno});"/>
			</c:if>
			</div>
		</div>
		
		
		
	</c:forEach>
	
	

	</div>
	
</div>
</div>
</section>




<!--                                              #연말특가 부분                                       -->
<!-- --------------------------------------------------------------------------------------------- -->
<section>
<div style="font-family: Nanum Gothic">
<div class="primeContainer_ForYear">
<div class="primeSemiContainer_ForYear">
	<div class="bigContainer_ForYear1">
	        <h3 class="title_ForYear">#설 얼리버드 특가</h3>
	        <h4>-</h4>
	        <h5 class="title2_ForYear">설날까지 매일 진행되는 24시간 한정 특가</h5>
	</div>
	
	<div class="bigContainer_ForYear2">
	
	<c:forEach var="y" items="${recProductList}" begin="0" end="0">
		<div style="display : flex; flex-direction : column">
			<div class="imgContainer_ForYear">
				<a href="#">
				<img src="${ pageContext.request.contextPath }/resources/boardUpload/${y.changename}" alt="" />
				</a>
			</div>
			<div class="productContainer_ForYear">
				<p style ="height : 10px;  font-size : 13pt; color : black; font-weight : 550;">${y.pname}</p>
				<p style ="height : 10px">${y.pexplain}</p>
				<div class="priceContainer_ForYear">
					<p style ="height : 10px; color : orange;  font-size : 13pt; font-weight : 550; ">${y.sale}%</p>&nbsp
					<p style ="height : 10px;  font-size : 13pt; color : black; font-weight : 550;">${y.saleprice}원</p>&nbsp
					<p style ="height : 10px; text-decoration : line-through;">${y.pprice}원</p>
				</div>
			</div>
			<div style="display : flex; justify-content : center;" >
			<c:if test="${member.mtype eq 'ADMIN'}">
				<input type="button" class="deleteButton_forYear" value="삭제" 
				       onclick="location.href='${pageContext.request.contextPath}/index/ProductDelete.do?pno=${y.pno}'"/>
				
				
				<input type="button" class="updateButton_forYear" value="수정" onclick="productUpdateList(${y.pno});"/>
			</c:if>
			</div>
		</div>
		
		
		
	</c:forEach>
	
	

	</div>
</div>
	
</div>
</div>
</section>





<!--                                              이벤트소식 부분                                       -->
<!-- --------------------------------------------------------------------------------------------- -->
<section>
<div style="font-family: Nanum Gothic">
<div class="primeContainer_ForEvent">
	<div class="bigContainer_ForEvent1">
	        <h3 class="">이벤트 소식 ></h3>
	</div>
	
	<div class="bigContainer_ForEvent2">
	
	<c:forEach var="e" items="${eventProductList}" begin="0" end="2">
		<div style="display : flex; flex-direction : column">
			<div class="imgContainer_ForEvent">
				<a href="#">
				<img src="${ pageContext.request.contextPath }/resources/boardUpload/${e.changename}" alt="" />
				</a>
			</div>
			<div class="productContainer_ForEvent">
				<p style ="height : 10px; font-size : 13pt; font-weight : 550; ">${e.pname}</p>
				<p style ="height : 10px; font-size : 11pt;">${e.pexplain}</p>
			</div>
			<div style="display : flex; justify-content : center; " >
			<c:if test="${member.mtype eq 'ADMIN'}">
				<input type="button" class="deleteButton_ForEvent" value="삭제" 
				       onclick="location.href='${pageContext.request.contextPath}/index/ProductDelete.do?pno=${e.pno}'"/>
				
				
				<input type="button" class="updateButton_ForEvent" value="수정" onclick="productUpdateList(${e.pno});"/>
			</c:if>		
			</div>
		</div>
		
		
		
	</c:forEach>
	
	

	</div>
	
</div>
</div>
</section>

<!--                                              인스타그램 부분                                       -->
<!-- --------------------------------------------------------------------------------------------- -->
<section>
<div class="primeContainer_ForInsta">
	<div class="bigContainer_ForInsta1">
	        <h3 class="">인스타그램 고객 후기</h3>
	</div>
	
	<div class="bigContainer_ForInsta2">
	
	<c:forEach var="i" items="${instaProductList}" begin="0" end="4">
		<div style="display : flex; flex-direction : column">
			<div class="imgContainer_ForInsta">
				<a href="#">
					<img src="${ pageContext.request.contextPath }/resources/boardUpload/${i.changename}" alt="" />
					<div class="div_ForInstaHover">
						<i class="fas fa-heart"></i>&nbsp&nbsp&nbsp
						<i class="fas fa-comment"></i>
					</div>
				</a>
				
			</div>
			<div style="display : flex; justify-content : center;" >
			<c:if test="${member.mtype eq 'ADMIN'}">
				<input type="button" class="deleteButton_ForInsta" value="삭제" 
				       onclick="location.href='${pageContext.request.contextPath}/index/ProductDelete.do?pno=${i.pno}'"/>
			</c:if>
			</div>
		</div>
		
		
		
	</c:forEach>
	</div>
	<br />
	<h5>더 많은 고객 후기가 궁금하다면?</h5>
	<h5>@Animall_regram</h5>
	<c:if test="${member.mtype eq 'ADMIN'}">
		<div class="submit_forindexProduct" id="submit_forindexProduct4">
		등록
		</div>
	</c:if>
</div>
</section>


<!-- 														상품등록 딤드레이어							 -->
<!-- 														----------        						 -->

<div class="primeContainer_forRayer" id="submitPrimeContainer_forRayer">
		<div class="dimedContainer_forRayer" id="write_form__bg">
		</div>
		
<!-- 		파일 전송을 위해 multipart/form-data사용 -->
		<form id='write_form' role='form' method='post' enctype='multipart/form-data'
		 action="${pageContext.request.contextPath}/index/ProductInsert.do">
		
<!-- 		가운데 맞추기 용 div -->
			<div class="bigContainer_forRayer" id="write_form_box">
				<div class="formContainer_forRayer">

					<div style="margin-top: 60px;">
							<div class="content_container_forRayer">
								<input class="title_forRayer" id="btitle" placeholder="제목" type="text" name="pname">
							</div>
							<div class="content_container_forRayer">
								<input class="content_forRayer" id="bprice" placeholder="가격" name="pprice">
							</div>
							<div class="content_container_forRayer">
								<input class="content_forRayer" id="bsale" placeholder="할인율" name="sale">
							</div>
							<div class="content_container_forRayer">
								<input class="content_forRayer" id="bsaleprice" placeholder="할인적용가격" name="saleprice">
							</div>
							<div class="content_container_forRayer">
								<input class="content_forRayer" id="bexplain" placeholder="상품설명" name="pexplain">
							</div>
							<div class="content_container_forRayer">
								<select class="select_forRayer" id="bproductlevel" placeholder="상품 등록 종류"
								 name="productlevel" required="required">
								 	<option value="" style="color : gray;">등록 종류 선택</option>
									<option value="0">이 상품 어때요?</option>
									<option value="1">특가</option>
									<option value="2">이벤트</option>
									<option value="3">인스타</option>
								</select>
							</div>
	
							<div class="fileContainer_forRayer">
								
								<div class="fileBox">
									<input id="nameBox1" class="nameBox" placeholder="파일선택"
									 disabled="disabled"/> &nbsp&nbsp
									<div>
									<label for="fileSubmit1"><i class="fas fa-camera-retro"></i></label>
									</div>
									<input id="fileSubmit1" type="file" name="upFile" class="upload-hidden"
									 onchange="getImgFile1(this)">
								</div>
								
							</div>
	
							<button class="writeButton_forRayer" id="write_button" type="submit">
							등록
							</button>

					</div>
					
<!-- 					이거는 absolute 적용중 -->
					<div class="closeButton_forRayer" id="write_close_button">
						<i class="fas fa-times"></i>
					</div>
				</div>

			</div>
		</form>
	</div>


<!-- 													상품수정 딤드레이어 								-->
<!-- 														----------        						 -->

<div class="primeContainer_forRayer2" id="primeContainer_forRayer2">
		<div class="dimedContainer_forRayer2" id="write_form__bg2">
		</div>
		
		<form id='write_form2' method='post' enctype='multipart/form-data'
		action="${pageContext.request.contextPath}/index/ProductUpdate.do">
			<input type="hidden" type="text" id="write_form2_pno" name="pno"/>
<!-- 		가운데 맞추기 용 div -->
			<div class="bigContainer_forRayer2" id="write_form_box2">
				<div class="formContainer_forRayer2">

					<div style="margin-top: 60px;">
							<div class="content_container_forRayer2">
								<input class="title_forRayer2" id="btitle2" placeholder="제목" type="text" name="pname">
							</div>
							<div class="content_container_forRayer2">
								<input class="content_forRayer2" id="bprice2" placeholder="가격" type="text" name="pprice">
							</div>
							<div class="content_container_forRayer2">
								<input class="content_forRayer2" id="bsale2" placeholder="할인율" type="text" name="sale">
							</div>
							<div class="content_container_forRayer2">
								<input class="content_forRayer2" id="bsaleprice2" placeholder="할인가격" type="text" name="saleprice">
							</div>
							<div class="content_container_forRayer2">
								<input class="content_forRayer2" id="bexplain2" placeholder="상품설명" type="text" name="pexplain">
							</div>
							
	
							<div class="fileContainer_forRayer2">
								
								<div class="fileBox2">
									<input id="nameBox2" class="nameBox" value="" disabled="disabled"/> &nbsp&nbsp
									<div>
										<label for="fileSubmit2"><i class="fas fa-camera-retro"></i></label>
									</div>
									<input id="fileSubmit2" type="file" name="upFile2" class="upload-hidden"
									 onchange="getImgFile2(this)">
								</div>
								
							</div>
							<div>
							</div>
	
							<button class="writeButton_forRayer2" id="write_button2" type="submit">
							수정
							</button>

					</div>
					
<!-- 					이거는 absolute 적용중 -->
					<div class="closeButton_forRayer2" id="write_close_button2">
						<i class="fas fa-times"></i>
					</div>
				</div>

			</div>
		</form>
	</div>



<!-- footer -->
<footer>
	<%@ include file="common/footer.jsp" %>
</footer>

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/carousel.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/rayer_submit.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/rayer_update.js"></script>

</body>
</html>
    
