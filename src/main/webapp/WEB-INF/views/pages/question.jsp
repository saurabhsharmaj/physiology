<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<div class="top-content">
  <div class="inner-bg">
                <div class="container">                    
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	
                        	<input type="hidden" id="userid" value="${loginDetails.userDetail.id}">
                        	<input type="hidden" id="testid" value="${testid}">
                        	<input type="hidden" id="testtypeid" value="${testType.id}">
                        	<form role="form" id="form" method="post" class="registration-form">
                        		<c:forEach var="que" items="${questions}" varStatus="loop">
                        		<fieldset>
		                        	<div class="form-top">
		                        		<%-- <div class="form-top-left">
		                        			<p>${loop.index + 1} / ${totalQuestion} [${testType.testName}]</p>
		                            		<h3>Q.No.${loop.index + 1} &nbsp;${que.question}</h3>
		                        		</div>
		                        		<div class="form-top-right">
		                        			<i class="fa fa-question-circle"></i>
		                        		</div> --%>
		                        		
		                        		
		                        		<div class="row">
										    <div class="col-sm-9">
										      <p class="panel-heading">${loop.index + 1} / ${totalQuestion} [${testType.testName}]</p>
										    </div>
										    <div class="col-sm-3">
										      <div class="form-top-right">
			                        			<i class="fa fa-question-circle"></i>
			                        		</div>
			                        			<!-- <a href="javascript:void(0);" onclick="exit();">exit</a> -->
										    </div>
										  </div>
		                        		
		                        		<div class="row">
										    <div class="col-sm-12">
										    	<h3>Q.No.${loop.index + 1} &nbsp;${que.question}</h3>
										    </div>
										</div>
		                            </div>
		                            <div class="form-bottom">
				                    	<div class="form-group">				                    			
				                    		<c:forEach var="ans" items="${que.answerses}" varStatus="ansloop">
												<label class="Form-label--tick">
												  <input type="radio" value="${ans.score}" name="option${loop.index}" qid="${que.id}" ansid="${ans.id}" qtype="${que.questiontype.id}" class="Form-label-radio">
												  <span class="Form-label-text">${ans.description}</span>
												</label>												
				                    		</c:forEach>				                       
				                        </div>			                        
				                         <c:if test="${loop.index ne 0 }">
				                        	<button type="button" class="btn btn-previous">Previous</button>
				                         </c:if>
				                         
				                        <c:if test="${loop.index + 1 < totalQuestion}">
				                        	<button type="button" class="btn btn-next">Next</button>
				                        </c:if>
				                        
				                         <c:if test="${loop.index + 1 == totalQuestion}">
				                        	<button type="button" class="btn" id="testFinish">Finish</button>
				                         </c:if>
				                    </div>
			                    </fieldset>
		                     
		                        </c:forEach>
		                    </form>
		                    
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
<div style="display: none;">
	<div id="optionTemplate1">
		<label>
			<input type="radio" name="option" value="" id=""><p id="displayValue"></p>
		</label>
	</div>
	<div id="optionTemplate2">
		<label>
			<input type="checkbox" name="option" value="" id=""><p id="displayValue"></p>
		</label>
	</div>
	<div id="optionTemplate3">
		<label>
			<input type="radio" name="option" value="" id=""><p id="displayValue"></p>
		</label>
	</div>
	<div id="optionTemplate4">
		<label>
			<input type="text" name="option" style="color: black;">
		</label>
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

$('#testFinish').on('click',function(){
	var selectedAnswers= new Array();
	$('input[type=radio]:checked', '#form').each(function(index, value){			
		var answer ={};
		answer.qid = $(this).attr('qid');
		answer.score = value.value;
		answer.option = $(this).attr('ansid');
		answer.questionType = $(this).attr('qtype');
		selectedAnswers.push(answer);
	});
	
	var reqData ={userid:$('#userid').val(), testid:$('#testid').val(), testTypeId:$('#testtypeid').val(), questions:selectedAnswers};	
	var URL = getContextPath()+"saveTestResult";
	  $.ajax({
		    type: "POST",
		    url: URL,
		    contentType: "application/json",
		    data: JSON.stringify(reqData),
		    success: function(data)
		    {       	
						
					if(data.successMsg == 'success'){
						window.location.href=getContextPath()+"testresult/"+data.testtypeid+'/'+data.score;
					}	
			        	
		 	   
		    },
		    error: function (xhr, ajaxOptions, thrownError) {
		 	  
		    }
		  });
});

function exit(){
	window.location.href=getContextPath()+"testtypes";
}
</script>
