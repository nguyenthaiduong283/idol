<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="dao.loaidao"%>
<%@page import="dao.sachdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sách</title>
<linkhref="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="asset/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="asset/plugins/font-awesome/css/all.min.css">
<link rel="stylesheet" href="asset/css/index.css">
<style>
.card{
width: 12rem;
}
.card-delete{
text-decoration:none;
}
.card-body p {
  margin: 0;
}
.card-body a {
  display: flex;
  justify-content: center;
  margin-top: 10px;
}
.sl{
width: 22px;
text-align: center;
}

.container-card {

  display: flex;
  justify-content: space-around;
}
.container-card .card {
 margin-top: 10px;

}
.card-img-top{
height: 250px;

}

.form-inline .form-control{
width: 140px}

.btn-xoa {
	color: #fff;
}

.btn-xoa:hover {
	text-decoration: none;
	color: #fff;
}

.tiep-tuc-mua-hang{
color: #fff;
}
.tiep-tuc-mua-hang:hover {
	color: #fff;
	text-decoration: none;
}
.so-luong{
width: 140px;
}


</style>
</head>

<body>

<div class="container">


<div class="text-center">
	<h1>BOOK STORE</h1>

</div>

 <div class="menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="nav-right">
				<a class="navbar-brand" href="SachController">
				<i class="fas fa-home"></i>Trang chủ</a>
			</div>
			<div class="nav-left">
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">Lịch sử
								mua hàng</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-shopping-cart"></i></a></li>
								<% giohangbo gh1=(giohangbo)session.getAttribute("gh");%>
					           	<% if (gh1==null){ %>
					           	<div >0</div>
					           	<%} %>
					           	<%if(gh1!=null){ %>
					           	<div> <%=gh1.ds.size() %> </div>
					           	<%} %>
						<li class="nav-item"><a class="nav-link" href="#">Đăng
								nhập</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

      
      <!-- Loai sach -->
<div class="row">

<%
	loaibo lbo=new loaibo();
	ArrayList<loaibean> ds2=lbo.getloai();
	int a=ds2.size();	
%>
<div class="col-3">
 <nav class="navbar navbar-light bg-light">
            <form class="form-inline m-auto" action="tc.jsp" method="post">
              <input
                class="form-control mr-sm-2"
                type="search"
                placeholder="Search..."
                name="txttk"
                
              />
              <button
                class="btn btn-outline-success my-2 my-sm-0"
                type="submit"
              >
                Search
              </button>
            </form>
          </nav>
	<% for(int i=0;i<a;i++){ %>
	<div class="list-group">
	     <a href="tc.jsp?maloai=<%=ds2.get(i).getMaloai()%>" class="list-group-item list-group-item-action list-group-item-light">
	     <%=ds2.get(i).getTenloai() %>
	     </a>
	</div>
	<%}%>			
</div>




    <!-- Content -->
    
    
    
    <div class="col-6">
        	  
    <h1>Giỏ Hàng</h1>
<%
	giohangbo gh=(giohangbo) session.getAttribute("gh");
	if(gh!=null){
		for(giohangbean g: gh.ds){%>
			
		<div class="card" >
			<img  class="card-img-top" alt="" src="asset/img/<%=g.getanh() %>">
			<div class="card-body">
			 <h6 class="card-title"><%=g.getTensach() %></h6>
			 <p class="card-text"><%=g.getTacgia() %></p>
			 <%-- <form action="sua.jsp">
			 	Số lượng: <input class="card-text btn1" type="submit" value="-"> 
			 	<input class="card-text sl" type="text" value="<%=g.getSoluong()%>">
			 	<input class="card-text btn1" type="submit" value="+">
			 </form> --%>
			 
			 <form class="card-text"
				action="SuaController?maSach=<%=g.getMasach()%>&ts=<%=g.getTensach()%>
							&anh=<%=g.getanh()%>&tg=<%=g.getTacgia()%>&gia=<%=g.getGia()%>"
				method="post">
				<div class="form-left">
					Giá: <span class="gia"><%=g.getGia()%>đ</span> 
					<input class="so-luong" type="number" name="soLuongCapNhat" min="1"
						value="<%=g.getSoluong()%>">
				</div>
				<div class="form-right">
					<span class="thanh-tien">Thành tiền: <%=g.getThanhtien()%>đ
					</span>
					<button class="btn btn-primary" type="submit">Cập
						nhật</button>
					<button class="btn btn-danger" type="button">
						<a class=" btn-xoa"
							href="xoa.jsp?ms=<%=g.getMasach()%>">Xóa</a>
					</button>
				</div>
			</form>
			 
			</div>
		</div>
		<%}
	}
	
%>

    </div>
 			<%
 				
				if (gh.tongtien() != 0) {
			%>
			<div class="col-3">
			
				<span class="tong-tien">Tổng tiền: <%=gh.tongtien()%>đ
				</span>
				<div class="button-area">
					<button class="btn-xoa btn-primary" type="button">
						<a class="tiep-tuc-mua-hang" href="SachController">Tiếp tục mua
							hàng</a>
					</button>
					<button class="btn-success" type="button">Thanh toán</button>
				</div>
			</div>
			<%
				} else {
			%>
			<p>Không có sản phẩm nào trong giỏ hàng!</p>
			<%
				}
			%>		

</div>
      
      
      

</div>

</body>
</html>
