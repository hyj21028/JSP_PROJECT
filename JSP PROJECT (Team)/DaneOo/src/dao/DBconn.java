package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBconn {
	public static Connection getConnect() {
		Connection conn=null;
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/project");
			conn = ds.getConnection();
			conn.setAutoCommit(false);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn) {
		try{
			conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public static void close(PreparedStatement ps) {
		try{
			ps.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try{
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static void commit(Connection con) {
		try {
			con.commit();
			System.out.println("commit success");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection con) {
		try {
			con.rollback();
			System.out.println("rollback success");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
