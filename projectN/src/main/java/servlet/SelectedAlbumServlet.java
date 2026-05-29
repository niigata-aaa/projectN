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
import model.dao.PhotoDAO;
import model.entity.AlbumBean;
import model.entity.PhotoBean;

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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;

		request.setCharacterEncoding("UTF-8");

		int albumId = Integer.parseInt(request.getParameter("album_id"));
		
		HttpSession session = request.getSession();
		
		try {
			PhotoDAO photoDao = new PhotoDAO();
			
			List<PhotoBean> photoList = photoDao.displayAlbumPhoto(albumId);
			
			AlbumDAO albumDAO = new AlbumDAO();
			AlbumBean album = albumDAO.selectAlbum(albumId);
			request.setAttribute("photoList", photoList);
			session.setAttribute("selectAlbum", album);
			url = "album.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
