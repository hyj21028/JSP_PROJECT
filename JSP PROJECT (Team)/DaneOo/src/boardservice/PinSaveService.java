package boardservice;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dao.MemberDAO;
import dto.Favorite;
import dto.Item;
import dto.Member;
import service.Service;

public class PinSaveService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			request.setCharacterEncoding("UTF-8");
		
			try {
			// 버퍼로 읽어오기
		    StringBuffer jsonbuff = new StringBuffer();
		    String line = null;
//	        JSONParser parser = new JSONParser();
	        JSONArray arr = null;
	        JSONObject obj = null;

//		    System.out.println("왜 안되니?");
		    JSONParser parser = new JSONParser();
	        BufferedReader reader = request.getReader();
//	        System.out.println(reader);
		        while((line = reader.readLine()) != null) {
		        	jsonbuff.append(line);
		        	
	        }		        
	        reader.close();
	        
		    System.out.println("받아온 jsonbuff: "+jsonbuff.toString());   
		    
		    String str = new String(jsonbuff).replace("\\", "");
		   		    
//		    System.out.println("raw sts: "+str);
		    
		    str = str.substring(1, str.length()-1);
		    
//		    System.out.println(str);
		    
		    obj = (org.json.simple.JSONObject)parser.parse(str);

		    // obj 값 insert 하기
            Item ListItem = new Item();
            String temp = obj.get("bno").toString();
           
            
//            System.out.println("temp: "+temp);
            
            ListItem.setBno(Integer.parseInt(obj.get("bno").toString()));
            ListItem.setTitle(obj.get("title").toString());
            ListItem.setLink(obj.get("link").toString());
            ListItem.setImage(obj.get("image").toString());
            ListItem.setLprice(obj.get("lprice").toString());
            ListItem.setHprice(obj.get("hprice").toString());
            ListItem.setMallName(obj.get("mallName").toString());
            ListItem.setProductId((Long.parseLong(obj.get("productId").toString())));
            ListItem.setProductType((Integer.parseInt(obj.get("productType").toString())));
            ListItem.setCategory(obj.get("category").toString());
            ListItem.setCount((Long.parseLong(obj.get("count").toString())));
            
            // 현재 Session의 정보 가져오기
    		HttpSession session = request.getSession();
    		Member member = (Member) session.getAttribute("UserInfo");

    		// 둘다 출력해보기
    		System.out.println("ListItem: "+ListItem.toString());
    		System.out.println("member: "+member.toString());

    		// 현재 Session의 메일
    		String mail = member.getMail();
    		
//    		System.out.println("mail : " + mail);
    		
    		// 가져올 관심사
    		String selectedPin = obj.get("pintitle").toString();
    		// 관심사 출력
//    		System.out.println("selectedPin: "+selectedPin);
    		
    		MemberDAO mDao = MemberDAO.getInstance();
    		
    		// DB의 tblMemberFavorite table에 값 저장
    		int n = mDao.insertMemberFavorite(selectedPin, mail, ListItem);
    		
    		if(n == 1) {
    			System.out.println("관심사 저장 성공");
    		}
    		
    		List<Favorite> flist = mDao.selectMemberFavorite(mail);
    		
    		request.setAttribute("UserInfo", member);
    		request.setAttribute("selectedPin", selectedPin);
    		request.setAttribute("flist", flist);
    		
		    }catch(Exception e) {
		    	e.printStackTrace();
		    }

//			System.out.println("갔냐");
//			request.getRequestDispatcher("/topic/topic.jsp").forward(request, response);
//			System.out.println("안갔냐");
	}

}
