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
.card-body p {
  margin: 0;
}
.card-body a {
  display: flex;
  justify-content: center;
  margin-top: 10px;
}
.container-card {

  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
.container-card .card {
 margin-top: 10px;

}
.card-img-top{
height: 250px;

}

.form-inline .form-control{
width: 140px}

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
						<li class="nav-item"><a class="nav-link" href="GiohangController"><i
								class="fas fa-shopping-cart"></i></a></li>
								<% giohangbo gh=(giohangbo)session.getAttribute("gh");%>
					           	<% if (gh==null){ %>
					           	<div >0</div>
					           	<%} %>
					           	<%if(gh!=null){ %>
					           	<div> <%=gh.ds.size() %> </div>
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
            <form class="form-inline m-auto" action="SachController" method="post">
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
	     <a href="SachController?maloai=<%=ds2.get(i).getMaloai()%>" class="list-group-item list-group-item-action list-group-item-light">
	     <%=ds2.get(i).getTenloai() %>
	     </a>
	</div>
	<%}%>			
</div>




    <!-- Content -->
    
    
    
    <div class="col-9">
        	  
      <%
	/* sachbo sbo=new sachbo();
	ArrayList<sachbean> ds=sbo.getsach();
	String ml = request.getParameter("maloai");
	if (ml != null)
		ds = sbo.TimSachTheoMa(ml);
	String key = request.getParameter("txttk");
	if (key != null)
		ds = sbo.TimSach(key); */
		ArrayList<loaibean> dsloai = (ArrayList<loaibean>)request.getAttribute("dsloai");
		ArrayList<sachbean> ds= (ArrayList<sachbean>)request.getAttribute("dssach");
		int n=ds.size();
		
%>     
    <div class=container-card>

	<% for(int i=0;i<n;i++){ %>
	<div class="card" >
	<% sachbean ss=ds.get(i); %>
		<img  class="card-img-top" alt="" src="asset/img/<%=ss.getAnh() %>">
		<div class="card-body">
		 <h6 class="card-title"><%=ss.getTensach() %></h6>
		 <p class="card-text"><%=ss.getTacgia() %></p>
		  <p class="card-text">Giá: <%=ss.getGia() %> VND</p>
		<a href="DatmuaController?ms=<%=ss.getMasach()%>&ts=<%=ss.getTensach()%>&tg=<%=ss.getTacgia()%>&gia=<%=ss.getGia()%>&ml=<%=ss.getMaloai()%>&anh=<%=ss.getAnh()%>"> <img alt="" src="asset/img/buynow.jpg"> </a> 
		</div>
	</div>
<%} %>
    	
    </div>
    	

    </div>
 


</div>
      
      
      

</div>

</body>
</html>
