package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class UserListServlet
 */
@WebServlet("/user-list")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<UserBean> userList = null;
		
		request.setCharacterEncoding("UTF-8");
		
		//int post_id = Integer.parseInt(request.getParameter("post_id"));
		
		
		UserDAO userDao = new UserDAO();
		
		try {
			userList = userDao.displayAllUser();
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("userList",userList);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-user-list.jsp");
		rd.forward(request,response);
	}

}
