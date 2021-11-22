<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
					<div class="topContainer_ForMain">
							<div class="topContainerLeft_ForMain"></div>
							<div class="topContainerRight_ForMain">
									<div style="color : #997296; font-weight : bold;">
										${member.nname} 님
									</div>
									<div>
										<i class="far fa-bell"></i>			
									</div>
									<a href="#">
										<div>
											<i class="fas fa-cog"></i>		
										</div>
									</a>
									<div class="totalCategory">
											  <div class="topMenu_profileImgBox" id="topMenu_profileImgBox">
											  	<img class="topMenu_profile" id="topMenu_profile" 
											  	src="${pageContext.request.contextPath}/resources/images/test2.jpg" alt="" />
											  </div>
										      <div class="dropdown-content">
										      		<a href="#" id="basicAdminInfo">사진변경</a>
											        <a href="${pageContext.request.contextPath}/admin/member/adminMember.do">관리자 설정</a>
											        <a href="${pageContext.request.contextPath}/users/member/memberLogout.do">로그아웃</a>
											        <a href="${pageContext.request.contextPath}/index/Load.do">홈(Animall)</a>
										      </div>
									</div>
									
							</div>
					</div>
					
			
<!-- ------------------             기본정보 수정 레이어            ---------------- -->
<!--                          ------------------------------------------------ -->
					
<div class="primeContainer_forRayer" id="adminPrimeContainer_forRayer">
			<div class="dimedContainer_forRayer" id="write_form__bg">
			</div>
			
	<!-- 		파일 전송을 위해 multipart/form-data사용 -->
			<form id='write_form' role='form' method='post' enctype='multipart/form-data'
			 action="${pageContext.request.contextPath}/index/ProductInsert.do">
			
	<!-- 		가운데 맞추기 용 div -->
				<div class="bigContainer_forRayer" id="write_form_box">
					<div class="formContainer_forRayer">
	
						<div style="margin-top: 60px;">
		
								<div class="fileContainer_forRayer">
									<div class="fileBox">
										<div class="filebox preview-image">
											<label for="input-file">사진선택</label> 
											<input type="file" id="input-file" class="upload-hidden">
											<!-- onchange="imgChangeBox()"> --> 
										</div>

									</div>
								</div>
		
								<button class="writeButton_forRayer" id="write_button" type="submit">
								저장
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
	

			