<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<link rel="stylesheet" href="/resources/css/member.css" />

<!-- validate cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>

<!-- Contact Section -->

<section id="contact">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <div class="section-title" style="padding-bottom: 10px;">
                         <h3>당신 곁에 언제나 이로운, 브로콜리 마켓</h3>
                    </div>

                    <form action="" method="post" id="modifyForm_profile" enctype="multipart/form-data">
                    	<div class="member-info-area">
	                    	<!-- <div class="modify-profile" id="profile-area"> -->
	                    	<div class="profile-area">
	                    		<input type="file" name="profileimgname" id="" class="profile-file"/>
	                    		<label for="profile-label" class="profile-label">
		                    		<img src="/resources/images/temp-profile.png" alt="" class="profile-img profile" id="profileImg"/>
		                    	 	<img src="/resources/images/add-img.png" alt="" class="icon-camera" />
		                    	 	<%-- <input type="hidden" name="pfuuid" value="${profileImg.pfuuid}" id="pfuuid"/>
		                    	 	<input type="hidden" name="profileUploadPath" value="${profileImg.profileUploadPath}" id="pfUploadPath"/>
		                    	 	<input type="hidden" name="profileImgName" value="${profileImg.profileImgName}" id="pfImgName"/> --%>
	                    	 	</label>
	                    	</div> <!-- profile-area end -->
	                        <div class="member-info-id">
	                        	<p>아이디</p>
	                            <input type="text" name="userid" class="form-control" value="${dto.userid}" readonly="readonly">
	                            <p>가입일 : 2021-12-25</p>
	                            <button type="button" class="modify-profile-btn" data-oper="profile">사진 저장</button>
	                            <button type="button" class="modify-profile-btn" data-oper="delete">사진 삭제</button>	                              
	                        </div> <!-- member-info-id end -->
                         </div> <!-- member-info-area end -->
					</form>
					
					<form action="" method="post" id="modifyForm_nickname">	 
                         <div class="login-form">
                         	<div class="modify-form">
                         		<div class="modify-label">
	                            	<!-- <label for="nickname">닉네임</label> -->
	                            	<p>닉네임</p>
	                            	<!-- <input type="button" class="modify-btn" value="수정" /> -->
	                             	<button type="button" id="nickname-btn" class="modify-btn" data-oper="nickname">수정</button>
	                             	<button type="submit" id="nickname-btn-submit" class="modify-btn-submit">저장</button>
	                        		<button type="button" id="nickname-btn-cancel" class="modify-btn" style="display: none;">취소</button>	                              
                            	</div>
                              
                            	<input type="text" name="nickname" id="nickname" class="form-control" value="${dto.nickname}" placeholder="닉네임" readonly>
                              	<small id="nickname"></small>
                         	</div>
                         </div>
                    </form>
                    
                    <form action="" method="post" id="modifyForm_password">
                    	<div class="login-form">
                        	<div class="modify-label">
		                    	<p>비밀번호</p>
		                        <button type="button" id="pssword-btn" class="modify-btn" data-oper="password">수정</button>
		                        <button type="submit" id="password-btn-submit" class="modify-btn-submit">저장</button>
	                            <button type="button" id="password-btn-cancel" class="modify-btn" style="display: none;">취소</button>
	                        </div>
	                         
	                        <div class="div-pwd-hide"></div>
	                        <div class="div-pwd-form" id="modifyPwdForm">
		                    	<!-- <div class="col-md-8"> -->
		                        <div class="div-pwd">
		                        	<label for="password">현재 비밀번호</label>
		                            <input type="password" name="password" id="password" class="form-control" placeholder="현재 비밀번호">
		                            <small id="password"></small>
		                        </div>
		                        <div class="div-pwd">
		                        	<label for="new_password">새 비밀번호</label>
		                            <input type="password" name="new_password" id="new_password" class="form-control" placeholder="새 비밀번호">
		                            <small id="new_password"></small>
		                        </div>
		                        <div class="div-pwd">
		                        	<input type="password" name="password_check" id="password_check" class="form-control" placeholder="새 비밀번호 확인">
		                            <small id="password_check"></small>
		                        </div>
	                         </div> <!-- div-pwd-form end -->
                         </div> <!-- modify-form end -->
                    </form>
                    
                    <form action="" method="post" id="modifyForm_email"> 
                         <div class="login-form">
                         	<div class="modify-label">                              
                           		<p>이메일</p>
                            	<button type="button" id="email-btn" class="modify-btn" data-oper="email">수정</button>
                            	<button type="submit" id="email-btn-submit" class="modify-btn-submit">저장</button>
	                            <button type="button" id="email-btn-cancel" class="modify-btn" style="display: none;">취소</button>
                             </div>
                             
                             <input type="text" name="email" id="email" class="form-control" value="${dto.email}" placeholder="이메일" readonly>
                             <small id="email"></small>
                         </div>
                    </form>
                    <form action="" method="post" id="modfiyForm_phone">
                         <div class="login-form">
                         	<div class="modify-label">
	                         	<p>휴대전화</p>
	                         	<button type="button" id="phone-btn" class="modify-btn"  data-oper="phone">수정</button>
	                         	<button type="submit" id="phone-btn-submit" class="modify-btn-submit">저장</button>
	                            <button type="button" id="phone-btn-cancel" class="modify-btn" style="display: none;">취소</button>
                         	</div>
                        
                            <input type="text" name="phone" id="phone" class="form-control" value="${dto.phone}" maxlength="13" placeholder="휴대전화" readonly>
                            <small id="phone"></small>
                         </div>
                    </form>
                         <div class="login-form">
                         	<div class="modify-label">
							 	<p>내 동네</p>
							 	<input type="button" class="modify-btn" value="수정" />
						 	</div>
                          
                            <input type="text" name="mytown" id="mytown" class="form-control" value="${dto.mytown}" placeholder="내 동네" readonly>
                         </div>
                         
                        <div class="login-form">
                        	<div class="modify-label">
                        		<a href="/member/remove-member" style="position: absolute; right: 0;">회원탈퇴</a>
                        	</div>
                        </div>
               </div>

          </div>
     </div>
</section>

<script src="/resources/js/member/modify-info.js"></script>
<%@ include file="../includes/footer.jsp" %>