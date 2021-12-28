<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/member.css" />    


<!-- Contact Section -->

<section id="contact">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <div class="section-title">
                         <h3>브로콜리 마켓</h3>
                         <h2>콜리님, 어서오세요. 브로콜리 마켓입니다.</h2>
                    </div>

                    <form action="/member/signIn" method="post">
                         <!-- <div class="col-md-8"> --> 
                         <div class="login-form"> 
                         	  <label for="userid">아이디</label>
                              <input type="text" name="userid" id="userid" class="form-control" placeholder="아이디">
                         </div>
                         <!-- <div class="col-md-8"> -->
                         <div class="login-form">
                         	  <label for="password">비밀번호</label>
                              <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호">
                         </div>
                         <!-- <div class="col-md-5"> -->
                         <div class="login-btn">
                              <input type="submit" class="form-control" id="login-btn" value="로그인">
                         </div>
                    </form>
                    <!-- <div class="col-md-10"> -->
                    <div class="change-signUp">
	                    	<label for="signUp">아직 회원이 아니신가요?</label>
	                        <a href="signUp">회원가입</a>
	                </div>
               </div>

          </div>
     </div>
</section>
<%@ include file="../includes/footer.jsp" %>