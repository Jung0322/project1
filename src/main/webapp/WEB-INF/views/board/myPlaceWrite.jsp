<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPlace.css" />
<%@ include file="../includes/header.jsp" %>

<body>
<!-- Contact Section -->

<section id="contact">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-1 col-md-10 col-sm-12">
                    <form action="#" method="post">
                         <div class="col-lg-6">
                              <input type="text" class="form-control" placeholder="Name">
                         </div>
                         <div class="col-lg-6">
                              <input type="email" class="form-control" placeholder="Email">
                         </div>
                         <div class="col-lg-6">
                              <input type="telephone" class="form-control" placeholder="Phone Number">
                         </div>
                         <div class="col-lg-6">
                              <select class="form-control">
                                   <option>Budget Select</option>
                                   <option>$1200 to $1600</option>
                                   <option>$2200 to $2400</option>
                                   <option>$2500 to $3800</option>
                              </select>
                         </div>
                         <div class="col-md-12 col-sm-12"> 
                              <textarea class="form-control" rows="5" placeholder="Project Details"></textarea>
                         </div>
                         <div class="col-md-3 col-sm-4">
                              <input type="submit" class="form-control" value="Send Message">
                         </div>
                    </form>
               </div>

          </div>
     </div>
</section>


<!-- SCRIPTS -->

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script>

</body>

<%@ include file="../includes/footer.jsp" %>