package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.time.LocalDate;
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

import model.dao.AlbumDAO;
import model.dao.PhotoDAO;
import model.entity.AlbumBean;
import model.entity.UserBean;

/**
 * Servlet implementation class AlbumRegisterServlet
 */
@WebServlet("/album-register")
@MultipartConfig(
		maxFileSize=10000000,
		maxRequestSize=10000000,
		fileSizeThreshold=10000000
	)

public class AlbumRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumRegisterServlet() {
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
		//リクエストのエンコーディング方式を指定
		request.setCharacterEncoding("UTF-8");
		//リクエストパラメータの取得
		String album_name = request.getParameter("albumName");
		LocalDate trip_start = LocalDate.parse(request.getParameter("startDate"));
		LocalDate trip_end = LocalDate.parse(request.getParameter("endDate"));
		String companion = request.getParameter("companion");
		String memo = request.getParameter("memo");
		
		// 画像をパスで取得
		List<String> photoDataList = new ArrayList<String>(); 
		Collection<Part> partList = request.getParts();
		for(Part part : partList) {
			if("photoRegistration".equals(part.getName()) && part.getSubmittedFileName() != null) {
				String photo = Paths.get(part.getSubmittedFileName()).getFileName().toString();
				
				if(!photo.isEmpty()) {
					String path = getServletContext().getRealPath("/photo");
					part.write(path + File.separator + photo);
					
					photoDataList.add(photo);
				}
			}
		}

		//セッションオブジェクトの取得
		HttpSession session = request.getSession();
		//セッションスコープからの属性値の取得
		int area_id = (int)session.getAttribute("area_id");
		//ログインユーザのセッションも
		UserBean loginUser = (UserBean)session.getAttribute("loginUser");
		
		AlbumBean albumbean = new AlbumBean();
		
		albumbean.setArea_id(area_id);
		albumbean.setUser_id(loginUser.getUser_id());
		albumbean.setTrip_start(trip_start);
		albumbean.setTrip_end(trip_end);
		albumbean.setCompanion(companion);
		albumbean.setAlbum_name(album_name);
		albumbean.setMemo(memo);
		
		int generatedKey = 0; // インサートしたalbumのalbum_id 
		try {
			//DAOの生成
			AlbumDAO albumdao = new AlbumDAO();
			PhotoDAO photoDAO = new PhotoDAO();
			//DAOの利用
			generatedKey= albumdao.insertAlbum(albumbean); 
			for(String photo_data : photoDataList) {
				photoDAO.insertPhoto(generatedKey, area_id, photo_data);
			}
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		//リクエストスコープへの属性の設定
		request.setAttribute("generatedKey",generatedKey);
		
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("album-regi-comp.jsp");
		rd.forward(request,response);
	}

}
