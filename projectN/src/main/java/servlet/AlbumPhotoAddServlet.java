package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.dao.PhotoDAO;

/**
 * Servlet implementation class AlbumPhotoAddServlet
 */
@WebServlet("/album-photo-add")
@MultipartConfig(
		maxFileSize=10000000,
		maxRequestSize=10000000,
		fileSizeThreshold=10000000
	)

public class AlbumPhotoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumPhotoAddServlet() {
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
		int cnt = 0;
		
		//セッション取得
		HttpSession session = request.getSession();
		
		//album_id取得
		//int album_id = (Integer)session.getAttribute("album_id");
		//area_id取得
		//int area_id = (Integer)session.getAttribute("area_id");
		
		int album_id = 1;
		int area_id = 1;
		
		Part part = request.getPart("photo");
		String photo = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		String photo_data = photo.isEmpty() ? "" : photo;
		
		String path = getServletContext().getRealPath("/photo");
		part.write(path + File.separator + photo_data);

		
		
		PhotoDAO photodao = new PhotoDAO(photo_data);
		
		try {
			//insertメソッド
			cnt = photodao.insertPhoto(photo_data);
		} catch (ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("cnt", cnt);
		
		RequestDispatcher rd = request.getRequestDispatcher("album-photo-add.jsp");
		rd.forward(request, response);
		
	}

}
