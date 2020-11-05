package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestController
 */
@WebServlet("/TestController")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */
		/*
		 * PrintWriter out=response.getWriter();
		 * out.print("<html><body><h1>Hello</h1></body></html>");
		 */
		 String a1=request.getParameter("txta");
		    String b1=request.getParameter("txtb");
		    if(a1!=null && b1!=null){//neu co du lieu
		    	 long kq=0;
				 long a=Long.parseLong(a1);
				 long b=Long.parseLong(b1);
				 if(request.getParameter("txtcong")!=null)
					 kq=a+b;
				 if(request.getParameter("txttru")!=null)
					 kq=a-b;
				 request.setAttribute("a",a);
				 request.setAttribute("b",b);
				 request.setAttribute("kq",kq);
		    }
		    RequestDispatcher rd= request.getRequestDispatcher("maytinh.jsp");
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
