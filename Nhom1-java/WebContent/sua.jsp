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
		giohangbo gioHangBo = (giohangbo) session.getAttribute("gh");
		String maSach	= request.getParameter("maSach");
		String tenSach	= request.getParameter("ts");
		String anh		= request.getParameter("anh");
		String tacGia 	= request.getParameter("tg");
		String gia 		= request.getParameter("gia");
		String soLuongSua	= request.getParameter("soLuongCapNhat");
		gioHangBo.suaGioHang(maSach, tenSach, anh, tacGia, Long.parseLong(gia), Integer.parseInt(soLuongSua));
		session.setAttribute("gh", gioHangBo);
		response.sendRedirect("htgio.jsp");
	%>
</body>
</html>