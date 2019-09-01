package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.Item;

public class ItemDAO {
	
	private ItemDAO() {}	// 싱글톤패턴 > 생성자를 private 하고
	private static ItemDAO iDao = new ItemDAO();	// 객체생성을 스태틱으로
	public static ItemDAO getInstance() {
		return iDao;	// 만들어진 객체를 주는 메소드를 생성 > 역시나 스태틱으로
	}
	
	public List<Item> getItemList() {
		List<Item> list = new ArrayList<Item>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT /*+index_desc(ITEM_BNO_IDX)*/ a.* "
				+"FROM (select * from tblitem order by bno desc) a " 
				+"where rownum <= 16"; 
		
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
//			System.out.println(rs.getRow());

// 			-- 		"bno"
//			--		"title": "반스 올드스쿨 <b>스니커즈</b> VN000D3HY28 블랙",
//			--		"link": "https://search.shopping.naver.com/gate.nhn?id=11642661041",
//			--		"image": "https://shopping-phinf.pstatic.net/main_1164266/11642661041.20170614110340.jpg",
//			--		"lprice": "20570",
//			--		"hprice": "160000",
//			--		"mallName": "네이버",
//			--		"productId": "11642661041",
//			--		"productType": "1"
//			private int bno;
//			private String title;
//			private String link;
//			private String image;
//			private String lprice;
//			private String hprice;
//			private String mallName;
//			private int productId;
//			private int productType;			
			
			while (rs.next()) {
				Item item = new Item();
				
				item.setBno(rs.getInt("bno"));
				item.setTitle(rs.getString("title"));
				item.setLink(rs.getString("link"));
				item.setImage(rs.getString("image"));
				item.setLprice(rs.getString("lprice"));
				item.setHprice(rs.getString("hprice"));
				item.setMallName(rs.getString("mallname"));
				item.setProductId(rs.getLong("productid"));
				item.setProductType(rs.getInt("producttype"));
				item.setCount(rs.getLong("count"));
				
				list.add(item);
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

	// 게시물 등록
	public int SaveSearchItems(Item item) {
		/* 1. comparing select productId */
		/* 2. insert tblItem */
		int n = 0;
		boolean isNotEquals = true;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sqlInsert = "insert into tblItem(bno, title, link, image, lprice, hprice, mallname, productid, producttype, category) values(tblItem_seq.nextval,?,?,?,?,?,?,?,?,?)";
		String sqlSelect = "select productid from tblItem";

		try {
			conn=DBconn.getConnect();
			ps = conn.prepareStatement(sqlSelect);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				if(item.getProductId().equals(rs.getLong(1)))
				{// DB에 중복된 값이 존재함
					isNotEquals = false;
					conn.close();
					break;
				}
			}
			
			if(isNotEquals)
			{
				conn.close();
				// DB에 중복된 값이 존재하지 않음
				conn = DBconn.getConnect();
				ps = conn.prepareStatement(sqlInsert);
				ps.setString(1, item.getTitle());
				ps.setString(2, item.getLink());
				ps.setString(3, item.getImage());
				ps.setString(4, item.getLprice());
				ps.setString(5, item.getHprice());
				ps.setString(6, item.getMallName());
				ps.setLong(7, item.getProductId());
				ps.setInt(8, item.getProductType());
				ps.setString(9, item.getCategory());
				
				n = ps.executeUpdate();
				
				if(n==1)
				{
					DBconn.commit(conn);
					conn.close();
				}				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(ps);
			DBconn.close(conn);
		}
		
		return n;
	}
	
	// 검색전 갯수만큼 들고오기
	public List<Item> getBoardPage(int start, int size) {
		List<Item> list = new ArrayList<Item>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// Oracle은 limit(가져올 칼럼사이 제한두기)가 없어서 서브쿼리를 써야한다.
		//String sql = "select * from board order by bno desc limit ?,?"; // mysql 형식
		// a.bno, a.member_id, a.title, a.content, a.write_date, a.read_count, a.reply_count, a.filename : a.*
		// 1. 검색어 2. 최대로우넘 3. 최소로우넘
		String sql = "select * from " + 
				"(select /*+index_desc(ITEM_BNO_IDX)*/ rownum as rn, " + 
				"a.* " + 
				"from (select * from tblItem order by bno desc) a " + 
				"where rownum <= ?) b " + 
				"where b.rn >= ?";
		
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start+size);			// 0+10
			ps.setInt(2, start+1);				// 0+1
			rs = ps.executeQuery();

			while (rs.next()) {
				Item item = new Item();

				item.setBno(rs.getInt("bno"));
				item.setTitle(rs.getString("title"));
				item.setLink(rs.getString("link"));
				item.setImage(rs.getString("image"));
				item.setLprice(rs.getString("lprice"));
				item.setHprice(rs.getString("hprice"));
				item.setMallName(rs.getString("mallname"));
				item.setProductId(rs.getLong("productid"));
				item.setProductType(rs.getInt("producttype"));
				item.setCategory(rs.getString("category"));
				item.setCount(rs.getLong("count"));
				
				list.add(item);
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
	
	public List<Item> getSearchBoardPage(int start, int size, String category) {
		List<Item> list = new ArrayList<Item>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// Oracle은 limit(가져올 칼럼사이 제한두기)가 없어서 서브쿼리를 써야한다.
		//String sql = "select * from board order by bno desc limit ?,?"; // mysql 형식
		// a.bno, a.member_id, a.title, a.content, a.write_date, a.read_count, a.reply_count, a.filename : a.*
		// 1. 검색어 2. 최대로우넘 3. 최소로우넘
		String sql = "select * from " + 
				"(select /*+index_desc(ITEM_BNO_IDX)*/ rownum as rn, " + 
				"a.* " + 
				"from (select * from tblItem where category=? order by bno desc) a " + 
				"where rownum <= ?) b " + 
				"where b.rn >= ?";
		
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setInt(2, start+size);			// 0+10
			ps.setInt(3, start+1);				// 0+1
			
			rs = ps.executeQuery();

			while (rs.next()) {
				Item item = new Item();

				item.setBno(rs.getInt("bno"));
				item.setTitle(rs.getString("title"));
				item.setLink(rs.getString("link"));
				item.setImage(rs.getString("image"));
				item.setLprice(rs.getString("lprice"));
				item.setHprice(rs.getString("hprice"));
				item.setMallName(rs.getString("mallname"));
				item.setProductId(rs.getLong("productid"));
				item.setProductType(rs.getInt("producttype"));
				item.setCategory(rs.getString("category"));
				item.setCount(rs.getLong("count"));
				
				list.add(item);
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
	
//	// 리스트 가져오기
//	public List<Item> getBoardAll(){
//		List<Item> list = new ArrayList<Item>();
//		Connection conn = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String sql = "select * from board";
//
//		try {
//			conn = DBconn.getConnect();
//			ps = conn.prepareStatement(sql);
//			rs = ps.executeQuery();
//
//			while (rs.next()) {
//				Item item = new Item();
//				
////				item.setBno(rs.getInt("bno"));
////				item.setMember_id(rs.getString("member_id"));
////				item.setTitle(rs.getString("title"));
////				item.setContent(rs.getString("content"));
////				item.setWrite_date(rs.getTimestamp("write_date"));
////				item.setRead_count(rs.getInt("read_count"));
////				item.setReply_count(rs.getInt("reply_count"));
////				item.setFilename(rs.getString("filename"));
//				
//				list.add(item);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBconn.close(rs);
//			DBconn.close(ps);
//			DBconn.close(conn);
//		}
//
//		return list;
//	}
//	
//	
//	// 한개의 정보 가져오기
//	// 리스트 가져오기
//	public Board getBoard(int bno){
//		Board board = null;
//		Connection conn = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String sql = "select * from board where bno=?";
//
//		try {
//			conn = DBconn.getConnect();
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, bno);
//			rs = ps.executeQuery();
//
//			while (rs.next()) {
//				board = new Board();
//				
//				board.setBno(rs.getInt("bno"));
//				board.setMember_id(rs.getString("member_id"));
//				board.setTitle(rs.getString("title"));
//				board.setContent(rs.getString("content"));
//				board.setWrite_date(rs.getTimestamp("write_date"));
//				board.setRead_count(rs.getInt("read_count"));
//				board.setReply_count(rs.getInt("reply_count"));
//				board.setFilename(rs.getString("filename"));
//				
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBconn.close(rs);
//			DBconn.close(ps);
//			DBconn.close(conn);
//		}
//
//		System.out.println("board: "+board.toString());
//		return board;
//	}
//	
//	public void read_count_update(int bno) {
//		Connection conn = null;
//		PreparedStatement ps = null;
//		String sql = "update board set read_count=read_count+1 where bno=?";
//		
//
//		try {
//			conn = DBconn.getConnect();
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, bno);
//			int n = ps.executeUpdate();
//			
//			if(n == 1)
//			{
//				DBconn.commit(conn);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBconn.close(ps);
//			DBconn.close(conn);
//		}
//	}
//	
//	public void boardUpdate(Board board) {
//		Connection conn = null;
//		PreparedStatement ps = null;
//		String sql = "update board set title=?, content=?, filename=? where bno=?";
//
//		try {
//			conn = DBconn.getConnect();
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, board.getTitle());
//			ps.setString(2, board.getContent());
//			ps.setString(3, board.getFilename());
//			ps.setInt(4, board.getBno());
//
//			int n = ps.executeUpdate();
//			
//			if(n == 1)
//			{
//				conn.commit();
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBconn.close(ps);
//			DBconn.close(conn);
//		}
//	}
//	
//	public void boardDelete(int bno) {
//		Connection conn = null;
//		PreparedStatement ps = null;
//		String sql = "delete from board where bno=?";
//
//		try {
//			conn = DBconn.getConnect();
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, bno);
//			int n = ps.executeUpdate();
//
//			if(n==1)
//			{
//				conn.commit();
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBconn.close(ps);
//			DBconn.close(conn);
//		}
//	}
//
	public int getTotalCount() {
		// TODO Auto-generated method stub
		int n = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select count(*) from tblItem";
		
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				// 필드명이 함수일경우 숫자로 순서대로 가져온다.
				n=rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(rs);
			DBconn.close(ps);
			DBconn.close(conn);
		}
		
		return n;
	}
	
