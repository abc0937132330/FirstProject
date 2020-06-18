<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>會員登入</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
@import url(assets/css/Login.css);

.container {
	border: 1px double;
	margin: 15px auto;
	border-radius: 5px;
	box-shadow: 3px 3px 3px 3px gray;
	height: 45px;
}

</style>
<script lang="JavaScript">
	function chDataBase() {
		var fm = document.Loginform;
		str1 = new String(fm.user.value);
		var reg1 = /^([A-Z]|[a-z])[0-9]{5}$/;//帳號正規
		str2 = new String(fm.password.value);
		var reg2 = /^\w{4}$/;

		//var checked = false;
		if (reg1.test(str1) == false || reg2.test(str2) == false) {
			alert("帳號錯誤!! 請重新輸入");
			reinput();
		} else
			document.Loginform.submit();
	}
	function reinput() {
		document.Loginform.user.focus();
		document.Loginform.user.select();
	}
</script>
</head>

<body>
	<div class="container" style="background-Color: #ffdab9">
		<div class="row justify-content-start">
			<div class="col-2">
				<a href="index.jsp" target="_parent">回首頁</a>
			</div>
			<div class="col-3">
				<a>新增網址區</a>
			</div>
			<div class="col-3">
				<a>新增網址區</a>
			</div>
		</div>
	</div>
	<form name="Loginform" method="post"
		action="http://localhost:8080/Project/CheckUser">
		<h2 align="center">會員登入</h2>
		<fieldset align="center">
			<p>
				會員帳號 : <input type="text" placeholder="請輸入會員帳號" autofocus
					name="user" size="12">
			</p>
			<p>
				會員密碼 : <input type="password" placeholder="請輸入會員密碼" autofocus
					name="password" size="12">
			</p>
			<p>
				<input id="input" type="button" onclick="chDataBase()" value="送出">
				<input id="input" type="reset" value="重新輸入">
		</fieldset>
	</form>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>

</html>