package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.AlbumDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class GeneralUserTopServlet
 */
@WebServlet("/general-user-top")
public class GeneralUserTopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneralUserTopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;
		// TODO 色付け処理
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		UserBean user = null;
		if(session.getAttribute("loginUser") != null) {
			user = (UserBean)session.getAttribute("loginUser");
			url = "user-index.jsp";
			

			String user_id = user.getUser_id();
			
			try {
				AlbumDAO dao = new AlbumDAO();
				// ログインユーザーの各市町村アルバム数カウント(area_id, カウント数)
				Map<Integer, Integer> rawAlbumCounts = dao.albumCount(user_id);
				
				// 各市町村の「ステータス（クラス名用）」を格納するMap
			    Map<String, String> cityStatusMap = new HashMap<>();
			    
			    // すべての市町村データをループしてステータスを判定
			    for (Map.Entry<Integer, Integer> entry : rawAlbumCounts.entrySet()) {
			        int cityCode = entry.getKey();
			        int count = entry.getValue();
			        String status = "0";
			        
			        // アルバム数に応じたステータスの判定
			        if (count >= 10) {
			            status = "count-10";
			        } else if (count >= 5) {
			            status = "count-5";
			        } else if (count >= 3) {
			            status = "count-3";
			        } else if(count >= 1){
			            status = "count-1";
			        } else {
			        	status = "count-0";
			        }
			        
			        // Mapに「市町村コード」と「ステータス文字列」を紐付ける
			        cityStatusMap.put(String.valueOf(cityCode), status);
			    }
			    
			    // 3. ステータス判定済みのMapをJSPに渡す
			    request.setAttribute("cityStatusMap", cityStatusMap);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			url = "main-top"; // servletに飛ばすべき？
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
