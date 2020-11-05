package dao;
import java.util.ArrayList;
import bean.sachbean;
public class sachdao {
	public ArrayList<sachbean> getsach(){
		ArrayList<sachbean> ds=new ArrayList<sachbean>();
		ds.add(new sachbean("ms1","Tên Sách: Book 1","Tác giả: Pham Bao",50000,"b1.jpg","s1"));
		ds.add(new sachbean("ms2","Tên Sách: Book 2","Tác giả: Mai Ngoc",50000,"b2.jpg","s1"));
		ds.add(new sachbean("ms3","Tên Sách: Book 3","Tác giả: Pham Hung",50000,"b3.jpg","s1"));
		ds.add(new sachbean("ms5","Tên Sách: Book 4","Tác giả: Dua Xanh",50000,"b10.jpg","s4"));
		ds.add(new sachbean("ms5","Tên Sách: Book 1","Tác giả: Nhi Nhi",50000,"b5.jpg","s2"));
		ds.add(new sachbean("ms1","Tên Sách: Book 2","Tác giả: Minh Khai",50000,"b6.jpg","s2"));
		ds.add(new sachbean("ms2","Tên Sách: Book 3","Tác giả: Simon Sinek",50000,"b7.jpg","s3"));
		ds.add(new sachbean("ms3","Tên Sách: Book 4","Tác giả: MeYer",50000,"b8.jpg","s3"));
		ds.add(new sachbean("ms4","Tên Sách: Book 1","Tác giả: Nhat Thi",50000,"b9.jpg","s3"));
		ds.add(new sachbean("ms4","Tên Sách: Book 2","Tác giả: Lara Bryan",50000,"b4.jpg","s2"));
		ds.add(new sachbean("ms1","Tên Sách: Book 3","Tác giả: Luu Lam",50000,"b11.jpg","s4"));
		ds.add(new sachbean("ms2","Tên Sách: Book 4","Tác giả: Phuong Anh",50000,"b12.jpg","s4"));
		return ds;
	}
}
