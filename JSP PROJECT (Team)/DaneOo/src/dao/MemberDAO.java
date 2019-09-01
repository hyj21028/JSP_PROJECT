package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.Favorite;
import dto.Item;
import dto.Member;

public class MemberDAO {
	private MemberDAO() {
	}

	private static MemberDAO mDao = new MemberDAO();

	public static MemberDAO getInstance() {
		return mDao;
	}

	public void insertMember(Member member) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO tblmemberInfo(mail, pwd, gender, favorite) values (?,?,?,?)";
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getMail());
			ps.setString(2, member.getPwd());
			ps.setString(3, member.getGender());
//			ps.setString(4, member.getFavorite());
			
			//////////////////////////////////////////// 배열 나누기
			// {"인터넷", "여행", "영화"}
			// hobby[] = {"인터넷", "여행", "영화"}
			String favorite[] = member.getFavorite();
//			char fv[] = {'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'};
			String lists = "";
	        
			for (int i = 0 ; i < favorite.length; i++) 
			{
				if(favorite.length-1 == i)
				{
					lists = lists + favorite[i];
				}
				else 
				{
					lists = lists + favorite[i]+",";
				}
			}
			
			System.out.println("관심사 리스트: "+lists);
			
			
			ps.setString(4, lists); // {'1','1','0','1','0'} > "11010"
			//////////////////////////////////////////// 배열 나누기 끝
			
			int n = ps.executeUpdate();
			if (n == 1) {
				conn.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(ps);
			DBconn.close(conn);			
		}

	}

	public void updateMember(Member member) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "UPDATE tblmemberInfo SET pwd=?, content=?, loc=? WHERE mail=?";
		
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getPwd());
			ps.setString(2, member.getContent());
			ps.setString(3, member.getLoc());
			ps.setString(4, member.getMail());
			
			int n = ps.executeUpdate();
			if (n == 1) {
				conn.commit();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(ps);
			DBconn.close(conn);			
		}

	}

	public void deleteMember(String mail) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "DELETE FROM tblmemberInfo WHERE mail=?";
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, mail);
			int n = ps.executeUpdate();
			if (n == 1) {
				conn.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(ps);
			DBconn.close(conn);			
		}

	}

	public int login(String mail, String pwd) {
		int result = -1;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT pwd FROM tblmemberInfo WHERE mail =?";
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, mail);
			rs = ps.executeQuery();
			while (rs.next()) {
				if (rs.getString(1).equals(pwd)) {
					result =1;
				} else  {
					result =0;
				}
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBconn.close(rs);
			DBconn.close(ps);
			DBconn.close(conn);
		}
		return result;

	}

	public Member getMember(String mail) {
		Member member = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

//		String lists[] = {"패션", "뷰티", "출산/유아동", "식품", "주방용품"
//				, "생활용품", "홈/인테리어", "가전/디지털", "스포츠/레저", "자동차/용품"
//				, "도서/DVD음반", "완구/취미", "문구/오피스", "반려동물/용품", "헬스/건강식품"};
		
		String sql = "SELECT mail, pwd, gender, favorite FROM tblMemberInfo WHERE mail=?";
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, mail);
			rs = ps.executeQuery();
			while (rs.next()) {
				member = new Member();
				member.setMail(rs.getString("mail"));
				member.setPwd(rs.getString("pwd"));
				member.setGender(rs.getString("gender"));
				member.setFavorite(rs.getString("favorite").split(","));
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(rs);
			DBconn.close(ps);
			DBconn.close(conn);
		}
		return member;
	}
	
	public Member getMemberProfile(String mail) {
		Member member = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

//		String lists[] = {"패션", "뷰티", "출산/유아동", "식품", "주방용품"
//				, "생활용품", "홈/인테리어", "가전/디지털", "스포츠/레저", "자동차/용품"
//				, "도서/DVD음반", "완구/취미", "문구/오피스", "반려동물/용품", "헬스/건강식품"};
		
		String sql = "SELECT * FROM tblMemberInfo WHERE mail=?";
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, mail);
			rs = ps.executeQuery();
			while (rs.next()) {
				member = new Member();
				member.setMail(rs.getString("mail"));
				member.setPwd(rs.getString("pwd"));
				member.setGender(rs.getString("gender"));
				member.setFavorite(rs.getString("favorite").split(","));
				member.setContent(rs.getString("content"));
				member.setLoc(rs.getString("loc"));
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(rs);
			DBconn.close(ps);
			DBconn.close(conn);
		}
		return member;
	}
	
	public int insertMemberFavorite(String favorite, String mail, Item item) {
		int n=-1;
		Connection conn = null;
		PreparedStatement ps = null;

		String sql = "INSERT INTO tblMemberFavorite(bno, mail, favorite, title, link, image, lprice, hprice, mallName, productId, productType) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, item.getBno());
			ps.setString(2, mail);
			ps.setString(3, favorite);
			ps.setString(4, item.getTitle());
			ps.setString(5, item.getLink());
			ps.setString(6, item.getImage());
			ps.setString(7, item.getLprice());
			ps.setString(8, item.getHprice());
			ps.setString(9, item.getMallName());
			ps.setLong(10, item.getProductId());
			ps.setInt(11, item.getProductType());

			n = ps.executeUpdate();
			
			if(n == 1)
			{
				DBconn.commit(conn);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(ps);
			DBconn.close(conn);			
		}
		return n;
	}
	
	public List<Favorite> selectMemberFavorite(String mail) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "Select * from tblMemberFavorite where mail=?";
		List<Favorite> flist = new ArrayList<Favorite>();
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, mail);
			rs = ps.executeQuery();

			while (rs.next()) {
				Favorite favorite = new Favorite();
				
				favorite.setBno(rs.getString("bno"));
				favorite.setMail(rs.getString("mail"));
				favorite.setFavorite(rs.getString("favorite"));
				favorite.setTitle(rs.getString("title"));
				favorite.setLink(rs.getString("link"));
				favorite.setImage(rs.getString("image"));
				favorite.setLprice(rs.getString("lprice"));
				favorite.setHprice(rs.getString("hprice"));
				favorite.setMallName(rs.getString("mallname"));
				favorite.setProductId(rs.getLong("productid"));
				favorite.setProductType(rs.getInt("producttype"));
				
				flist.add(favorite);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(rs);
			DBconn.close(ps);
			DBconn.close(conn);
		}

		return flist;
	}
	
}
