<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	//System.out.println("wirte = "+id);
%>
<%
	MemberDto mem = (MemberDto) session.getAttribute("login_Dto");
	if(mem==null){
%>
	<script type="text/javascript">
		//alert("로그인 해주십시오");
		//로그인 페이지로 이동
	</script>
<%		
	}
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Q&A 작성</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script type="text/javascript" src ="<%=request.getContextPath() %>/jquery/jquery-3.5.1.min.js"></script>
<style type="text/css">
body {
	background: white;
}
.form-control {
	min-height: 41px;
	background: #f2f2f2;
	box-shadow: none !important;
	border: transparent;
	text-align: center;
	padding-left:20px;
}
.write-form {
		width: 900px;
		height: 700px;
		margin: 30px auto;
		border-radius: 100px;
		/* opacity: 0.95; */
	}
.write-form h3 {
    margin: 10px 0 25px;
}
.write-form form {
	color: #7a7a7a;
	border-radius: 3px;
	margin-bottom: 15px;
    background: #fff;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.5);
    padding: 30px;
}
.form-area {
	min-height: 700px;
	min-width: 830px;
	background: #f2f2f2;
	box-shadow: none !important;
	border: transparent;
	text-align: center;
	padding-left:20px;
	padding-top:20px;
	padding-right:20px;
	pading-bottom:20px;
}
.write-form .btn {        
	width: 150px;
	color : white;
    font-size: 16px;
    font-weight: bold;
	background: black;
	border: none;
    outline: none !important;
}
#secret{
	color : black;
	margin-top:10px;
	margin-bottom:30px;
}
.write-form .btn:hover, .write-form .btn:focus .form-area {
	background: #2389cd;
}
</style>
</head>
<body>


<div class="write-form">
<h3 class="text-center">Q&A 작성</h3>
<form>
<div class="form-group">
제목 :<input type="text" id="title" class="form-control" placeholder="글 제목을 입력해주세요" style="text-align: left;">
</div>

<div class="form-group has-error">
ID : <p class="form-control" id="id" style="text-align: left;"><%=id %></p>
</div>

<div class="form-group">
구분 : <select id="sel" class="form-control">
		<option value="1">상품문의</option>
		<option value="2">배송문의</option>
		<option value="3">기타문의</option>
	</select>
</div>

<div class="form-group">
내용 : <textarea class="form-area" id="contents" cols="80" rows="40" placeholder="내용을 입력해주세요" style="text-align: left;"></textarea>
</div>

<%-- 
<table id="tb">
<col width="100"><col width="400">
	<tr>
	<td class="table-header">제목 </td>
	<td><input type="text" id="title" class="itext" size="200"></td> 
	</tr>
	<tr>
	<td class="table-header">아이디  </td>
	<td><input type="text" id="id" class="itext" size="200" value='<%=id %>' readonly></td> 
	</tr>
	<td class="table-header">구분</td>
	<td>
	<select id="sel" style="width:250px;" class="itext">
		<option value="1">상품문의</option>
		<option value="2">배송문의</option>
		<option value="3">기타문의</option>
	</select>
	</td> 
	</tr>
	<!-- 상품문의 일 경우 상품 선택 가능할 수 있도록 하기 -->
	<tr>
	<td class="table-header">내용  </td>
	<td>
	<textarea id="contents" class="itext" rows="30" cols="200"></textarea>
	</td> 
	</tr>
</table>
--%>
<div class="form-group" >
<input type="checkbox" id="secret">비밀글로 등록<br>
<input type="button" value="등록" onclick="wclick()" class="btn btn-primary btn-lg btn-block"><br>
<input type="button" value="목록으로 돌아가기" onclick="backbtn()" class="btn btn-primary btn-lg btn-block">
</div>
</form>

</div>


<script type="text/javascript">
function wclick(){
	let title = $("#title").val();
	let contents = $("#contents").val();
	let part = $("#sel option:selected").val();
	let secret = $("#secret").prop("checked");
	//console.log(title+" "+contents+" "+part+" "+secret);
	if(title.trim()=="" || title==null){
		alert("제목을 입력해주세요");
		$("#title").focus();
	}else if(contents.trim()=="" || contents==null){
		alert("내용을 입력해주세요");
		$("#contents").focus();
	}else{
		$.ajax({
			url:"../qnacont",
			type:"get", 
			datatype:"text",
			data:"work=addone&id=<%=id%>&title="+title+"&contents="+contents+"&part="+part+"&secret="+secret, 
			success:function(obj){
				if(obj.b){
					alert("정상적으로 추가 되었습니다");
					location.href="qna_main.jsp";
				}else{
					alert("정상적으로 추가되지 않았습니다");
					window.location.reload;
				}
			},
			error:function(){
				alert("error");
			}
		});	
	}
}
function backbtn() {
	location.href="<%=request.getContextPath()%>/board/qna_main.jsp";
}
</script>

</body>
</html>










