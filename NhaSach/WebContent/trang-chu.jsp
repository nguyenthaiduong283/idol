<%@page import="bo.GioHangBo"%>
<%@page import="bo.LoaiBo"%>
<%@page import="bean.LoaiBean"%>
<%@page import="bean.Sachbean"%>
<%@page import="bo.Sachbo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhà Sách HH</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="asset/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="asset/plugins/font-awesome/css/all.min.css">
<link rel="stylesheet" href="asset/css/trang-chu.css">

</head>
<body>
	<div class="container menu-top">
		<nav class="navbar navbar-expand-lg navbar-light">
		 	<div class="nav-right">
				<a class="navbar-brand" href="SachController">Trang chủ</a>
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
				        <a class="nav-link" href="gio-hang.jsp">
				        <i class="gio-hang fas fa-shopping-cart">
				         	<% GioHangBo gioHangBo = (GioHangBo) session.getAttribute("ssGioHang");
					        if ( gioHangBo == null) { %>
					        	<div class="so-luong-sp">0</div>
					        <% } else { %>
					        	<div class="so-luong-sp"><%=gioHangBo.ds.size() %></div>
					        <% } %>
				        </i>
				        </a>
				       
				      </li>
				      <%
				      	if ( session.getAttribute("ssDangNhap") != null ) {
				      		 session.removeAttribute("ssDangNhap");
				       %>
					      <li class="nav-item">
					        <a class="nav-link" href="dang-nhap.jsp">Đăng xuất</a>
					      </li>
				      <% } else { %> 
				    	  <li class="nav-item">
					        <a class="nav-link" href="dang-nhap.jsp">Đăng nhập</a>
					      </li>
				     <%} %>
			   		</ul>
			  	</div>
		 	</div>
		</nav>
	</div>
	
	<section class="container search-box">
		<form class="form-inline my-2 my-lg-0 " action="SachController" method="POST"> 
	      <input  type="search" name="keyword" class="form-control mr-sm-2 " placeholder="Tên sách, Tên tác giả" aria-label="Search">
	      <button type="submit" name="submitTimKiem" class="btn btn-outline-success my-2 my-sm-0" >Tìm kiếm</button>
	    </form>
	</section>
	<div class="container main-content">
		<aside class="menu-left">
			<ul class="list-group">
			<% // Hiển thị loại sách
				//LoaiBo loaiBo = new LoaiBo();
				ArrayList<LoaiBean> dsLoaiSach = (ArrayList<LoaiBean>) request.getAttribute("dsLoaiSach");
				for(LoaiBean loaiSach: dsLoaiSach) { 
			%>
				<li class="list-group-item">
					<a href="SachController?maLoai=<%=loaiSach.getMaLoai()%>" class="list-group-item-link"><%=loaiSach.getTenLoai() %></a>
				</li>
			<% } %>
			</ul>
		</aside>
		<aside class="menu-right">
			<table>
				<tr>
					<% // Hiển thị thông tin sách, Hiển thị kết quả tìm kiếm
						Sachbo sachBo = new Sachbo();
						ArrayList<Sachbean> ds = (ArrayList<Sachbean>) request.getAttribute("dssach");
						/* String maLoai = request.getParameter("maLoai");
						String keyword = request.getParameter("keyword");
						if ( maLoai != null ) {
							ds = sachBo.TimKiemSachTheoMa(maLoai);
						} else 
						if ( keyword != null) {
							ds = sachBo.TimKiemSachTheoTen(keyword);
						} */
						int  n = ds.size();
						for (int i = 0; i < n; i++) {
					%>
						<td>
							<td class="td-thong-tin-sach">
								<%  Sachbean ss = ds.get(i); %>
								<img  class="anh-sach" alt="Ảnh" src="asset/img/<%=ds.get(i).getAnh()%>">
								<span class="ten-sach">Tên sách: <%=ds.get(i).getTensach()%></span>
								<span class="tac-gia">Tác giả: <%=ds.get(i).getTacgia()%></span>
								<span class="gia">Giá: <%=ds.get(i).getGia()%> </span>
								<a href="gio-hang.jsp?maSach=<%=ss.getMasach()%>&ts=<%=ss.getTensach()%>&anh=<%=ss.getAnh()%>&tg=<%=ss.getTacgia()%>&gia=<%=ss.getGia()%>">
									<img alt="Đặt mua" src="asset/img/buynow.jpg">
								</a>
							</td>
						</td>
					<%
						}
					%>
				</tr>
			</table>
		</aside>
	</div>
</body>
</html>