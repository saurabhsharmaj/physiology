<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">                    
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<c:url var="loginUrl" value="/login" />                        	
                        	<form role="form" action="${loginUrl}" method="post" class="registration-form"> 
			                    <fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">		                        			
		                            		<p>Login</p>
		                            		<c:if test="${param.error != null}">
							                      <div class="alert alert-danger">
							                          <p>Invalid username and password.</p>
							                      </div>
							                  </c:if>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-user"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="username">UserName</label>
				                        	<input type="text" name="username" placeholder="Username..." class="form-facebook form-control" id="username">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="password">Password</label>
				                        	<input type="password" name="password" placeholder="Password..." class="form-twitter form-control" id="password">
				                        </div> 
				                        <button type="button" class="btn btn-previous">Reset</button>
				                        
				                        <button type="submit" class="btn">Login</button>
				                    </div>
			                    </fieldset>
		                    
		                    </form>
		                    
                        </div>
                    </div>
                </div>
            </div>
            
        </div>