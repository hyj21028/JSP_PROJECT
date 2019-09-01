package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.FavoriteList;

public class FavoriteListDAO {

	private FavoriteListDAO() {}	// 싱글톤패턴 > 생성자를 private 하고(외부에서 객체생성을 못하게 하려고)
	private static FavoriteListDAO fDao = new FavoriteListDAO();	// 객체생성
	public static FavoriteListDAO getInstance() {
		return fDao;	// 만들어진 객체를 주는 메소드를 생성 > 역시나 스태틱으로
	}

	public List<FavoriteList> getFavList() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from tblFavoriteList";
		List<FavoriteList> list = new ArrayList<FavoriteList>();
		
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				FavoriteList fList = new FavoriteList();
				
				fList.setFavorite(rs.getString("favorite"));

				
				list.add(fList);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(rs);
			DBconn.close(ps);
			DBconn.close(conn);
		}

		return list;
	}
	
}
