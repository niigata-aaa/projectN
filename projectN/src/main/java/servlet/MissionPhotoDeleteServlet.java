package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MissionPhotoDAO;
import model.entity.MissionPhotoBean;

/**
 * Servlet implementation class MissionPhotoDeleteServlet
 */
@WebServlet("/mission-photo-delete")
public class MissionPhotoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MissionPhotoDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "mission-photo-delete-comfirmation.jsp";

		request.setCharacterEncoding("UTF-8");
		int mission_photo_id = Integer.parseInt(request.getParameter("mission_photo_id"));
		
		try {
			MissionPhotoDAO missionPhotoDao = new MissionPhotoDAO();

			MissionPhotoBean missionPhotoBean = missionPhotoDao.selectMissionPhoto(mission_photo_id);
			request.setAttribute("missionPhoto", missionPhotoBean);
	        
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int mission_photo_id = Integer.parseInt(request.getParameter("mission_photo_id"));
		
		try {
			MissionPhotoDAO missionPhotoDao = new MissionPhotoDAO();
			missionPhotoDao.deleteMissionPhoto(mission_photo_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("mission");
	}

}
