<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	
	
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<div class="top-content">
			<div class="inner-bg">
                <div class="container">                    
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
							<form:form method="post" modelAttribute="user" action="${pageContext.request.contextPath}/updateUserdetail" cssClass="registration-form">
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
		                            	<div class="form-group">
		                            		<form:hidden path="id" value="${id}"/>				                        	
				                        	<form:select path="role" class="name form-control">
												<form:option value="NONE" label="--- Select ---" />
												<form:options items="${roleList}" />
											</form:select>
				                        </div>
				                        
				                    	<div class="form-group">				                        	
				                        	<form:input path="name" id="name" type="text" cssClass="name form-control" placeholder="name" />
				                        </div>
				                        
				                        <div class="form-group">
				                    		<form:input path="fname" id="fname" type="text" cssClass="name form-control" placeholder="father name" />
				                        </div>
				                        
				                        <div class="form-group">
				                        	<form:input path="contactNo" id="contactNo" type="text" cssClass="name form-control" placeholder="contact no" />
				                        </div>
				                        <div class="form-group">				                        	
				                        	<form:textarea path="address" rows="5" cssClass="address form-control" id="address" placeholder="address" />
				                        </div>
				                        
				                        <div class="form-group">
				                        	<form:input path="age" id="age" type="text" cssClass="name form-control" placeholder="age " />
				                        </div>
				                        
										<label class="row" >Select Gender:</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												 <form:radiobutton path="gender" value="1" cssClass="Form-label-radio" />
												  <span class="Form-label-text">Male</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="gender" value="2" cssClass="Form-label-radio"/>												 
												  <span class="Form-label-text">Female</span>
												</label>
												
				                        </div>
				                        
				                        
				                        <label class="row" >Select Education:</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <form:radiobutton path="eduType" value="1" cssClass="Form-label-radio"/>	
												  <span class="Form-label-text">With Coaching</span>
												</label>
												<label class="Form-label--tick">
												 <form:radiobutton path="eduType" value="2" cssClass="Form-label-radio"/>	
												  <span class="Form-label-text">Without Coaching</span>
												</label>
												
				                        </div>
				                        
				                        
				                    	<label class="row" >Select Medium of Education</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <form:radiobutton path="eduMedium" value="1" cssClass="Form-label-radio"/>
												  <span class="Form-label-text">English</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="eduMedium" value="2" cssClass="Form-label-radio"/>
												  <span class="Form-label-text">Hindi</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="eduMedium" value="3" cssClass="Form-label-radio"/>
												  <span class="Form-label-text">Other</span>
												</label>
				                        </div>
				                        
				                        
				                        <label class="row" >Select Marital Status</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <form:radiobutton path="maritalStatus" value="1" cssClass="Form-label-radio"/>
												  <span class="Form-label-text">Married</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="maritalStatus" value="2" cssClass="Form-label-radio"/>
												  <span class="Form-label-text">UnMarried</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="maritalStatus" value="3" cssClass="Form-label-radio"/>
												  <span class="Form-label-text">divorced</span>
												</label>
				                        </div>
				                        
				                        
				                        <label class="row" >Select Monthly Income(family)</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <form:radiobutton path="income" value="1" cssClass="Form-label-radio"/>	
												  <span class="Form-label-text">Nill-6000</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="income" value="2" cssClass="Form-label-radio"/>	
												  <span class="Form-label-text">6001-15000</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="income" value="3" cssClass="Form-label-radio"/>	
												  <span class="Form-label-text">> 15000</span>
												</label>
				                        </div>
				                        
				                       
				                       <label class="row" >Select Religion</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <form:radiobutton path="religion" value="1" cssClass="Form-label-radio"/>	
												  <span class="Form-label-text">Hindu</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="religion" value="2" cssClass="Form-label-radio"/>	
												 <span class="Form-label-text">Muslim</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="religion" value="3" cssClass="Form-label-radio"/>	
												  <span class="Form-label-text"> Other</span>
												</label>
				                        </div>
				                        
				                        <label class="row" >Select Family Type</label>
				                       	<div class="form-group">				                       			
												<label class="Form-label--tick">
												 <form:radiobutton path="familyType" value="1" cssClass="Form-label-radio"/>	
												 <span class="Form-label-text">Nuclear</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="familyType" value="2" cssClass="Form-label-radio"/>	
												 <span class="Form-label-text">Nuclear extended</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="familyType" value="3" cssClass="Form-label-radio"/>	
												  <span class="Form-label-text"> Other</span>
												</label>
				                        </div>
				                        
				                        <div class="form-group">
				                        	<form:input path="birthOrder" id="birthOrder" type="text" cssClass="name form-control" placeholder="birth order" />
				                        </div>
				                       
				                       <label class="row" >Select Locality</label>
				                       	<div class="form-group">
												<label class="Form-label--tick">
												  <form:radiobutton path="locality" value="1" cssClass="Form-label-radio"/>
												  <span class="Form-label-text">Urban</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="locality" value="2" cssClass="Form-label-radio"/>
												  <span class="Form-label-text">Rural</span>
												</label>
												<label class="Form-label--tick">
												  <form:radiobutton path="locality" value="3" cssClass="Form-label-radio"/>
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
				                    		<form:input path="username" id="username" cssClass="name form-control" placeholder="Username" onkeyup="check(this);"/>
				                        	<span id="username-msg" style="display: none;"></span>
				                        </div>
				                        
				                        <div class="form-group">
				                    		<label class="sr-only" for="password">Password</label>
				                        	<form:password path="password" id="password" cssClass="name form-control" placeholder="password" />
				                        </div>
				                        
				                        <button type="button" class="btn btn-previous">Previous</button>
				                        <button type="submit" id="registrationBtn" class="btn">Update</button>
				                    </div>
			                    </fieldset>
		                    
		                    </form:form>
		                    
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
<script>
function check(ref){
	var username=$(ref).val();
	if(username.length < 4) return;
	$('#username-msg').text('').hide();
	$('#username-msg').removeClass('success');
	$('#username-msg').removeClass('error');
	var URL = getContextPath()+"isUserAlreadyNameExist/"+username;
	  $.ajax({
		    type: "GET",
		    url: URL,
		    success: function(data)
		    {       	
						
					if(data.successMsg == 'success'){
						if(data.response==true){
							$('#username-msg').text('This name already Exist, Choose Another username').addClass('error').show();
						} else {
							$('#username-msg').text('success.').addClass('success').show();
						}
					} else {
						$('#username-msg').text('This name already Exist, Choose Another username').addClass('error').show();
					}	
			        	
		 	   
		    },
		    error: function (xhr, ajaxOptions, thrownError) {
		 	  
		    }
		  });
}
</script>
