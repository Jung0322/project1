<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!-- csrf 토큰 -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta name="_csrf" content="${_csrf.token}" />

<title>Magnet - Minimal Portfolio Template</title>

<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/custom.js"></script>

<!-- jquery cdn -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->
<!-- ajax cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- fontawesome -->
<!-- <link rel="stylesheet" href="/resources/css/font-awesome.min.css" /> -->
<script src="https://kit.fontawesome.com/84524c7dde.js" crossorigin="anonymous"></script>

<!-- 공통css -->
<link rel="stylesheet" href="/resources/css/style.css" />

<!-- 폰트(글자 종류) api -->
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet" />

<style>
.profile-menu {
	border-radius: 100%;
	height: 100%;
	width: 100%;
}
.dropdown-menu-area {
	width: 250px;
}
.dropdown-item-area {
	display: block;
}
</style>

</head>
<body>
	<!-- PRE LOADER -->

	<div class="preloader">
		<div class="sk-spinner sk-spinner-wordpress">
			<span class="sk-inner-circle"></span>
		</div>
	</div>

	<!-- Navigation section  -->

	<div class="navbar navbar-default navbar-static-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-toggle="collapse" 
					data-target=".navbar-collapse">
					<span class="icon icon-bar"></span> <span class="icon icon-bar"></span>
					<span class="icon icon-bar"></span>
				</button>
				<a href="/product/index" class="navbar-brand"> <i class="fa fa-magnet"></i>
				</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="pdt" href="/product/index">상품</a></li>
					<li><a href="/board/myPlace">내동네</a></li>
					<li><a href="/auction/auction">경매</a></li>
					
					<!-- 로그인 안된 상태 -->					
					<sec:authorize access="isAnonymous()">
						<li><a href="/member/signIn">로그인</a></li>
					</sec:authorize>
					<!-- 로그인 된 상태 -->
					<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="info" />
						<li style="margin-left: 13px; margin-top: 5px;">
							<div class="dropdown" style="height: 40px; width: 40px; margin:auto;">
								<img class="dropdown-toggle profile-menu" data-toggle="dropdown" aria-expanded="false" src="/resources/images/temp-profile.png"/>
								
								<div class="dropdown-menu dropdown-menu-area" aria-labelledby="dropdownMenuLink">
									<div class="dropdown-item dropdown-item-area">
									    <a href="/member/profile-page?userid=${info.username}">프로필</a>
									</div>
									<div class="dropdown-item dropdown-item-area">
										<a href="/product-registration">상품 등록</a>
									</div>
									<div class="dropdown-item dropdown-item-area">
										<a href="/view_chat">메신저</a>
									</div>
									<div class="dropdown-item dropdown-item-area">
										<a href="/my-basket">찜목록</a>
									</div>
									<div class="dropdown-item dropdown-item-area">
										<a href="/product/sellproduct">판매목록</a>
									</div>
									<div class="dropdown-item dropdown-item-area">
										<form action="/member/logout" method="post">
											<button type="submit">로그아웃</button>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										</form>
									</div>
								</div>
							</div>
						</li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</div>