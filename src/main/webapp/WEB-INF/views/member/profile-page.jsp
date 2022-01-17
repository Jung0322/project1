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
							<img src="/resources/images/temp-profile.png"  class="profile-img">
	                    </div> <!-- profile-area end -->
	
	                    <div class="member-info-id" style="left: 25%;">
	                        <h3 style="margin: 23px 0 15px 0;">${dto.nickname}</h3>
	                         
	                        <c:if test="${info.username != dto.userid}">
								<div class="user-assessment">
		                        	<button type="button" class="modify-profile-btn">매너평가</button>
		                         	<button type="button" class="modify-profile-btn">모아보기</button>
		                        </div> <!-- user-assessment end -->
							</c:if>
							 
	                        <c:if test="${info.username == dto.userid}">
		                    	<div class="member-info-modify">
		                        	<a href="/member/modify-info"><button type="button" class="modify-info-btn">프로필 및 정보 수정</button></a>
		                        </div> <!-- member-info-modify end -->
	                        </c:if>
	                    </div> <!-- member-info-id end -->
                    </div> <!-- member-info-area end -->
					<!-- 
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
								<b>재거래 희망률 --%</b>
								<p>--명 중 --명이 만족</p>
							</div> <!-- retransaction-info end -->
					<!-- 		<div class="answer-info">
								<span>
									<i class="far fa-comment"></i>
								</span>
								&nbsp;
								<b>응답률 --%</b>
								<p>보통 --분 내로 응답</p>
							</div> <!-- answer-info end -->
			<!-- 			</div> <!-- user-assessment-result end -->
			<!-- 		</div>  -->
					
					<div class="profile-form">
					<c:if  test="${info.username == dto.userid}">
						<a href="/product/sellproduct?userid=${info.username}">
							<b>판매상품 ${sellpdcount}개</b>
						</a>
					</c:if>
					<c:if  test="${info.username != dto.userid}">
						<a href="/product/sellproduct?userid=${dto.userid}">
							<b>판매상품 ${sellpdcount}개</b>
						</a>
					</c:if>
					</div>
					<div class="profile-form">
						<a href="/board/myPlace-myPage?userid=${dto.userid}">
							<b>동네생활</b>
						</a>
					</div>
					
					<!-- 
					<div class="profile-form">
						<a href="#">
							<b>받은 매너 평가(n)</b>
						</a>
					</div>
					<div class="profile-form">
						<a href="">
							<b>받은 거래 후기(n)</b>
						</a>
					</div>  -->
               </div> <!-- col-md-offset-1 col-md-10 col-sm-12 -->

          </div> <!-- row end -->
     </div> <!--  container end -->
</section>

<%@ include file="../includes/footer.jsp" %>