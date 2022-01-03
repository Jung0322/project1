<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/member.css" />    

<sec:authorize access="isAuthenticated()"> <!-- 로그인된 상태 -->
	<c:redirect url="/product/index"/> <!-- 메인페이지로 이동 -->
</sec:authorize>


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
                         <div class="login-form"> 
                         	  <label for="username">아이디</label>
                              <input type="text" name="username" id="username" class="form-control" placeholder="아이디">
                         </div>
                         <div class="login-form">
                         	  <label for="password">비밀번호</label>
                              <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호">
                         </div>
                         <div class="login-btn">
                              <input type="submit" class="form-control" id="login-btn" value="로그인">
                         </div>

                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                    </form>
                    <div class="change-signUp">
	                        <a href="/member/signUp">회원가입</a>
	                        &nbsp;|&nbsp;
	                        <a href="">아이디/비밀번호 찾기</a>
	                </div>
	                <div class="error-message">
	                	<ul>
	                		<li>
                				${loginFailMsg}
	                		</li>
		               	</ul>
	                </div>
               </div>

          </div>
     </div>
</section>

<script src="/resources/js/member/signin.js"></script>
<%@ include file="../includes/footer.jsp" %>