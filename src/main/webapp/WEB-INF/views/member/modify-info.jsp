<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/member.css" />

<%@ include file="../includes/header.jsp" %>


<!-- Contact Section -->

<section id="contact">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <div class="section-title">
                         <h3>브로콜리 마켓</h3>
                         <h2>The creative web & mobile studio and focused on brand identity, web development and social marketing.</h2>
                    </div>

                    <form action="#" method="post">
                    	 <div class="member-info-area">
	                    	 <!-- <div class="modify-profile" id="profile-area"> -->
	                    	 <div class="profile-area">
	                    	 	<input type="file" name="profileimgname" id="" class="profile-file"/>
	                    	 	<label for="profile-label">
		                    	 	<img src="/resources/images/portfolio-img1.jpg" alt="" class="profile-img" />
		                    	 	<img src="/resources/images/ccoli.png" alt="" class="icon-camera" />
	                    	 	</label>
	                    	 </div> <!-- profile-area end -->
	                         <div class="member-info-id">
	                              <p>아이디</p>
	                              <input type="text" name="userid" class="form-control" readonly="readonly">
	                              <p>가입일 : 2021-12-25</p>
	                              <input type="button" class="modify-profile-btn" value="사진 변경" />
	                              <input type="button" class="modify-profile-btn" value="사진 삭제" />	                              
	                         </div> <!-- member-info-id end -->
                         </div> <!-- member-info-area end -->
                         
                         <div class="login-form">
                         	  <div class="modify-label">
	                              <!-- <label for="nickname">닉네임</label> -->
	                              <p>닉네임</p>
	                              <input type="button" class="modify-btn" value="수정" />
                              </div>
                              
                              <input type="text" name="nickname" id="nickname" class="form-control" placeholder="닉네임">
                         </div>
                         <div class="login-form">
                         	<div class="modify-label">
		                         <p>비밀번호</p>
		                         <input type="button" class="modify-btn" value="수정" />
	                         </div>
	                         
	                         <div class="div-pwd-hide"></div>
	                         <div class="div-pwd-form">
		                         <!-- <div class="col-md-8"> -->
		                         <div class="div-pwd">
		                              <label for="password">현재 비밀번호</label>
		                              <input type="password" name="password" id="password" class="form-control" placeholder="현재 비밀번호">
		                         </div>
		                         <div class="div-pwd">
		                              <label for="new-password">새 비밀번호</label>
		                              <input type="password" name="newPassword" id="new-password" class="form-control" placeholder="새 비밀번호">
		                         </div>
		                         <div class="div-pwd">
		                              <input type="password" name="passwordCheck" id="password-check" class="form-control" placeholder="새 비밀번호 확인">
		                         </div>
	                         </div> <!-- div-pwd-form end -->
                         </div> <!-- modify-form end -->
                         <div class="login-form">
                         	<div class="modify-label">                              
                           		<p>이메일</p>
                            	<input type="button" class="modify-btn" value="수정" />
                             </div>
                             
                             <input type="text" name="email" id="email" class="form-control" placeholder="이메일">
                         </div>
                         <div class="login-form">
                         	<div class="modify-label">
	                         	<p>휴대전화</p>
	                         	<input type="button" class="modify-btn" value="수정" />
                         	</div>
                        
                            <input type="text" name="phone" id="phone" class="form-control" placeholder="휴대전화">
                         </div>
                         <div class="login-form">
                         	<div class="modify-label">
							 	<p>내 동네</p>
							 	<input type="button" class="modify-btn" value="수정" />
						 	</div>
                          
                            <input type="text" name="mytown" id="mytown" class="form-control" placeholder="내 동네">
                         </div>
                         
                         <!-- <div class="col-md-4">
                              <input type="submit" class="form-control" value="회원가입">
                         </div>
                         <div class="col-md-4">
                              <input type="button" class="form-control" value="쥐소">
                         </div> -->
                    </form>
               </div>

          </div>
     </div>
</section>


<%@ include file="../includes/footer.jsp" %>