<%@page import="dto.suggestDto"%>
<%@page import="dao.suggestDao"%>
<%@page import="dto.sug_AnswerDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%
        String id = null; int seq = 0;
        List<sug_AnswerDto> list = null;
        if(request.getParameter("id") != null && request.getParameter("seq") == null){
        	id = request.getParameter("id");	
        	 suggestDao dao = suggestDao.getInstance();
              list = dao.getMyAnswerList(id);
        }
        if(request.getParameter("seq") != null && request.getParameter("id") == null){
        	seq = Integer.parseInt(request.getParameter("seq"));
        	suggestDao dao = suggestDao.getInstance();
        	list = dao.getSu_AnswerList(seq);
        }
       
    %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Lora&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>내가 작성한 댓글</title>
<style type="text/css">
.ttop{
font-family: 'Lora', serif;
font-size: 12px;
}
.top{
font-family: 'Yanone Kaffeesatz', sans-serif;
font-size: 30px;
}
</style>
</head>
<body>
<a class="ttop">
              The best design comes from simplicity.
            </a><br>
<a class="top">Simple Five</a>
<div align="center"><h3 style="color: #293462">작성한 댓글</h3></div><hr color="#0f4c75">
<%
if(list.size()==0){
	%>
	<div align="center" style="margin-top: 150px"><span style="color: #ffa36c">작성한 댓글이 없습니다</span></div>
	<div align="right" style="margin-top: 165px">
<a href ="javascript:WinClose();" style="color: #519872;text-decoration: none;">[창닫기]</a>
</div>
<%}else{
for(int i = 0; i<list.size(); i++ ){
    sug_AnswerDto a_dto = list.get(i);
    if(a_dto.getDel() == 0){
%>


<div style=" height: 35px; margin-top: 40px"><span onclick="goSuggest('<%=a_dto.getSuggest_Seq()%>')"><%=a_dto.getContent() %></span><a style="font-size: 13px">(<%=a_dto.getAnswer_Wdate() %>)</a></div>
    	
        
        <input type="hidden" name="a_seq" value="<%=a_dto.getAnswer_Seq()%>"><input type="hidden" class="s_seq" value="<%=a_dto.getSuggest_Seq()%>">
        <hr>
<%
    }else{%>
   
  <%   }
}%>
<div align="right" style="margin-top: 255px">
<a href ="javascript:WinClose();" style="color: #519872;text-decoration: none;">[창닫기]</a>
</div>

<% }
%>

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
function goSuggest( seq ) {
	
	opener.parent.location.replace("../suggest?work=suggest&detailwork=suggest_detail&seq="+ seq);
	
}
function WinClose()

{
 window.open('','_self').close();     
}

</script>


</body>
</html>