<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<title>BIZTROX</title>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<c:import url="../../common/style.jsp" />
<style>
/* input, textarea 브라우저에서 클릭시 생기는 테두리 없애기. */
input:focus, textarea:focus {
	outline: none;
}
/* safari에서 input, textarea 그림자효과 없애기 */
input, textarea {
	-webkit-appearance: none;
}

#box__detail::-webkit-scrollbar {
	width: 10px;
}

#box__detail::-webkit-scrollbar-thumb {
	background-color: rgb(175, 156, 136);
	border-radius: 8px;
	box-shadow: inset 0px 0px 5px white;
}

#box__detail::-webkit-scrollbar-track {
	background-color: lightgrey;
}

#reply__b {
	width: 100%;
	height: 100%;
	background-color: rgb(224, 225, 220);
	cursor: pointer;
	zoom: 1;
	text-align: center;
	text-decoration: none;
	border-radius: .5em;
	border: none;
	box-shadow: 0 10px 15px rgba(0, 0, 0, .2)
}

#reply__b:hover {
	text-decoration: none;
	background: rgb(212, 209, 220);
}

#reply__b:active {
	position: relative;
	top: 1px;
}

.border-swiper {
	overflow: hidden;
	position: relative;
	width: 100%;
}

.border-swiper .d__swiper-container {
	position: relative;
	width: 100%;
}

.border-swiper .swiper-wrapper {
	position: relative;
	white-space: nowrap;
}

.border-swiper .swiper-slide {
	overflow: visible;
	padding: 10px;
	width: 100%;
	box-sizing: border-box;
}

.border-swiper .swiper-button-next::before {
	color: black;
}

.border-swiper .swiper-button-prev::before {
	color: black;
}
</style>
</head>

