
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
		String url = "album-photo-delete.jsp";

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		int albumId;
		AlbumBean sessionAlbum = (AlbumBean) session.getAttribute("selectAlbum");
		albumId = sessionAlbum.getAlbum_id();

		try {
			PhotoDAO photoDao = new PhotoDAO();

			List<PhotoBean> photoList = photoDao.displayAlbumPhoto(albumId);
			request.setAttribute("photoList", photoList);
			
			String indexStr = request.getParameter("index");
	        if (indexStr != null) {
	            int index = Integer.parseInt(indexStr);
	            
	            // 念のため範囲内かチェック
	            if (photoList != null && index >= 0 && index < photoList.size()) {
	                PhotoBean selectedPhoto = photoList.get(index);
	                request.setAttribute("selectDeletePhoto", selectedPhoto);
	                
	                // インデックスがある場合は、確認画面へ遷移先を切り替える
	                url = "album-photo-delete-comfirmation.jsp";
	            }
	        }
	        
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

		int photo_id = Integer.parseInt(request.getParameter("deletePhoto"));

		PhotoDAO dao = new PhotoDAO();

		int count = 0;

		try {
			count = dao.deletePhoto(photo_id);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("album-photo-delete-comp.jsp");
		rd.forward(request, response);
	}

}
