<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel='stylesheet' href='/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/woocommerce.css' type='text/css' media='all'/>
	<%@ include file="../includes/header.jsp" %>
	
<script>
	var pathArr = [];
	var startD=[];
	var endD=[];
	
</script>

<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main" role="main">
				<p class="woocommerce-result-count">
					 Showing 1–8 of ${pageDto.total}
				</p>
				<form action="" class="woocommerce-ordering" method="get">
						<input type="hidden" name="pageNum" value="${pageDto.cri.pageNum}"/>
						<input type="hidden" name="amount" value="${pageDto.cri.amount}"/>
					
					<select name="cate" class="orderby">
						<option value="전체"<c:out value="${pageDto.cri.cate =='전체'?'selected':''}"/>>전체</option>
						<option value="디지털기기"<c:out value="${pageDto.cri.cate =='디지털기기'?'selected':''}"/>>디지털기기</option>
						<option value="생활가전"<c:out value="${pageDto.cri.cate =='생활가전'?'selected':''}"/>>생활가전</option>
						<option value="가구/인테리어"<c:out value="${pageDto.cri.cate =='가구/인테리어'?'selected':''}"/>>가구/인테리어</option>
						<option value="스포츠/레저"<c:out value="${pageDto.cri.cate =='스포츠/레저'?'selected':''}"/>>스포츠/레저</option>
						<option value="여성잡화/의류"<c:out value="${pageDto.cri.cate =='여성잡화/의류'?'selected':''}"/>>여성잡화/의류</option>
						<option value="남성잡화/의류"<c:out value="${pageDto.cri.cate=='남성잡화/의류'?'selected':''}"/>>남성잡화/의류</option>
					</select>
				</form>
				<ul class="products">
				
				<c:forEach var="dto" items="${list}">
					<li class="product">
					<a href="/auction-single-product">
					<span class="onsale">예약</span>
					<script>
					uploadPath = '${dto.attachList[0].auploadPath}';
					fileName = '${dto.attachList[0].aimgname}';
					uuid = '${dto.attachList[0].auuid}';
					
					originPath = uploadPath+"\\"+uuid+"_"+fileName;	
					
					pathArr.push(originPath);
					
					startD.push('${dto.startdate}'.replace('T',' '));
					endD.push('${dto.enddate}'.replace('T',' '));
					
					</script>
					
					<img src="" alt="" class="pimg">
					<h3>${dto.title}</h3>
					<span class="price"><span class="amount">시작가격: ${dto.startprice}</span></span>
					<span class="startdate"><span></span></span>
					<span class="enddate"><span></span></span>
				
					</a>
					</li>
					</c:forEach>

					
				</ul>
				<nav class="woocommerce-pagination">
				<ul class="pagination">
                            		<c:if test="${pageDto.prev}">
                            			<li class="paginate_button previous">
                            			<a class="pNum" href="${pageDto.startPage-10}">Previous</a></li>
                            		</c:if>
                            		<c:forEach var="idx" begin="${pageDto.startPage}" end="${pageDto.endPage}">
                            			<li class="paginate_button ${pageDto.cri.pageNum==idx?'active':''}">
                            				<a class="pNum" href="${idx}">${idx}</a>
                            			</li>
                            		</c:forEach>
                            		<c:if test="${pageDto.next}">
	                            		<li class="paginate_button next">
	                            		<a class="pNum" href="${pageDto.endPage+1}">Next</a></li>
                            		</c:if>
                            	</ul>
				</nav>
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
			<form action="" method="get" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageDto.cri.pageNum}"/>
	<input type="hidden" name="amount" value="${pageDto.cri.amount}"/>
	<input type="hidden" name="type" value="${pageDto.cri.type}"/>
	<input type="hidden" name="cate" value="${pageDto.cri.cate}"/>
	<input type="hidden" name="pno" value=""/>
	
	</form>
		</div>
		
<script>
console.log(pathArr);	


let pimg = $(".pimg");
let start = $(".startdate span");
let end = $(".enddate span");

$(start).each(function(i,item){
	$(this).text(startD[i]);
})

$(end).each(function(i,item){
	$(this).text(endD[i]);
})

$(pimg).each(function(i,item){
	$(this).attr("src","/Adisplay?fileName="+encodeURIComponent(pathArr[i]));
})


</script>	


<!-- #page -->
<script src='/resources/js/auction.js'></script>
<script src='/resources/js/shopjs.js'></script>
<script src='/resources/js/plugins.js'></script>
<script src='/resources/js/scripts.js'></script>
<script src='/resources/js/masonry.pkgd.min.js'></script>
    <%@ include file="../includes/footer.jsp" %>
