<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<section id="team" class="section gray-bg">
		<div class="container">
			<div class="row title text-center">
				<h2 class="margin-top">Physiology Quiz</h2>
				<h4 class="light muted">${testType.testName }</h4>
				<input type="hidden" name="userid" id="userid" value="${userdetail.id }">
				<input type="hidden" name="testtypeId" id="testtypeId" value="${testType.id }">
			</div>
			Total Questions: ${fn:length(questions)}.
			<c:forEach items="${questions}" var="q" varStatus="index">
			<div class="row" id="question${index.index}">
				<div class="col-md-12">
					<div class="team text-center">
						<div class="cover" style="background:url('/physiology/resources/img/team/team-cover1.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white"><span>Q.No.${index.index+1}. </span>${q.question}</h3>
							</div>
						</div>
						
						
						<div class="title">
							<div class="item">
								<c:forEach items="${q.answerses}" var="a" varStatus="aIndex">
									<div class="schedule-row row">
										<div class="col-xs-6">
											<h5 class="regular">											
												<label>
													<c:choose>
														<c:when test="${q.questiontype.type ==1 }">
															<input type="radio" name="answerGroup" value="0" id="answerGroup_0">${a.description}
															<input type="hidden" name="answerGroup${aindex.index+1}" id="answerGroup${aindex.index+1}" value="${a.score}">
														</c:when>
														<c:when test="${q.questiontype.type ==2 }">
															<input type="checkbox" name="answerGroup" value="0" id="answerGroup_0">${a.description}
															<input type="hidden" name="answerGroup${aindex.index+1}" id="answerGroup${aindex.index+1}" value="${a.score}">
														</c:when>
														<c:when test="${q.questiontype.type ==3 }">
															<input type="radio" name="answerGroup" value="0" id="answerGroup_0">${a.description}
															<input type="hidden" name="answerGroup${aindex.index+1}" id="answerGroup${aindex.index+1}" value="${a.score}">
														</c:when>
														<c:otherwise>
															<input type="text" name="answerGroup" value="0" id="answerGroup_0">${a.description}
															<input type="hidden" name="answerGroup${aindex.index+1}" id="answerGroup${aindex.index+1}" value="${a.score}">
														</c:otherwise>
													</c:choose>
												</label>
											</h5>
										</div>									
									</div>
								</c:forEach>
								<c:if test="${fn:length(q.answerses) eq 0}">
									<label>Enter your Answers: <input type="text" class="free-txt" name="answerGroup" id="answerGroup_0">
									<input type="hidden" name="answerGroup0" class="free-txt-hidden" id="answerGroup0">
									</label>								
								</c:if>								
							</div>	
											
						</div>
						<c:if test="${index.index != 0}">
							<a href="#question${index.index -1 }" class="btn btn-blue-fill">Back</a>
						</c:if>
						<c:if test="${index.index != fn:length(questions)-1}">
						<a href="#question${index.index +1 }" onclick="saveAndCalculateScore(${q.id},${index.index})" class="btn btn-blue-fill">Next</a>
						</c:if>
						<c:if test="${index.index == fn:length(questions)-1}">
							<a href="javascript:void(0);" onclick="finish(${q.id},${index.index})" class="btn btn-blue-fill">Finish</a>
						</c:if>
					</div>
				</div>
				
				
				
			</div>
			</c:forEach>
		</div>
	</section>