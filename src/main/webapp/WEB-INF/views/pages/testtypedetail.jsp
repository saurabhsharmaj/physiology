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
								      <h3>Hi ${loginDetails.username}, You have attempt following tests.</h3>
								    </div>
								    <div class="col-sm-3">
								      <div class="form-top-right">
	                        			<i class="fa fa-question-circle"></i>
	                        		</div>
	                        			<!-- <a href="javascript:void(0);" onclick="exit();">exit</a> -->
								    </div>
								  </div>
                            </div>
                           <div class="table-responsive">
  							<table class="table table-bordered table-striped">
                            	<thead>
                            		<tr>
	                            		<th>S.No.</th>
	                            		<th>Test Name</th>
	                            		<th>Score</th>
	                            		<th>Date</th>
                            		</tr>
                            	</thead>
                            	<tbody>
                            		<c:forEach var="testDetail" items="${testdetails}" varStatus="questionMaploop">
                            		<tr>
                            			<td>${questionMaploop.index+1}</td>
                            			<td>${testDetail.testtype.testName }</td>
                            			<td>
                            				<c:choose>
                            					<c:when test="${empty testDetail.score}">
                            					0
                            					</c:when>
                            					<c:otherwise>
                            						<a href="${pageContext.request.contextPath}/testdetail/${testDetail.id}">${testDetail.score}</a>
                            					</c:otherwise>
                            				</c:choose>
                            			</td>
                            			<td>${testDetail.updatedOn}</td>
                            		</tr>
                            		 </c:forEach>
                            	</tbody>
                            </table>
                            </div>
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