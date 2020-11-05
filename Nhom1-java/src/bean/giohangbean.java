package bean;

public class giohangbean {
	private String masach;
	private String tensach;
	private String tacgia;
	private String anh;
	private long gia;
	private long soluong;
	private long thanhtien;
	private String maloai;
	public giohangbean(String masach, String tensach, String tacgia, String anh, long gia, long soluong,String maloai) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.tacgia = tacgia;
		this.anh = anh;
		this.gia = gia;
		this.soluong = soluong;
		this.thanhtien = soluong*gia;
		this.maloai = maloai;
	}
	public String getMasach() {
		return masach;
	}
	public giohangbean(String masach, String tensach, String tacgia, String anh, long gia, long soluong) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.tacgia = tacgia;
		this.anh = anh;
		this.gia = gia;
		this.soluong = soluong;
	}
	public void setMasach(String masach) {
		this.masach = masach;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public String getTacgia() {
		return tacgia;
	}
	public void setTacgia(String tacgia) {
		this.tacgia = tacgia;
	}
	public String getanh() {
		return anh;
	}
	public void setanh(String anh) {
		this.anh = anh;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public long getThanhtien() {
		return soluong*gia;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	
}
