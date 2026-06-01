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

import model.dao.AreaDAO;
import model.entity.AreaBean;

/**
 * Servlet implementation class AdminPhotoAddServlet
 */
@WebServlet("/admin-photo-add")
public class AdminPhotoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPhotoAddServlet() {
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
		
		List<AreaBean> areaList =null;
		
		AreaDAO dao = new AreaDAO();
		
		try {
			areaList = dao.allAreaList();
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		request.setAttribute("areaList",areaList);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-photo-add.jsp");
		rd.forward(request, response);
	}

}
