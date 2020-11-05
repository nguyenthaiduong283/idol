<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="stylesheet" href="asset/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="asset/plugins/font-awesome/css/all.min.css">
<link rel="stylesheet" href="asset/css/index.css">
<link rel="stylesheet" href="asset/css/dang-nhap.css">
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light">
		 	<div class="nav-right">
				<a class="navbar-brand" href="trang-chu.jsp">Book Store</a>
			  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			  	<span class="navbar-toggler-icon"></span>
			   	</button>
		 	</div>
		 	<div class="nav-left">
			  	<div class="collapse navbar-collapse" id="navbarNavDropdown">
			    	<ul class="navbar-nav">
			    	  <li class="nav-item">
				        <a class="nav-link" href="#">Lịch sử mua hàng</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#"><i class="fas fa-shopping-cart"></i></a>
				      </li>
			   		</ul>
			  	</div>
		 	</div>
		</nav>
	</div>
	<h3>ĐĂNG NHẬP HỆ THỐNG</h3>
	<form method="post" action="dang-nhap.jsp" class="sign-up">
		<aside>
			<label> Tên đăng nhập:</label> <input type="text" name="username" placeholder="Nhập tên đăng nhập">
		</aside>
		<aside>
			<label> Mật khẩu: </label> <input type="password" name="password" placeholder="Nhập mật khẩu">
		</aside>
		<button class="btn-sign-up" type="submit" name="submit">Đăng nhập</button>
	</form>
	<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String kq = request.getParameter("kq");
	if (username != null)
		if (username.equals("abc")) {
			session.setAttribute("ssDangNhap", 1);
			response.sendRedirect("trang-chu.jsp");
		}
		else {
			response.sendRedirect("dang-nhap.jsp?kq=false");
		}
	if (kq != null && kq.equals("false")) {
		%>
		<p class="thong-bao">Đăng nhập thất bại!</p>
	<%}%>
</body>
</html>