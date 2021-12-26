<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

                    <form action="#" method="post">
                         <div class="col-md-6 col-sm-6">
                              <input type="text" class="form-control" placeholder="제목">
                         </div>
                         <div class="col-md-6 col-sm-6">
                              <select class="form-control">
                                   <option>카테고리</option>
                                   <option>디지털기기</option>
                                   <option>생활가전</option>
                                   <option>가구/인테리어</option>
                                   <option>스포츠/레저</option>
                                   <option>여성잡화/의류</option>
                                   <option>남성잡화/의류</option>
                                   
                              </select>
                         </div>
                         <div class="col-md-4 col-sm-4">
                              <input type="datetime-local" class="form-control" placeholder="시작시간">
                         </div>
                         <div class="col-md-4 col-sm-4">
                              <input type="datetime-local" class="form-control" placeholder="마감시간">
                         </div>
                         <div class="col-md-4 col-sm-4">
                              <input type="number" class="form-control" placeholder="시작가격">
                         </div>
                         <div class="col-md-12 col-sm-12"> 
                              <textarea class="form-control" rows="5" placeholder="상품 상세정보를 입력해주세요."></textarea>
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
                         <div class="col-md-8">
                              <input id="registration" type="submit" class="form-control" value="등록">
                         </div>
                    </form>
               </div>

          </div>
     </div>
</section>	
	
	
	
	
	
	
	
<!-- #page -->
<script src='/resources/js/shopjs.js'></script>
<script src='/resources/js/plugins.js'></script>
<script src='/resources/js/scripts.js'></script>
<script src='/resources/js/masonry.pkgd.min.js'></script>
    <%@ include file="../includes/footer.jsp" %>
	