<body>

	<!-- 글 수정 -->
	<div id="update__box" style="display: none">
		<div id="update__form__bg"
			style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: #0000004d; z-index: 9999;"></div>

		<form id='update__form' role='form' method='post'
			enctype='multipart/form-data'>
			<div id="update__form__box"
				style="display: flex; justify-content: center; align-items: center; position: fixed; top: 0; left: 0; widtH: 100%; height: 100%; z-index: 10000;">
				<div
					style="background-color: #ffffff; width: 550px; height: 700px; position: relative; display: flex; justify-content: center;">

					<div style="margin: 60px 0 0 0;">
						<div>
							<input id="update__btitle" placeholder="제목" type="text"
								name="btitle"
								style="height: 40px; width: 350px; margin: 0 0 30px 0; padding: 0; border: none; border-bottom: 1px solid #191621; font-size: 20pt; background-color: transparent; border-radius: 0;">
						</div>
						<div style="width: 350px; height: 350px; margin: 0 0 30px 0;">
							<textarea id="update__bcontent" placeholder="내용" name="bcontent"
								style="padding: 0; border: solid 1px black; font-size: 11pt; width: 100%; height: 100%; padding: 10px; resize: none;"></textarea>
						</div>
						
						<div
							style="margin: 20px 0 0 0; display: flex; justify-content: center;">
							<div id="update__button"
								style="background-color: #997296; width: 350px; border-radius: 14px; display: flex; justify-content: center; align-items: center; cursor: pointer; height: 25px; box-shadow: 0 10px 15px rgba(0, 0, 0, .2);">
								<div style="font-size: 10pt; color: white;">글수정</div>
							</div>
						</div>

					</div>
					<!-- 닫기 버튼 -->
					<div id="update__close__button"
						style="cursor: pointer; position: absolute; top: 10px; right: 10px;">
						<img src="/animall/resources/images/cancel.png"
							style="width: 25px;">
					</div>
				</div>

			</div>
		</form>
	</div>

	<!-- 글쓰기 폼 -->
	<div id="write__box" style="display: none">
		<div id="write__form__bg"
			style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: #0000004d; z-index: 9999;"></div>

		<form id='write__form' role='form' method='post'
			enctype='multipart/form-data'>
			<div id="write__form__box"
				style="display: flex; justify-content: center; align-items: center; position: fixed; top: 0; left: 0; widtH: 100%; height: 100%; z-index: 10000;">
				<div
					style="background-color: #ffffff; width: 550px; height: 700px; position: relative; display: flex; justify-content: center;">

					<div style="margin: 60px 0 0 0;">
						<div>
							<input id="btitle" placeholder="제목" type="text" name="btitle"
								style="height: 40px; width: 350px; margin: 0 0 30px 0; padding: 0; border: none; border-bottom: 1px solid #191621; font-size: 20pt; background-color: transparent; border-radius: 0;">
						</div>
						<div style="width: 350px; height: 350px; margin: 0 0 30px 0;">
							<textarea id="bcontent" placeholder="내용" name="bcontent"
								style="padding: 0; border: solid 1px black; font-size: 11pt; width: 100%; height: 100%; padding: 10px; resize: none;"></textarea>
						</div>

						<!-- 첨부파일 -->
						<div>
							<div>
								<input id="file1" type="file" name="file" style="display: none;"">
								<img src="/animall/resources/images/camera.png" border='0'
									style="width: 30px; height: 30px; cursor: pointer;"
									onclick='document.all.file1.click(); document.all.file1.value=document.all.file1.value'>
								<span class="pic_download1" style="white-space: nowrap;">사진을
									첨부해 주세요.</span>
							</div>
							<div>
								<input id="file2" type="file" name="file" style="display: none;"">
								<img src="/animall/resources/images/camera.png" border='0'
									style="width: 30px; height: 30px; cursor: pointer;"
									onclick='document.all.file2.click(); document.all.file2.value=document.all.file2.value'>
								<span class="pic_download2" style="white-space: nowrap;">사진을
									첨부해 주세요.</span>
							</div>
							<div>
								<input id="file3" type="file" name="file" style="display: none;"">
								<img src="/animall/resources/images/camera.png" border='0'
									style="width: 30px; height: 30px; cursor: pointer;"
									onclick='document.all.file3.click(); document.all.file3.value=document.all.file3.value'>
								<span class="pic_download3" style="white-space: nowrap;">사진을
									첨부해 주세요.</span>
							</div>
						</div>

						<div
							style="margin: 20px 0 0 0; display: flex; justify-content: center;">
							<div id="write__button"
								style="background-color: #997296; width: 350px; border-radius: 14px; display: flex; justify-content: center; align-items: center; cursor: pointer; height: 25px; box-shadow: 0 10px 15px rgba(0, 0, 0, .2);">
								<div style="font-size: 10pt; color: white;">글등록</div>
							</div>
						</div>

					</div>
					<!-- 닫기 버튼 -->
					<div id="write__close__button"
						style="cursor: pointer; position: absolute; top: 10px; right: 10px;">
						<img src="/animall/resources/images/cancel.png"
							style="width: 25px;">
					</div>
				</div>

			</div>
		</form>
	</div>


	<!-- 글 상세보기-->
	<div id="detail__box" style="display: none;">
		<div id="detail__bg"
			style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: #0000004d; z-index: 9999;"></div>
		<div id="detail__form__box"
			style="display: flex; justify-content: center; align-items: center; position: fixed; top: 0; left: 0; widtH: 100%; height: 100%; z-index: 10000;">
			<div id="box__detail"
				style="overflow-x: auto; background-color: #ffffff; width: 550px; max-height: 900px; position: relative; display: flex; justify-content: center;">
				<div style="width: 100%; height: 100%; margin: 0 50px 50px 50px;">
					<!-- 글 제목 -->
					<div id="d__btitle"
						style="padding-top: 70px; font-size: 20pt; text-align: center;">제목</div>

					<!-- 글 이미지 -->
					<div class="border-swiper" style="position: relative; width: 100%;">
						<!-- Slider main container -->
						<div class="d__swiper-container">
							<!-- Additional required wrapper -->
							<div id="d__swiper-wrapper" class="swiper-wrapper">
								<!-- Slides -->
								<!-- 
							<div class="swiper-slide">
								<img id="d__image1" src="" style="width: 100%;">
							</div>
							 -->
							</div>
							<!-- If we need pagination -->
							<div class="swiper-pagination"></div>

							<!-- If we need navigation buttons -->
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>
					</div>
					<!-- 글 내용 -->
					<div id="d__bbox" style="padding: 25px;">
						<div id="d__bcontent" style="word-break: break-all;"></div>

						<!-- 유저 닉네임, 시간 -->
						<div style="width: 100%; display: flex; align-items: center;">
							<div id="d__bnname"
								style="text-align: left; width: 50%; color: #9b9b9b; font-size: 13pt;">test</div>
							<div id="d__bdate"
								style="text-align: right; width: 50%; color: #9b9b9b; font-size: 13pt;">2020-12-29</div>
						</div>

						<!-- 구분선 -->
						<div style="width: 100%;">
							<img
								src="${pageContext.request.contextPath}/resources/images/line.png"
								style="width: 100%;">
						</div>

						<!-- 댓글 달리는 영역 -->
						<div id="reply__box">
							<!-- 
						<div style="display: flex; margin: 10px 0 10px 0; width: 100%;">
							<div style="width: 80%; word-break: break-all;">awefwefawefawefawegawejgiajowegjaiowegjaoiwejgoiawjegoiajiowegjaiowejgaoiwjegoi</div>
							<div style="width: 20%; text-align: right;">글쓴이</div>
						</div>
						 -->
						</div>


						<div style="width: 100%; display: flex;">

							<div style="width: 50%;">
								<div id="update__delete__button__box"
									style="display: flex; align-items: center; height: 100%;">
									<div id="call__update"
										style="cursor: pointer; padding: 2px 4px 2px 4px; background-color: rgb(212, 209, 220); margin: 0 10px 0 0; border-radius: 5px; color: #FFFFFF; border: none; display: flex; justify-content: center; align-items: center; height: 30px;">
										<div>수정</div>
									</div>
									<div id="delete__button"
										style="cursor: pointer; padding: 2px 4px 2px 4px; background-color: rgb(212, 209, 220); margin: 0 10px 0 0; border-radius: 5px; color: #FFFFFF; border: none; display: flex; justify-content: center; align-items: center; height: 30px;">
										<div>삭제</div>
									</div>
								</div>

							</div>
							<div style="width: 50%;">

								<div style="display: flex; justify-content: flex-end;">
									<!-- 좋아요 버튼 -->
									<div id="d__like"
										style="width: 50px; cursor: pointer; display: flex; align-items: flex-end;">
										<img
											src="${pageContext.request.contextPath}/resources/images/black_heart.png"
											style="width: 100%;">
										<div id="d__like__count" style="color: #9b9b9b;"></div>
									</div>

									<!-- 댓글 버튼 -->
									<div
										style="width: 50px; display: flex; align-items: flex-end; margin-left: 10px;">
										<img
											src="${pageContext.request.contextPath}/resources/images/reply.png"
											style="width: 100%;">
										<div id="d__reply__count" style="color: #9b9b9b;"></div>
									</div>
								</div>
							</div>
						</div>

						<!-- 댓글창 / 댓글 등록 버튼 -->
						<div style="display: flex; align-items: center; margin-top: 10px;">
							<div
								style="border: none; height: 55px; width: 80%; display: flex; align-items: center; border-radius: .5em; box-shadow: 0px 10px 15px lightgrey;">
								<input id="reply_content" type="text" placeholder="댓글을 입력해 주세요."
									style="border: none; width: 100%;">
							</div>
							<div id="d__create__reply__button"
								style="height: 55px; width: 20%;">
								<button id="reply__b">등록</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 창 끄기 버튼 -->
				<div id="detail__close__button"
					style="cursor: pointer; position: absolute; top: 10px; right: 10px;">
					<img
						src="${pageContext.request.contextPath}/resources/images/cancel.png"
						style="width: 25px;">
				</div>
			</div>
		</div>
	</div>

	<c:import url="../../common/header.jsp" />

	<!-- Search Form -->
	<div class="search-form">
		<a href="#" class="close" id="searchClose"> <i class="ti-close"></i>
		</a>
		<div class="container">
			<form action="#" class="row">
				<div class="col-lg-10 mx-auto">
					<h3>Search Here</h3>
					<div class="input-wrapper">
						<input type="text" class="form-control" name="search" id="search"
							placeholder="Enter Keywords..." required>
						<button>
							<i class="ti-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- 제목 / 글 등록 -->
	<section class="section">
		<div class="container">
			<div class="col-lg-12" style="display: flex; margin-bottom: 20px;">
					<h1 class="mb-2" style="width: 50%;">AniPic</h1>
					<div style="width: 50%; display: flex; justify-content: flex-end;">
						<div id='write__form__button'
							style="background-color: #997296; width: 100px; height: 55px; border-radius: 14px; display: flex; justify-content: center; align-items: center; cursor: pointer; box-shadow: 0 10px 15px rgba(0, 0, 0, .2);">
							<div style="font-size: 12pt; color: white;">글쓰기</div>
						</div>
					</div>
				</div>
			<div class="board__box row justify-content-center">
				
				<!-- boardList -->
				<c:forEach var="board" items="${boardList}">
					<div class="col-lg-3 col-sm-6 mb-3">
						<div class="card text-center" data-bno="${board.bno}">
							<%-- <a href="#"> <img class="card-img-top"
								src="${pageContext.request.contextPath}${board.imgpath}"
								alt="team-member">
							</a> --%>
							<div
								style="width: 100%; height: 300px; background-image: url('${pageContext.request.contextPath}${board.imgpath}'); background-size: cover; background-position: center;">
								
							</div>

							<div class="card-body card-body-2 pb-0 px-4">
								<h5 class="card-title">${board.btitle}</h5>
								<h6
									style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"
									class="text-color mb-30">${board.bcontent}</h6>
								<div style="display: flex; justify-content: center;">
									<!-- 좋아요 버튼 -->
									<div
										style="width: 50px; cursor: pointer; display: flex; align-items: flex-end;">
										<c:if test="${board.click eq 'Y'}">
											<img src="/animall/resources/images/red_heart.png"
												style="width: 80%;">
										</c:if>
										<c:if test="${board.click eq 'N'}">
											<img src="/animall/resources/images/black_heart.png"
												style="width: 80%;">
										</c:if>
										<div style="color: #9b9b9b;">${board.likec}</div>
									</div>

									<!-- 댓글 버튼 -->
									<div
										style="width: 50px; display: flex; align-items: flex-end; margin-left: 10px;">
										<img src="/animall/resources/images/reply.png"
											style="width: 80%;">
										<div style="color: #9b9b9b;">${board.replyc}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div
				style="display: flex; justify-content: center; align-items: center;">
				<div id="more__button"
					style="background-color: #997296; width: 100px; height: 55px; border-radius: 14px; display: flex; justify-content: center; align-items: center; cursor: pointer; box-shadow: 0 10px 15px rgba(0, 0, 0, .2);">
					<div style="font-size: 12pt; color: white;">더보기</div>
				</div>
			</div>
		</div>




	</section>

	<c:import url="../../common/footer.jsp" />
	<c:import url="../../common/script.jsp" />

	<script>

	    // 스와이퍼
		function startSwiper(){
			var swiper = new Swiper('.d__swiper-container', {
			      cssMode: true,
			      navigation: {
			        nextEl: '.swiper-button-next',
			        prevEl: '.swiper-button-prev',
			      },
			      pagination: {
			        el: '.swiper-pagination'
			      },
			      mousewheel: true,
			      keyboard: true,
			    });
		}

		function resetFormElement(e) {
	        e.wrap('<form>').closest('form').get(0).reset();
	        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) ,
	        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
	        //DOM에서 제공하는 초기화 메서드 reset()을 호출
	        e.unwrap(); //감싼 <form> 태그를 제거
	    }
	
		//글쓰기 폼 버튼 클릭 이벤트
		$('#write__form__button').on('click',(e)=>{
			e.stopPropagation();
	        e.preventDefault();
	
	        //글쓰기폼 초기화
	        $('#btitle').val('');
	        $('#bcontent').val('');
	        resetFormElement($('#file1'));
	        resetFormElement($('#file2'));
	        resetFormElement($('#file3'));
	
	        //글쓰기폼 보이기
			$('#write__box').show();
		});

		// file url
		var $file = $('#file1');
		$file.on('change', function() {
		var fileValue = $("#file1").val();
		$('.pic_download1').text(fileValue);			
		console.log('fileValue', fileValue);
		});

		var $file = $('#file2');
		$file.on('change', function() {
		var fileValue = $("#file2").val();
		$('.pic_download2').text(fileValue);			
		console.log('fileValue', fileValue);
		});

		var $file = $('#file3');
		$file.on('change', function() {
		var fileValue = $("#file3").val();
		$('.pic_download3').text(fileValue);			
		console.log('fileValue', fileValue);
		});
	
		//글등록창 닫기버튼 클릭 이벤트
		$('#write__close__button').on('click',(e)=>{
			e.stopPropagation();
	        e.preventDefault();
			$('#write__box').hide();
		});

		//댓글등록
		$('#d__create__reply__button').on('click',(e)=>{
			e.stopPropagation();
	        e.preventDefault();
	        var bno = $('#box__detail').attr('data-bno');
	        $.ajax({
	        	url: '${pageContext.request.contextPath}/board/insertReply',
	        	type: 'get',
	        	data: {'bno':bno,'rcontent':$('#reply_content').val()},
	        	success: function(data){

	        		if(data.ok){
        				makeUpReply(data);
		        	}else{
						alert('댓글등록 실패');
		        	}
	        		//$('#reply').load(document.URL +  ' #reply');
		        		
	            },
	            error: function(err){
					alert('${pageContext.request.contextPath}/board/insertReply 에러');
					$('.preloader').hide();
	            }
	            
			});
		});

		
	
		//글 등록 버튼
		$('#write__button').off().on('click', function (e) {
	        e.stopPropagation();
	        e.preventDefault();
	        
	        $('.preloader').show();
	        
	        $.ajax({
	            url: '${pageContext.request.contextPath}/board/insert',
	            type: 'post',
	            enctype: 'multipart/form-data',
	            processData: false, //데이터를 쿼리 문자열로 변환하는 jQuery 형식 방지
	            contentType: false,
	            dataType: 'json',
	            cache: false,
	            mimeType: "multipart/form-data",
	            data: new FormData($("#write__form")[0]),//파일업로드를 위해, FormDataAPI사용
	            success: function (data) {
	                if(data.ok){
	                	alert('등록완료');
	                	$('.preloader').hide();
	                	$('#write__box').hide();

	                	$('.board__box').html('');//게시글 전체 화면 초기화
	                	nextIndex = 1;
	                	getList(nextIndex);
	                }
	            },
	            error: function (err) {
	            	$('.preloader').hide();
	            }
	        });
	    });
	    
		

		function getDate(time){
			var x = new Date(time);
			return x.getFullYear() + '-' +(x.getMonth()+1) + '-' + x.getDate();
		}


		//댓글 리스트 뿌리기
		function makeUpReply(data){
			var replyList = data.replyList;
			var loginMno = data.loginMno;
			var isAdmin = data.isAdmin;
			
			var str = '';
    		for(var i=0;i<replyList.length;i++){
				
				
        		//x 내가(로그인한사람) 쓴 댓글(그 댓글의 작성자)일때 관리자(admin)일때
	        	if(replyList[i].mno == loginMno || isAdmin){
        		str +=`
            		<div class="reply" data-rno="\${replyList[i].rno}" style="display: flex; margin: 10px 0 10px 0; width: 100%;">
						<div style="width: 75%; word-break: break-all;">\${replyList[i].rcontent}</div>
						<div style="width: 20%; text-align: right;">\${replyList[i].nname}</div>
						<div class="reply__delete__button" data-rno="\${replyList[i].rno}" style="cursor: pointer; text-align: center; color: gray; width: 5%; background-color: rgb(212,209,220); border-radius: 52%;">x</div>
														
					</div>
				`;
        		}
				 else{
				str +=`
        		   <div class="reply" data-rno="\${replyList[i].rno}" style="display: flex; margin: 10px 0 10px 0; width: 100%;">
						<div style="width: 75%; word-break: break-all;">\${replyList[i].rcontent}</div>
						<div style="width: 20%; text-align: right;">\${replyList[i].nname}</div>
						<!--<div class="reply__delete__button" style="cursor: pointer; display:none; text-align: center; color: gray; width: 5%; ">x</div> -->							
				</div>
				`;
				}  
        		

        	}
    		$('#reply__box').html(str);
    		$('#d__reply__count').text(replyList.length);

    		$('.reply__delete__button').off().on('click',function(e){
    			e.stopPropagation();
    	        e.preventDefault();

    	        $.ajax({
    	        	url: '${pageContext.request.contextPath}/board/replyDelete',
    	        	type: 'post',
    	        	data: {'rno':$(this).attr('data-rno')},
    	        	success: function(data){
    	        		if(data.ok){
    		        		alert('삭제되었습니다.');
    		        		makeUpReply(data);
    	        		}else{
    		        		alert('삭제 실패');
    	        		}
    	            },
    	            error: function(err){
    					alert('${pageContext.request.contextPath}/board/replydelete 에러');
    	            }
    	            
    	        });	        
    		});
		}
		
		
		//글상세보기 클릭 이벤트 활성
		function boardDetailClickEvent(){
			//글상세보기 클릭 이벤트
		    $('.card').off().on('click',function(e){
		    	e.stopPropagation();
		        e.preventDefault();
		        $('#reply__box').html('');
		        $('#reply_content').val('');
		        $('#d__like > img').attr('src','${pageContext.request.contextPath}/resources/images/black_heart.png');
		        var bno = $(this).attr('data-bno');

		        $.ajax({
		        	url: '${pageContext.request.contextPath}/board/getDetail',
		        	type: 'get',
		        	data: {'bno':bno},
		        	async:false,
		        	success: function(data){
		        		$('#d__btitle').text(data.board.btitle);
		        		$('#d__bnname').text(data.board.nname);
		        		$('#d__bcontent').html(data.board.bcontent);
		        		$('#d__bdate').text(getDate(data.board.bdate));
		        		$('#d__like__count').text(data.countLike);

		        		if(data.like){
		        			$('#d__like > img').attr('src','${pageContext.request.contextPath}/resources/images/red_heart.png');
			        	}else{
			        		$('#d__like > img').attr('src','${pageContext.request.contextPath}/resources/images/black_heart.png');
		        		}


		        		var boardImgList = data.boardImgList;

						var swipe = '';
		        		for(var i=0; i<boardImgList.length; i++){
		        			swipe += `
								<div class="swiper-slide">
								<img src="${pageContext.request.contextPath}\${boardImgList[i].imgpath}" style="width: 100%;">
								</div>
								`;
		        	    }
		        	    $('#d__swiper-wrapper').html(swipe);
		        	    
		        		$('#box__detail').attr('data-bno', bno);

		        		makeUpReply(data);
		        		
		        		// 수정/삭제 버튼 활성 유무
		        		if(data.loginMno == data.board.mno || data.isAdmin){
		        			$('#update__delete__button__box').show();
		        		}else{
		        			$('#update__delete__button__box').hide();
		        		}		        		

		        		$('#detail__box').show();
		        		startSwiper();
			        	
		            },
		            error: function(err){
						alert('${pageContext.request.contextPath}/board/getDetail 에러');
		            }
		            
		        });
		    });

		 
		}
		boardDetailClickEvent();
		
		//글 상세보기 닫기버튼 클릭 이벤트
		$('#detail__close__button').on('click',(e)=>{
			e.stopPropagation();
	        e.preventDefault();
			$('#detail__box').hide();
		});


		//라이크 클릭 이벤트
		$('#d__like').on('click',(e)=>{
			e.stopPropagation();
	        e.preventDefault();

	        $.ajax({
	        	url: '${pageContext.request.contextPath}/board/blike',
	        	type: 'post',
	        	data: {'bno':$('#box__detail').attr('data-bno')},
	        	success: function(data){
	        		if(data.ok){
	        			$('#d__like > img').attr('src','${pageContext.request.contextPath}/resources/images/red_heart.png');
		        	}else{
		        		$('#d__like > img').attr('src','${pageContext.request.contextPath}/resources/images/black_heart.png');
	        		}
	        		$('#d__like__count').text(data.countLike);	        		
	            },
	            error: function(err){
					alert('${pageContext.request.contextPath}/board/blike 에러');
	            }
	            
	        });
		});
		


		function getList(index){
			$.ajax({
	        	url: '${pageContext.request.contextPath}/board/getList',
	        	type: 'get',
	        	data: {'index':index},
	        	success: function(data){
	            	var str = '';
	
	            	for (let x = 0; x < data.length; x++) {
	                    var b = data[x];
	                    
	                    var heartStatus;
	                    if(b.click=='Y'){
						 	heartStatus = '/animall/resources/images/red_heart.png';
	                    }else{
	                    	heartStatus = '/animall/resources/images/black_heart.png';
	                    }
		                    
	        			str += `
	                		<div class="col-lg-3 col-sm-6 mb-3">
	        				<div class="card text-center" data-bno="\${b.bno}">
	        					<div style="width: 100%; height: 300px; background-image: url('${pageContext.request.contextPath}\${b.imgpath}'); background-size: cover; background-position: center;"></div>
	        					<div class="card-body card-body-2 pb-0 px-4">
	        						<h5 class="card-title">\${b.btitle}</h5>
	        						<h6	style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"
	        							class="text-color mb-30">\${b.bcontent}</h6>

        							<div style="display: flex; justify-content: center;">
										<!-- 좋아요 버튼 -->
										<div style="width: 50px; cursor: pointer; display: flex; align-items: flex-end;">
											<img src="\${heartStatus}"	style="width: 100%;">
											<div style="color: #9b9b9b;">\${b.likec}</div>
										</div>
										<!-- 댓글 버튼 -->
										<div style="width: 50px; display: flex; align-items: flex-end; margin-left: 10px;">
											<img src="/animall/resources/images/reply.png"	style="width: 100%;">
											<div style="color: #9b9b9b;">\${b.replyc}</div>
										</div>
									</div>
	        							
	        						</div>
	        					</div>
	        				</div>
	        				`;
	        		}
	
	        		$('.board__box').append(str);
	        		boardDetailClickEvent();
	        		nextIndex++;
	            },
	            error: function(err){
					alert('${pageContext.request.contextPath}/board/getList 에러');
	            }
	            
	        });
		}
	
		var nextIndex = 2;
		//더보기버튼 클릭 이벤트
		$('#more__button').off().on('click',function(e){
	    	e.stopPropagation();
	        e.preventDefault();
	        getList(nextIndex);
	    });

		

		// 글 수정 닫기 버튼 이벤트	
		$('#update__close__button').on('click',(e)=>{
			e.stopPropagation();
	        e.preventDefault();
			$('#update__box').hide();
		});

		// 글 수정 폼 버튼	
		$('#call__update').on('click',(e)=>{
			e.stopPropagation();
	        e.preventDefault();
	        var bno = $('#box__detail').attr('data-bno');
	        $.ajax({
	        	url: '${pageContext.request.contextPath}/board/getUpdateForm',
	        	type: 'get',
	        	data: {'bno':bno},
	        	success: function(data){
	        		$('#update__box').attr('data-bno',data.board.bno);	
		        	$('#update__btitle').val(data.board.btitle);
		        	$('#update__bcontent').val(data.board.bcontent);
		        			        	
	        		$('#detail__box').hide();
	    			$('#update__box').show();	        	
	            },
	            error: function(err){
					alert('${pageContext.request.contextPath}/board/getUpdateForm 에러');
	            }
	            
	        });
		});

		// 글수정 버튼 이벤트
		$('#update__button').on('click',(e)=>{
			e.stopPropagation();
	        e.preventDefault();
	        
	        var reqData = {};
	        reqData.bno = $('#update__box').attr('data-bno');
	        reqData.btitle = $('#update__btitle').val();
	        reqData.bcontent = $('#update__bcontent').val();

	        $.ajax({
	        	url: '${pageContext.request.contextPath}/board/update',
	        	type: 'post',
	        	data: reqData,
	        	success: function(data){
	        		if(data.ok){
		        		alert('수정되었습니다.');
		        		$('#update__box').hide();	  
	        		}else{
		        		alert('수정 실패');
	        		}
	            },
	            error: function(err){
					alert('${pageContext.request.contextPath}/board/update 에러');
	            }
	            
	        });
	        
		});

		// 글삭제 버튼 이벤트
		$('#delete__button').on('click',(e)=>{
			e.stopPropagation();
	        e.preventDefault();
	  
	        $.ajax({
	        	url: '${pageContext.request.contextPath}/board/delete',
	        	type: 'post',
	        	data: {'bno':$('#box__detail').attr('data-bno')},
	        	success: function(data){
	        		if(data.ok){
		        		alert('삭제되었습니다.');
		        		$('#detail__box').hide();
	        		}else{
		        		alert('삭제 실패');
	        		}
	            },
	            error: function(err){
					alert('${pageContext.request.contextPath}/board/delete 에러');
	            }
	            
	        });
	        
		});
			
</script>
</body>
</html>

















