package db.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class QueryBeans {
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public QueryBeans() {
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

	public ArrayList getBookInfo(String bookName) throws Exception {
		StringBuffer sb = new StringBuffer();

		sb.append("SELECT ");
		sb.append(" BOOK_SYMBOL, BOOK_NAME, BOOK_AUTHOR, BOOK_PUBLISHER ");
		sb.append(" FROM ");
		sb.append(" BOOK_DB ");
		sb.append(" WHERE ");
		sb.append(" BOOK_NAME LIKE '%" + bookName + "%'");
		sb.append(" ORDER BY ");
		sb.append(" BOOK_NAME ");
		

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

	}//도서목록
   public int setBookInfo(String bookSymbol , String bookName, String bookAuthor, String bookPublisher ) throws Exception {
      StringBuffer sb = new StringBuffer();

       sb.append("INSERT");
       sb.append(" INTO ");
       sb.append(" BOOK_DB ");
       sb.append(" (BOOK_SYMBOL, BOOK_NAME, BOOK_AUTHOR, BOOK_PUBLISHER )"); 
       sb.append(" VALUES ");
       sb.append(" ( '"+bookSymbol+"','"+bookName+"','"+bookAuthor+"','"+bookPublisher+"')");
//       sb.append(" commit");
       int n = 0;
       System.out.println(sb.toString());
       n = stmt.executeUpdate(sb.toString());

      return n;

   }//도서목록추가
   public int updateBookInfo(String bookSymbol , String bookName, String bookAuthor, String bookPublisher  ) throws Exception {
	      StringBuffer sb = new StringBuffer();

	       sb.append("UPDATE");
	       sb.append(" BOOK_DB ");
	       sb.append(" SET "); 
	       sb.append(" BOOK_SYMBOL = '"+bookSymbol+"'," );
	       sb.append(" BOOK_NAME = '"+bookName+"',");
	       sb.append(" BOOK_AUTHOR = '"+bookAuthor+"',");
	       sb.append(" BOOK_PUBLISHER = '"+bookPublisher+"'");
	       sb.append(" WHERE ");
	       sb.append(" BOOK_SYMBOL = '"+bookSymbol+"' ");
	       //sb.append(" commit;");
	       int n = 0;
	      System.out.println(sb.toString());
	       n = stmt.executeUpdate(sb.toString());
	       System.out.println(n);

	     return n;

	   }//도서정보수
   public int deleteBookInfo(String bookName) throws Exception {
	      StringBuffer sb = new StringBuffer();

	       sb.append("DELETE"); 
	       sb.append(" FROM "); 
	       sb.append(" BOOK_DB ");
	       sb.append(" WHERE "); 
	       sb.append(" BOOK_NAME LIKE '"+ bookName+"' ");
	       //sb.append(" commit;");
	       int n = 0;
	      System.out.println(sb.toString());
	       n = stmt.executeUpdate(sb.toString());
	       System.out.println(n);

	      return n;
	   

	   } //도서정보삭제
//   도서정보 목록 끝

}

