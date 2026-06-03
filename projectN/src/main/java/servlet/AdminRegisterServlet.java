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
		
		String URL;
		String ErrorMessage;
		
		String user_id = request.getParameter("id");
		String password = request.getParameter("password");
		
		UserDAO userDao = new UserDAO();
		
		int count = 0;
		
		try {
			count = userDao.insertAdmin(user_id,password);
			
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(count);
		
		
		if (count == 0) {//登録失敗：登録画面に戻る
			URL = "admin-regi.jsp";
			ErrorMessage = "そのIDはすでに存在します。";
			request.setAttribute("ErrorMessage",ErrorMessage);
		} else {//登録成功：完了画面にとぶ
			URL = "admin-regi-comp.jsp";
			request.setAttribute("user_id",user_id);
			request.setAttribute("password",password);
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher(URL);
		rd.forward(request,response);
	}

}
