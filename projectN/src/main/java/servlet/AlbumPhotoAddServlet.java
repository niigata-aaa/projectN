package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
import model.entity.AlbumBean;

/**
 * Servlet implementation class AlbumPhotoAddServlet
 */
@WebServlet("/album-photo-add")
@MultipartConfig(maxFileSize = 10000000, maxRequestSize = 10000000, fileSizeThreshold = 10000000)

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

		int cnt = 0;
		
		String URL;
		
		String ErrorMessage;
		
		//セッション取得
		HttpSession session = request.getSession();

		AlbumBean albumbean = (AlbumBean) session.getAttribute("selectAlbum");

		//album_id取得
		int album_id = albumbean.getAlbum_id();
		//area_id取得
		int area_id = albumbean.getArea_id();

		// 画像をパスで取得
		List<String> photoDataList = new ArrayList<String>();
		Collection<Part> partList = request.getParts();
		for (Part part : partList) {
			if ("photo".equals(part.getName()) && part.getSubmittedFileName() != null) {
				String photo = Paths.get(part.getSubmittedFileName()).getFileName().toString();

				if (!photo.isEmpty()) {
					String path = getServletContext().getRealPath("/photo");
					part.write(path + File.separator + photo);

					photoDataList.add(photo);
				}
			}
		}

		PhotoDAO photodao = new PhotoDAO();

		try {
			for (String photo_data : photoDataList) {
				cnt = photodao.insertPhoto(album_id, area_id, photo_data);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		if (cnt == 0) {
			URL = "album-photo-add";
			ErrorMessage = "なんでかわかんないけど写真が追加できませんでした";
			request.setAttribute("ErrorMessage", ErrorMessage);
		} else {
			URL = "album-photo-add-comp.jsp";
			request.setAttribute("photoDataList", photoDataList);
		}

		RequestDispatcher rd = request.getRequestDispatcher(URL);
		rd.forward(request, response);

	}

}
