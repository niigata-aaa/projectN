package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.MissionPhotoDAO;
import model.entity.MissionPhotoBean;
import model.entity.UserBean;

/**
 * Servlet implementation class MissionServlet
 */
@WebServlet("/mission")
public class MissionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MissionServlet() {
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
		
		List<MissionPhotoBean> yurucharaPhotoList = new ArrayList<MissionPhotoBean>();
		List<MissionPhotoBean> gurmentPhotoList = new ArrayList<MissionPhotoBean>();
		List<MissionPhotoBean> sightseePhotoList = new ArrayList<MissionPhotoBean>();

		
		int yurucharaCnt = 0;
		int gurmentCnt = 0;
		int sightseeCnt = 0;
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		UserBean user  = (UserBean)session.getAttribute("loginUser");
		
		String user_id = user.getUser_id();
		int area_id = (Integer)session.getAttribute("area_id");
		
		try {
			MissionPhotoDAO missionphotoDao = new MissionPhotoDAO();
			
			yurucharaPhotoList = missionphotoDao.displayCategoryPhoto(1, user_id, area_id);
			gurmentPhotoList = missionphotoDao.displayCategoryPhoto(2, user_id, area_id);
			sightseePhotoList = missionphotoDao.displayCategoryPhoto(3, user_id, area_id);
			
			yurucharaCnt = missionphotoDao.photoCount(1, user_id, area_id);
			gurmentCnt = missionphotoDao.photoCount(2, user_id, area_id);
			sightseeCnt = missionphotoDao.photoCount(3, user_id, area_id);
			
			request.setAttribute("yurucharaPhotoList", yurucharaPhotoList);
			request.setAttribute("gurmentPhotoList", gurmentPhotoList);
			request.setAttribute("sightseePhotoList", sightseePhotoList);
			
			request.setAttribute("yurucharaCnt", yurucharaCnt);
			request.setAttribute("gurmentCnt", gurmentCnt);
			request.setAttribute("sightseeCnt", sightseeCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("mission.jsp");
		rd.forward(request, response);
	}

}
