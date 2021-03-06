<!-- Footer Section -->

<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-3">
				<i class="fa fa-magnet"></i>
			</div>

			<div class="col-md-4 col-sm-4">
				<p>124 Market Street, Suite 3570 San Francisco, CA 3042 United
					States</p>
			</div>

			<div class="col-md-offset-1 col-md-4 col-sm-offset-1 col-sm-3">
				<p>
					<a href="mailto:youremail@gmail.com">hello@yourstudio.co</a>
				</p>
				<p>(+01) 2048937 / 02 203403</p>
			</div>

			<div class="clearfix col-md-12 col-sm-12">
				<hr />
			</div>

			<div class="col-md-6 col-sm-6">
				<div class="footer-copyright">
					<p>© 2016 Magnet Studio | All Rights Reserved.</p>
				</div>
			</div>

			<div class="col-md-6 col-sm-6">
				<ul class="social-icon">
					<li><a href="#" class="fa fa-facebook"></a></li>
					<li><a href="#" class="fa fa-twitter"></a></li>
					<li><a href="#" class="fa fa-linkedin"></a></li>
				</ul>
			</div>
		</div>
	</div>
</footer>

<script>

	let filePath = encodeURIComponent('${profileImg.profileUploadPath}'+"\\"+'${profileImg.pfuuid}'+"_"+'${profileImg.profileImgName}');
	console.log(filePath.length);
	if(filePath.length > 4) {
		$(".profile-img").attr("src","/member/profileDisplay?fileName="+filePath);
	}


	let userid = null;
    <sec:authorize access="isAuthenticated()">
    	 $(".pdt").attr("href","/product/Secindex");
    	 userid = '${info.username}';
    </sec:authorize>
</script>

<!-- SCRIPTS -->
<!-- <script src="/resources/js/jquery.js"></script>
    <script src="/resources/js/custom.js"></script> -->
</body>
</html>
