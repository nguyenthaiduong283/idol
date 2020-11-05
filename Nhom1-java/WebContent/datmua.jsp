<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String ms=request.getParameter("ms");
	String ts=request.getParameter("ts");
	String giatam=request.getParameter("gia");
	String ml=request.getParameter("ml");
	String a=request.getParameter("anh");
	String tg=request.getParameter("tg");
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
		response.sendRedirect("htgio.jsp");//chay ra gio hang
	}
	%>
</body>
</html>