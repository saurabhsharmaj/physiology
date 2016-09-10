<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cardio: Free One Page Template by Luka Cvetinovic</title>
	<meta name="description" content="Cardio is a free one page template made exclusively for Codrops by Luka Cvetinovic" />
	<meta name="keywords" content="html template, css, free, one page, gym, fitness, web design" />
	<meta name="author" content="Luka Cvetinovic for Codrops" />
	<!-- Favicons (created with http://realfavicongenerator.net/)-->
	<link rel="apple-touch-icon" sizes="57x57" href="${pageContext.request.contextPath}/resources/img/favicons/apple-touch-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="${pageContext.request.contextPath}/resources/img/favicons/apple-touch-icon-60x60.png">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/img/favicons/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/img/favicons/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="${pageContext.request.contextPath}/resources/img/favicons/manifest.json">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicons/favicon.ico">
	<meta name="msapplication-TileColor" content="#00a8ff">
	<meta name="msapplication-config" content="${pageContext.request.contextPath}/resources/img/favicons/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">
	<!-- Normalize -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/normalize.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<!-- Owl -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.css">
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.1.0/css/font-awesome.min.css">
	<!-- Elegant Icons -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/eleganticons/et-icons.css">
	<!-- Main style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cardio.css">
</head>

<body>
	<div class="preloader">
		<img src="${pageContext.request.contextPath}/resources/img/loader.gif" alt="Preloader image">
	</div>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />	
	
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Sign Up</h3>
				<form action="" class="popup-form">
					<input type="text" class="form-control form-white" placeholder="Full Name">
					<input type="text" class="form-control form-white" placeholder="Email Address">
					<div class="dropdown">
						<button id="dLabel" class="form-control form-white dropdown" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Pricing Plan
						</button>
						<ul class="dropdown-menu animated fadeIn" role="menu" aria-labelledby="dLabel">
							<li class="animated lightSpeedIn"><a href="#">1 month membership ($150)</a></li>
							<li class="animated lightSpeedIn"><a href="#">3 month membership ($350)</a></li>
							<li class="animated lightSpeedIn"><a href="#">1 year membership ($1000)</a></li>
							<li class="animated lightSpeedIn"><a href="#">Free trial class</a></li>
						</ul>
					</div>
					<div class="checkbox-holder text-left">
						<div class="checkbox">
							<input type="checkbox" value="None" id="squaredOne" name="check" />
							<label for="squaredOne"><span>I Agree to the <strong>Terms &amp; Conditions</strong></span></label>
						</div>
					</div>
					<button type="submit" class="btn btn-submit">Submit</button>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Login</h3>
				<c:url var="loginUrl" value="/login" />
				<form action="${loginUrl}" method="post" class="popup-form">
					<c:if test="${param.error != null}">
                          <div class="alert alert-danger">
                              <p>Invalid username and password.</p>
                          </div>
                      </c:if>
                      <c:if test="${param.logout != null}">
                          <div class="alert alert-success">
                              <p>You have been logged out successfully.</p>
                          </div>
                      </c:if>
                      
					<input type="text" class="form-control form-white" name="username" placeholder="username">
					<input type="text" class="form-control form-white" name="password" placeholder="password">
					<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />					
					<button type="submit" class="btn btn-submit">Login</button>
				</form>
			</div>
		</div>
	</div>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
	<!-- Holder for mobile navigation -->
	<div class="mobile-nav">
		<ul>
		</ul>
		<a href="#" class="close-link"><i class="arrow_up"></i></a>
	</div>
	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/typewriter.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.onepagenav.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script>
	$(document).ready(function() {	
		$.fn.serializeObject = function()
		{
		    var o = {};
		    var a = this.serializeArray();
		    $.each(a, function() {
		        if (o[this.name] !== undefined) {
		            if (!o[this.name].push) {
		                o[this.name] = [o[this.name]];
		            }
		            o[this.name].push(this.value || '');
		        } else {
		            o[this.name] = this.value || '';
		        }
		    });
		    return o;
		};		
	});
	</script>
</body>

</html>
