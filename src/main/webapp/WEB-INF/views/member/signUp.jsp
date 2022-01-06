<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/member.css" />

<!-- validate cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>

<script src="/resources/js/member/signup.js"></script>

<sec:authorize access="isAuthenticated()"> <!-- 로그인 된 상태 -->
	<c:redirect url="/product/Secindex"/> <!-- 메인페이지로 이동 -->
</sec:authorize>

<!-- Contact Section -->

<section id="contact">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <div class="section-title">
                         <h3>브로콜리 마켓</h3>
                         <h2>The creative web \& mobile studio and focused on brand identity, web development and social marketing.</h2>
                    </div>

                    <form action="#" method="post" id="signupForm">
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
                         <div class="login-form">
                              <label for="password_check">비밀번호 재확인</label>
                              <input type="password" name="password_check" id="password_check" class="form-control" placeholder="비밀번호 재확인">
                              <small id="password_check"></small>
                         </div>
                         <div class="login-form">
                              <label for="nickname">닉네임</label>
                              <input type="text" name="nickname" id="nickname" class="form-control" placeholder="닉네임">
                              <small id="nickname"></small>
                         </div>
                         <div class="login-form">
                              <div class="modify-label">
                              		<label for="mytown">내 동네</label>
                                	<input type="button" value="선택" class="modify-btn" onclick="goPopup();" />
                              </div>
                              <input type="text" id="mytown" name="mytown" class="form-control" placeholder="내 동네" >
                              <small id="mytown"></small>
                         </div>
                         <div class="login-form">
                              <label for="email">이메일</label>
                              <input type="text" name="email" id="email" class="form-control" placeholder="이메일">
                              <small id="email"></small>
                         </div>
                         <div class="login-form">
                              <label for="phone">휴대전화</label>
                              <input type="text" name="phone" id="phone" class="form-control" placeholder="휴대전화">
                              <small id="phone"></small>
                         </div>
                         
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                         
                         <div class="col-md-3 insert-btn-area">
                              <input type="submit" class="form-control" id="insert-btn" value="회원가입">
                         </div>
                         <div class="col-md-3">
                              <a href="/member/signIn">
                                 <input type="button" class="cancel-btn" value="취소">
                              </a>
                         </div>
                    </form>
               </div>

          </div>
     </div>
</section>

<script>
function goPopup(e){
   // 주소검색을 수행할 팝업 페이지를 호출합니다.
   // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
   var pop = window.open("/member/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
   
   // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


/* function jusoCallBack(roadFullAddr,jibunAddr){ */
function jusoCallBack(siNm, sggNm, emdNm, liNm){
      // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
      var addressEl =  document.querySelector("#mytown");
      addressEl.value = siNm+" "+sggNm+" "+emdNm+" "+liNm;
      
      /* document.form.roadFullAddr.value = roadFullAddr;
      document.form.jibunAddr.value = jibunAddr; */
      
}
</script>

<%@ include file="../includes/footer.jsp" %>