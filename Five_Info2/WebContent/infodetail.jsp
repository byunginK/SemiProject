<%@page import="dto.InfoDto"%>
<%@page import="dao.InfoDao"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	InfoDto dto = (InfoDto)request.getAttribute("dto");
	System.out.println("dto:"+dto.toString());

%>
<%
	String id =null;
	if(session.getAttribute("login_Id") != null){
	   id = (String)session.getAttribute("login_Id");
	   System.out.println("id:"+id);
	}
	InfoDao dao = InfoDao.getInstance();
	
	System.out.println("dto.getid:"+dto.getId());
	System.out.println("mem.getid:"+id);
%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style>
table{
	border-collapse: collapse;
	
	/* max-width: 100%; */
	
}
.container {
  margin-left: auto;
  margin-right: auto;
  padding-left: 10px;
  padding-right: 10px;
}
 .table-header {
    background-color: #95A5A6;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.03em;
    height: 40px;
    font-size: 16px;
}
  .table-row {
    background-color: #ffffff;
    box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.3);
}
.h2{
	background-color: #f0f0f0;
	 text-align: center;
}
.wri{
	text-align: right;
}
.btn {        
    font-size: 16px;
    font-weight: bold;
	background: gray;
	border: none;
    color: white;
    border-radius: 2px;
    
}
</style>
</head>
<body>
<h2 class="h2">공지사항</h2>

<div align="center" class="container">
<table border="1">
	<tr>
		<th class="table-header">작성자</th><th><%=dto.getId() %></th>
	</tr>
	<tr>
		<th class="table-header">작성일</th><th><%=dto.getWdate() %></th>
	</tr>
	<tr>
		<th class="table-header">제목</th><th><%=dto.getTitle() %></th>
	</tr>
	<tr>
		<th class="table-header">내용</th><th><textarea readonly="readonly" class="form-area" id="area" name="area" cols="80" rows="30" placeholder="내용을 입력해주세요" required="required"><%=dto.getContent() %></textarea></th>
	</tr>
</table>
<%
	if(dto.getId().equals(id)){//작성자와 로그인id가 같을때만 수정하게해라(다를경우 수정,삭제 버튼 비공개) 
%>
	<button type="button" onclick="updateBbs(<%=dto.getSeq() %>)" class="btn">수정하기</button>
	<%
	}
%>
<button type="button" onclick="bbslist(<%=dto.getSeq() %>)" class="btn">목록으로 돌아가기</button>
</div>

<script type="text/javascript">
function updateBbs() {
	location.href = "infomain?work=update&seq=<%=dto.getSeq()%>";
}

function bbslist() {
	location.href = "infomain?work=move";	

}

</script>
</body>
</html>