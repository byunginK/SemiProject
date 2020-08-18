<%@page import="dto.MemberDto"%>
<%@page import="dto.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.blistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto mem = (MemberDto) session.getAttribute("login_Dto");
	//MemberDto mem = new MemberDto("a",1);
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
	//String id = (String) session.getAttribute("id");
	String id = "a";
	//session.removeAttribute("dto");
	
	List<ReplyDto> list = (List<ReplyDto>) request.getAttribute("list");
	//System.out.println(dto.getSeq());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세페이지</title>
<script type="text/javascript" src ="<%=request.getContextPath() %>/jquery/jquery-3.5.1.min.js"></script>
<style type="text/css">
table{
	border-collapse: collapse;
}
h2{
	background-color: #f0f0f0;
	 text-align: center;
}
#dtb{
	border : 1px solid grey;
	collapse:collapse;
}
 .table-header {
    background-color: #95A5A6;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.03em;
    height: 40px;
    font-size: 16px;
}
.btn {        
    font-size: 16px;
    font-weight: bold;
	background: gray;
	border: none;
    color: white;
    border-radius: 2px;
    
}
#replycontainer{
	margin-top:30px;
}
#mine{
	margin-top:20px;
}
.grp{
  margin-left: auto;
  margin-right: auto;
  padding-left: 10px;
  padding-right: 10px;
}
#repbtn{
	margin-left:20px;
}
.itext{
	/* border: 0.2px solid grey; */
	border:none;
	box-shadow: 0px 0px 2px 0px grey;
}
</style>
</head>
<body>

<h2>Q&A 상세 페이지</h2>

<div class="grp" align="center">
<table id="tb">
	<tr>
	<td colspan="2">
	<input type="hidden" id="seq" value="<%=dto.getSeq()%>">
	</td>
	</tr>
	<tr>
	<td class="table-header">제목 </td>
	<td><input type="text" id="title" class="itext" size="97" value="<%=dto.getTitle() %>" readonly></td> 
	</tr>
	<tr>
	<td class="table-header">아이디  </td>
	<td><input type="text" id="id" size="97" value="<%=dto.getId() %>" style="border:none; text-align:left;" readonly></td> 
	</tr>
	<td class="table-header">구분</td>
	<td><input type="text" id="sel" class="itext" size="97" value="<%=dto.getPart_name() %>" readonly> </td> 
	</tr>
	<!-- 상품문의 일 경우 상품 선택 가능할 수 있도록 하기 -->
	<tr>
	<td class="table-header">내용  </td>
	<td>
	<textarea id="contents" rows="30" cols="100" class="itext" value="<%=dto.getContents() %>" readonly><%=dto.getContents() %></textarea>
	</td> 
	</tr>
</table>
</div>
<!-- 댓글 작성 -->
<div id="replycontainer" class="grp" align="center">

<!-- 댓글 가져오기 -->
<div id="dlist" class="grp">
<table id="dtb">
<col width="150"><col width="520"><col width="100">
<tr id="reptitle">
<th class="table-header" >아이디</th>
<th class="table-header">내용</th>
<th class="table-header">작성일</th>
<th class="table-header"></th>
<th class="table-header"></th>
</tr>
<% 
	if(list.size()==0){%>
	<tr class="replist">
	<td colspan="4" style="text-align:center;">작성된 댓글이 없습니다</td>
	</tr>
<%	}else{
	for(int i=0; i<list.size(); i++){ 
	ReplyDto rd = list.get(i);
%>
	<tr class="replist">
	<td><%=rd.getId() %></td>
	<td><%=rd.getContents() %></td>
	<td><%=rd.getWdate() %></td>
<% if(rd.getId().equals(id)){ %>
	<td><input type="button" id="<%=rd.getQna_seq()%>/<%=rd.getSeq() %>/<%=rd.getId() %>/<%=rd.getContents() %> " value="수정" onclick="upfunc(this.id)" class="btn"></td>
	<td><input type="button" id="<%=rd.getSeq() %>/<%=rd.getQna_seq() %> " value="삭제" onclick="delfunc(this.id)" class="btn"></td>
<%} %>	
	</tr>
<%} }%>
</table>
</div>

<!-- 댓글 추가 부분 -->
<% if( mem != null && !mem.getId().equals("") ){ %>
<div id="mine" class="grp" align="center">
<table id="minetb">
<col width="20"><col width="200"><col width="100">
<tr>
<td><input type="text" id="repid" value="<%=id %>" size="5" style="border:none; text-align:left;" ></td>
<td><textarea id="repcontents" rows="5" cols="50"></textarea></td>
<td><input type="button" id="repbtn" value="댓글 쓰기" class="btn"></td>
</tr>
</table>
</div>
<%} %>
</div>

