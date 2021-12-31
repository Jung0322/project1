<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/member.css" />


<section id="about">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <div class="section-title">
                         <h3>2021년 12월 브로콜리 가계부</h3>
                    </div>
					
					<div class="member-info-area">
						<div class="cashbook-member-info">
							<h2>(닉네임)님의</h2>
							<h2>브로콜리 가계부</h2>
							
							<div class="cashbook-profile">
		                    	<img src="/resources/images/temp-profile.png" class="profile-img" >
		                    </div>
						</div>
	                    <div class="cashbook-date-info">
	                    	<select>
	                    		<option>2021</option>
	                    	</select>
	                    	년&nbsp;&nbsp;&nbsp;
	                    	<select name="" id="">
	                    		<option value="">12</option>
	                    	</select>
	                    	월
	                    </div>
                    </div>
                    
                    <!--  여기 아래부터 다시 ~~ 디자인 하기 ~~ -->
                    <div class="login-form">
                    	<div class="cashbook-icon">
                    		<i class="fa fa-magnet"></i>
                    		
                    		<div class="cashbook-trade-date">
                    			<h3>2021년 12월에는</h3>
                    			<h3>이렇게 거래했어요</h3>
                    		</div>
                    	</div>
                    </div>

	                    


                   
                    <hr>

                    <div class="col-md-4 col-sm-6">
                         <h3>Web Development</h3>
                         <ul>
                              <li>Online Shopping Site</li>
                              <li>Wordpress CMS</li>
                              <li>Bootstrap themes</li>
                              <li>Web Application</li>
                         </ul>
                    </div>

                    <div class="col-md-4 col-sm-6">
                         <h3>Brand Identity</h3>
                         <ul>
                              <li>Logo Design</li>
                              <li>Personal Branding</li>
                              <li>Flyer Design</li>
                              <li>Creative Direction</li>
                         </ul>
                    </div>

                    <div class="col-md-4 col-sm-6">
                         <h3>Social marketing</h3>
                         <ul>
                              <li>facebook, twitter.</li>
                              <li>Page Maintenance</li>
                              <li>Social media</li>
                         </ul>
                    </div>                    
			</div> <!-- col-md-offset-1 col-md-10 col-sm-12 end -->

          </div>
     </div>
</section>


<%@ include file="../includes/footer.jsp" %>