<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
<link rel="stylesheet" href="/resources/css/myPlace.css" />
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<%@ include file="../includes/header.jsp"%>

<!-- Contact Section -->

<body>
<section id="contact">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <form action="" method="post" role="form">
                         <div class="col-md-6 col-sm-6">
                              <select class="form-control" name="mcategory">
                                   <option>동네질문</option>
                                   <option>동네사건사고</option>
                                   <option>일상</option>
                                   <option>기타</option>
                              </select>
                         </div>
                         <div class="col-md-6 col-sm-6">
                              <input type="text" class="form-control" name="userid" placeholder="글 작성자" >
                         </div>
                         <div class="col-md-12 col-sm-6">
                              <input type="text" class="form-control" name="title" placeholder="글 제목" >
                         </div>
                   <div>
                   </div>
                    <div class="col-md-12 col-sm-6" id="textArea" > 
                    	<textarea id="summernote" name="content"></textarea>
                         <script>
                           $('#summernote').summernote({
                             height: 300,                 // 에디터 높이
                             minHeight: null,             // 최소 높이
                             maxHeight: null,             // 최대 높이
                             focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                             lang: "ko-KR",               // 한글 설정
                             placeholder: "내용을 작성해주세요",
                             toolbar: [
                                ['fontname', ['fontname']],
                                ['fontsize', ['fontsize']],
                                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                                ['color', ['forecolor','color']],
                                ['para', ['ul', 'ol', 'paragraph']],
                                ['height', ['height']],
                                ['insert',['picture','link']],
                                ['view', ['fullscreen', 'help']]
                             ]
                           });
                         </script>
                         </div>
                         <div>
                              <input type="button" class="form-control"  id="listButton2" onclick="location.href='/board/myPlace'" value="목록보기" style="border:1px solid #9BB460;">  
                              <input type="submit" class="form-control"  id="successButton" value="글 올리기">
                         </div>
                    </form>
               </div>

          </div>
     </div>
</section>
<script src="/resources/js/upload.js"></script>  
<%@ include file="../includes/footer.jsp"%>