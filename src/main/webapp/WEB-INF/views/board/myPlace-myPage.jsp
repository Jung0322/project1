<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPlace.css" />
<link rel='stylesheet' href='/resources/css/woocommerce-layout.css'
	type='text/css' media='all' />
<link rel='stylesheet' href='/resources/css/woocommerce.css'
	type='text/css' media='all' />
<script src="https://kit.fontawesome.com/84524c7dde.js"
	crossorigin="anonymous"></script>
<%@ include file="../includes/header.jsp"%>

<!-- Blog Section -->
<body
	class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
	<section id="blog">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1 col-md-10 col-sm-12">
					<div class="writeButton">
						<input type="submit" class="form-control" id="writeButton" value="글 작성" onclick="location.href='/write'">
					</div>
					<div class="blog-post-thumb">
						<div class="blog-post-title">
							<span>동네질문</span>
							<h3>
								<a href="/read">We Help You Create Perfect Modern Design</a>
							</h3>
						</div>
						<div class="blog-post-format">
							<span>
								<a href="#">
									<img src="/resources/images/ccoli.png" class="img-responsive img-circle"> Jen Lopez
								</a>
							</span> 
							<span>서울시 종로구 관철동</span> 
							<span> Jan 30, 2016</span>
						</div>
						<div class="blog-post-des">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
								aute irure dolor in reprehenderit in voluptate velit esse cillum
								dolore eu fugiat nulla pariatur.</p>
						</div>
						<div class="blog-post-format" id="ques">
							<span><i class="far fa-grin"></i> 궁금해요</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- pagination -->
	<nav class="woocommerce-pagination">
		<ul class="page-numbers">
			<li><span class="page-numbers current">1</span></li>
			<li><a class="page-numbers" href="#">2</a></li>
			<li><a class="next page-numbers" href="#">→</a></li>
		</ul>
	</nav>


	<%@ include file="../includes/footer.jsp"%>