package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PhotoDAO;

/**
 * Servlet implementation class AdminReleaseSettingServlet
 */
@WebServlet("/AdminReleaseSettingServlet")
public class AdminReleaseSettingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReleaseSettingServlet() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		int cnt = 0;
		
		int photo_id = Integer.parseInt(request.getParameter("photo_id"));
		String photo_title = request.getParameter("photo_title");
		int is_published = Integer.parseInt(request.getParameter("is_published"));
		
		try {
			PhotoDAO photodao = new PhotoDAO();
			cnt = photodao.setteingChangePhoto(photo_id, is_published, photo_title);
			request.setAttribute("cnt", cnt);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-photo-publish-setting-comp.jsp");
		rd.forward(request,response);
	}

}
