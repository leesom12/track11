package command.product;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.ProductDao;
import dto.ProductDto;

public class ProductLIst implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		ProductDao dao = new ProductDao();
		
		String select= request.getParameter("t_select");
		String search= request.getParameter("t_search");
		if(select == null) {
			select = "no";
			search="";
		}
		String pageList = request.getParameter("t_pageNum");
		if(pageList == null) pageList= "5";
		int pageList_count= Integer.parseInt(pageList);
		
		/* paging 설정 start*/
		int totalCount = dao.getTotalCount(select,search);
		int list_setup_count = pageList_count;  //한페이지당 출력 행수 
		int pageNumber_count = 3;  //한페이지당 출력 페이지 갯수
		
		String setup= request.getParameter("t_setup");
		if(setup != null) list_setup_count= Integer.parseInt(setup);
		else if(setup == null) setup= "";
		
		String nowPage = request.getParameter("t_nowPage");
		int current_page = 0; // 현재페이지 번호
		int total_page = 0;    // 전체 페이지 수
		
		if(nowPage == null || nowPage.equals("")) current_page = 1; 
		else current_page = Integer.parseInt(nowPage);
		
		total_page = totalCount / list_setup_count;  // 몫 : 2
		int rest = 	totalCount % list_setup_count;   // 나머지:1
		if(rest !=0) total_page = total_page + 1;     // 3
		
		int start = (current_page -1) * list_setup_count + 1;
		int end   = current_page * list_setup_count;
		/* paging 설정 end*/	
		
		ArrayList<ProductDto> arr= dao.getProductList(select, search, start, end);
		String paging = CommonUtil.pageListPost(current_page, total_page, pageNumber_count);
		
		request.setAttribute("t_arr", arr);
		request.setAttribute("t_select", select);
		request.setAttribute("t_search", search);
		request.setAttribute("t_totalCount", totalCount);
		request.setAttribute("t_paging", paging);
		request.setAttribute("t_list_count", pageList_count);

	}

}
