<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/resources/img/logo.png" data-active-url="${pageContext.request.contextPath}/resources/img/logo-active.png" alt=""></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right main-nav">
				<li><a href="/physiology/home">Home</a></li>
				<li><a href="/physiology/testtypes">Physiology Test's</a></li>				
				<li><a href="#">About Us</a></li>				
				<c:choose>
				    <c:when test="${pageContext.request.userPrincipal.name == null}">
				      <li><a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue">Sign Up</a></li>
				    </c:when>    
				    <c:otherwise>
				       <li><a href="${pageContext.request.contextPath}/logout" data-toggle="modal" data-target="#modal1" class="btn btn-blue">Logout</a></li>
				    </c:otherwise>
				</c:choose>
				
			</ul>
		</div>
		
		
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>