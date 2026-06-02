package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.dao.MissionPhotoDAO;
import model.entity.MissionPhotoBean;
import model.entity.UserBean;

/**
 * Servlet implementation class MissionPhotoAddServlet
 */
@WebServlet("/mission-photo-add")
@MultipartConfig(maxFileSize = 10000000, maxRequestSize = 10000000, fileSizeThreshold = 10000000)

public class MissionPhotoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MissionPhotoAddServlet() {
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
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		int cnt = 0;
		
		UserBean user  = (UserBean)session.getAttribute("loginUser");
		
		String user_id = user.getUser_id();
		int area_id = (Integer)session.getAttribute("area_id");
		
		int mission_id = Integer.parseInt(request.getParameter("mission_id"));
		Part part = request.getPart("mission_photo");
		String photo = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		String mission_photo_data = photo.isEmpty() ? "" : photo;
		
		String path = getServletContext().getRealPath("/photo");
		part.write(path + File.separator + mission_photo_data);
		
		System.out.println(user_id);
		System.out.println(area_id);
		System.out.println(mission_id);
		System.out.println(mission_photo_data);
		
		MissionPhotoBean bean = new MissionPhotoBean();
		bean.setUser_id(user_id);
		bean.setArea_id(area_id);
		bean.setMission_id(mission_id);
		bean.setMission_photo_data(mission_photo_data);
		
		
		try {
			MissionPhotoDAO missionphotoDao = new MissionPhotoDAO();
			
			cnt = missionphotoDao.insertMissionPhoto(bean);

			request.setAttribute("cnt", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("mission");
		rd.forward(request, response);
		
		

//		MissionPhotoDAO missionphotodao = new MissionPhotoDAO()
	}

}
