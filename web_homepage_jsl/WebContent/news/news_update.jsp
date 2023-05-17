<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*,common.*" %>
<%@ include file="../common_session.jsp"%>
<%if(!sessionLevel.equals("top")){ %>
		<script type="text/javascript">
			alert("관리자 화면입니다!");
			location.href="/web_homepage_jsl/notice/notice_list.jsp";
		</script>
<%} %>
<%
	NewsDao dao= new NewsDao();
	String no= request.getParameter("t_no");
	NewsDto dto= dao.newsView(no);
%>
<%@ include file="../common_header.jsp" %>

<style type="text/css">
	.cursor{
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	function goUpdate(){
		if(checkValue(news.t_title,"제목을 입력하세요"))return;
		if(checkValue(news.t_content,"내용을 입력하세요"))return;
		news.method="post";
		news.action="db_news_update.jsp";
		news.submit();
	}
</script>

	<!-- sub contents -->
	<div class="sub_title">
		<h2>뉴스</h2>
	<%@ include file="../common_menu.jsp" %>
	</div>

	<div class="container">
	  <div class="write_wrap">
	  <h2 class="sr-only">공지사항 글쓰기</h2>
	  <form name="news">
	  <input type="hidden" name="t_no" value="<%=dto.getNo()%>">
	  <!-- action을 처리하기전에 check()사용자 함수를 실행하고 되돌아 와라-->
			<table class="bord_table">
				<caption class="sr-only">공지사항 입력 표</caption>
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr class="first">
						<th>제목</th>
						<td colspan="3"><input type="text" name="t_title" value="<%=dto.getTitle()%>"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea name="t_content"><%=dto.getContent()%></textarea></td>
					</tr>
					<tr>
						<th rowspan="2">등록자</th>
						<td rowspan="2"><%=dto.getReg_name() %></td>
						<th>등록일</th>
						<td><%=dto.getReg_date()%></td>
					</tr>
					<tr>
						<th>수정일</th>
						<td><%=CommonUtil.getTodayTime() %></td>
					</tr>
				</tbody>
			</table>
			<div class="btn_wrap">
				<input type="button" onclick="goUpdate()" value="저장" class="btn_ok cursor">&nbsp;&nbsp;
				<input type="button" value="목록" class="btn_list cursor" onClick="location.href='news_list.jsp';">
			</div>
		</form>
	  </div>
	  
	</div>
	<!-- end contents -->
	
	<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
		});
	</script>
	
<%@ include file="../common_footer.jsp" %>

 </body>
</html>









    