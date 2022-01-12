<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/myPlace.css" />
<script src="https://kit.fontawesome.com/84524c7dde.js"
	crossorigin="anonymous"></script> 


<!-- Blog Single Post Section -->
<section id="blog-single-post">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-1 col-md-10 col-sm-12">
					<div class="blog-single-post-thumb">
						<div class="blog-post-title">
							<span >${dto.mcategory}</span>
							<h2 style="line-height: 20px;">${dto.title}</h2>
						</div>
						<div class="blog-post-format">
							<span> <a href="/member/profile-page?userid=${dto.userid}"><img src="/resources/images/temp-profile.png" class="img-responsive img-circle profile"> ${dto.nickname}</a></span> 
							<span>${dto.mytown}</span> 
							<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.regdate}" /></span> 
							<span style="display: none;">${dto.userid}</span> 							
							<span id="contextOptionButton">
								<div class="dropdown" id="dropdownContent">
									<i class="fas fa-ellipsis-v" data-toggle="dropdown" aria-expanded="false"></i>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
										<button class="dropdown-item list" type="button" data-oper='list' onclick="location.href='/board/myPlace'">목록보기</button>
										<sec:authentication property="principal" var="info"/>
										<sec:authorize access="isAuthenticated()">
											<c:if test="${info.username == dto.userid}">
												<button class="dropdown-item list" type="button" id="hiddenBtn" data-oper='modify' onclick="location.href='/board/modify?mno=${dto.mno}'">수정하기</button>
											</c:if>
										</sec:authorize>
									</div>
								</div>
							</span>
						</div>
					</div>
					<div class="blog-context">
						<p>${dto.content}</p>
					</div>
					<div class="blog-good" id="ques">
						<c:choose>						
							<c:when test="${dto.mcategory == '동네질문'}">
								<span><i class="far fa-grin"></i> 궁금해요</span>
							</c:when>
							<c:when test="${dto.mcategory == '동네사건사고'}">
								<span><i class="far fa-grin"></i> 공감해요</span>
							</c:when>
							<c:when test="${dto.mcategory == '일상'}">
								<span><i class="far fa-grin"></i> 공감해요</span>
							</c:when>
							<c:otherwise>
								<span><i class="far fa-grin"></i> 공감해요</span>
							</c:otherwise>
						</c:choose>
						<span id="quesCnt">${dto.curious}</span>						
					</div>
				<div class="blog-reply">
					<!--  <h3>${dto.replycnt} Comments</h3>-->
					<!-- 댓글 보여주는 영역 -->
					  <div class="media" id="showReply">
						<!--<div class='dropdown' id='dropdown1'>
							<i class='fas fa-ellipsis-v' data-toggle='dropdown' aria-expanded='false'></i>
							<div class='dropdown-menu' aria-labelledby='dropdownMenuLink'>
							<div style='display:block;'>
							<button class='dropdown-item list' id='replyModifyBtn' type='button'>수정하기</button>
							</div>
							<div style='display:block;'>
							<button class='dropdown-item list' id='replyDeleteBtn' type='button'>삭제하기</button>
							</div>
							</div>
						</div>
						<div class="media-object pull-left">
							<img src="/images/heart.png" class="img-responsive img-circle" alt="Blog Image" >
						</div>
						<div class="media-body">
							<span name="nickname">Omar Larus</span> 
							<span name="mytown">서울시 은평구 신사동</span> 
							<span name="regdate">7 months ago</span>
							<p style="margin-bottom: 20px; margin-top: 10px;" name="content">댓글내용</p>
						</div>
						</div>-->
					</div>
				</div>
				
				<!-- 로그인 안된 상태 -->
				<sec:authorize access="isAnonymous()">
					<textarea class="form-control" placeholder="댓글을 입력하기 위해선 로그인이 필요합니다." rows="5" name="replyContent" id="replyContent" style="margin-top: 20px;" readonly="readonly"></textarea>				
				</sec:authorize>
				
				<!-- 로그인 된 상태 -->
				<sec:authorize access="isAuthenticated()">
				<div class="blog-reply-form">
					<form action="" method="post" id="replyForm">
						<textarea class="form-control" placeholder="댓글을 입력하세요." rows="5" name="replyContent" id="replyContent"></textarea>
						<div>
							<input type="button" class="form-control" id="replyButton" value="댓글입력">
						</div>
						    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                         	<input type="hidden" name="mno" value="${dto.mno}"/>
                         	                  	  						 						
					</form>
				</div>
				</sec:authorize>
			</div>
		</div>
		</div>	
</section>
            <!-- 댓글작성 폼 -->
            <div class="modal" tabindex="-1" id="replyModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			        <h5 class="modal-title">댓글 수정하기</h5>
			      </div>
			      <div class="modal-body">
			        <div class="modal-user">
				        <div class="media-object pull-left" style="margin-right: 10px;">
							<img src="/resources/images/temp-profile.png" class="img-responsive img-circle profile" alt="Blog Image" >
						</div>						
			        	<span name="userid">Omar Larus</span> 
			        	<span name="nickname" style="margin-right: 7px;">Omar Larus</span> 
						<span name="mytown" style="margin-right: 7px;">서울시 은평구 신사동</span> 
						<span name="regdate" style="margin-right: 7px;">7 months ago</span>
						<textarea rows="3" cols="" style="width: 100%; margin-top: 10px" name="content">댓글 내용</textarea>       
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="" id="modalModifyBtn">수정</button>
			        <button type="button" class="" id="modalCloseBtn" data-dismiss="modal">종료</button>
			      </div>
			    </div>
			  </div>
			</div>
		</div>
		<!-- 대댓글작성 폼 -->
            <div class="modal" tabindex="-1" id="re-replyModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			        <h5 class="modal-title">댓글 수정하기</h5>
			      </div>
			      <div class="modal-body">
			        <div class="modal-user">
				        <div class="media-object pull-left" style="margin-right: 10px;">
							<img src="/resources/images/temp-profile.png" class="img-responsive img-circle profile" alt="Blog Image" >
						</div>
			        	<span name="nicknameM" style="margin-right: 7px;">Omar Larus</span> 
						<span name="mytownM" style="margin-right: 7px;">서울시 은평구 신사동</span> 
						<span name="regdateM" style="margin-right: 7px;">7 months ago</span>
						<textarea rows="3" cols="" style="width: 100%; margin-top: 10px" name="contentM">댓글 내용</textarea>       
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="" id="modalModifyBtnRe">작성완료</button>
			        <button type="button" class="" id="modalCloseBtnRe" data-dismiss="modal">종료</button>
			      </div>
			    </div>
			  </div>
			</div>
		</div>		
<script>
	//현재 글번호 가져오기
	let mno = ${dto.mno};
	let writer = "${dto.userid}";
	
	
	let replyer = null;
	<sec:authorize access = "isAuthenticated()">
		replyer = "<sec:authentication property='principal.username'/>";
	</sec:authorize>
	
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";	
	
	//페이지 로드 시 좋아요 표시
	let good_check = "${good_check}";
	let curious = ${dto.curious};
	
</script>

<script src="/resources/js/board/good.js"></script> 
<script src="/resources/js/board/myPlace.js"></script> 
<script src="/resources/js/board/myPlaceReply.js"></script> 
<%@ include file="../includes/footer.jsp"%>