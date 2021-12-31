<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel='stylesheet' href='/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/woocommerce.css' type='text/css' media='all'/>
	<%@ include file="../includes/header.jsp" %>
	
	
<!-- Contact Section -->

<section id="contact">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <div class="section-title">
                         <h3>상품 등록</h3>
                         <h2>중고 경매거래 상품 등록</h2>
                    </div>

                    <form action="/auction/auction-product-registration" method="post" role="form" formvalidate>
                         <div class="col-md-6 col-sm-6">
                              <input type="text" class="form-control" placeholder="제목" name="title" required="required"/>
                         </div>
                         <div class="col-md-6 col-sm-6">
                              <select class="form-control" name="category">
                                   <option value="">카테고리</option>
                                   <option value="디지털기기">디지털기기</option>
                                   <option value="생활가전">생활가전</option>
                                   <option value="가구/인테리어">가구/인테리어</option>
                                   <option value="스포츠/레저">스포츠/레저</option>
                                   <option value="여성잡화/의류">여성잡화/의류</option>
                                   <option value="남성잡화/의류">남성잡화/의류</option>
                                   
                              </select>
                         </div>
                         <div class="col-md-4 col-sm-4">
                              <input type="datetime-local" class="form-control" placeholder="시작시간" name="startdate"  value="2021-12-11T06:00">
                         </div>
                         <div class="col-md-4 col-sm-4">
                              <input type="datetime-local" class="form-control" placeholder="마감시간" name="enddate" value="2021-12-11T13:00" maxlength="">
                         </div>
                         <div class="col-md-4 col-sm-4">
                              <input type="number" class="form-control" placeholder="시작가격" name="startprice">
                         </div>
                         <div class="col-md-12 col-sm-12"> 
                              <textarea class="form-control" rows="5" placeholder="상품 상세정보를 입력해주세요." name="content" required="required"></textarea>
                         </div>
                         <div class="row">
							<div class="col-md-12 col-sm-12">
								<div class="panel panel-default">
									<div class="panel-heading"><i class="fa fa-files-o"></i>상품 사진</div>
										<div class="panel-body">
											<div class="form-group uploadDiv">
												<input type="file" name="uploadFile" id="" multiple/>
											</div>
										<div class="uploadResult">
											<ul></ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                         <div class="col-md-8">
                         
                              <button  id="registration" type="submit" class="form-control">등록</button>
                         </div>
                    </form>
               </div>

          </div>
     </div>
</section>	
	
	
	
<script>
	//ajax 동작시 헤더 값에 포함해서 보낼 csrf 토큰 값 설정
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue= "${_csrf.token}";
</script>	
	
	
	
<!-- #page -->
<script src='/resources/js/auction-product-registration.js'></script>
<script src='/resources/js/shopjs.js'></script>
<script src='/resources/js/plugins.js'></script>
<script src='/resources/js/scripts.js'></script>
<script src='/resources/js/masonry.pkgd.min.js'></script>
    <%@ include file="../includes/footer.jsp" %>
	