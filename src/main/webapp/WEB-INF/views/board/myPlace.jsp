<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPlace.css" />
<%@ include file="../includes/header.jsp" %>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div class="container">
	<table class="table">
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">카테고리</th>
				<th scope="col">지역</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성시간</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td><a href="/read">Otto</a></td>
				<td>@mdo</td>
				<td>@mdo</td>
				<td>@mdo</td>
			</tr>
				<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td><a href="/read">Otto</a></td>
				<td>@mdo</td>
				<td>@mdo</td>
				<td>@mdo</td>
			</tr>
				<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td><a href="/read">Otto</a></td>
				<td>@mdo</td>
				<td>@mdo</td>
				<td>@mdo</td>
			</tr>	
		</tbody>
	</table>
	<button type="button" class="write" >글작성</button>

</div>
  
<!-- pagination -->
	<nav class="woocommerce-pagination">
		<ul class="page-numbers">
			<li><span class="page-numbers current">1</span></li>
			<li><a class="page-numbers" href="#">2</a></li>
			<li><a class="next page-numbers" href="#">→</a></li>
		</ul>
	</nav>
</body>
<%@ include file="../includes/footer.jsp" %>
