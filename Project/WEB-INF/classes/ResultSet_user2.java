
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class test
 */
@WebServlet("/ResultSet_user2")
public class ResultSet_user2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

			
		PrintWriter out = response.getWriter();
		Statement stmt = null;
		Connection dbCon = null;
		String sDriver = "org.mariadb.jdbc.Driver";
		String userdb = "root";
		String passworddb = "1234";
		String url = "jdbc:mariadb://localhost:3306/1718";

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");
		
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");

		try {
			Class.forName(sDriver);
		} catch (ClassNotFoundException e) {
			System.out.println("無法載入驅動程式");
			return;
		}
		
		try {
			dbCon = DriverManager.getConnection(url, userdb, passworddb);
			stmt = dbCon.createStatement();
		} catch (SQLException e) {
			out.println("與資料來源連結錯誤");
			return;
		}

		try {
			String sql = " UPDATE homework SET password='" + password + "',name='" + name
					+ "',gender='" + gender + "',email='" + email + "' where user ='" + user + "'"; // 更新個人資料
			stmt.executeUpdate(sql);
			out.println("修改完成!");
			out.println("3秒後回歸首頁!");
			response.setHeader("refresh", "3 ; url=http://localhost:8080/Project/index.jsp");
		} catch (SQLException e) {
			System.out.println("資料來源錯誤");
			try {
				stmt.close();
				dbCon.close();
			} catch (SQLException e2) {
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
