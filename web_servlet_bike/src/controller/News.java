package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.news.NewsDelete;
import command.news.NewsList;
import command.news.NewsUpdate;
import command.news.NewsView;
import command.news.NewsWrite;
import common.CommonExecute;
import common.CommonToday;

/**
 * Servlet implementation class News
 */
@WebServlet("/News")
public class News extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public News() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String gubun = request.getParameter("t_gubun");
		if(gubun == null) gubun="list";
		String viewPage= "";
		
		request.setAttribute("nowPage", "news");
		
		if(gubun.equals("list")) {
			CommonExecute ce = new NewsList();
			ce.execute(request);
			viewPage="news/news_list.jsp";
		}else if(gubun.equals("writeForm")) {
			CommonExecute ce = new CommonToday();
			ce.execute(request);
			viewPage="news/news_write.jsp";
		}else if(gubun.equals("save")) {
			CommonExecute ce = new NewsWrite();
			ce.execute(request);
			viewPage="common_alert.jsp";
		}else if(gubun.equals("view")) {
			CommonExecute ce = new NewsView();
			ce.execute(request);
			viewPage="news/news_view.jsp";
		}else if(gubun.equals("updateForm")) {
			CommonExecute ce = new NewsView();
			ce.execute(request);
			viewPage="news/news_update.jsp";
		}else if(gubun.equals("update")) {
			CommonExecute ce = new NewsUpdate();
			ce.execute(request);
			viewPage="common_alert.jsp";
		}else if(gubun.equals("delete")) {
			CommonExecute ce = new NewsDelete();
			ce.execute(request);
			viewPage="common_alert.jsp";
		}
		
		RequestDispatcher rd= request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
