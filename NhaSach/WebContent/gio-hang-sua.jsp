<%@page import="bo.GioHangBo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa giỏ hàng</title>
</head>
<body>
	<%
		GioHangBo gioHangBo = (GioHangBo) session.getAttribute("ssGioHang");
		String maSach	= request.getParameter("maSach");
		String tenSach	= request.getParameter("ts");
		String anh		= request.getParameter("anh");
		String tacGia 	= request.getParameter("tg");
		String gia 		= request.getParameter("gia");
		String soLuongSua	= request.getParameter("soLuongCapNhat");
		gioHangBo.suaGioHang(maSach, tenSach, anh, tacGia, Double.parseDouble(gia), Integer.parseInt(soLuongSua));
		session.setAttribute("ssGioHang", gioHangBo);
		response.sendRedirect("gio-hang.jsp");
	%>
	<%=request.getParameter("maSach")%>
	<%=request.getParameter("ts")%>
	<%=request.getParameter("anh")%>
	<%=request.getParameter("tg")%>
	<%=request.getParameter("gia")%>
	<%=request.getParameter("soLuongCapNhat")%>
</body>
</html>