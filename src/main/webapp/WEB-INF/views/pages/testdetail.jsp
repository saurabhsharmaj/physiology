<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<div class="top-content">
  <div class="inner-bg">
                <div class="container">                    
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">		                        		
                        		<div class="row">
								    <div class="col-sm-9">
								      <p style="padding-top: 45px;">${loop.index + 1} / ${totalQuestion} [${testType.testName}]</p>
								      <h3>Test History</h3>
								    </div>
								    <div class="col-sm-3">
								      <div class="form-top-right">
	                        			<i class="fa fa-question-circle"></i>
	                        		</div>
	                        			<!-- <a href="javascript:void(0);" onclick="exit();">exit</a> -->
								    </div>
								  </div>
                            </div>
                        	<c:forEach var="questionMap" items="${questionList}" varStatus="questionMaploop">
                        		<c:forEach var="que" items="${questionMap}" varStatus="loop">
                        		<fieldset>		                        	
		                            <div class="form-bottom">
				                    	<div class="row">
										    <div class="col-sm-12">
										    	${que.key.id }<h3>Q.No.${questionMaploop.index + 1} &nbsp; ${que.key.question}</h3>
										    </div>
										</div>
										
				                    	<div class="form-group">				                    				                    			
				                    		<c:forEach var="ans" items="${que.key.answerses}" varStatus="ansloop">
												<label class="Form-label--tick">
												<c:choose>
												  <c:when test="${ans.id == que.value.selectedTypeId}">
												   		<input type="radio" value="${ans.score}" name="option${questionMaploop.index}" qid="${que.key.id}" ansid="${ans.id}" qtype="${que.key.questiontype.id}" class="Form-label-radio" checked>
												  <span class="Form-label-text">${ans.description}</span>
												  </c:when>									  
												  <c:otherwise>
												  		<input type="radio" value="${ans.score}" name="option${questionMaploop.index}" qid="${que.key.id}" ansid="${ans.id}" qtype="${que.key.questiontype.id}" class="Form-label-radio">
												  <span class="Form-label-text">${ans.description}</span>
												  </c:otherwise>
												</c:choose>
												</label>
												
																								
				                    		</c:forEach>				                       
				                        </div> 
				                    </div>
			                    </fieldset>
		                     	</c:forEach>
		                    </c:forEach>
		                        
		                        <div class="form-bottom">				                    	
	                    			<button type="button"  url="${targetURL}" onclick="redirect(this);" class="btn btn-previous">Previous</button>
			                    </div>
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