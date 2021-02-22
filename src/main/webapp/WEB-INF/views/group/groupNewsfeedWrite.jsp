<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<%@ include file="../include/header.jspf" %> 

<style>
.fileDrop {
  width: 80%;
  height: 40px;
  border: 1px dotted gray;
  margin: auto;
  
}
iframe {
	width: 0px;
	height: 0px;
	border: 0px
}
@media (min-width: 768px){
	#form1 {
		display:none;
	}
}
@media (max-width: 768px){
	#fileDropDiv {
		display:none;
	}
}
</style>
    <div class="container">

      <!-- Timeline
      ================================================= -->
      <div class="timeline">
<!--         <div class="timeline-cover">
 -->
          <!--Timeline Menu for Large Screens-->
          <div class="timeline-nav-bar hidden-sm hidden-xs">
            <div class="row">
              <div class="col-md-3">
              </div>
            </div>
          </div><!--Timeline Menu for Large Screens End-->

        </div>
        <div id="page-contents">
          <div class="row">
            <div class="col-md-3">
              
              <!--Edit Profile Menu-->
              <ul class="edit-menu">
              	<li><a href="${pageContext.request.contextPath}/group/groupIndex">그룹 메인</a></li>
               	<li class="active"><a href="${pageContext.request.contextPath}/group/groupNewsfeed">내 그룹</a></li>
              	<li><a href="${pageContext.request.contextPath}/group/groupRegister">그룹 생성</a></li>
              </ul>
            </div>
            <div class="col-md-7">

              <!-- Edit Work and Education
              ================================================= -->
              <div class="edit-profile-container">
                <div class="block-title">
                  <h4 class="grey">게시물 작성</h4>
                  <div class="line"></div>
                </div>
                
                <div class="block-title">
                  <h4 class="grey">${groupInfo.grname}</h4>
                </div>
                
                <div class="edit-block">
                
                <form id='form1' action="${pageContext.request.contextPath}/uploadForm" method="post"
						enctype="multipart/form-data" target="zeroFrame">
					<div class="row">
                    	<div class="form-group col-xs-12">
						<input type='file' name='file' id="fileform"> <button type='submit' id="formsubmit">그룹 커버 이미지 첨부</button>
						</div>
                	</div>
				</form>
				
				<iframe name="zeroFrame"></iframe>
				
				<script>
							function addFilePath(msg) {
								$(".uploadedList .delbtn").closest("li").remove();
								var fileInfo = getFileInfo(msg);
								var html = template(fileInfo);

								$(".uploadedList").append(html);
								document.getElementById("form1").reset();
							}
						</script>
				
                <form action="${pageContext.request.contextPath}/group/groupNewsfeedWrite" method="post" id="postwrite">
                <input type="hidden" value="${write.grno}" name="grno">
				<input type="hidden" value="${write.memno}" name="memno">
                    <div class="row">
                      <div class="form-group col-xs-12">
                        <label for="school">게시물 내용</label>
                        
						<textarea name="grpocon" id="grpocon" cols="100"rows="3" class="form-control-add" placeholder="글을 작성해 주세요."></textarea>
                      </div>
                    </div>
                    <div class="line"></div>
                    
                    <div class="row" id="fileDropDiv">
                    	<div class="form-group col-xs-12">
	                        <label for="school">게시물 이미지 첨부</label>
	                        <div class="fileDrop" id="fileDrop"></div>
                    	</div>
                	</div>
                    <ul class="uploadedList">
					</ul>
					
                    <button type="submit" class="btn btn-primary">게시물 작성</button>
                  </form>
                </div>
              </div>
            </div>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>
<script>

	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	}); 
    
	$(".fileDrop").on("drop", function(event){
		
		event.preventDefault();
    	
    	var files = event.originalEvent.dataTransfer.files;
    	
    	var file = files[0];

    	var formData = new FormData();
    	
    	formData.append("file", file);	
    	
    	$.ajax({
    		  url: '/uploadAjax',
    		  data: formData,
    		  dataType:'text',
    		  processData: false,
    		  contentType: false,
    		  type: 'POST',
    		  success: function(data){
    			  
    			  var fileInfo = getFileInfo(data);
    			  
    			  var html = template(fileInfo);
    			  
    			  $(".uploadedList").append(html);
    		  }
    		});	
    	});
	
	$(".uploadedList").on("click", "img", function(event){
	
		event.preventDefault();
		var that = $(this);
	
	   $.ajax({
		   url:"deleteFile",
		   type:"post",
		   data: {fileName:$(this).attr("data-src")},
		   dataType:"text",
		   success:function(result){
			   if(result == 'deleted'){
				   that.parent("div").remove();
			   }
		   }
	   });
	});
	
	$("#postwrite").submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);

		that.get(0).submit();
	});
             
</script>            
            <div class="col-md-2 static">
            </div>
          </div>
        </div>
      </div>



<%@ include file="../include/footer.jspf" %>
