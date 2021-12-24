<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPlace.css" />
<%@ include file="../includes/header.jsp"%>

<!-- Blog Single Post Section -->
<section id="blog-single-post">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-1 col-md-10 col-sm-12">
				<div class="blog-single-post-thumb">
					<div class="blog-post-title">
						<span>동네질문</span>
						<h2>은평구에서 수선 잘하는 곳 아시는 분 있나요?</h2>
					</div>
					<div class="blog-post-format">
						<span><a href="#"><img src="/resources/images/ccoli.png" class="img-responsive img-circle"> Jen Lopez</a></span> 
						<span>서울시 은평구 신사동</span> 
						<span><i class="fa fa-date"></i> Jan 30, 2016</span>
					</div>
				</div>
				<div class="listButton">
					<input type="button" class="form-control" id="listButton" value="목록보기" onclick="location.href='/myPlace'">
				</div>

				<div class="blog-author">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
						eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				</div>

				<div class="">
					<h3>2 Comments</h3>
					<div class="media">
						<div class="media-object pull-left">
							<img src="/images/heart.png" class="img-responsive img-circle" alt="Blog Image">
						</div>
						<div class="media-body">
							<span>Omar Larus</span> <span>7 months ago</span>
							<p>Lorem ipsum dolor sit amet, maecenas eget vestibulum justo
								imperdiet, wisi risus purus augue vulputate voluptate neque,
								curabitur.</p>
						</div>
					</div>
					<div class="media">
						<div class="media-object pull-left">
							<img src="/images/heart.png" class="img-responsive img-circle" alt="Blog Image">
						</div>
						<div class="media-body">
							<span>Omar Larus</span> <span>7 months ago</span>
							<p>Lorem ipsum dolor sit amet, maecenas eget vestibulum justo
								imperdiet, wisi risus purus augue vulputate voluptate neque,
								curabitur.</p>
						</div>
					</div>
				</div>
				<div class="blog-comment-form">

					<h3>댓글 쓰기</h3>
					<form action="#" method="post">
						<textarea class="form-control" placeholder="댓글을 입력하세요." rows="5" name"Your Comments" required></textarea>
						<div>
							<input type="button" class="form-control" id="replyButton" value="댓글입력">
						</div>
					</form>

				</div>

			</div>
		</div>

	</div>
</section>

<%@ include file="../includes/footer.jsp"%>