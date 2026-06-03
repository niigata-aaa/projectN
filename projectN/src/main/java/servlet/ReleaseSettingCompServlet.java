package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PhotoDAO;
import model.entity.PhotoBean;

/**
 * Servlet implementation class ReleaseSettingCompServlet
 */
@WebServlet("/release-setting-comp")
public class ReleaseSettingCompServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReleaseSettingCompServlet() {
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
		String ErrorMessage;
		String URL;
		
		int photo_id = Integer.parseInt(request.getParameter("photo_id"));
		String Stringphoto_id = request.getParameter("photo_id");
		String photo_title = request.getParameter("photo_title");
		int is_published = Integer.parseInt(request.getParameter("is_published"));
		
		try {
			PhotoDAO photodao = new PhotoDAO();
			cnt = photodao.setteingChangePhoto(photo_id, is_published, photo_title);
			PhotoBean photo = photodao.displaySelectPhoto(Stringphoto_id);
			request.setAttribute("photo", photo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		if (cnt == 0) {
		    URL = "release-setting";
		    ErrorMessage = "なんでかわかんないけど設定を変更できませんでした";
		    request.setAttribute("photo_id", photo_id);
		    request.setAttribute("ErrorMessage", ErrorMessage);
	    } else {
		    URL = "photo-publish-setting-comp.js";
	    }
		
		request.setAttribute("cnt", cnt);
		
		RequestDispatcher rd = request.getRequestDispatcher("photo-publish-setting-comp.jsp");
		rd.forward(request,response);
	}

}
