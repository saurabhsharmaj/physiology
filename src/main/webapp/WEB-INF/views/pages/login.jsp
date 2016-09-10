<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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