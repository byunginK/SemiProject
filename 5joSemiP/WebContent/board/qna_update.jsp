
<%@page import="dto.blistDto"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null; int auth = 3;
	MemberDto mem = (MemberDto) session.getAttribute("login_Dto");
	//MemberDto mem = new MemberDto("a",1);
	if(mem != null || !mem.getId().equals("")){
		id = mem.getId(); auth = mem.getAuth();
	}
%>
<script type="text/javascript">
let id ="<%=mem.getId()%>";
if(id == null || id==""){
	alert("로그인 해주십시오");
	//console.log("로그인해주세요");
	//location.href = "login.jsp";
}
</script>
<%
blistDto dto = (blistDto) request.getAttribute("sdto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 수정 </title>
 <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script type="text/javascript" src ="<%=request.getContextPath() %>/jquery/jquery-3.5.1.min.js"></script>
  <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" />
<style type="text/css">

</style>
</head>
<body>

<!---------------- 글 수정하기 시작 -------------->

    <section class="bbs_section layout_padding">
      <div class="container_padding">

			<h1>Q&A 수정</h1>
			
			<div class="grp" align="center">
			<table id="tb">
			<col width="100"><col width="400">
				<tr>
					<th class="table-header">제목 </th>
					<td class="table-h"><textarea type="text" id="title"  cols="85" rows="1" style="border: none"><%=dto.getTitle() %></textarea></td> 
				</tr>
				<tr>
					<th class="table-header">아이디  </th>
					<td class="table-h"><%=dto.getId() %></td> 
				</tr>
					<th class="table-header">구분</th>
					<td >
						<select id="sel" class="qnassearch">
							<option value="1">상품문의</option>
							<option value="2">배송문의</option>
							<option value="3">기타문의</option>
						</select>
					</td> 
				</tr>
				<!-- 상품문의 일 경우 상품 선택 가능할 수 있도록 하기 -->
				<tr>
					<% String scont = dto.getContents();
					   scont = scont.replace("<br/>", "\n");
					%>
				<th class="table-header">내용  </th>
				<td >
				<textarea id="contents" class="form-area"><%=scont %></textarea>
				</td> 
				</tr>
			</table>
			</div>

		<div class="grp" align="center">
			<input type="checkbox" id="secret" style="margin-left:50px;">비밀글로 등록<br>
			<input type="button" value="수정하기" onclick="wclick(<%=dto.getSeq() %>)"  class="btn">
			<input type="button" value="글 삭제하기" onclick="dclick(<%=dto.getSeq() %>)"  class="btn">
			<input type="button" value="돌아가기" onclick="history.back();"  class="btn">
		</div>
	</div>
</section>
<!-- sweetalert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	let senum = <%=dto.getSecret()%>;
	if(senum==1) $("#secret").attr("checked","checked");

	$("#sel").val('<%=dto.getPart_seq()%>').prop("selected","selcted");
});

function wclick(data) {
	let title = $("#title").val();
	let contents = $("#contents").val();
	let part = $("#sel option:selected").val();
	let secret = $("#secret").prop("checked");
	
	if(title=="" || title==null){
		swal("","제목을 입력해주세요","warning");
		/* alert("제목을 입력해주세요"); */
		$("#title").focus();
	}else if(contents=="" || contents==null){
		swal("","내용을 입력해주세요","warning");
		/* alert("내용을 입력해주세요"); */
		$("#contents").focus();
	}else{
		contents = contents.replace(/(?:\r\n|\r|\n)/g, '<br />');
		$.ajax({
			url:"<%=request.getContextPath() %>/qnacont",
			type:"get", 
			datatype:"text",
			data:"work=upQna&seq="+data+"&title="+title+"&contents="+contents+"&part="+part+"&secret="+secret, 
			success:function(obj){
				if(obj.b){
					swal("정상적으로 수정 되었습니다").then(function () {
						location.href="qnacont?work=dmove&seq="+data+"&id=<%=dto.getId()%>&auth=<%=auth%>";
					});
					<%-- alert("정상적으로 수정 되었습니다");
					location.href="qnacont?work=dmove&seq="+data+"&id=<%=dto.getId()%>&auth=<%=auth%>"; --%>
				}else{
					swal("정상적으로 수정되지 않았습니다").then(function () {
						window.location.reload;
					});
				}
			},
			error:function(){
				alert("error");
			}
		});	
	}
}
function dclick(data) {
	location.href="./qnacont?work=delQnaforup&seq="+data;
}
</script>


</body>
</html>
