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
                         <h2>The creative web \& mobile studio and focused on brand identity, web development and social marketing.</h2>
                    </div>

                    <form action="#" method="post">
                         <!-- <div class="col-md-8"> -->
                         <div class="login-form">
                              <label for="userid">아이디</label>
                              <input type="text" name="userid" id="userid" class="form-control" placeholder="아이디">
                         </div>
                         <div class="login-form">
                              <label for="password">비밀번호</label>
                              <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호">
                         </div>
                         <div class="login-form">
                              <label for="password-check">비밀번호 확인</label>
                              <input type="password" name="passwordCheck" id="password-check" class="form-control" placeholder="비밀번호 재확인">
                         </div>
                         <div class="login-form">
                         	  <button type= "button" style="color:white; background-color: black; border-radius: 12px;	font-family:'Nanum Gothic';"
                         	  onclick="goPopup();">
                         	  주소검색</button>
                              <input type="text" id="address" name="address" class="form-control" placeholder="주소" readonly>
                         </div>
                         <div class="login-form">
                         	  <label for="email">이메일</label>
                              <input type="text" name="email" class="form-control" placeholder="이메일">
                         </div>
                         <div class="login-form">
                              <label for="nickname">닉네임</label>
                              <input type="text" name="nickname" id="nickname" class="form-control" placeholder="닉네임">
                         </div>
                         <div class="login-form">
                              <label for="phone">휴대전화</label>
                              <input type="text" name="phone" id="phone" class="form-control" placeholder="휴대전화">
                         </div>
                         <div class="login-form">
                              <label for="mytwon">내 동네</label>
                              <input type="text" name="mytown" id="mytown" class="form-control" placeholder="내 동네">
                         </div>
                         
                         <div class="col-md-3 insert-btn-area">
                              <input type="submit" class="form-control" id="insert-btn" value="회원가입">
                         </div>
                         <div class="col-md-3">
                              <input type="button" class="cancel-btn" value="취소">
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


function jusoCallBack(roadFullAddr,jibunAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		var addressEl =  document.querySelector("#address");
		addressEl.value = roadFullAddr;
		
		/* document.form.roadFullAddr.value = roadFullAddr;
		document.form.jibunAddr.value = jibunAddr; */
		
}
</script>
<%@ include file="../includes/footer.jsp" %>