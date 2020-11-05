package dao;

import java.util.ArrayList;
import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai(){
	ArrayList<loaibean> ds=new ArrayList<loaibean>();
	ds.add(new loaibean("s1","Cong nghe thong tin"));
	ds.add(new loaibean("s2","Toan hoc"));
	ds.add(new loaibean("s3","Vat ly"));
	ds.add(new loaibean("s4","Sinh học"));
		return ds;
}
}