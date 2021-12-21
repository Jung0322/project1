<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>


<!-- Contact Section -->

<section id="contact">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <div class="section-title">
                         <h3>get in touch</h3>
                         <h2>The creative web & mobile studio and focused on brand identity, web development and social marketing.</h2>
                    </div>

                    <form action="#" method="post">
                    	 <div class="col-md-6 col-sm-6">
                         	  <label for="userId">ID</label>
                              <input type="text" name="userId" class="form-control" placeholder="아이디">
                         </div>
                         <div class="col-md-6 col-sm-6">
                         	  <label for="password">PASSWORD</label>
                              <input type="password" name="password" class="form-control" placeholder="비밀번호">
                         </div>	
                         <div class="col-md-6 col-sm-6">
                         	  <label for="name">이름</label>
                              <input type="text" name="name" class="form-control" placeholder="이름">
                         </div>
                         <div class="col-md-6 col-sm-6">
                         	  <label for="nickname">닉네임</label>
                              <input type="email" name="nickname" class="form-control" placeholder="닉네임">
                         </div>
                         <div class="col-md-3 col-sm-4">
                              <input type="submit" class="form-control" value="Create Account">
                              <input type="reset" class="form-control" value="Cancel">
                         </div>
                    </form>
               </div>

          </div>
     </div>
</section>

<%@ include file="../includes/footer.jsp" %>