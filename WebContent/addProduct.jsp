<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>제품 추가</h1>

<div>
	<form action="addPro" method="post" enctype="multipart/form-data">
	<ul>
		<li>제품명<br><input type="text" name="p_name"></li>
		<li>원단(재료)<br><input type="text" name="p_material"></li>
		<li>제조 국가<br><input type="text" name="p_madeIn"></li>
		<li>가격<br><input type="number" name="price"></li>
		<li>카테고리 분류<br>
			<select id="selbig" name="selbig">
				<option>대분류</option>
				<option value="top">상의</option>
				<option value="bottom">하의</option>
				<option value="shoes">신발</option>
				<option value="accessary">악세사리</option>
			</select>
			<select id="selsmall" name="selsmall">
				<option>소분류</option>
			</select>
		</li>
		<li>이미지 파일<br><input type="file" name="fileload"></li>
		<li>제품 정보<br><textarea rows="10" cols="100" name="p_info"></textarea></li>
	</ul>
	<input type="submit" value="제품 추가" id="smbtn">
	</form>
</div>

<script type="text/javascript">


/* 카테고리 선택시 펼쳐지는 목록 */
$(function() {
	
	$("#selbig").change(function() {
		if(this.value == "top"){
			$("#selsmall").html("<option value='1'>긴팔</option>"
								+"<option value='2'>반팔</option>"
								+"<option value='3'>셔츠</option>"
								+"<option value='4'>니트</option>"
								+"<option value='5'>민소매</option>");
		}else if(this.value == "bottom"){
			$("#selsmall").html("<option value='1'>치마</option>"
								+"<option value='2'>긴바지</option>"
								+"<option value='3'>반바지</option>"
								+"<option value='4'>청바지</option>");
		}else if(this.value == "shoes"){
			$("#selsmall").html("<option value='1'>운동화</option>"
								+"<option value='2'>슬리퍼</option>"
								+"<option value='3'>구두</option>");
		}else if(this.value == "accessary"){
			$("#selsmall").html("<option value='1'>귀걸이</option>"
								+"<option value='2'>목걸이</option>"
								+"<option value='3'>팔찌</option>"
								+"<option value='4'>시계</option>"
								+"<option value='5'>기타</option>");
		}
	});
	
	
});
</script>

</body>
</html>