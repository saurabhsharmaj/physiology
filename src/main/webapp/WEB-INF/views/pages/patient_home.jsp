<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<section id="services" class="section section-padded">
		<div class="container">
			<div class="row text-center title">
				<h2 class="white typed">Test Types</h2>
				<h4 class="white typed">Select Test, Which one you want to take now</h4>
			</div>
			<div class="row services">
				<c:forEach items="${testTypes}" var="testType">
					<div class="col-md-${fn:length(testTypes) >=  4 ?3:4}">
						<div class="service">
							<div class="icon-holder">
								<img src="./resources/images/quiz-logo.png" alt="" class="icon">
							</div>
							<h4 class="heading">${testType.testName }</h4>
							<p class="description">${testType.description}
							 <a href="#" class="btn btn-blue-fill expand" onclick="showModal(${loginDetails.userDetail.id},${testType.id},escape('${testType.note}'));">Take Test</a>						
							</p>
						</div>
					</div>
				</c:forEach>				
			</div>
		</div>
		<div class="cut cut-bottom"></div>
	</section>
	
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Introduction</h3>
				<form class="popup-form" id="popup-form">
					<p id="modal-body-text" class="modal-text"></p>
					<button type="submit" class="btn btn-submit">Start Test</button>
				</form>
			</div>
		</div>
	</div>
	
	<script>

	function showModal(userId, testTypeId,note){
		var url = './starttest/'+userId+'/'+testTypeId;	
		$('#popup-form').attr('action',url);		
		$('#modal-body-text').html(unescape(note));		
		$('#modal1').modal('show');
	}
	</script>