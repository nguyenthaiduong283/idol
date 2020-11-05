package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class SuaController
 */
@WebServlet("/SuaController")
public class SuaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		giohangbo gioHangBo = (giohangbo) session.getAttribute("gh");
		String maSach	= request.getParameter("maSach");
		String tenSach	= request.getParameter("ts");
		String anh		= request.getParameter("anh");
		String tacGia 	= request.getParameter("tg");
		String gia 		= request.getParameter("gia");
		String soLuongSua	= request.getParameter("soLuongCapNhat");
		gioHangBo.suaGioHang(maSach, tenSach, anh, tacGia, Long.parseLong(gia), Integer.parseInt(soLuongSua));
		session.setAttribute("gh", gioHangBo);
		RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
