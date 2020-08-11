<%@page import="dto.InfoDto"%>
<%@page import="dao.InfoDao"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- <%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
mem = (MemberDto)ologin; 

InfoDao dao = InfoDao.getInstance();
List<InfoDto> list = dao.getBbsList();
%> --%>
<%
	String id = (String)request.getAttribute("id");
	System.out.println("write id : "+id);
	
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
	body {
		color: #fff;
		background: white;
	}
	.form-control {
		min-height: 41px;
		background: #f2f2f2;
		box-shadow: none !important;
		border: transparent;
		text-align: center;
	}
	.form-area {
		min-height: 700px;
		min-width: 830px;
		background: #f2f2f2;
		box-shadow: none !important;
		border: transparent;
		text-align: center;
	}
	.form-control:focus {
		background: #e2e2e2;
	}
	.form-control, .btn {        
        border-radius: 2px;
    }
	.write-form {
		width: 900px;
		height: 700px;
		margin: 30px auto;
		border-radius: 100px;
		/* opacity: 0.95; */
	}
	.write-form h2 {
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
    .write-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: black;
		border: none;
        outline: none !important;
    }
	.write-form .btn:hover, .write-form .btn:focus .form-area {
		background: #2389cd;
	}
</style>
</head>
<body>
<div class="write-form">
	<h2 class="text-center">게시글 작성</h2>   
    <form action="infomain" method="get">
        <input type="hidden" name="work" value="writeAf">
        
		<div class="form-group has-error">
       		ID:<p class="form-control" name="id"><%=id %> 
        </div> 
		<div class="form-group">
                     제목 : <input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력해주세요" required="required">
        </div>   
          
        <div class="form-group">
         	내용:<textarea class="form-area" id="area" name="content" cols="100" rows="40" placeholder="내용을 입력해주세요" required="required"></textarea>
        </div> 
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block">작성 완료</button>
            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='infomain?work=move'">목록으로 돌아가기</button>
        </div>
        
    </form>
</div>
<script type="text/javascript">
/* $(document).ready(function() {
	$("#back").click(function() {
		location.href = "./bbslist.jsp";
	});
	
	$("#front").click(function() {
		$("#frm").attr("action", "bbswriteAf.jsp").submit();
	});
}); */
</script>
</body>
</html>

