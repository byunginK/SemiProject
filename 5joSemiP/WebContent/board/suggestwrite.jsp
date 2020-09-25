<%@page import="dto.loginDto"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<%--     <%=request.getContextPath() %> --%>
   <%
   String id = null; int auth = 3;
   MemberDto login_Dto = null;
   if(session.getAttribute("login_Dto") != null){
	   login_Dto = (MemberDto)session.getAttribute("login_Dto");
	   id = login_Dto.getId(); auth = login_Dto.getAuth();
   }  
   String GetId = request.getParameter("id");
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
  
  <title>WriteSuggest</title>
  
<%--경로설정 <%=request.getContextPath()%> --%>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
  <!--slick slider stylesheet -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />
  
   <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <!-- slick slider -->
  <!-- <link rel="stylesheet" href="css/slick-theme.css" /> --> 
  <!-- font awesome style -->
  <link href="<%=request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" />
</head>


<!-- 바디 셋팅 -->

<body>


    
<!----------- 건의사항 글쓰기 시작 --------------->
<section class="bbs_section layout_padding">
	<div class="container_padding">
		<h1>건의사항 작성</h1>
		<div class="write-form">
			 
			
				<form>
						<!-- 건의 사항 글쓰기 테이블 시작 -->
					<div class="form-group">
			                     제목 : <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" required="required">
			        </div>	
						
					<div class="form-group has-error">
						ID:<p class="form-control"><%=id %> 
			        </div> 
					
		   
					
					<div class="form-group">
			         	내용:<textarea class="form-area-bbs" id="content" name="content"  placeholder="내용을 입력해주세요" required="required"></textarea>
			        </div> 
			        
			        <div class="form-group">
			            <button type="button" class="btn btn-primary btn-lg btn-block" id="btn" value="작성">작성 완료</button>
			            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href ='../suggest?work=suggest&detailwork=suggest_main'">목록으로 돌아가기</button>
			        </div>
			</form>
			
		</div>
	</div>
</section>
<!--  건의사항 글쓰기 테이블 끝 -->


<!------------ 건의사항 글쓰기 끝 ------------>




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



 
 <!-- 글 작성시 빈칸 여부 확인 --> 

<script>
$(document).ready(function() {
	$("#btn").click(function() {
		var title = $("#title").val();  var content = $("#content").val();
		if( title == "" || content == ""){
			swal("","모두 작성해주세요","error");
		}else{
			 swal({
			     title: "건의사항 작성",
			     text: "건의사항을 등록하시겠습니까?",
			     icon: "info", 
			     buttons: true,
			}).then((update) => {
			     if (update) {
			    	 var id = "<%=id%>";
			    	 var work = "suggest"; var detailwork = "suggest_write";
			    	 content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
			    	  $.ajax({
			    		url:"../suggest",
			    		type:"post",
			    		data:{ "id":id, "title":title, "content":content, "work":work , "detailwork":detailwork},
			    		success:function(data){
			    			var isS = data.map.isS;

			    			if(isS == "YES"){
			    				swal("건의사항 적성이 완료되었습니다").then(function () {
									location.href = "../suggest?work=suggest&detailwork=suggest_main";
								});
			    			}else{
			    				swal("등록 실패", "해당 현상이 지속되면 고객센터를 통해 문의해주세요","error");
			    			}
			    		} 
			    	 })   
			  
			     }else{
			    	 
			     }
			});
		}	
	});
});

</script> 
 
</body>
</html>





