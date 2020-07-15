<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >@import url(assets/css/ResultSet_user.css);</style>
</head>
<body>

	<%
	request.setCharacterEncoding("utf-8");
	String user = (String) session.getAttribute("user");
	Statement stmt = null; //
	Connection dbCon = null; // 連結
	String sDriver = "org.mariadb.jdbc.Driver";// 驅動程式參數
	String userdb = "root";
	String passworddb = "1234";
	String url = "jdbc:mariadb://localhost:3306/1718";
	String sql = "select * from homework where user ='" + user + "'";

	Class.forName(sDriver);// 載入JDBC driver
	// 建立資料連結和Statement物件
	dbCon = DriverManager.getConnection(url, userdb, passworddb);//資料庫登入帳號
	stmt = dbCon.createStatement();
	ResultSet rs = stmt.executeQuery(sql);// 查詢

	while (rs.next()) {
		session.setAttribute("user", rs.getString("user"));
		session.setAttribute("password", rs.getString("password"));
		session.setAttribute("name", rs.getString("name"));
		session.setAttribute("gender", rs.getString("gender"));
		session.setAttribute("email", rs.getString("email"));
	}
	String getuser = (String) session.getAttribute("user");
	String getpassword = (String) session.getAttribute("password");
	String getname = (String) session.getAttribute("name");
	String getgender = (String) session.getAttribute("gender");
	String getemail = (String) session.getAttribute("email");
	session.setAttribute("user", user);
	System.out.println(getemail);
	%>

	<h2 align="center">基本資料</h2>
	<form name="userform" method="post" action="ResultSet_user1.jsp">
		<fieldset>
			<legend>個人資料</legend>

			*帳號 ：<input type="text" name="user" size=12 value="<%=user%>"
				disabled="disabled">
			<p>
				*密碼 ：<input type="password" name="password" size=8
					value="<%=getpassword%>" disabled="disabled"> 
			<p>		
				*名字:<input
					type="name" name="name" value="<%=getname%>" disabled="disabled">
			
			<p>
				*性別：<input type="text" name="gender" value="<%=getgender%>"
					disabled="disabled"> 
			<p>		
				*電子信箱：
			<input type="text" name="email" value="<%=getemail%>"
					disabled="disabled"> 
			
			<p>
		
		<input id="input" type="submit" value="編輯資料"> <a href="index1.jsp">取消回首頁</a>
		</fieldset>
		<br>
		
	</form>
</body>
</html>