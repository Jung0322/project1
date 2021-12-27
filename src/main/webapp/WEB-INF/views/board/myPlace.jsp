<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPlace.css" />
<link rel='stylesheet' href='/resources/css/woocommerce-layout.css'
	type='text/css' media='all' />
<link rel='stylesheet' href='/resources/css/woocommerce.css'
	type='text/css' media='all' />
<script src="https://kit.fontawesome.com/84524c7dde.js"
	crossorigin="anonymous"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file="../includes/header.jsp"%>

<!-- Blog Section -->
<body
	class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
	<section id="blog">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1 col-md-10 col-sm-12">
					<div class="writeButton">
						<input type="submit" class="form-control" id="writeButton" value="글 작성" onclick="location.href='/board/write'">
					</div>
					<c:forEach var="dto" items="${list}">
					<div class="blog-post">
						<div class="blog-post-title">
							<span>${dto.mcategory}</span>
							<h3>
								<a href="${dto.mno}" class="move">${dto.title}</a>
							</h3>
						</div>
						<div class="blog-post-format">
							<span>
								<a href="/member/profile-page">
									<img src="/resources/images/ccoli.png" class="img-responsive img-circle"> ${dto.userid}
								</a>
							</span> 
							<span>서울시 종로구 관철동</span> 
							<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.regdate}"/></span>
						</div>
						<div class="blog-post-des">
							<p>${dto.content}</p>
						</div>
						<div class="blog-post-format" id="ques">
							<span><i class="far fa-grin"></i> 궁금해요</span>
						</div>
					</div>
					</c:forEach>
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

<form action="" id="actionForm">
	<input type="hidden" name="mno" value=""/>
</form>

<script src="/resources/js/myPlace.js"></script> 
<%@ include file="../includes/footer.jsp"%>