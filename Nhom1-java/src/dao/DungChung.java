package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Driver;
public class DungChung {
	public Connection cn;
	public void KetNoi() throws Exception {
		//b1 xac dinh HQTCSDL
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url="";
		cn= DriverManager.getConnection(url);
		System.out.print("Da ket noi");
	}

}
