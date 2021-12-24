<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel='stylesheet' href='/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/woocommerce.css' type='text/css' media='all'/>
	<%@ include file="../includes/header.jsp" %>

<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main" role="main">
				<p class="woocommerce-result-count">
					 Showing 1–8 of 12 results
				</p>
				<form class="woocommerce-ordering" method="get">
					<select name="orderby" class="orderby">
						<option value="menu_order" selected="selected">Default sorting</option>
						<option value="popularity">Sort by popularity</option>
						<option value="rating">Sort by average rating</option>
						<option value="date">Sort by newness</option>
						<option value="price">Sort by price: low to high</option>
						<option value="price-desc">Sort by price: high to low</option>
					</select>
				</form>
				<ul class="products">
				
				
					<li class="first product">
					<a href="auction-single-project">
					<span class="onsale">예약</span>
					<img src="/resources/images/portfolio-img1.jpg" alt="">
					<h3>Cool Fedora</h3>
					<span class="price"><span class="amount">시작가격: $34.00</span></span>
					</a>
					</li>

					<li class="product">
					<a href="auction-single-project">
					<img src="/resources/images/portfolio-img1.jpg" alt="">
					<h3>Beige Blouse</h3>
					<span class="price"><span class="amount">시작가격: $66.00</span></span>
					</a>
					</li>
					
					<li class="product">
					<a href="auction-single-project">
					<img src="/resources/images/portfolio-img1.jpg" alt="">
					<h3>Black Jacket</h3>
					<span class="price"><span class="amount">시작가격: $125.00</span></span>
					</a>
					</li>
					
					<li class="last product">
					<a href="auction-single-project">
					<img src="/resources/images/portfolio-img1.jpg" alt="">
					<h3>Brown Jacket</h3>
					<span class="price"><span class="amount">시작가격: $28.00</span></span>
					</a>
					</li>
					
					<li class="first product">
					<a href="auction-single-project">
					<img src="/resources/images/portfolio-img1.jpg" alt="">
					<h3>Gray Blouse</h3>
					<span class="price"><span class="amount">시작가격: $15.00</span></span>
					</a>
					</li>
					
					<li class="product">
					<a href="auction-single-project">
					<img src="/resources/images/portfolio-img1.jpg" alt="">
					<h3>Male Bag</h3>
					<span class="price"><span class="amount">시작가격: $16.00</span></span>
					</a>
					</li>
					
					<li class="product">
					<a href="auction-single-project">
					<img src="/resources/images/portfolio-img1.jpg" alt="">
					<h3>Hugo Jeans</h3>
					<span class="price"><span class="amount">시작가격: $36.00</span></span>
					</a>
					</li>
					
					<li class="last product">
					<a href="auction-single-project">
					<img src="/resources/images/portfolio-img1.jpg" alt="">
					<h3>Male T-Shirt</h3>
					<span class="price"><span class="amount">시작가격: $49.00</span></span>
					</a>
					</li>
					
				</ul>
				<nav class="woocommerce-pagination">
				<ul class="page-numbers">
					<li><span class="page-numbers current">1</span></li>
					<li><a class="page-numbers" href="#">2</a></li>
					<li><a class="next page-numbers" href="#">→</a></li>
				</ul>
				</nav>
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>


<!-- #page -->
<script src='/resources/js/shopjs.js'></script>
<script src='/resources/js/plugins.js'></script>
<script src='/resources/js/scripts.js'></script>
<script src='/resources/js/masonry.pkgd.min.js'></script>
    <%@ include file="../includes/footer.jsp" %>
