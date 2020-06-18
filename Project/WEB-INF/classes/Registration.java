
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HomeWork")
public class Registration extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 接收JSP裡各個欄位值
		String usersvl, passwordsvl, namesvl, gendersvl, emailsvl;
		usersvl = request.getParameter("user");
		passwordsvl = request.getParameter("password");
		namesvl = request.getParameter("name");
		gendersvl = request.getParameter("gender");
		emailsvl = request.getParameter("email");
		Statement stmt = null;// Servlet與資料庫連接
		Connection dbCon = null;
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>註冊</title>");
		out.println("<style>@import url(my.css);</style>");
		out.print("</head><body>");
	

		String sDriver = "org.mariadb.jdbc.Driver";// 驅動程式參數
		String userdb = "root";
		String passworddb = "1234";
		String url = "jdbc:mariadb://localhost:3306/1718";
		String sql = "select * from homework;";// 查詢資料庫是否有預先建立的表格
		// 建立新增data進資料庫的指令 {
		String sqlinp0 = "insert into homework (user,password,name,gender,email) value ('usersql','pwdsql','namesql','gendersql','emailsql');";
		String sqlinp1 = sqlinp0.replace("usersql", usersvl);
		String sqlinp2 = sqlinp1.replace("pwdsql", passwordsvl);
		String sqlinp3 = sqlinp2.replace("namesql", namesvl);
		String sqlinp4 = sqlinp3.replace("gendersql", gendersvl);
		String sqlinp = sqlinp4.replace("emailsql", emailsvl);// }

		try {
			Class.forName(sDriver);// 載入JDBC driver
		} catch (ClassNotFoundException e) {
			out.print("<h3>無法載入驅動程式");
			return;
		}
		try {
			// 建立資料連結和Statement物件
			dbCon = DriverManager.getConnection(url, userdb, passworddb);
			stmt = dbCon.createStatement();
			
			stmt.executeUpdate(sqlinp);// 新增data進資料庫
			ResultSet rs = stmt.executeQuery(sql);// 查詢資料庫
			// 網頁部分
			while (rs.next()) {
				if (rs.getString("user") != usersvl && rs.getString("email") != emailsvl) {
					RequestDispatcher test = request.getRequestDispatcher("SuccessReg.jsp");
					test.forward(request, response);
				} else {
					RequestDispatcher test = request.getRequestDispatcher("ErrorMessage.jsp");
					test.forward(request, response);
				}
			}
			out.print("</body></html>");
		} catch (SQLException e) {
			// 方法一
			RequestDispatcher test = request.getRequestDispatcher("ErrorMessage.jsp");
			test.forward(request, response);

			if (dbCon != null) {
				try {
					dbCon.close();
				} catch (SQLException e2) {
				}
			}
			return;
		} finally {
			try {
				stmt.close();
				dbCon.close();
			} catch (SQLException e) {
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
