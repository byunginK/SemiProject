<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String content = request.getParameter("content");
    content = content.replaceAll("<br />", "\n");
    
    String id =  request.getParameter("id");
    int seq = Integer.parseInt(request.getParameter("seq"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 댓글 수정</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
 <style type="text/css">
.btn {        
    font-size: 16px;
    font-weight: bold;
	background: gray;
	border: none;
    color: white;
    border-radius: 2px;
    width:100px;
}
form{
	width:300px;
	margin-left:20px;
}

</style>
</head>
<body>

<br>
<form id="frm">
<div class="form-group">
<input type="hidden" name="work" value="suggest"><input type="hidden" name="detailwork" value="Update_Su_Answer"><input type="hidden" name="seq" value="<%=seq%>" id="seq">
<!-- <span>댓글 수정</span><br> -->
<label for="formGroupExampleInput"><b> &nbsp;&nbsp; 댓글수정 </b></label>
 <textarea id="Su_Answer" name="content" class="form-control" cols="30"><%=content %></textarea> 
 <br>
<%-- <input type="text" id="Su_Answer" value="<%=content%>" name="content"> --%>
<button type="button" id="update" class="btn">댓글 수정</button>

</form>
</div>



 <!-- sweetalert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <!-- ajax -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<!-- jQery -->
  <script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
  <!-- cookie 아이디저장 -->
  <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- slick slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->


<script>
$(document).ready(function(){
	$("#update").click(function () {
	
		var content = $("#Su_Answer").val();
	  
		if(content ==""){
			swal("","내용을 입력해주세요","error");
		}else{
			var frm = $("#frm").serialize();
	        var seq = $("#seq").val(); 
	     
	        $.ajax({
	            type : "post",
	            url : "../suggest", 
	            data : frm, 
	            dataType : "json", 
	            success : function(data){
	            
	                $(opener.document).find("tr[id=" + seq + "]>td[id=content]").text(data.map.dto.content); 
	              
	                $(opener.document).find("tr[id=" + seq + "]>td[id=wdate]>a[id=wdate_a]").text("("+data.map.dto.answer_Wdate+")"); 
	               window.close();
	            }  
	            })
	       
	            }
	       
	
	 
	});
	
	
});


</script>
</body>
</html>