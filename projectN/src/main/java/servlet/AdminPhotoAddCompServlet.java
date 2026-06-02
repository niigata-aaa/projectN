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
import javax.servlet.http.Part;

import model.dao.PhotoDAO;

/**
 * Servlet implementation class AdminPhotoAddCompServlet
 */
@WebServlet("/admin-photo-add-comp")
@MultipartConfig(
		maxFileSize=10000000,
		maxRequestSize=10000000,
		fileSizeThreshold=10000000
	)

public class AdminPhotoAddCompServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPhotoAddCompServlet() {
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
		
		request.setCharacterEncoding("UTF-8");
		//セッション取得
		//HttpSession session = request.getSession();
		
		
		//album_id取得
		String photo_title = (String)request.getParameter("title");
		//area_id取得
		System.out.println(request.getParameter("area_id"));
		int area_id = Integer.parseInt(request.getParameter("area_id"));
		//System.out.println(area_id);
		//写真データ登録
		Part part = request.getPart("photo");
		String photo = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		String photo_data = photo.isEmpty() ? "" : photo;
		
		String path = getServletContext().getRealPath("/photo");
		part.write(path + File.separator + photo_data);

		
		
		PhotoDAO photodao = new PhotoDAO(photo_data);
		
		try {
			//insertメソッド
			cnt = photodao.adminInsertPhoto(photo_title, area_id, photo_data);
		} catch (ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("cnt", cnt);
		
//		System.out.println(cnt);
		RequestDispatcher rd = request.getRequestDispatcher("admin-photo-add-comp.jsp");
		rd.forward(request, response);
		
		
	}

}
