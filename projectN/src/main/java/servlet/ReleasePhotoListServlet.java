package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AreaDAO;
import model.dao.PhotoDAO;
import model.entity.AreaBean;
import model.entity.PhotoBean;

/**
 * Servlet implementation class ReleasePhotoListServlet
 */
@WebServlet("/release-photo-list")
public class ReleasePhotoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReleasePhotoListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		
		request.setCharacterEncoding("UTF-8");
		int area_id = 0;
		if(request.getParameter("area_id") != null) {
			area_id = Integer.parseInt(request.getParameter("area_id"));
		}
		
		try {
			// 地域取得
			AreaDAO dao = new AreaDAO();
			List<AreaBean> areaList = dao.allAreaList();
			request.setAttribute("areaList",areaList);
			
			PhotoDAO photoDao = new PhotoDAO();
			List<PhotoBean> photoList = null;
			if(area_id > 0) {
				// 公開写真一覧（市町村絞り込み）
				photoList = photoDao.areaPublishedPhoto(area_id);
			} else {
				// 公開写真一覧
				photoList = photoDao.displayAllPublishedPhoto();
				
			}
			request.setAttribute("photoList", photoList);
			
			url = "published-photo.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
