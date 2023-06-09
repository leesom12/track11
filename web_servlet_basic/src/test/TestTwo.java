package test;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Tdto;

/**
 * Servlet implementation class TestTwo
 */
@WebServlet("/TestTwo")
public class TestTwo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestTwo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name="홍길동";
		int age= 25;
		Tdto dto= new Tdto("김정은", "평양", 40);
		ArrayList<Tdto> dtos = new ArrayList<Tdto>();
		dtos.add(new Tdto("바이든", "워싱턴", 75));
		dtos.add(new Tdto("푸틴", "모스크바", 65));
		
		request.setAttribute("t_name", name); 									//request.setAttribute("넘어갈 변수 명", 넘길 값);
		request.setAttribute("t_age", age);
		request.setAttribute("t_dto", dto);
		request.setAttribute("t_dtos", dtos);
		
		RequestDispatcher rd= request.getRequestDispatcher("test_two.jsp");		//servelt과 jsp 연결
		rd.forward(request, response);											//jsp 파일 여는 메소드
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}






