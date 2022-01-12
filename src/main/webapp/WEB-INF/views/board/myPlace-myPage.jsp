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
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
	<section id="blog">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1 col-md-10 col-sm-12">
					<c:forEach var="dto" items="${list}">
					<div class="blog-post">
						<div class="blog-post-title">
							<span>${dto.mcategory}</span>
							<h3 id="listTitle" style="margin-top: 10px;">
								<a href="${dto.mno}" class="move">${dto.title}
								<i class="far fa-comment-dots" style="margin-left: 5px; margin-right: 5px;"></i>${dto.replycnt}</a>
							</h3>
						</div>
						<div class="blog-post-format">
							<span>
								<a href="/member/profile-page?userid=${dto.userid}">
									<img src="/resources/images/temp-profile.png" class="img-responsive img-circle profile"> ${dto.nickname}
								</a>
							</span> 
							<span>${dto.mytown}</span> 
							<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.updatedate}"/></span>
						</div>
						<div class="blog-post-des">
							<p>${dto.content}</p>
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
	
<form action="" method="get" id="actionForm">
	<input type="hidden" name="mno" value=""/>
</form>

<script src="/resources/js/board/list.js"></script>
<%@ include file="../includes/footer.jsp"%>