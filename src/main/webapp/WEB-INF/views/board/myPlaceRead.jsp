<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPlace.css" />
<script src="https://kit.fontawesome.com/84524c7dde.js"
	crossorigin="anonymous"></script> 

<%@ include file="../includes/header.jsp"%>

<!-- Blog Single Post Section -->
<section id="blog-single-post">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-1 col-md-10 col-sm-12">
					<div class="blog-single-post-thumb">
						<div class="blog-post-title">
							<span>${dto.mcategory}</span>
							<h2>${dto.title}</h2>
						</div>
						<div class="blog-post-format">
							<span> <a href="/member/profile-page"><img src="/resources/images/ccoli.png" class="img-responsive img-circle">${dto.nickname}</a></span> 
							<span>${dto.mytown}</span> 
							<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.regdate}" /></span> 
							<span id="contextOptionButton">
								<div class="dropdown">
									<i class="fas fa-ellipsis-v" data-toggle="dropdown" aria-expanded="false"></i>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
										<button class="dropdown-item list" type="button" data-oper='list' onclick="location.href='/board/myPlace'">목록보기</button>
										<button class="dropdown-item list" type="button" id="hiddenBtn" data-oper='modify' onclick="location.href='/board/modify?mno=${dto.mno}'">수정하기</button>
										<button class="dropdown-item list" type="button" id="hiddenBtn" data-oper='remove'>삭제하기</button>
									</div>
								</div>
							</span>
						</div>
					</div>
					<div class="blog-context">
						<p>${dto.content}</p>
					</div>
				<div class="blog-good">
					<span><i class="far fa-grin"></i> 궁금해요</span> 
				</div>
				<div class="dropdown" >
					<i class="fas fa-ellipsis-v" data-toggle="dropdown" aria-expanded="false"></i>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<button class="dropdown-item list" type="submit" >수정하기</button>
							<button class="dropdown-item list" type="submit" >삭제하기</button>
						</div>
							</div>
				<div class="blog-reply">
					<h3>2 Comments</h3>
					<div class="media">
						<div class="media-object pull-left">
							<img src="/images/heart.png" class="img-responsive img-circle" alt="Blog Image" >
						</div>
						<div class="media-body">
							<span name="nickname">Omar Larus</span> 
							<span name="mytown">서울시 은평구 신사동</span> 
							<span name="regdate">7 months ago</span>
							<p name="content">Lorem ipsum dolor sit amet, maecenas eget
								vestibulum justo imperdiet, wisi risus purus augue vulputate
								voluptate neque, curabitur.</p>
						</div>
					</div>
				</div>
				<div class="blog-reply-form">
					<form action="#" method="post">
						<textarea class="form-control" placeholder="댓글을 입력하세요." rows="5" id="replyContent"></textarea>
						<div>
							<input type="submit" class="form-control" id="replyButton" value="댓글입력">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	let mno = ${dto.mno};
	
</script>

<script src="/resources/js/reply.js"></script> 
<script src="/resources/js/myPlace.js"></script> 
<%@ include file="../includes/footer.jsp"%>