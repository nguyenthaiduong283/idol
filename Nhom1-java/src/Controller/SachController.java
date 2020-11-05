package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.sachbean;
import bo.loaibo;
import bo.sachbo;

@WebServlet("/SachController")
public class SachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public SachController() {
        super();
    }

	loaibo lbo = new loaibo();
	sachbo sbo = new sachbo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("utf-8"); //lấy dữ lên bằng unicode
			response.setCharacterEncoding("utf-8"); //lấy dữ liệu về bằng unicode
			request.setAttribute("dsloai", lbo.getloai());
			
			String ml = request.getParameter("maloai");

			String key = request.getParameter("txttk");
			
			ArrayList<sachbean> dssach;
			
			if(ml!=null)
				dssach = sbo.TimSachTheoMa(ml);
			else
				if(key!= null)
					dssach=sbo.TimSach(key);
				else
					dssach=sbo.getsach();
			request.setAttribute("dssach", dssach);
			
			RequestDispatcher rd = request.getRequestDispatcher("tc.jsp");
			rd.forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}