	public int getSearchTotalCount(String sch) {
		// TODO Auto-generated method stub
		int n = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select count(*) from tblItem where category=?";
		
		try {
			conn = DBconn.getConnect();
			ps = conn.prepareStatement(sql);
			ps.setString(1, sch);
			rs = ps.executeQuery();

			while (rs.next()) {
				// 필드명이 함수일경우 숫자로 순서대로 가져온다.
				n=rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconn.close(rs);
			DBconn.close(ps);
			DBconn.close(conn);
		}
		
		return n;
	}
//	
//	// 댓글추가
//	public void replyWrite(Reply reply) {
//		Connection conn = null;
//		PreparedStatement ps = null;
//		String sql1 = "update board set reply_count=reply_count+1 where bno=?";
//		String sql2 = "insert into reply(rno, bno, member_id, content) values(reply_seq.nextval, ?, ?, ?)";
//		
//		try {
//			conn = DBconn.getConnect();
//			ps = conn.prepareStatement(sql1);
//			ps.setInt(1, reply.getBno());
//			int m = ps.executeUpdate();
//
//			ps.close();
//			
//			ps = conn.prepareStatement(sql2);
//			ps.setInt(1, reply.getBno());
//			ps.setString(2, reply.getMember_id());
//			ps.setString(3, reply.getContent());
//			int n = ps.executeUpdate();
//
//			if(m==1 && n==1) {
//				DBconn.commit(conn);
//			} else {
//				DBconn.rollback(conn);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBconn.close(ps);
//			DBconn.close(conn);
//		}
//	}
//	
//	public void replyDelete(int rno) {
//		Connection conn = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String sql = "select bno from reply where rno=?";
//		String sql1 = "update board set reply_count=reply_count-1 where bno=?";
//		String sql2 = "delete from reply where rno=?";
//
//		try {
//			conn = DBconn.getConnect();
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, rno);
//			rs = ps.executeQuery();
//			int bno = -1;
//			
//			if(rs.next()) {
//				bno = rs.getInt(1);
//			}
//			ps.close();// ps. sql close
//
//			ps = conn.prepareStatement(sql1);
//			ps.setInt(1, bno);
//			int m = ps.executeUpdate();
//			ps.close();
//			
//			ps = conn.prepareStatement(sql2);
//			ps.setInt(1, rno);
//			
//			int n = ps.executeUpdate();
//			
//			if(m==1 && n==1) {
//				DBconn.commit(conn);
//			} else {
//				DBconn.rollback(conn);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBconn.close(ps);
//			DBconn.close(conn);
//		}
//	}
//	
//	public List<Reply> getReplyList(int bno){
//		List<Reply> list = new ArrayList<Reply>();
//		
//		Connection conn = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String sql = "select * from reply where bno=?";
//
//		try {
//			conn = DBconn.getConnect();
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1,bno);
//			rs = ps.executeQuery();
//
//			while (rs.next()) {
//				Reply reply = new Reply();
//				
//				reply.setRno(rs.getInt("rno"));
//				reply.setBno(rs.getInt("bno"));
//				reply.setMember_id(rs.getString("member_id"));
//				reply.setContent(rs.getString("content"));
//				reply.setRe_date(rs.getTimestamp("re_date"));				
//				
//				list.add(reply);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBconn.close(rs);
//			DBconn.close(ps);
//			DBconn.close(conn);
//		}
//
//		return list;
//	}
	
}
