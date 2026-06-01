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

/**
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/user-delete")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
				
		UserDAO userDao = new UserDAO();
		
		int count = 0;
		
		try {
			count = userDao.deleteUser(user_id);
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-user-delete-comp.jsp");
        rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		
		UserDAO Userdao = new UserDAO();
		
		int count = 0;
		
		try {
			count = Userdao.deleteUser(user_id);
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();    
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-published-photo-delete-comp.jsp");
		rd.forward(request, response);
	}

}
