
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class CheckUser
 */
@WebServlet("/CheckUser")
public class CheckUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user, password;
		user = request.getParameter("user");
		password = request.getParameter("password");
		Statement stmt = null;
		Connection dbCon = null;
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>會員登入</title>");

		String sDriver = "org.mariadb,jdbc,Driver";
		String userdb = "root";
		String passworddb = "1234";
		String url = "jdbc:mariadb://localhost:3306/1718";
		String chksql0 = "select user,password from homework;";
		String chksql1 = chksql0.replace("usersvl", user);
		String chksql = chksql1.replace("passwordsvl", password);
		try {
			Class.forName(sDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			dbCon = DriverManager.getConnection(url, userdb, passworddb);
			stmt = dbCon.createStatement();
			ResultSet rs = stmt.executeQuery(chksql);
			while (rs.next()) {
				if (rs.getString("user").equals(user) == true && rs.getString("password").equals(password) == true) {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					RequestDispatcher test = request.getRequestDispatcher("index1.jsp");
					test.forward(request, response);
				} else {
					response.getWriter().print("<script>alert('登入帳號失敗');window.location.href='Login.jsp'</script>");

				}
			}

		} catch (SQLException e) {
			out.print(e);
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
