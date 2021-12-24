<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/member.css" />

<!-- 나중에 옮기기 -->
<style>
	img {
		width: 120px;
  		height: 120px;
  		object-fit: cover;
  		border-radius: 100px;
	}
	
	.image_upload {
		margin-left: 100px;
	}
</style>

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
                    	<div class="image_upload">
                    		<label for="profile_img">
                    			<img src="/resources/images/author-image1.jpg" alt="" />
                    		</label>
                    	</div>
                    	 <div class="memberForm">
                         	  <label for="userId">ID</label>
                              <input type="text" name="userId" class="form-control" placeholder="아이디" readonly="readonly">
                         </div>
                         <div class="memberForm">
                         	  <label for="password">비밀번호</label>
                              <input type="password" name="password" class="form-control" placeholder="비밀번호">
                         </div>	
                         <div class="memberForm">
                         	  <label for="password">비밀번호 재확인</label>
                              <input type="password" name="passwordCheck" class="form-control" placeholder="비밀번호 재확인">
                         </div>	
                         <div class="memberForm">
                         	  <label for="nickname">닉네임</label>
                              <input type="text" name="nickname" class="form-control" placeholder="닉네임">
                         </div>
                         <div class="memberForm">
                         	  <label for="email">이메일</label>
                              <input type="text" name="email" class="form-control" placeholder="이메일">
                         </div>
                         <div class="memberForm">
                         	  <label for="phone">휴대전화</label>
                              <input type="text" name="phone" class="form-control" placeholder="휴대전화">
                         </div>
                         <div class="memberForm">
                         	  <label for="phone">내 동네</label>
                              <input type="text" name="myTown" class="form-control" placeholder="동까지만 입력">
                         </div>
                    </form>
               </div>

          </div>
     </div>
</section>


<%@ include file="../includes/footer.jsp" %>