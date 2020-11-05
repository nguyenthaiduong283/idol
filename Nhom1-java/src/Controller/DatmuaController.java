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
 * Servlet implementation class DatmuaController
 */
@WebServlet("/DatmuaController")
public class DatmuaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatmuaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ms=request.getParameter("ms");
		String ts=request.getParameter("ts");
		String giatam=request.getParameter("gia");
		String ml=request.getParameter("ml");
		String a=request.getParameter("anh");
		String tg=request.getParameter("tg");
		HttpSession session = request.getSession();
		if (ms!=null){
			giohangbo gh;
			//neu mua hang dau tien
			if (session.getAttribute("gh")==null){
				gh= new giohangbo();//tao gio hang
				session.setAttribute("gh",gh);//khoi tao session
			}
			gh=(giohangbo)session.getAttribute("gh");//1 lay session gan ra bien
			gh.Them(ms, ts,tg, Long.parseLong(giatam),1,ml,a);//2 thay doi bien
			session.setAttribute("gh", gh);//3 luu bien vao session
			RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
