<%@page import="bean.GioHangBean"%>
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
<title>Giỏ hàng</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="asset/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="asset/plugins/font-awesome/css/all.min.css">
<link rel="stylesheet" href="asset/css/trang-chu.css">
<link rel="stylesheet" href="asset/css/gio-hang.css">
</head>
<body>
	<div class="container menu-top">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="nav-right">
				<a class="navbar-brand" href="trang-chu.jsp">Trang chủ</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
			<div class="nav-left">
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">Lịch sử
								mua hàng</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-shopping-cart"></i></a></li>
						<%
							if (session.getAttribute("ssDangNhap") != null) {
						%>
						<li class="nav-item"><a class="nav-link" href="dang-nhap.jsp">Đăng
								xuất</a></li>
						<%
							} else {
						%>
						<li class="nav-item"><a class="nav-link" href="dang-nhap.jsp">Đăng
								nhập</a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<section class="container search-box">
		<form class="form-inline my-2 my-lg-0 " action="trang-chu.jsp"
			method="POST">
			<input type="search" name="keyword" class="form-control mr-sm-2 "
				placeholder="Tên sách, Tên tác giả" aria-label="Search">
			<button type="submit" name="submitTimKiem"
				class="btn btn-outline-success my-2 my-sm-0">Tìm kiếm</button>
		</form>
	</section>
	<div class="container main-content">
		<aside class="menu-left">
			<ul class="list-group">
				<%
					// Hiển thị loại sách
				LoaiBo loaiBo = new LoaiBo();
				ArrayList<LoaiBean> dsLoaiSach = loaiBo.getLoai();
				for (LoaiBean loaiSach : dsLoaiSach) {
				%>
				<li class="list-group-item"><a
					href="trang-chu.jsp?maLoai=<%=loaiSach.getMaLoai()%>"
					class="list-group-item-link"><%=loaiSach.getTenLoai()%></a></li>
				<%
					}
				%>
			</ul>
		</aside>
		<aside class="menu-right">
			<h4 class="dat-hang-title">Giỏ hàng của bạn</h4>
			<div>
				<%
				GioHangBo gioHangBo = new GioHangBo();
				String maSach = request.getParameter("maSach");
				String tenSach = request.getParameter("ts");
				String anh = request.getParameter("anh");
				String tacGia = request.getParameter("tg");
				String gia = request.getParameter("gia");
				// Mua hàng lần đầu
				if (maSach != null && tenSach != null && tacGia != null && gia != null) {
					if (session.getAttribute("ssGioHang") == null) {
						session.setAttribute("ssGioHang", gioHangBo);
					}
					gioHangBo = (GioHangBo) session.getAttribute("ssGioHang");
					gioHangBo.ThemSach(maSach, tenSach, anh, tacGia, Double.parseDouble(gia), 1);
					session.setAttribute("ssGioHang", gioHangBo);
				}
				%>
				<div class="gio-hang">
					<%
						// Hiển thị sách trong session 
					if (session.getAttribute("ssGioHang") != null) {
						gioHangBo = (GioHangBo) session.getAttribute("ssGioHang");
						int n = gioHangBo.ds.size();
					%>
					<ul class="danh-sach-gio-hang">
						<%
							for (int i = 0; i < n; i++) {
							GioHangBean ss = gioHangBo.ds.get(i);
						%>
						<li class="chi-tiet-gio-hang">
							<div class="chi-tiet-trai">
								<img class="chi-tiet-anh" src="asset/img/<%=ss.getAnh()%>"
									alt="Chi tiết sản phẩm">
							</div>
							<div class="chi-tiet-phai">
								<div class="chi-tiet-phai-tren">
									<span class="ten-sach"><%=ss.getTenSach()%></span>
								</div>
								<span class="tac-gia">Tác giả: <%=ss.getTacGia()%></span>
								<div class="chi-tiet-phai-duoi">
									<form class="form-gio-hang"
										action="gio-hang-sua.jsp?maSach=<%=ss.getMaSach()%>&ts=<%=ss.getTenSach()%>
													&anh=<%=ss.getAnh()%>&tg=<%=ss.getTacGia()%>&gia=<%=ss.getGia()%>"
										method="post">
										<div class="form-left">
											Giá: <span class="gia"><%=ss.getGia()%>đ</span> <input
												class="so-luong" type="number" name="soLuongCapNhat" min="1"
												value="<%=ss.getSoLuong()%>">
										</div>
										<div class="form-right">
											<span class="thanh-tien">Thành tiền: <%=ss.getThanhTien()%>đ
											</span>
											<button class="btn btn-primary" type="submit">Cập
												nhật</button>
											<button class="btn btn-danger" type="button">
												<a class="btn-xoa"
													href="gio-hang-xoa.jsp?maSach=<%=ss.getMaSach()%>">Xóa</a>
											</button>
										</div>
									</form>
								</div>
							</div>
						</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<%
				if (gioHangBo.TongTien() != 0) {
			%>
			<div class="tong-tien-area">
				<span class="tong-tien">Tổng tiền: <%=gioHangBo.TongTien()%>đ
				</span>
				<div class="button-area">
					<button class="btn btn-primary" type="button">
						<a class="tiep-tuc-mua-hang" href="trang-chu.jsp">Tiếp tục mua
							hàng</a>
					</button>
					<button class="btn btn-success" type="button">Thanh toán</button>
				</div>
			</div>
			<%
				} else {
			%>
			<p>Không có sản phẩm nào trong giỏ hàng!</p>
			<%
				}
			%>
			<%
				}
			%>
		</aside>

	</div>

</body>
</html>