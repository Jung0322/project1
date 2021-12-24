<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel='stylesheet' href='/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/woocommerce.css' type='text/css' media='all'/>
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
						<nav class="woocommerce-breadcrumb" itemprop="breadcrumb"><a href="#">Home</a> / <a href="#">Clothing</a> / Beige Jacket</nav>
						<div itemscope itemtype="http://schema.org/Product" class="product">
							<div class="images">
								<a href="" itemprop="image" class="woocommerce-main-image zoom" title="" data-rel="prettyPhoto">								
								<img src="/resources/images/portfolio-img1.jpg" alt=""></img></a>
							</div>
							<div class="summary entry-summary">
								<h1 itemprop="name" class="product_title entry-title">Beige Jacket</h1>
									<div itemprop="reviewCount">
										<p>지역명 (인천광역시 서구)</p>
									</div>
								<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
									<p class="price">
										<span class="amount">$35.00</span>
									</p>
									<meta itemprop="price" content="35"/>
									<meta itemprop="priceCurrency" content="USD"/>
									<link itemprop="availability" href="http://schema.org/InStock"/>
								</div>
								<div id="description">
									<p>	내고여부 : </p>
									<p>	택배가능여부 : </p>
									<p>	예약여부 : </p>
								</div>
								<form class="cart" method="post" enctype='multipart/form-data'>							
									<button type="submit" class="single_add_to_cart_button button alt">채팅 하기</button>
								</form>
								<div class="product_meta">
									<span class="posted_in">Categories: 
									<a href="#" rel="tag">Clothing</a>, 
									<a href="#" rel="tag">Hoodies</a>
									</span>
								</div>
							</div>
							<!-- .summary -->
							<div class="woocommerce-tabs wc-tabs-wrapper">
									<div class="panel entry-content wc-tab" id="tab-description">
									<h2>Product Description</h2>
									<p>
										Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.
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
									<a href="#" class="button">Add to cart</a>
									</li>
									
									<li class="product">
									<a href="shop-single.html">								
									<img src="/resources/images/portfolio-img1.jpg" alt=""></img>
									<h3>Male Jeans</h3>
									<span class="price"><span class="amount">$35.00</span></span>
									</a>
									<a href="#" class="button">Add to cart</a>
									</li>
									
									<li class="product">
									<a href="shop-single.html">								
									<img src="/resources/images/portfolio-img1.jpg" alt=""></img>
									<h3>Slim Jeans</h3>
									<span class="price"><span class="amount">$20.00</span></span>
									</a>
									<a href="#" class="button">Add to cart</a>
									</li>
									
									
									<li class="product last">
									<a href="shop-single.html">									
									<img src="/resources/images/portfolio-img1.jpg" alt=""></img>
									<h3>Summer Blouse</h3>
									<span class="price"><span class="amount">$35.00</span></span>
									</a>
									<a href="#" class="button">Add to cart</a>
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

<!-- #page -->
<script src='/resources/js/shopjs.js'></script>
<script src='/resources/js/plugins.js'></script>
<script src='/resources/js/scripts.js'></script>
<script src='/resources/js/masonry.pkgd.min.js'></script>
  <%@ include file="../includes/footer.jsp" %>