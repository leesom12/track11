package command.news;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.CommonUtil;
import dao.NewsDao;
import dto.NewsDto;

public class NewsWrite implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NewsDao dao = new NewsDao();
		String newsDir= CommonUtil.getFile_dir_news();
		int maxSize= 1024*1024*10;
		String msg ="";
		
		try {
			MultipartRequest mpr = new MultipartRequest(request, newsDir, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			String no = dao.getNewsNo();
			String title = mpr.getParameter("t_title");
			title = title.replaceAll("\'", "\''");
			String content = mpr.getParameter("t_content");
			content = content.replaceAll("\'", "\''");
			String attach = mpr.getFilesystemName("t_attach");
			if(attach==null) attach="";
			
			HttpSession session = request.getSession();
			String reg_id = (String) session.getAttribute("sessionId");
			String reg_date = CommonUtil.getTodayTime();
			
			NewsDto dto = new NewsDto(no, title, content, attach, reg_id, reg_date);
			int result = dao.saveNews(dto);
			if(result == 1) msg="등록 성공!";
			else msg="등록 실패";
			
			
		} catch (IOException e) {
			System.out.println("new attach 등록 오류!!");
			e.printStackTrace();
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "News");
	}

}











