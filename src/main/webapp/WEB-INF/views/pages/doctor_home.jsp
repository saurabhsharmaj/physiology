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