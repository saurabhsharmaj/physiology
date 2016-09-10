<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<header id="intro" style="opacity: 0; height: 813px;" class="animated fadeIn">
		<div class="container">
			<div class="table">
				<div class="header-text">
					<div class="row">
						<div class="col-md-12 text-center">
								<p class="w3-large" style="margin-bottom:30px;">Q.No.<span id="questionNo"></span>. <span id="questionDescription"></span></p>
								<form id="quizform" method="POST" action="javascript:void(0);" onsubmit="return saveAndNext();">
									<input type="hidden" name="userId" value="${userdetail.id}">
									<input type="hidden" name="testType" value="${testType.id}">
									<input type="hidden" name="testId" id="testId">
									<input type="hidden" name="qno" id="qno">
									<input type="hidden" name="action" id="action">	
									<input type="hidden" name="totalQuestion" id="totalQuestion">																	
									<div id="optionsDiv"></div>										
									<br>
									<input type="button" class="w3-btn w3-orange w3-large" value=" Back " onclick="saveAndBack();">	
									<input type="button" class="w3-btn w3-orange w3-large" value=" Next " onclick="saveAndNext();">	
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
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
		debugger
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
	
	saveAndNext();
});

function saveAndBack(){	
	 $('#action').val('back');
	 getQuestion();
}
function saveAndNext(action){
	 $('#action').val('next');
	 getQuestion();
}
function getQuestion(){

	var postURL='/physiology/saveAndNext';
	$.ajax({
	    type: "POST",
	    url: postURL,
	    contentType: "application/json",
	    data: JSON.stringify($("#quizform").serializeObject()),
	    success: function(data)
	    {   
	    	
	    	if(data.successMsg){
	    		
	    		$('#totalQuestion').val(data.totalQuestion);
	    		$('#testId').val(data.testId);
	    		$('#qno').val(data.qno+1);
	    		$('#questionNo').text(data.nextQuestion.qid);
	    		$('#questionDescription').text(data.nextQuestion.question);
	    		var options ='';
	    		if(data.nextQuestion.questionType ==1){	    			
	    			$(data.nextQuestion.answers).each(function(index,val){
	    				label =$('#optionTemplate1 label').clone();
	    				$(label).find('input').val(val.score);
	    				$(label).find('p').text(val.label);
	    				options+=$(label).html();
	    			});
	    		} else if(data.nextQuestion.questionType ==2){	    			
		    			$(data.nextQuestion.answers).each(function(index,val){
		    				label =$('#optionTemplate2 label').clone();
		    				$(label).find('input').val(val.score);
		    				$(label).find('p').text(val.label);
		    				options+=$(label).html();
		    			});
		    	} else if(data.nextQuestion.questionType ==3){	    			
	    			$(data.nextQuestion.answers).each(function(index,val){
	    				label =$('#optionTemplate3 label').clone();
	    				$(label).find('input').val(val.score);
	    				$(label).find('p').text(val.label);
	    				options+=$(label).html();
	    			});
	    	} else if(data.nextQuestion.questionType ==4){   			
    				label =$('#optionTemplate4 label').clone();
    				$(label).find('input').val('');
    				options+=$(label).html();
    	}
	    		
	    		$('#optionsDiv').html(options);
	    	}
	    		
	    	resetButton();
	    },
	    error: function (xhr, ajaxOptions, thrownError) {
	 	  
	    }
	  });
}

function resetButton(){
	
}
</script>
