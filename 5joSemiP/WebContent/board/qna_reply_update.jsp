<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int qna_seq = Integer.parseInt(request.getParameter("qnaseq"));
	int seq = Integer.parseInt(request.getParameter("rpseq"));
	String id= request.getParameter("id");
	String contents = request.getParameter("contents");
	int auth = Integer.parseInt(request.getParameter("auth"));
	//System.out.println("pop up = "+ id +" "+contents+" "+qna_seq+" "+seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<script type="text/javascript" src ="<%=request.getContextPath() %>/jquery/jquery-3.5.1.min.js"></script>
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
	margin-left:30px;
}

</style>

</head>
<body style="overflow-Y:hidden;">

<br>
<form >
<div class="form-group">

<label for="formGroupExampleInput"><b> &nbsp;&nbsp; 아이디 </b></label> 
<input type="text" readonly="readonly" value="<%=id %>" class="form-control" >
<br>
<label for="formGroupExampleInput"><b> &nbsp;&nbsp; 내용</b></label>
<%-- <input type="text" id="upcont" value="<%=contents %>" class="form-control" style="word-break:break-all;"">
 --%>
 <textarea id="upcont" class="form-control" cols="30"><%=contents %></textarea> 

<%-- 	<table id="tb">
		<col width="150px"><col width="300px">
		<tr class="table-header">
			<th>아이디</th><th>내용</th>
		</tr>
		<tr class="table-row">
			<td><%=id %></td>
			<td><input type="text" id="upcont" class="itext" value="<%=contents %>"></td>
		</tr>
	</table> --%>
<input type="button" id="upbtn" value="수정" style="margin-top:50px;" class="btn">
	
</div>
</form>


<!-- sweetalert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#upcont").focus();	
});

$("#upbtn").click(function () {
	let cont = $("#upcont").val();
	
	if(cont.trim()!="" || cont!=null){
	
	 $.ajax({
			url:"../qnacont",
			type:"get", 
			datatype:"text",
			data:"work=updateReply&id=<%=id%>&seq=<%=seq%>&qna_seq=<%=qna_seq%>&contents="+cont, 
			success:function(obj){
				if(!obj.b){
					swal("","정상적으로 수정되지 않았습니다","warning");
					/* alert("정상적으로 수정되지 않았습니다"); */
				}else{
					opener.location.href="../qnacont?work=dmove&id=<%=id%>&seq=<%=qna_seq%>&auth=<%=auth%>";
					self.close();
				}
						
			},
			error:function(){
				alert("error");
			}
		});	
	}
});
</script>


</body>
</html>