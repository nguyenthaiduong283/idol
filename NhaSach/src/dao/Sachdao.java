package dao;

import java.util.ArrayList;

import bean.Sachbean;

public class Sachdao {

	/**
	 * Get all book
	 * 
	 * @return list book
	 */
	public ArrayList<Sachbean> getsach() {
		
		ArrayList<Sachbean> ds = new ArrayList<Sachbean>();
		ds.add(new Sachbean("tin", "b1.jpg", "Objective-C", "Xuan Anh", "90000", "s1"));
		ds.add(new Sachbean("toan", "b2.jpg", "Số Phận", "Anh Bao", "80000", "s2"));
		ds.add(new Sachbean("tin", "b3.jpg", "Số Phân 2", "Quoc Cuong", "70000", "s3"));
		ds.add(new Sachbean("ly", "b4.jpg", "Kinh Doanh", "Thai Duong", "500000", "s4"));
		ds.add(new Sachbean("ly", "b5.jpg", "Tư duy ", "Cong Hoa", "100000", "s5"));
		return ds;
		
	}
}
