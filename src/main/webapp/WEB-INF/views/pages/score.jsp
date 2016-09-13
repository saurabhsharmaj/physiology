<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">                    
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	                      	
                        	
			                    <fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">		                        			
		                            		<h3>Hi ${loginDetails.username}, <br> You have score ${score } in ${testType.testName} Test. </h3>
		                            		
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-user"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
				                    	<button type="button"  url="${targetURL}" onclick="redirect(this);" class="btn btn-previous">Previous</button>
				                    </div>
			                    </fieldset>	                    
		                    
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
<script>
	function redirect(ref){
		window.location.href=getContextPath() + $(ref).attr('url');
	}
</script>