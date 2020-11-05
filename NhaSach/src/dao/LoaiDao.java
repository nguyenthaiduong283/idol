package dao;

import java.util.ArrayList;

import bean.LoaiBean;

public class LoaiDao {
	public ArrayList<LoaiBean> getLoaiSach() {
		ArrayList<LoaiBean> ds = new ArrayList<LoaiBean>();
		ds.add(new LoaiBean("toan", "Toán"));
		ds.add(new LoaiBean("tin", "Tin"));
		ds.add(new LoaiBean("ly", "Vật Lý"));
		return ds;
		
	}
}