<div id="btngrp" class="grp" align="center">
<%if(!mem.getId().equals("") && mem != null && mem.getId().equals(dto.getId()) ){ %>
<input type="button" value="수정" onclick="upbtn(<%=dto.getSeq()%>)" class="btn">
<%} %>

<input type="button" value="돌아가기" onclick="backbtn()" style="margin-top:50px;" class="btn">
</div>

<script type="text/javascript">
function backbtn() {
	location.href="./board/qna_main.jsp";
}
$("#repbtn").click(function(){
	let id = $("#repid").val();
	let repcontents = $("#repcontents").val();
	let seq = $("#seq").val();
	//console.log(id + " "+repcontents+" "+seq);
	if(repcontents.trim()==""){
		alert("댓글을 작성해주시기 바랍니다");
	}else if(repcontents.length > 120){
		alert("댓글의 최대 길이를 넘기셨습니다");
		$("#repcontents").focus();
	}else{
	 $.ajax({
			url:"./qnacont",
			type:"get", 
			datatype:"text",
			data:"work=adddetail&id="+id+"&repcontents="+repcontents+"&seq="+seq, 
			success:function(obj){
				//console.log(obj);
				//console.log(obj.ar.id);
				
				let str = "<tr class='replist'><td>"+obj.ar.id+"</td><td>"+obj.ar.contents+"</td>"
						+ "<td>"+obj.ar.wdate+"</td>";
				if(obj.ar.id == '<%=id%>' ){
					//console.log("동일");
					str += "<td><input type='button' id='"+obj.ar.qna_seq+"/"+obj.ar.seq+"/"+obj.ar.id+"/"+obj.ar.contents+"' value='수정' onclick='upfunc(this.id)' class='btn'></td>";
					str += "<td><input type='button' id='"+obj.ar.seq+"/"+obj.ar.qna_seq+"' value='삭제' onclick='delfunc(this.id)' class='btn'></td>"; 
				} 	
				str+= "</tr>";	
				
				if($(".replist").length >0){
					$(".replist").eq(-1).after(str);
				}else{
					$("#reptitle").eq(-1).after(str);
				}		
				$("#repcontents").val("");
						
			},
			error:function(){
				alert("error");
			}
		});	 
	}
});

function upfunc(data) {
	//let bfdata= data;
	data = data.split("/");
	let qnaseq = data[0];
	let rpseq = data[1]
	let id = data[2];
	let contents = data[3];
	//console.log(qnaseq +", "+rpseq+", "+id+", "+contents);
	
	window.open('./board/qna_reply_update.jsp?qnaseq='+qnaseq+"&rpseq="+rpseq+"&id="+id+"&contents="+contents,'repUpdate','width=400,height=200,left=500,top=300');
}
function delfunc(data) {
	data = data.split("/");
	let seq = data[0];
	let qnaseq = data[1];
	 $.ajax({
			url:"./qnacont",
			type:"get", 
			datatype:"text",
			data:"work=delRepOne&seq="+seq+"&qnaseq="+qnaseq, 
			success:function(obj){
				if(obj.b){
					alert("정상적으로 삭제 되었습니다");
					
					if($(".replist").length>0) {
						$(".replist").remove();
					}
					let str = "";
					for(var i=0; i<obj.list.length; i++){
						str += "<tr class='replist'><td>"+obj.list[i].id+"</td><td>"+obj.list[i].contents+"</td>"
						+ "<td>"+obj.list[i].wdate+"</td>";
						if(obj.list[i].id == '<%=id%>' ){
							str += "<td><input type='button' id='"+obj.list[i].qna_seq+"/"+obj.list[i].seq+"/"+obj.list[i].id+"/"+obj.list[i].contents+"' value='수정' onclick='upfunc(this.id)' class='btn'></td>";
							str += "<td><input type='button' id='"+obj.list[i].seq+"/"+obj.list[i].qna_seq+"' value='삭제' onclick='delfunc(this.id)' class='btn'></td>"; 
						} 	
						str+= "</tr>";
					}
					//console.log(str);
					$("#reptitle").eq(-1).after(str);
				}
						
			},
			error:function(){
				alert("error");
			}
		});	 
}
function upbtn(data) {
	//console.log(data);
	location.href="./qnacont?work=dupmove&seq="+data;
}
</script>

</body>
</html>