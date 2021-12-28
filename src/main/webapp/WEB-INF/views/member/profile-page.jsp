<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/member.css" />

<!-- About Section -->

<section id="about">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
               
                    <div class="member-profile-area">
	                    <div class="profile-area">
	                         <img src="/resources/images/portfolio-img1.jpg" class="profile-img">
	                    </div> <!-- profile-area end -->
	
	                    <div class="member-info-id">
	                         <h2 style="margin: 20px 0 15px 0">닉네임</h2>
	                         
	                         <div class="user-assessment">
	                         	<button type="button" class="modify-profile-btn">매너평가</button>
	                         	<button type="button" class="modify-profile-btn">모아보기</button>
	                         </div> <!-- user-assessment end -->
	                         <div class="member-info-modify">
	                         	<a href="/member/modify-info"><button type="button" class="modify-info-btn">프로필 및 정보 수정</button></a>
	                         </div> <!-- member-info-modify end -->
	                    </div> <!-- member-info-id end -->
                    </div> <!-- member-info-area end -->

                    <div class="profile-form">
                    	<label for="">매너온도</label>
                    	<br>첫 온도 36.5<br>
                    	---------------------------------------- <i class="far fa-smile fa-2x"></i>
                    </div>

					<div class="profile-form">
						<div class="user-assessment-result">
							<div class="retransaction-info">
								<span>
									<i class="far fa-heart fa-1x"></i>
								</span>
								&nbsp;
								<span>재거래 희망률 --%(글씨 굵게 변경)</span>
								<p>--명 중 --명이 만족</p>
							</div> <!-- retransaction-info end -->
							<div class="answer-info">
								<span>
									<i class="far fa-comment"></i>
								</span>
								&nbsp;
								<span>응답률 --%(글씨 굵게 변경)</span>
								<p>보통 --분 내로 응답</p>
							</div> <!-- answer-info end -->
						</div> <!-- user-assessment-result end -->
					</div>
					
					<div class="profile-form">
						<a>
							<span>판매상품 n개(글씨 굵게 변경)</span>
						</a>
					</div>
					<div class="profile-form">
						<a>
							<span>동네생활(n)(글씨 굵게 변경)</span>
						</a>
					</div>
					<div class="profile-form">
						<a href="#">
							받은 매너 평가(n)(글씨 굵게 변경)
						</a>
					</div>
					<div class="profile-form">
						<a href="">
							받은 거래 후기(n)(글씨 굵게 변경)
						</a>
					</div>
					<div class="profile-form"> <!-- 임시로 만든 div. 곧 지울 예정. -->
						temp - 다른 이미지 파일 찾아보기 
						<div style="width: 90px; height: 90px;">
							<img src="/resources/images/temp-profile.png" class="profile-img" alt="" />
						</div>
					</div>
					              
               </div> <!-- col-md-offset-1 col-md-10 col-sm-12 -->

          </div> <!-- row end -->
     </div> <!--  container end -->
</section>

<%@ include file="../includes/footer.jsp" %>