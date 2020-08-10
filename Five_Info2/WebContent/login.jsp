<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
		/* background: black; */
		background-image: url('./image/images (1).jpg');
		
	}
	.form-control {
		min-height: 41px;
		background: #f2f2f2;
		box-shadow: none !important;
		border: transparent;
	}
	.form-control:focus {
		background: #e2e2e2;
	}
	.form-control, .btn {        
        border-radius: 2px;
    }
	.login-form {
		width: 500px;
		margin: 30px auto;
		text-align: center;
		border-radius: 100px;
		opacity: 0.95;
	}
	.login-form h2 {
        margin: 10px 0 25px;
    }
    .login-form form {
		color: #7a7a7a;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: black;
		border: none;
        outline: none !important;
    }
	.login-form .btn:hover, .login-form .btn:focus {
		background: #2389cd;
	}
	.login-form a {
		color: #fff;
		text-decoration: underline;
	}
	.login-form a:hover {
		text-decoration: none;
	}
	.login-form form a {
		color: #7a7a7a;
		text-decoration: none;
	}
	.login-form form a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
<div class="login-form">
    <form id="frm" method="post">
        <h2 class="text-center">로그인</h2>   
        <div class="form-group has-error">
        	<input type="text" class="form-control" id="id" name="id" value=""  placeholder="유저 아이디" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" id="pwd" name="pwd" value="" placeholder="비밀번호" required="required">
        </div>        
        <div class="form-group">
            <button type="button" id="_btnLogin" class="btn btn-primary btn-lg btn-block" value="로그인">로그인 하기</button>
        </div>
        <input type="checkbox" name="check" id="chk_save_id">아이디 기억하기
        <p><a href="searchpwd">비밀번호 찾기</a></p>
    </form>
    <p class="text-center small">계정 만들기 <a href="regi.jsp">클릭!</a></p>
</div>
<script type="text/javascript">
$("#_btnLogin").click(function() {
	//alert("click");
	if ($("#id").val().trim() == "") {
		alert("id를 입력해 주십시오");
		$("#id").focus();
	}else if ($("#pwd").val().trim() == "") {
		alert("password를 입력해 주십시오");
		$("#pwd").focus();
	}else {
		$("#frm").attr("action", "loginAf.jsp").submit();
	}
});


//cookie : String	-> id
//session : Object	-> login 개인정보
let user_id = $.cookie("user_id");
if (user_id != null) {//아이디가 있을 때
	//alert("cookie 있음");
	$("#id").val(user_id);
	$("#chk_save_id").attr("checked", "checked");
}
$("#chk_save_id").click(function() {
	if ($("#chk_save_id").is(":checked")) {//체크 되었을때
		//alert('체크됨');
		//cookie ID저장(페이지 껏다가 켜도 아이디 저장되어있음)
		if ($("#id").val().trim() == "") {//id가 빈 상태로 check를 누르면 에러알림창이 뜸
			alert("id를 입력해 주십시오");
			$("#chk_save_id").prop("checked", false);
		}else {
			$.cookie("user_id", $("#id").val().trim(), {expires:7, path:'/'})//기한 7일
		}
	}else {
		//alert('체크 없어짐');
		//cookie 삭제
		$.removeCookie("user_id", {path:'/'});
	}
});

</script>
</body>
</html>






















