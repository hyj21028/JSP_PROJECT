package db.bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	public static Connection getConnection() throws Exception{
		System.out.println("DB연결시도");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.76:1521:xe","madang","madang");
	}
	public static Connection getConnection(String ip, int port, String db, String user, String pw)throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection("jdbc:oracle:thin:@"+ip+":"+port+":"+db,user,pw);
	}
}
