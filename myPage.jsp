<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%=request.getContextPath() %>
    <%
        String id = null;
      if(session.getAttribute("login_Id")!=null){
    	  id = (String)session.getAttribute("login_Id");
      }
    
    %>
<!DOCTYPE html>
<html>
<head>
<style>
ul{
   list-style:none;
   padding-left:0px;
   }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<table border="1">
<tr style="border: none"><th>회원님의 현재 등급은 <b style="color: blue;">일반</b> 입니다.</th></tr>
<tr style="border: none"><td><a href="#" onclick="GradeView()">회원등급이란?</a></td></tr>
</table>
</div>
<div>
<table>
<tr><th>내 정보 수정</th></tr>
<tr><td><a href="myPageCheck.jsp?detailwork=update&id=<%=id%>">->회원정보 수정</a></td></tr>
</table>
</div>
<br><br>
<div>
<table>
<tr><th>탈퇴하기</th></tr>
<tr><td><a href="myPageCheck.jsp?detailwork=delete&id=<%=id%>">->회원탈퇴</a></td></tr>
</table>
</div>
<br><br>
<div>
<table>
<tr><th>장바구니<th></tr>
<tr><td><a href="#">->장바구니</a></td></tr>
</table>
</div>
<br><br>
<div>
<table>
<tr><th>구매내역<th></tr>
<tr><td><a href="myorder?id=<%=id%>">주문/배송 조회</a></td></tr>
</table>
</div>
<br><br>
<div>
<table>
<tr><th>내가 작성한 댓글<th></tr>
<tr><td><a href="#" onclick="NewView();">작성한 댓글</a></td></tr>
</table>
</div>


 <!-- jQery -->
  <script  src="js/jquery-3.4.1.min.js"></script>
  <!-- bootstrap js -->
  <script  src="js/bootstrap.js"></script>
  <!-- slick slider -->
  <script  src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script  src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
  <!-- End Google Map -->

<script>

function NewView() {
	
    window.open('AnswerList.jsp?id=<%=id%>', 'newWindow', 'width=500, height=500');
  

}
function GradeView() {
	window.open('GradeView.html', 'newWindow', 'width=700, height=220');
}

</script>
</body>
</html>