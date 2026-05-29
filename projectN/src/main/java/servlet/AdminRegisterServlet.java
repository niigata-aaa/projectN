package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;

/**
 * Servlet implementation class AdminRegisterServlet
 */
@WebServlet("/admin-register")
public class AdminRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRegisterServlet() {
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
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("id");
		String password = request.getParameter("password");
		
		UserDAO userDao = new UserDAO();
		
		int count = 0;
		
		try {
			count = userDao.insertAdmin(user_id,password,post_id);
			
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("user_id",user_id);
		request.setAttribute("password",password);
		request.setAttribute("post_id",post_id);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin_regi_comp");
	}

}
