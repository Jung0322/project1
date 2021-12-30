<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>Magnet - Minimal Portfolio Template</title>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />

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
				<a href="/index" class="navbar-brand"> <i class="fa fa-magnet"></i>
				</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="/index">상품</a></li>
					<li><a href="/board/myPlace">내동네</a></li>
					<li><a href="/auction">경매</a></li>
					
					<!-- 로그인 안된 상태 -->					
					<sec:authorize access="isAnonymous()">
						<li><a href="/member/signIn">로그인</a></li>
					</sec:authorize>
					<!-- 로그인 된 상태 -->
					<sec:authorize access="isAuthenticated()">
						<li style="margin-left: 15px; margin-top: 5px;">
							<div class="dropdown" style="height: 40px; width: 40px; margin:auto;">
								<img class="dropdown-toggle profile-menu" data-toggle="dropdown" aria-expanded="false" src="/resources/images/temp-profile.png"/>
								
								
								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink" style="width: ">
								    <a class="dropdown-item" href="#">Action</a>
								    <a class="dropdown-item" href="#">Another action</a>
								    <a class="dropdown-item" href="#">Something else here</a>
								  </div>
							</div>
						</li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</div>