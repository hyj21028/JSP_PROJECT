package controller;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardservice.ItemSearchService;
import boardservice.ItemService;
import boardservice.StartMainItemList;

/**
 * Servlet implementation class BoardServlet
 */
/* 어떠한 작업에도 .do 만 붙이면 된다 */
@WebServlet("*.do")
public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ItemService service = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();	// 실제 파일이 있는 경로 전체 'URI'를 다 가져온다. , URL 은 프로토콜 + 도메인이 합쳐진것 
		String contextPath = request.getContextPath();	// 현재 프로젝트 path만 얻어온다. 
		String command = requestURI.substring(contextPath.length());	// BoardSystem/URI.do
																								// BoardSystem/list.do , /list.do 만 잘라서 command 에 넣어줌
		
//		request.getContextPath()는 프로젝트 path만 얻어온다.
//
//		요청 : http://localhost/ZESTINE/test.jsp 경우
//
//		→ /ZESTINE 경로만 얻는다
//
//
//		request.getRequestURI()는 프로젝트와 파일 경로까지 얻어온다.
//
//		요청 : http://localhost/ZESTINE/test.jsp 경우
//
//		→ /ZESTINE/test.jsp 까지 얻어온다.


		if(command.equals("/Start.do")) 
		{
			System.out.println("메인페이지");
			service = new StartMainItemList();
		}
		else if(command.equals("/ItemSearch.do")) 
		{
			service = new ItemSearchService();
		}
//		else if(command.equals("/.do")) 
//		{
//			service = new BoardWriteService();
//		}
//		else if(command.equals("/boardView.do")) 
//		{
//			service = new BoardViewService();
//		}
//		else if(command.equals("/boardUpdateForm.do")) 
//		{
//			service = new BoardUpdateFormService();
//		}
//		else if(command.equals("/boardUpdate.do")) 
//		{
//			service = new BoardUpdateService();
//		}
//		else if(command.equals("/boardDelete.do")) 
//		{
//			service = new BoardDeleteService();
//		}
//		else if(command.equals("/replyWrite.do")) 
//		{
//			service = new ReplyWriteService();
//		}
//		else if(command.equals("/replyDelete.do")) 
//		{
//			service = new ReplyDeleteService();
//		}
		service.execute(request, response);
	}
	
}
