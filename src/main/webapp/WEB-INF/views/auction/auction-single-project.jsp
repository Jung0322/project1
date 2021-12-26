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
						<nav class="woocommerce-breadcrumb" itemprop="breadcrumb"><a href="#">Home</a> / <a href="#">Clothing</a> / Beige Jacket</nav>
						<div itemscope itemtype="http://schema.org/Product" class="product">
							<div class="images ">
								<div class="mySlides fade2">

								<img class="main_slideImg" src="/resources/images/portfolio-img1.jpg">
								
								
								</div>
								
								<div class="mySlides fade2">
								
								<img class="main_slideImg" src="/resources/images/portfolio-img2.jpg">
								
								
								</div>
								
								<div class="mySlides fade2">
								
								<img class="main_slideImg" src="/resources/images/portfolio-img3.jpg">
								
								
								</div>
								
								<a class="prev" onclick="plusSlides(-1)">❮</a>
								
								<a class="next"onclick="plusSlides(1)">❯</a>
							</div>
							<div class="summary entry-summary">
								<h1 itemprop="name" class="product_title entry-title">Beige Jacket</h1>
									<div itemprop="reviewCount">
										<p>지역명 (인천광역시 서구)</p>
									</div>
									<div class="product_meta">
									<span class="posted_in">Categories: 
									<a href="#" rel="tag">Clothing</a>, 
									<a href="#" rel="tag">Hoodies</a>
									</span>
								</div>
							<div id="auctionDetail">
								<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">					
									<p class="price">
										<span class="priceText">시작가격 : </span>
										<span class="amount">$35.00</span>
									</p>
									<meta itemprop="price" content="35"/>
									<meta itemprop="priceCurrency" content="USD"/>
									<link itemprop="availability" href="http://schema.org/InStock"/>
								</div>
									<p id="time"> 시작시간 : </p>
									<p id="time"> 마감시간 : </p>
							</div>
							</div>
							<!-- .summary -->
							<div class="woocommerce-tabs wc-tabs-wrapper">
								<div>
								<span class="imagedot" onclick="currentSlide(1)"></span> 
								
								<span class="imagedot" onclick="currentSlide(2)"></span>
								
								<span class="imagedot" onclick="currentSlide(3)"></span>
								
								</div>
									<div class="panel entry-content wc-tab" id="tab-description">
									<h2>Product Description</h2>
									<p>
										Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.
									</p>
								</div>
								<div class="panel entry-content wc-tab" id="tab-reviews">
									<div id="reviews">
										<div id="comments">
											<h2>2 Reviews for Beige Jacket</h2>
											<ol class="commentlist">
												<li itemprop="review" itemscope itemtype="http://schema.org/Review" class="comment">
												<div id="comment-3" class="comment_container">
													<img alt='' src='http://0.gravatar.com/avatar/c7cab278a651f438795c2a9ebf02b5ae?s=60&#038;d=mm&#038;r=g' srcset='http://0.gravatar.com/avatar/c7cab278a651f438795c2a9ebf02b5ae?s=120&amp;d=mm&amp;r=g 2x' class='avatar avatar-60 photo' height='60' width='60'/>
													<div class="comment-text">	
														<p class="meta">
															<strong itemprop="author">Steve</strong> &ndash; <time itemprop="datePublished" datetime="2013-06-07T15:54:25+00:00">June 7, 2013</time>:
														</p>
														<div itemprop="description" class="description">
															<p>
																I like the logo but not the color.
															</p>
														</div>
													</div>
												</div>
												</li>
												<!-- #comment-## -->
												<li itemprop="review" itemscope itemtype="http://schema.org/Review" class="comment">
												<div id="comment-4" class="comment_container">
													<img alt='' src='http://2.gravatar.com/avatar/59c82b1d2c60537f900fb191b3cb611b?s=60&#038;d=mm&#038;r=g' srcset='http://2.gravatar.com/avatar/59c82b1d2c60537f900fb191b3cb611b?s=120&amp;d=mm&amp;r=g 2x' class='avatar avatar-60 photo' height='60' width='60'/>
													<div class="comment-text">													
														<p class="meta">
															<strong itemprop="author">Maria</strong> &ndash; <time itemprop="datePublished" datetime="2013-06-07T15:54:25+00:00">June 7, 2013</time>:
														</p>
														<div itemprop="description" class="description">
															<p>
																Three letters, one word: WOO!
															</p>
														</div>
													</div>
												</div>
												</li>
												<!-- #comment-## -->
											</ol>
										</div>
										<div id="review_form_wrapper">
											<div id="review_form">
												<div id="respond" class="comment-respond">
													<h3 style="margin-bottom:10px;" id="reply-title" class="comment-reply-title">Add a review <small><a rel="nofollow" id="cancel-comment-reply-link" href="/demo-moschino/product/woo-logo-2/#respond" style="display:none;">Cancel reply</a></small></h3>
													<form action="#" method="post" id="commentform" class="comment-form" novalidate>
														<p class="comment-form-comment">
															<label for="comment">Your Price</label><textarea id="comment" name="comment" cols="45" rows="8" aria-required="true"></textarea>
														</p>
														<p class="form-submit">
															<input name="submit" type="submit" id="submit" class="submit" value="Submit"/><input type='hidden' name='comment_post_ID' value='60' id='comment_post_ID'/>															
														</p>
													</form>
												</div>
												<!-- #respond -->
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

<!-- #page -->
<script src='/resources/js/slide.js'></script>
<script src='/resources/js/shopjs.js'></script>
<script src='/resources/js/plugins.js'></script>
<script src='/resources/js/scripts.js'></script>
<script src='/resources/js/masonry.pkgd.min.js'></script>
  <%@ include file="../includes/footer.jsp" %>