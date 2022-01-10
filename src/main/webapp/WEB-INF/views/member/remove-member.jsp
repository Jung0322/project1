<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/member.css" />
<script src="/resources/js/member/remove-member.js"></script>

<!-- validate cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>

<!-- 로그인 안된 상태 -->
<sec:authorize access="isAnonymous()">
	<c:redirect url="/member/signIn"/> <!-- 로그인 페이지로 이동 -->
</sec:authorize>

<!-- Contact Section -->

<section id="contact">
     <div class="container">
          <div class="row">
				
               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <div class="section-title">
                         <h3>브로콜리 마켓</h3>
                    </div>
                    
                    <div class="login-form div-delete-reason">
                    	<b>탈퇴 사유 선택 <span style="color: red;">*</span></b>
                    	<select name="delete_reason" id="deleteReason" class="form-control">
                    		<option value="1" selected>탈퇴 사유를 선택해 주세요</option>
                    		<option value="3" >재가입을 위해</option>
                    		<option value="4" >브로콜리 팀의 서비스 불만</option>
                    		<option value="5" >시스템 장애</option>
                    		<option value="6" >개인정보 우려</option>
                    		<option value="7" >기타</option>
                    	</select>
                    </div>
                    
                    <div class="login-form">
                    	<textarea rows="" cols="" class="form-control" id="deleteContent" name="deleteContent"></textarea>
                    	<small id="deleteContent"></small>
                    </div>
					<div class="login-form">
						<div class="div-remove-hide"></div>
					</div>

					<div class="div-remove">
	                    <form action="/member/remove-member" method="post" id="removeForm">
	                         <div class="login-form"> 
	                         	  <label for="userid">아이디</label>
	                              <input type="text" name="userid" id="userid" class="form-control" placeholder="아이디">
	                              <small id="userid"></small>
	                         </div>
	                         <div class="login-form">
	                         	  <label for="password">비밀번호</label>
	                              <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호">
	                              <small id="password"></small>
	                         </div>
	                         <div class="login-btn">
	                              <input type="submit" class="form-control" id="login-btn" value="회원탈퇴">
	                         </div>
	
	                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	                    </form>
                    </div>
               </div>

          </div>
     </div>
</section>

<%@ include file="../includes/footer.jsp" %>