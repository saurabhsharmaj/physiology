<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<div class="top-content">
			<div class="inner-bg">
                <div class="container">                    
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	
                        	<form role="form" id="registrationform" method="post" class="registration-form">
                        		<fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 1 / 2</h3>
		                            		<p>Registration Details:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-user"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
		                            	<div class="form-group" style="display:none;">
				                    		<label class="sr-only" for="role">Role</label>
				                        	<select name="role" class="name form-control" >
				                        		<option value="ROLE_PATIENT" selected="selected">ROLE PATIENT</option>
				                        		<option value="ROLE_DOCTOR" >ROLE DOCTOR</option>
				                        	</select>
				                        </div>
				                        
				                    	<div class="form-group">
				                    		<label class="sr-only" for="name">Name</label>
				                        	* <input type="text" name="name" placeholder="Name..." class="name form-control" id="name">
				                        </div>
				                        
				                        <div class="form-group">
				                    		<label class="sr-only" for="fname">Fater Name</label>
				                        	<input type="text" name="fname" placeholder="Father Name..." class="fname form-control" id="fname">
				                        </div>
				                        
				                        <div class="form-group">
				                        	<label class="sr-only" for="contactNo">Mobile No</label>
				                        	<input type="text" name="contactNo" placeholder="Mobile No" class="contactNo form-control" id="contactNo">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="address">Address</label>
				                        	<textarea name="address" placeholder="Address" 
				                        				class="address form-control" id="address"></textarea>
				                        </div>
				                        
				                        <div class="form-group">
				                    		<label class="sr-only" for="fname">Age</label>
				                        	*<input type="text" name="age" placeholder="age" class="age form-control" id="age">
				                        </div>
				                        
										<label class="row" >Select Gender:</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <input type="radio" value="1" name="gender" class="Form-label-radio" checked>
												  <span class="Form-label-text">Male</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="2" name="gender" class="Form-label-radio">
												  <span class="Form-label-text">Female</span>
												</label>
												
				                        </div>
				                        
				                        
				                        <label class="row" >Select Education:</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <input type="radio" value="1" name="eduType" class="Form-label-radio" checked>
												  <span class="Form-label-text">With Coaching</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="2" name="eduType" class="Form-label-radio">
												  <span class="Form-label-text">Without Coaching</span>
												</label>
												
				                        </div>
				                        
				                        
				                    	<label class="row" >Select Medium of Education</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <input type="radio" value="1" name="eduMedium" class="Form-label-radio" checked>
												  <span class="Form-label-text">English</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="2" name="eduMedium" class="Form-label-radio">
												  <span class="Form-label-text">Hindi</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="3" name="eduMedium" class="Form-label-radio">
												  <span class="Form-label-text">Other</span>
												</label>
				                        </div>
				                        
				                        
				                        <label class="row" >Select Marital Status</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <input type="radio" value="1" name="maritalStatus" class="Form-label-radio" checked>
												  <span class="Form-label-text">Married</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="2" name="maritalStatus" class="Form-label-radio">
												  <span class="Form-label-text">UnMarried</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="3" name="maritalStatus" class="Form-label-radio">
												  <span class="Form-label-text">divorced</span>
												</label>
				                        </div>
				                        
				                        
				                        <label class="row" >Select Monthly Income(family)</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <input type="radio" value="1" name="income" class="Form-label-radio" checked>
												  <span class="Form-label-text">Nill-6000</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="2" name="income" class="Form-label-radio">
												  <span class="Form-label-text">6001-15000</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="3" name="income" class="Form-label-radio">
												  <span class="Form-label-text">> 15000</span>
												</label>
				                        </div>
				                        
				                       
				                       <label class="row" >Select Religion</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <input type="radio" value="1" name="religion" class="Form-label-radio" checked>
												  <span class="Form-label-text">Hindu</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="2" name="religion" class="Form-label-radio">
												  <span class="Form-label-text">Muslim</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="3" name="religion" class="Form-label-radio">
												  <span class="Form-label-text"> Other</span>
												</label>
				                        </div>
				                        
				                        <label class="row" >Select Family Type</label>
				                       	<div class="form-group">				                       			
												<label class="Form-label--tick">
												  <input type="radio" value="1" name="familyType" class="Form-label-radio" checked>
												  <span class="Form-label-text">Nuclear</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="2" name="familyType" class="Form-label-radio">
												  <span class="Form-label-text">Nuclear extended</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="3" name="familyType" class="Form-label-radio">
												  <span class="Form-label-text"> Other</span>
												</label>
				                        </div>
				                        
				                        <div class="form-group">
				                        	<label class="sr-only" for="birthOrder">Birth order</label>
				                        	<input type="text" name="birthOrder" placeholder="birth order" class="form-birth-order form-control" id="birthOrder">
				                        </div>
				                       
				                       <label class="row" >Select Locality</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <input type="radio" value="1" name="locality" class="Form-label-radio" checked>
												  <span class="Form-label-text">Urban</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="2" name="locality" class="Form-label-radio">
												  <span class="Form-label-text">Rural</span>
												</label>
												<label class="Form-label--tick">
												  <input type="radio" value="3" name="locality" class="Form-label-radio">
												  <span class="Form-label-text">Other</span>
												</label>
				                        </div>
				                        
				                        <button type="button" class="btn btn-next">Next</button>
				                    </div>
			                    </fieldset>
			                   
			                    
			                    <fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 2 / 2</h3>
		                            		<p>Registration Details:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-key"></i>
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
				                    	
				                    	<div class="form-group">
				                    		<label class="sr-only" for="username">UserName</label>
				                        	<input type="text" name="username" placeholder="UserName" class="form-username form-control" id="username">
				                        </div>
				                        
				                        <div class="form-group">
				                    		<label class="sr-only" for="password">Password</label>
				                        	<input type="password" name="password" placeholder="Password" class="password form-control" id="password">
				                        </div>
				                        
				                        <button type="button" class="btn btn-previous">Previous</button>
				                        <button type="button" id="registrationBtn" class="btn">Registered</button>
				                    </div>
			                    </fieldset>
		                    
		                    </form>
		                    
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
<script>

$( document ).ready(function() {
	$.fn.serializeObject = function()
	{
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	        if (o[this.name] !== undefined) {
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || null);
	        } else {
	            o[this.name] = this.value || null;
	        }
	    });
	    return o;
	};
	
});

$('#registrationBtn').on('click',function(){
	
	
	var URL = getContextPath()+"registration";
	  $.ajax({
		    type: "POST",
		    url: URL,
		    contentType: "application/json",
		    data: JSON.stringify($('#registrationform').serializeObject()),
		    success: function(data)
		    {       	
						
					if(data.successMsg == 'success'){
						window.location.href=getContextPath()+"homePage?success=register";
					}	
			        	
		 	   
		    },
		    error: function (xhr, ajaxOptions, thrownError) {
		 	  
		    }
		  });
});
</script>