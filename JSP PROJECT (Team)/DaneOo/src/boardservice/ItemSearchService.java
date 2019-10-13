package boardservice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dao.ItemDAO;
import dto.Item;
import dto.PageMaker;
import service.Service;

public class ItemSearchService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String clientId = "Aa2qvR82E8qwDITsQCz4";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "AmjrVfP37y";//애플리케이션 클라이언트 시크릿값";
        
        String sch = request.getParameter("sch");		// 검색어
       
        System.out.println(sch);
        try {
        	/* 검색어를 가져와서 encoding 해줘야함 */
            String text = URLEncoder.encode(sch, "UTF-8");
            String start = "&start=1";
            String display = "&display=100";
            String filter = "&filter=medium";   
            String apiURL = "https://openapi.naver.com/v1/search/shop?query="+ text + start + display; // json 결과 : 블로그
//            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text + start + display; // json 결과 : 블로그
//            String apiURL = "https://openapi.naver.com/v1/search/webkr?query="+ text + start + display; // json 결과 : 블로그
//            String apiURL = "https://openapi.naver.com/v1/search/image?query="+ text + start + display + filter; // json 결과 : 이미지
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;//많은 양의 데이터를 입력받을 때, 문자, 문자 배열, 문자열 라인 등을 보다 효율적으로 처리
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream())); //콘솔에서 입력 받은 경우
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer resp = new StringBuffer();
            
            /* json obj */
            JSONParser parser = new JSONParser();
            JSONObject obj = null;
            JSONArray arr = null;
           
            while ((inputLine = br.readLine()) != null) {
            	resp.append(inputLine);
            }
            br.close();

            System.out.println("resp: " +resp.toString());
            /* 응답 돌려주기 */
            /* 모든 검색 다 들어감 */
            
            obj = (JSONObject)parser.parse(new String(resp)); //json 데이터를 넣어 json object로 만듬

//            System.out.println("obj to String: "+obj.toJSONString());
            
            JSONObject imgObj = new JSONObject();
            JSONArray jsonArray = (JSONArray) obj.get("items");

//            System.out.println("OBJ: "+obj);
//            System.out.println("OBJ total: "+obj.get("total"));
//            System.out.println("OBJ dis: "+obj.get("display"));
//            System.out.println("OBJ start: "+obj.get("start"));
//            System.out.println("OBJ date : "+obj.get("lastBuildDate"));
//            System.out.println("OBJ items: "+obj.get("items"));
            
            for(int i = 0 ; i < jsonArray.size() ; i++) {
                imgObj = (JSONObject) jsonArray.get(i);
                
                Item item = new Item();
                item.setImage((String)imgObj.get("image"));
                item.setMallName((String)imgObj.get("mallName"));
                item.setProductId(Long.parseLong((String) imgObj.get("productId")));
                item.setLprice((String)imgObj.get("lprice"));
                item.setHprice((String)imgObj.get("hprice"));
                item.setLink((String)imgObj.get("link"));
                item.setTitle((String)imgObj.get("title"));
                item.setProductType(Integer.parseInt((String)imgObj.get("productType")));
                item.setCategory(sch);
                
                System.out.println("["+i+"번]"+item.toString());
                
                // 아이템 각각을 배열에 넣기 : 검색한 것만 가져오기 위해서
                // DB에 존재하는것도 있고, 존재하지 않는것도 있기 때문에 
                // DB에서 끌어오기보다는 검색된 것은 바로 넣어서 들고와야함
                // list 뿌려주기위해서 보내주는 방법 : setAttr > Dispatcher
//                itemList.add(item);
                
                // 중복제거하고 저장하는 일'만' 함
                ItemDAO iDao = ItemDAO.getInstance();
                int n = iDao.SaveSearchItems(item);
                
            }

        } catch (Exception e) {
            System.out.println(e);
        }

		String spage = request.getParameter("page");
		
		if(spage == null)
		{
			spage = "1";
		}
		
		int page = Integer.parseInt(spage);
		ItemDAO iDao = ItemDAO.getInstance();
		int totalCount = iDao.getSearchTotalCount(sch);
		
		PageMaker pageMaker = new PageMaker(page, totalCount);
        
		List<Item> itemList = iDao.getSearchBoardPage(pageMaker.getStart(), pageMaker.getPageSize(), sch);
		request.setAttribute("itemList", itemList);	// 검색어에 맞는걸 다 긁어옴
		request.setAttribute("pageMaker", pageMaker);
		request.setAttribute("sch", sch);
		request.getRequestDispatcher("/main_board/main_itemList.jsp").forward(request, response);
	}
}
