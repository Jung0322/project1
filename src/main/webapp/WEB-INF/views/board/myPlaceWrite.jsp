<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPlace.css" />
<script src="resources/ckeditor/ckeditor.js"></script>
<%@ include file="../includes/header.jsp" %>

<!-- Contact Section -->

<body>
<section id="contact">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <form action="#" method="post">
                         <div class="col-md-6 col-sm-6">
                              <select class="form-control">
                                   <option>동네질문</option>
                                   <option>일상</option>
                                   <option>궁금해요</option>
                                   <option>기타</option>
                              </select>
                         </div>
                         <div class="col-md-6 col-sm-6">
                              <input type="text" class="form-control" placeholder="글 작성자" readonly="readonly">
                         </div>
                         <div class="col-md-12 col-sm-6"">
                              <input type="email" class="form-control" placeholder="글 제목">
                         </div>
						 <div>
						 
						 </div>
                         <div class="col-md-12 col-sm-6"> 
                         	<textarea id="editor4" name="editor4" rows="40"></textarea>
								<script>
									CKEDITOR.replace('editor4',{
									uploadUrl:"/image/drag",
									filebrowserUploadUrl:""
									});
								</script>
                         </div>
                         <div>
                              <input type="submit" class="form-control"  id="successButton" value="글 올리기">
                         </div>
                    </form>
               </div>

          </div>
     </div>
</section>

<%@ include file="../includes/footer.jsp" %>