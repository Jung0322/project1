<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    	 <div>
                         	  <label for="userId">ID</label>
                              <input type="text" name="userId" class="form-control" placeholder="아이디">
                         </div>
                         <div>
                         	  <label for="password">비밀번호</label>
                              <input type="password" name="password" class="form-control" placeholder="비밀번호">
                         </div>	
                         <div>
                         	  <label for="password">비밀번호 재확인</label>
                              <input type="password" name="passwordCheck" class="form-control" placeholder="비밀번호 재확인">
                         </div>	
                         <div>
                         	  <label for="name">이름</label>
                              <input type="text" name="name" class="form-control" placeholder="이름">
                         </div>
                         <div>
                         	  <label for="nickname">닉네임</label>
                              <input type="text" name="nickname" class="form-control" placeholder="닉네임">
                         </div>
                         <div>
                         	  <label for="birthday">생년월일</label>
                              <input type="text" name="birthday" class="form-control" placeholder="생일">
                         </div>
                         <div>
                         	  <label for="email">이메일</label>
                              <input type="text" name="email" class="form-control" placeholder="이메일">
                         </div>
                         <div>
                         	  <label for="phone">휴대전화</label>
                              <input type="text" name="phone" class="form-control" placeholder="휴대전화">
                         </div>
                         <div class="col-md-6">
                              <input type="submit" class="form-control" value="회원가입">
                              <input type="reset" class="form-control" value="취소">
                         </div>
                    </form>
               </div>

          </div>
     </div>
</section>

<%@ include file="../includes/footer.jsp" %>