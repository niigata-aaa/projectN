package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.AlbumDAO;
import model.entity.AlbumBean;
import model.entity.UserBean;

/**
 * Servlet implementation class AlbumListServlet
 */
@WebServlet("/album-list")
public class AlbumListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AlbumListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;

		request.setCharacterEncoding("UTF-8");

		int areaId = Integer.parseInt(request.getParameter("municipalityCode"));
		String areaName = request.getParameter("municipalityName");
		
		HttpSession session = request.getSession();
		//UserBean user = (UserBean)session.getAttribute("LoginUser");
		UserBean user = new UserBean();
		user.setUser_id("adminUSER");
		user.setPost_id(2);
		
		session.setAttribute("areaId", areaId);
		session.setAttribute("areaName", areaName);

		try {
			AlbumDAO dao = new AlbumDAO();
			
			List<AlbumBean> albumList = dao.displayAllAlbum(user, areaId);
			
			request.setAttribute("albumList", albumList);
			url = "album-list.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
