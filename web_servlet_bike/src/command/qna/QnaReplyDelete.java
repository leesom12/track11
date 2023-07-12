package command.qna;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.QnaDao;

public class QnaReplyDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		QnaDao dao = new QnaDao();
		String no = request.getParameter("t_no");
		int result = dao.deleteReply(no);
		String msg = "";
		if(result == 1) msg ="삭제 완료";
		else msg ="삭제 실패!!";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Qna");
	}

}
