package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SelectedAlbumServlet
 */
@WebServlet("/selected-album")
public class SelectedAlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectedAlbumServlet() {
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

		int albumId = Integer.parseInt(request.getParameter("album_id"));
		
		HttpSession session = request.getSession();
		session.setAttribute("album_id", albumId);
		
//		try {
//			PhotoDAO photoDao = new PhotoDAO();
//			
//			List<PhotoBean> photoList = photoDao.displayAlbumPhoto(albumId);
//			
//			request.setAttribute("photoList", photoList);
//			url = "album.jsp";
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
