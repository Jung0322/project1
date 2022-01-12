<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel='stylesheet' href='/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/slide.css'/>
<%@ include file="../includes/header.jsp" %>
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
								
								<a class="prev" onclick="plusSlides(-1)">❮</a>								
								<a class="next"onclick="plusSlides(1)">❯</a>
							</div>
							<div class="summary entry-summary">
								<h2 itemprop="name" class="product_title entry-title">${row.title}</h2>
									<div>
										<p id="local">${row.mytown}</p>
											<sec:authorize access="isAuthenticated()">
												<button class="heart"><img id="asd" src="c" alt=""></button>
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
										"${row.content}"
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
								<h2>Related Products</h2>
								<ul class="products">
									<li class="first product">
									<a href="shop-single.html">
									<span class="onsale">예약</span>									
									<img src="/resources/images/portfolio-img1.jpg" alt=""></img>
									<h3>Beige Fedora</h3>
									<span class="price"><del><span class="amount">$35.00</span></del><ins><span class="amount">&#36;14.00</span></ins></span>
									</a>
									</li>
									
									<li class="product">
									<a href="shop-single.html">								
									<img src="/resources/images/portfolio-img1.jpg" alt=""></img>
									<h3>Male Jeans</h3>
									<span class="price"><span class="amount">$35.00</span></span>
									</a>
									</li>
									
									<li class="product">
									<a href="shop-single.html">								
									<img src="/resources/images/portfolio-img1.jpg" alt=""></img>
									<h3>Slim Jeans</h3>
									<span class="price"><span class="amount">$20.00</span></span>
									</a>
									</li>
									
									
									<li class="product last">
									<a href="shop-single.html">									
									<img src="/resources/images/portfolio-img1.jpg" alt=""></img>
									<h3>Summer Blouse</h3>
									<span class="price"><span class="amount">$35.00</span></span>
									</a>
									</li>
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
<sec:authentication property="principal" var="info"/>

<script>

let csrfHeaderName = "${_csrf.headerName}";
let csrfTokenValue= "${_csrf.token}";

let pno = ${row.pno};
let discount1 = ${row.discount};
let reservation1 = ${row.reservation};
let delivery1 =  ${row.delivery};


let userid = null;

<sec:authorize access="isAuthenticated()">
	 userid = '${info.username}';
</sec:authorize>

console.log(userid);

</script>

<!-- #page -->
<script src='/resources/js/product/single-product.js'></script>
<script src='/resources/js/product/slide.js'></script>
<script src='/resources/js/shopjs.js'></script>
<script src='/resources/js/plugins.js'></script>
<script src='/resources/js/scripts.js'></script>
<script src='/resources/js/masonry.pkgd.min.js'></script>
  <%@ include file="../includes/footer.jsp" %>