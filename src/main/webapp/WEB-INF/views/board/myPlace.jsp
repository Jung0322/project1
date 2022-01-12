<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>  

 <link rel="stylesheet" href="/resources/css/myPlace.css" />
<link rel='stylesheet' href='/resources/css/woocommerce-layout.css'
	type='text/css' media='all' />
<link rel='stylesheet' href='/resources/css/woocommerce.css'
	type='text/css' media='all' />

<!-- Blog Section -->
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
	<section id="blog">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1 col-md-10 col-sm-12">
				<!-- 로그인 후 보여질 버튼 -->
				<sec:authorize access="isAuthenticated()">
					<div class="writeButton">
						<input type="submit" class="form-control" id="writeButton" value="글 작성" onclick="location.href='/board/write'">
					</div>
				</sec:authorize>
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
			<c:if test="${pageDto.prev}">
				<li class="paginate_button">
					<a class="next page-numbers" href="${pageDto.startPage-1}">←</a>
				</li>
			</c:if>
			<c:forEach var="idx" begin="${pageDto.startPage}" end="${pageDto.endPage}">
				<li class="paginate_button">
					<span class="page-numbers current">
						<a href="${idx}">${idx}</a>
					</span>
				</li>
			</c:forEach>
			<c:if test="${pageDto.next}">
				<li class="paginate_button">
					<a class="next page-numbers" href="${pageDto.endPage+1}">→</a>
				</li>
			</c:if>
		</ul>
	</nav>

<form action="" method="get" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageDto.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageDto.cri.amount}" />
	<input type="hidden" name="mno" value=""/>
</form>

<script src="/resources/js/board/list.js"></script>
<%@ include file="../includes/footer.jsp"%>