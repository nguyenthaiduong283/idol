<%@page import="bo.GioHangBo"%>
<%@page import="bean.GioHangBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xóa khỏi giỏ hàng</title>
</head>
<body>
	<%
		GioHangBo gioHangBo = (GioHangBo) session.getAttribute("ssGioHang");
		gioHangBo.xoa(request.getParameter("maSach"));
		session.setAttribute("ssGioHang", gioHangBo);
		response.sendRedirect("gio-hang.jsp");
	%>
</body>
</html>