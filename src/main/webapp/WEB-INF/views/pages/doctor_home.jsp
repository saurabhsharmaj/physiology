<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="wrapper" id="wrapperId">
			<div style="padding-top:25px;">
			 <form method="post" enctype="multipart/form-data" name="fileinfo">
				<input type="file" name="fileName" id="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"/>
			 </form> 
			</div>
			<div>
				<input type="button" name="upload" Value="Upload" onclick="uploadFile();"/>
			</div>
		</div>
		<a href="resources/exceltemplates/question.xls">Download Question Template</a>
		<div class="table-responsive">
			<table class="table">
				<thead class="thead-inverse">
					<tr>
					<th>S.No</th>
					<th>UserName</th>
					<c:forEach var="testType" items="${testTypes}" varStatus="loop">
						<th>${testType.testName}</th>
					</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr>
						
					<c:forEach var="testDetail" items="${testResults}" varStatus="tdetail">
						<tr>
							<td>${tdetail.index + 1 }</td>
							<td>${ testDetail.userDetail.name}</td>
							<c:forEach var="entry" items="${testDetail.testResults}">
							  <td>
							  	   <c:choose>
									  <c:when test="${not empty entry.value}">									
							  	   				<c:choose>
												  <c:when test="${not empty entry.value.score}">
												   <%--  <c:out value="${entry.key}"/> / --%>
										  	   		<a href="${pageContext.request.contextPath}/testdetail/${entry.value.id}"><c:out value="${entry.value.score}"/></a>
										  	   		&nbsp;<a href="${pageContext.request.contextPath}/testdetail/all/${testDetail.userDetail.id}/${entry.value.testtype.id}">...</a>
												  </c:when>									  
												  <c:otherwise>
												  	 0
												  </c:otherwise>
												</c:choose>
									  </c:when>									  
									  <c:otherwise>
									    Not Attempt
									  </c:otherwise>
									</c:choose>
							  </td>
							</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
<script>
function uploadFile(){
	var formData = new FormData($('form')[0]); 
    $.ajax({
    	url:getContextPath()+'uploadQuestion',
        data: formData,
        processData: false,
        contentType: false,
        type: 'POST',
        beforeSend: function( xhr ) {
        	
          },
        success:function(res){
        	
         },
         error: function(ex){
        	$(".underlay").hide();
 			$(".lightbox").hide();
         }
    });
}

</script>