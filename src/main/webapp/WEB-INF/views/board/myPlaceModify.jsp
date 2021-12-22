<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPlace.css" />
<script src="resources/ckeditor/ckeditor.js"></script>
<%@ include file="../includes/header.jsp" %>
<body>
<div class="container">
	<form action="" method="post">
		<div class="writeBoard">
			<label for="userid">글 작성자</label>
			<input type="text" class="form-control">
		</div>
		<div class="writeBoard" >
			<label>카테고리</label>
			<select name="ctg" class="form-control">
				<option value="">동네질문
				<option value="">동네소식
				<option value="">일상
				<option value="">기타
			</select>	
		</div>
		<div class="writeBoard">
			<label>제목</label>
			<input type="text" class="form-control" placeholder="제목을 입력하세요">
		</div>
		<textarea id="editor4" name="editor4" rows="40"></textarea>
			<script>
				CKEDITOR.replace('editor4',{
					uploadUrl:"/image/drag",
					filebrowserUploadUrl:""
				});
			</script>
			<button type="button" class="write">글 작성</button>
	</form>
</div>
</body>
                				

<%@ include file="../includes/footer.jsp" %>