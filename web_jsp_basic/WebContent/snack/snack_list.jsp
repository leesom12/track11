<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	SnackDao dao= new SnackDao();
	
	String gubun= request.getParameter("t_gubun");
	String search= request.getParameter("t_search");
	if(gubun==null){
		gubun="p_name";
		search="";
	}
	ArrayList<SnackDto> arr= dao.getSnackList(gubun, search); 
	
%>
<!DOCTYPE html>
<html> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--
	******************************************** 
		title : 풀스텍 홍길동
	******************************************** 
 -->	
	<title>TRACK11 이소민</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">	
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/layout.css" rel="stylesheet" >
	<script>
		function goSearch(){
			snack.method="post";
			snack.method="snack_list.jsp";
			snack.submit();
		}
		
		
		function goView(p_code){
			view.t_p_code.value=p_code;
			view.method="post";
			view.action="snack_view.jsp";
			view.submit();
		}
	</script>	
</head>

<body>
<form name="view">
	<input type="hidden" name="t_p_code">
</form>
	<div class="container">

		<div class="leftmargin">
			<a href="snack_list.jsp"><img src="../images/jsl_logo.png"></a><h1>TRACK11 이소민 SNACK</h1>
		</div>		
		<div class="search_wrap">
			<div class="record_group">
				<p>총게시글 : <span><%=arr.size() %></span>건</p>
			</div>
			<form name="snack">
				<div class="search_group">
					<select  name="t_gubun" class="select">
						<option value="p_name" <%if(gubun.equals("p_name"))out.print("selected"); %> >제품명</option>
						<option value="m_name" <%if(gubun.equals("m_name"))out.print("selected"); %>>제조사명</option>
					</select>
					<input name="t_search" value="<%= search %>" type="text" class="search_word">
					<button onclick="goSearch()" class="btn_search"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
				</div>
			</form>
		</div>
	</div>
	<div class="board_list">
		<table class="board_table">
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<thead>
				<tr>
					<th>제품번호</th>
					<th>제품명</th>
					<th>제조사명</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<%for(int k=0; k<arr.size(); k++) {%>	
					<tr>
						<td><a href="snack_view.jsp?t_p_code=<%=arr.get(k).getP_code()%>"><%=arr.get(k).getP_code() %></a></td>
						<td><a href="javascript:goView('<%=arr.get(k).getP_code() %>')"><% out.print(arr.get(k).getP_name()); %></a></td>
						<td><%=arr.get(k).getM_name() %></td>
						<td><%=arr.get(k).getStrPrice() %></td>
					</tr>	
				<%} %>	
			
			</tbody>
		</table>
		<div class="paging">
			<a href="snack_write.jsp" class="write">제품등록</a>
		</div>
	</div>
 </body>
</html>


