<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
	<div class="header">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/doctorHome"></a><span class="heading-text">Physiocology Test</span>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="top-navbar-1">
			<ul class="nav navbar-nav navbar-right">
				<li>
					<span class="li-text">
						
						<c:choose>
							<c:when test="${empty loginDetails}"><a href="${pageContext.request.contextPath}/registration" class="header-btn">Register</a> &nbsp; <a href="${pageContext.request.contextPath}/login" class="header-btn">Login</a></c:when>
							<c:otherwise>Hi ${loginDetails.username}</c:otherwise>
						</c:choose>
						
					</span> 
					
					<span class="li-text">
						
					</span> 
					<span class="li-social">
						<c:choose>
							<c:when test="${empty loginDetails}"></c:when>
							<c:otherwise><a href="${pageContext.request.contextPath}/logout" class="header-btn">Logout</a></c:otherwise>
						</c:choose>
					</span>
				</li>
			</ul>
		</div>
	</div>
</nav>