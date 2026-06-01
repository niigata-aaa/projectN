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

/**
 * Servlet implementation class AlbumEditServlet
 */
@WebServlet("/album-edit")
public class AlbumEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AlbumEditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//セッションオブジェクトの取得
		HttpSession session = request.getSession();

		//セッションスコープからの属性値の取得
		AlbumBean album = (AlbumBean) session.getAttribute("selectAlbum");

		//DAOの生成
		AlbumDAO dao = new AlbumDAO();

		int processingNumber = 0;//処理件数

		try {
			//DAOの利用
			processingNumber = dao.updateAlbum(album);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		//リクエストスコープへの属性への設定
		request.setAttribute("processingNumber", processingNumber);

		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("album-edit-comp.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// album-edit.jspから送られた入力内容を取得
		request.setCharacterEncoding("UTF-8");

		String album_name = request.getParameter("albumName");
		LocalDate trip_start = LocalDate.parse(request.getParameter("startDate"));
		LocalDate trip_end = LocalDate.parse(request.getParameter("endDate"));
		String companion = request.getParameter("companion");
		String memo = request.getParameter("memo");

		//セッションオブジェクトの取得
		HttpSession session = request.getSession();

		//セッションスコープからの属性値の取得
		AlbumBean sessionAlbum = (AlbumBean) session.getAttribute("selectAlbum");
		int album_id = sessionAlbum.getAlbum_id();
		
		AlbumBean editAlbum = new AlbumBean();
		editAlbum.setAlbum_id(album_id);
		editAlbum.setAlbum_name(album_name);
		editAlbum.setTrip_start(trip_start);
		editAlbum.setTrip_end(trip_end);
		editAlbum.setCompanion(companion);
		editAlbum.setMemo(memo);
		
		// 編集内容をsessionに格納
		session.setAttribute("editAlbum", editAlbum);
		
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("album-edit-confirmation.jsp");
		rd.forward(request, response);
	}

}
