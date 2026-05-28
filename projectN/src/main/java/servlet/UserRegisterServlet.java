package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/user-register")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;
		
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		
		UserBean user = new UserBean();
		user.setUser_id(user_id);
		user.setPassword(password);
		
		UserDAO userDao = new UserDAO();
		
		int count = 0;
		
		try {
			count =userDao.insertUser(user);
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		if(count > 0) {
			url = "user-regi-comp";
		}else {
			url = "user-regi-error";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request,response);
				
	}

}
