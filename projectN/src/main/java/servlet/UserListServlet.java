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
		UserDAO userDao = new UserDAO();
		
		request.setCharacterEncoding("UTF-8");
		String user_id = "";
		if(request.getParameter("user_id") != null) {
			user_id = request.getParameter("user_id");
		}
		int post_id = 0;
		if(request.getParameter("post_id") != null) {
			post_id = Integer.parseInt(request.getParameter("post_id"));
		}
//		String user_id = request.getParameter("user_id");
//		Integer post_id = Integer.parseInt(request.getParameter("post_id"));
		
//		UserDAO userDao = new UserDAO();

		
		try {
			if(user_id != null && !(user_id.isEmpty())) {
				if(post_id != 0) {
					userList = userDao.displaySelectUser(user_id, post_id);
				}else {
					userList = userDao.displaySelectUser(user_id);
				}
				
			}else if(post_id == 1 || post_id ==  2){
				userList = userDao.displaySelectUser(post_id);
			}else {
				userList = userDao.displayAllUser();
			}
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("userList",userList);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-user-list.jsp");
		rd.forward(request,response);
	}

}
