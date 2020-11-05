package bo;

import java.util.ArrayList;

import bean.giohangbean;
public class giohangbo {
	public ArrayList<giohangbean> ds= new ArrayList<giohangbean>();
	private String anh;
	private String tacgia;
	public void Them (String masach, String tensach, String tacgia, long gia, long soluong, String maloai, String anh) {
		
		for(giohangbean g: ds)
			if (g.getMasach().equals(masach)) {
				g.setSoluong(g.getSoluong()+soluong);
				return;
			}
		giohangbean gh= new giohangbean(masach, tensach, tacgia, anh, gia, soluong, maloai);
		ds.add(gh);
	}
	public void suaGioHang(String maSach, String tenSach, String anh, String tacGia, long gia, int soLuong) {
	
		for (giohangbean gioHangBean : ds) {
			if ( gioHangBean.getMasach().equals(maSach)) {
				gioHangBean.setSoluong(soLuong);
				long thanhTien = soLuong * gioHangBean.getGia();
				gioHangBean.setThanhtien(thanhTien);
				return;
			}
		}
		ds.add(new giohangbean(maSach, tenSach, tacGia, anh, gia, soLuong));
	}
	
	public void xoa(String masach) {
		for(giohangbean g:ds)
			if (g.getMasach().equals(masach)) {
				ds.remove(g); break;
			}
	}
	public long tongtien() {
		long s=0;
		for (giohangbean g: ds)
			s+=g.getThanhtien();
		return s;
	}
}
