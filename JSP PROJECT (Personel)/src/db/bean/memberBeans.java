package db.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class memberBeans {
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public memberBeans() {
		conn = null;
		stmt = null;
		rs = null;
	}

	public void getConnection() {
		try {
			conn = DBconnection.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	public void closeConnection() {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	// 관리자정보 
	public ArrayList getMemInfo(String mem_id) throws Exception {
		StringBuffer sb = new StringBuffer();

		sb.append("SELECT ");
		sb.append(" M_FNAME, M_LNAME, M_ID, M_PWD, M_MAIL ");
		sb.append(" FROM ");
		sb.append(" BOOK_MEMBER  ");
		sb.append(" WHERE ");
		sb.append(" M_ID LIKE '%" + mem_id + "%'");
		sb.append(" ORDER BY ");
		sb.append(" M_ID ");

		System.out.println(sb.toString());
		rs = stmt.executeQuery(sb.toString());

		ArrayList res = new ArrayList();
		while (rs.next()) {
			res.add(rs.getString(1));
			res.add(rs.getString(2));
			res.add(rs.getString(3));
			res.add(rs.getString(4));

		}
		return res;

	}// 회원검색

	public int setMemInfo(String mem_firstName, String mem_lastName, String mem_id, String mem_pwd, String mem_mail) throws Exception {
		StringBuffer sb = new StringBuffer();

		sb.append("INSERT");
		sb.append(" INTO ");
		sb.append(" BOOK_MEMBER  ");
		sb.append(" ( M_FNAME, M_LNAME, M_ID, M_PWD, M_MAIL )");
		sb.append(" VALUES ");
		sb.append(" ( '" + mem_firstName + "','" + mem_lastName + "','" + mem_id + "','" + mem_pwd + "','" + mem_mail + "')");
        //sb.append(" commit");
		int n = 0;
		System.out.println(sb.toString());
		n = stmt.executeUpdate(sb.toString());

		return n;

	}// 회원정보추가

	public int updateMemInfo(String mem_firstName, String mem_lastName, String mem_id, String mem_pwd, String mem_mail) throws Exception {
		StringBuffer sb = new StringBuffer();

		sb.append("UPDATE");
		sb.append(" BOOK_MEMBER  ");
		sb.append(" SET ");
		sb.append(" M_FNAME = '" + mem_firstName + "',");
		sb.append(" M_LNAME = '" + mem_lastName + "',");
		sb.append(" M_ID = '" + mem_id + "',");
		sb.append(" M_PWD = '" + mem_pwd + "',");
		sb.append(" M_MAIL = '" + mem_mail + "'");
		sb.append(" WHERE ");
		sb.append(" M_ID = '" + mem_id + "' ");
		int n = 0;
		System.out.println(sb.toString());
		n = stmt.executeUpdate(sb.toString());
		System.out.println(n);

		return n;

	}// 회원정보수정

	public int deleteMemInfo(String mem_id) throws Exception {
		StringBuffer sb = new StringBuffer();

		sb.append("DELETE");
		sb.append(" FROM ");
		sb.append(" BOOK_MEMBER  ");
		sb.append(" WHERE ");
		sb.append(" M_ID  LIKE '" + mem_id + "' ");
		// sb.append(" commit;");
		int n = 0;
		System.out.println(sb.toString());
		n = stmt.executeUpdate(sb.toString());
		System.out.println(n);

		return n;

	} // 회원정보삭제

}
