<%@page import="dto.InfoDto"%>
<%@page import="dao.InfoDao"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String id = (String)request.getAttribute("id");
	System.out.println("write id : "+id);
	
%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>공지사항 작성</title>


  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!--slick slider stylesheet -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />
  
   <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <!-- slick slider -->
  <!-- <link rel="stylesheet" href="css/slick-theme.css" /> --> 
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <!-- <link href="css/responsive.css" rel="stylesheet" /> -->
</head>

<!-- 바디 셋팅 -->
<body>

      
      
      
      <!-- 게시판 글쓰기 시작 -->
    <section class="bbs_section layout_padding">
      <div class="container_padding">
      
      <h1>공지사항 작성</h1> 
       
      
		<div class="write-form">
			  
		    <form action="infomain" method="get">
		        <input type="hidden" name="work" value="writeAf">
		        <input type="hidden" name="id" value="<%=id%>">
				<div class="form-group has-error">
		       		ID:<p class="form-control" ><%=id %> 
		        </div> 
				<div class="form-group">
		                     제목 : <input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력해주세요" required="required">
		        </div>   
		          
		        <div class="form-group">
		         	내용:<textarea class="form-area-bbs" id="area" name="content" placeholder="내용을 입력해주세요" required="required"></textarea>
		        </div> 
		        <div class="form-group">
		            <button type="submit" class="btn btn-primary btn-lg btn-block">작성 완료</button>
		            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='<%=request.getContextPath()%>/admin/admin_main.jsp'">목록으로 돌아가기</button>
		        </div>
		    </form>
		</div>





	  </div>
    </section>


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

</body>

</html>

