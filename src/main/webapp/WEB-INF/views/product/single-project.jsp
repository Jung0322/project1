<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel='stylesheet' href='/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/slide.css'/>
<%@ include file="../includes/header.jsp" %>

<script>
	var pathArr = [];
</script>
<body class="single single-product woocommerce woocommerce-page">
		<!-- #masthead -->
	 <div class="container" id="shopDetail">
       <div class="row">	
		<div  class="col-md-offset-1 col-md-10 col-sm-12">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main" role="main">
				<div id="container">
					<div id="content" role="main">
						<nav class="woocommerce-breadcrumb" itemprop="breadcrumb"><a href="#">Home</a> / <a href="#">${row.category}</a> / ${row.title}</nav>
						<div itemscope itemtype="http://schema.org/Product" class="product">
							<div class="images ">
								<!-- 이미지 들어갈 곳 -->
							</div>
							<span>
								<a href="/member/profile-page?userid=${row.userid}" style="font-size: 25px; " >
									<img src="/resources/images/temp-profile.png" class="img-responsive img-circle profile" style="display: inline-block; width: 32px; margin-right: 4px;"> 
									${nickname} 님의 상품
								</a>
							</span> 
							<div class="summary entry-summary">
								<h2 itemprop="name" class="product_title entry-title">${row.title}</h2>
							
									<div>
										<p id="local">${row.mytown}</p>
											<sec:authorize access="isAuthenticated()">
												<button class="heart"><img id="asd" src="" alt=""></button>
											</sec:authorize>
									</div>
								<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
									<p class="price">
										<span class="amount">${row.price} won</span>
									</p>
									<meta itemprop="price" content="35"/>
									<meta itemprop="priceCurrency" content="USD"/>
									<link itemprop="availability" href="http://schema.org/InStock"/>
								</div>
								<div id="description">
									<p class = "discount"></p>
									<p class = "delivery"></p>
									<p class = "reservation"></p>
								</div>
								<form class="cart" method="post" enctype='multipart/form-data'>	
								<sec:authorize access="isAuthenticated()">						
									<button type="submit" class="single_add_to_cart_button button alt">채팅 하기</button>
								</sec:authorize>
								</form>
								<div class="product_meta">
									<span class="posted_in">Categories: ${row.category}</span>
								</div>
							</div>

							<!-- .summary -->
							<div class="woocommerce-tabs wc-tabs-wrapper">
								<div class="imgslide">
								
								</div>
									<div class="panel entry-content wc-tab" id="tab-description">

									<h2>Product Description</h2>
									<p>
										${row.content}
									</p>
									</div>
							</div>
						</div>
							<div class="clear">
								</div>
									</div>
								</div>
							</div>
							<div class="related products">
								<h2>${nickname}님의 판매상품</h2>
								<ul class="products">
								<c:forEach var="dto" items="${list}">
									<li class="product">
									<a href="${dto.pno}" class="move">
									<c:if test="${dto.reservation == 1}">
										<span class="onsale">예약</span>				
									</c:if>	
									<script>
									uploadPath = '${dto.attachList[0].puploadPath}';
									fileName = '${dto.attachList[0].pimgname}';
									uuid = '${dto.attachList[0].puuid}';
									
									originPath = uploadPath+"\\"+uuid+"_"+fileName;	
									
									pathArr.push(originPath);
									</script>
									<img src="" alt="" class="pimg"> 					
									<h3>${dto.title}</h3>
									<span class="price"><span class="amount">${dto.price}원</span></span>
									</a><span>❤ : ${dto.good}</span>											
									</li>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
	</div>
	<!-- .container -->
</div>

<form action="" method="get" id="actionForm">
	<input type="hidden" name="pageNum" value='1'/>
	<input type="hidden" name="amount" value='8'/>
	<input type="hidden" name="type" value=""/>
	<input type="hidden" name="cate" value="전체"/>
	<input type="hidden" name="pno" value=""/>
	
	</form>

<script>

let csrfHeaderName = "${_csrf.headerName}";
let csrfTokenValue= "${_csrf.token}";

let pno = ${row.pno};
let discount1 = ${row.discount};
let reservation1 = ${row.reservation};
let delivery1 =  ${row.delivery};

let pimg = $(".pimg");

$(pimg).each(function(i,item){
	$(this).attr("src","/display?fileName="+encodeURIComponent(pathArr[i]));
})

let userid = null;

<sec:authorize access="isAuthenticated()">
	 userid = '${info.username}';
</sec:authorize>

console.log(userid);

</script>

<!-- #page -->
<script src='/resources/js/product/single-product.js'></script>
<script src='/resources/js/slide.js'></script>
<script src='/resources/js/product/shopjs.js'></script>
<script src='/resources/js/plugins.js'></script>
<script src='/resources/js/scripts.js'></script>
<script src='/resources/js/masonry.pkgd.min.js'></script>
  <%@ include file="../includes/footer.jsp" %>