package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.AlbumDAO;
import model.entity.AlbumBean;
import model.entity.UserBean;

/**
 * Servlet implementation class AlbumRegisterServlet
 */
@WebServlet("/album-register")
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
		String photoRegistration = request.getParameter("photoRegistration");
		
		
		//DAOの生成
		AlbumDAO albumdao = new AlbumDAO();
		
		int processingNumber = 0; //処理件数
		
		//セッションオブジェクトの取得
		HttpSession session = request.getSession();
		//セッションスコープからの属性値の取得
		int area_id = (int)session.getAttribute("area_id");
		//ログインユーザのセッションも
		UserBean loginUser = (UserBean)session.getAttribute("loginUser");
		
		
		AlbumBean albumbean = new AlbumBean();
		
		albumbean.setArea_id(area_id);
		albumbean.setUser_id(loginUser.getUser_id());
		albumbean.setArea_id(area_id);
		albumbean.setTrip_start(trip_start);
		albumbean.setTrip_end(trip_end);
		albumbean.setCompanion(companion);
		albumbean.setAlbum_name(album_name);
		albumbean.setMemo(memo);
		
		
		try {
			//DAOの利用
			processingNumber= albumdao.insertAlbum(albumbean);
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		//リクエストスコープへの属性の設定
		request.setAttribute("prpcessingNumber",processingNumber);
		
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("album-regi-comp.jsp");
		rd.forward(request,response);
	}

}
