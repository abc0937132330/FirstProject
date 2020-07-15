<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("utf-8");
	Statement stmt = null; //
	Connection dbCon = null; // 連結
	String user = (String) session.getAttribute("user");
	String sDriver = "org.mariadb.jdbc.Driver";// 驅動程式參數
	String userdb = "root";
	String passworddb = "1234";
	String url = "jdbc:mariadb://localhost:3306/1718";
	String sql = "select * from homework where user ='" + user+ "'";
	
	Class.forName(sDriver);// 載入JDBC driver
	// 建立資料連結和Statement物件
	dbCon = DriverManager.getConnection(url, userdb, passworddb);//資料庫登入帳號
	stmt = dbCon.createStatement();
	ResultSet rs = stmt.executeQuery(sql);// 查詢
	%>

	<%
		while (rs.next()) {
		session.setAttribute(rs.getString("user"), "user");
		session.setAttribute(rs.getString("password"), "password");
		session.setAttribute(rs.getString("name"), "name");
		session.setAttribute(rs.getString("gender"), "gender");
		session.setAttribute(rs.getString("email"), "email");
	}

	String getuser = (String) session.getAttribute("user");
	String getpassword = (String) session.getAttribute("password");
	String getname = (String) session.getAttribute("name");
	String getgender = (String) session.getAttribute("gender");
	String getemail = (String) session.getAttribute("email");
	out.print(getemail);
	session.setAttribute("user", user);
	%>
	
		<form name="userform" method="post"
		action="http://localhost:8080/Project/ResultSet_user2">
		<!--跳到登錄 login.jsp -->
		<fieldset>
			<legend>個人資料</legend>

			*帳號 ：<input type="text" name="user" size=12 value="<%=user%>" disabled="disabled">
			<p>
				*密碼 ：<input type="password" name="password" size=8 value="<%=getpassword%>" >
			<p>
				*名字:<input type="name" name="name" value="<%=getname%>">
			<p>
				*性別：<input type="radio" name="gender" value="'M'<%=getgender%>"disabled="disabled">男
					   <input type="radio" name="gender" value="'F'<%=getgender%>"disabled="disabled">女
			<p>
				*電子信箱：<input type="text" name="email" value="<%=getemail%>">
			
			<p>
				<input type="submit"  value="確認">
				<input type="reset" name="reset" value="重新填寫"> <a
				href="ResultSet_user.jsp">取消 </a>
			</p>
		</fieldset>

	</form>


</body>
</html>