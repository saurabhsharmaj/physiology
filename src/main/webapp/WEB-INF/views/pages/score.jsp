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
		                            	<c:if  test="${score ge 50 && testType.testName=='Test_depression' || score ge 17 && testType.testName=='anxiety test'}">
						                    	<p>
						                    		For further assistance you can communicate with me at <a href="mailto:drkkpsychiatry@gmail.com">drkkpsychiatry@gmail.com</a>  or consult in deptartment of psychiatry jlnmc ajmer ( free of cost ).
						                    	</p>
						                    	
						                    	<button type="button"  url="${targetURL}" onclick="redirect(this);" class="btn btn-previous">Previous</button>
						                    </c:if>
						                    
						                    <c:if  test="${testType.testName=='coping style'}">
						                    <div class="form-group">
				                        	<label class="sr-only" for="address">FEEL FREE TO WRITE US IF YOU HAVE ANY OTHER SPECIFIC PROBLEM OR ANY OTHER QUERY</label>
				                        	<textarea style="min-height: 200px;" name="address" placeholder="FEEL FREE TO WRITE US IF YOU HAVE ANY OTHER SPECIFIC PROBLEM OR ANY OTHER QUERY" 
				                        				class="address form-control" id="address"></textarea>
				                        </div>
				                        <button type="button"  url="${targetURL}" onclick="submitFeedback(this);" class="btn btn-previous">save</button>
						                    </c:if>
				                    	
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
	
	function submitFeedback(ref){
		debugger
		 $.ajax({
		        cache: false,
		        url : getContextPath()  +'savefeedback',
		        type: "POST",
		        dataType : "json",
		        contentType:"application/json",
		        data : {feedback:$(ref).parents().find('textarea').val()},
		        success : function(callback){
		            //Where $(this) => context == FORM
		            console.log(JSON.parse(callback));
		            $(this).html("Success!");
		        },
		        error : function(){
		            $(this).html("Error!");
		        }
		    });
	}
</script>