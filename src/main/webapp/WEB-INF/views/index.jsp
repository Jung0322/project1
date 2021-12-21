<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1"
    />

    <title>Magnet - Minimal Portfolio Template</title>

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" />

    <!-- Main css -->
    <link rel="stylesheet" href="/resources/css/style.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700"
      rel="stylesheet"
    />
  </head>
  <body>
    <!-- PRE LOADER -->
	
    <div class="preloader">
      <div class="sk-spinner sk-spinner-wordpress">
        <span class="sk-inner-circle"></span>
      </div>
    </div>

    <!-- Navigation section  -->

    <div class="navbar navbar-default navbar-static-top" role="navigation">
      <div class="container">
     
        <div class="navbar-header">
          <button
            class="navbar-toggle"
            data-toggle="collapse"
            data-target=".navbar-collapse"
          >
            <span class="icon icon-bar"></span>
            <span class="icon icon-bar"></span>
            <span class="icon icon-bar"></span>
          </button>
          <a href="/index" class="navbar-brand"
            ><i class="fa fa-magnet"></i
          ></a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="/index">상품</a></li>
            <li><a href="/about">내동네</a></li>
            <li><a href="/blog">경매</a></li>
            <li><a href="/contact">로그인</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Home Section -->

    <section id="home">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-sm-12">
            <h2>
              The creative web & mobile studio. we are young designers and
              focused on brand identity, web development and social marketing.
            </h2>
            <hr />
          </div>
        </div>
      </div>
    </section>
=======
	<%@ include file="./includes/header.jsp" %>
>>>>>>> branch 'master' of https://github.com/Jung0322/project1.git

    <!-- Portfolio Section -->

    <section id="portfolio">
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-6">
            <a href="single-project.html">
              <div class="portfolio-thumb">
                <img
                  src="images/portfolio-img1.jpg"
                  class="img-responsive"
                  alt="Portfolio"
                />
                <div class="portfolio-overlay">
                  <div class="portfolio-item">
                    <h3>Project Name</h3>
                    <small>Brand Identity</small>
                  </div>
                </div>
              </div>
            </a>
          </div>

          <div class="col-md-4 col-sm-6">
            <a href="single-project.html">
              <div class="portfolio-thumb">
                <img
                  src="images/portfolio-img2.jpg"
                  class="img-responsive"
                  alt="Portfolio"
                />
                <div class="portfolio-overlay">
                  <div class="portfolio-item">
                    <h3>Project Name</h3>
                    <small>Web Development</small>
                  </div>
                </div>
              </div>
            </a>
          </div>

          <div class="col-md-4 col-sm-6">
            <a href="single-project.html">
              <div class="portfolio-thumb">
                <img
                  src="images/portfolio-img3.jpg"
                  class="img-responsive"
                  alt="Portfolio"
                />
                <div class="portfolio-overlay">
                  <div class="portfolio-item">
                    <h3>Project Name</h3>
                    <small>Mobile App</small>
                  </div>
                </div>
              </div>
            </a>
          </div>

          <div class="col-md-4 col-sm-6">
            <a href="single-project.html">
              <div class="portfolio-thumb">
                <img
                  src="images/portfolio-img4.jpg"
                  class="img-responsive"
                  alt="Portfolio"
                />
                <div class="portfolio-overlay">
                  <div class="portfolio-item">
                    <h3>Project Name</h3>
                    <small>Logo Design</small>
                  </div>
                </div>
              </div>
            </a>
          </div>

          <div class="col-md-4 col-sm-6">
            <a href="single-project.html">
              <div class="portfolio-thumb">
                <img
                  src="images/portfolio-img5.jpg"
                  class="img-responsive"
                  alt="Portfolio"
                />
                <div class="portfolio-overlay">
                  <div class="portfolio-item">
                    <h3>Project Name</h3>
                    <small>Social marketing</small>
                  </div>
                </div>
              </div>
            </a>
          </div>

          <div class="col-md-4 col-sm-6">
            <a href="single-project.html">
              <div class="portfolio-thumb">
                <img
                  src="images/portfolio-img6.jpg"
                  class="img-responsive"
                  alt="Portfolio"
                />
                <div class="portfolio-overlay">
                  <div class="portfolio-item">
                    <h3>Project Name</h3>
                    <small>Fyler Design</small>
                  </div>
                </div>
              </div>
            </a>
          </div>

          <div class="col-md-12 col-sm-12 text-center">
            <h3>
              hello, if you interest working together. just send message
              <a href="contact.html">contact page</a>
            </h3>
          </div>
        </div>
      </div>
    </section>

    <%@ include file="./includes/footer.jsp" %>