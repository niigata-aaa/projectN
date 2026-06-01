
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
import javax.servlet.http.HttpSession;

import model.dao.PhotoDAO;
import model.entity.AlbumBean;
import model.entity.PhotoBean;

/**
 * Servlet implementation class AlbumPhotoDeleteServlet
 */
@WebServlet("/album-photo-delete")
public class AlbumPhotoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AlbumPhotoDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		int albumId;
		AlbumBean sessionAlbum = (AlbumBean) session.getAttribute("selectAlbum");
		albumId = sessionAlbum.getAlbum_id();

		try {
			PhotoDAO photoDao = new PhotoDAO();

			List<PhotoBean> photoList = photoDao.displayAlbumPhoto(albumId);
			request.setAttribute("photoList", photoList);
			url = "album-photo-delete.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int photo_id = Integer.parseInt(request.getParameter("photo_id"));

		PhotoDAO dao = new PhotoDAO();

		int count = 0;

		try {
			count = dao.deletePhoto(photo_id);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("admin-published-photo-delete-comp.jsp");
		rd.forward(request, response);
	}

}
