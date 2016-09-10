<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<section id="services" class="section section-padded">
		<div class="container">
			<div class="row text-center title">
				<h2>Test Types</h2>
				<h4 class="light muted">Select Test, Which one you want to take now</h4>
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
							 <a href="./starttest/${loginDetails.userDetail.id}/${testType.id}"  class="btn btn-blue-fill expand">Take Test</a>						
							</p>
						</div>
					</div>
				</c:forEach>				
			</div>
		</div>
		<div class="cut cut-bottom"></div>
	</section>