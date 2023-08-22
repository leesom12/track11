<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.*, dto.*" %>
    <%
    	AuditionDao dao = new AuditionDao();
    	ArrayList<AuditionDto> arr = dao.getArtistList();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이소민 오디션</title>
<link href="index.css" rel="stylesheet">
</head>
<body>

	<header>
		<h1>(과정평가형 정보처리산업기사)오디션 관리</h1>
	</header>
	
	<nav>
		<ul>
			<li><a href="오디션등록.jsp">오디션등록</a></li>
			<li><a href="참가자목록조회.jsp" class="click">참가자목록조회</a></li>
			<li><a href="멘토점수등록.jsp">멘토점수등록</a></li>
			<li><a href="멘토점수조회.jsp">멘토점수조회</a></li>
			<li><a href="참가자등수조회.jsp">참가자등수조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	
	<section>
		<h2>참가자 목록 조회</h2>
		<form name="audition">
		<table class="border">
			<colgroup>
				<col style="width:15%">
				<col style="width:15%">
				<col style="width:20%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:30%">
			</colgroup>
			<tr>
				<th>참가번호</th>
				<th>참가자명</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>특기</th>
				<th>소속사</th>
			</tr>
			<%for(int i=0;i<arr.size();i++) {%>
				<tr>
					<td><%=arr.get(i).getArtist_id() %></td>
					<td><%=arr.get(i).getArtist_name() %></td>
					<td><%=arr.get(i).getArtist_birth() %></td>
					<td><%=arr.get(i).getArtist_gender() %></td>
					<td><%=arr.get(i).getTalent() %></td>
					<td><%=arr.get(i).getAgency() %></td>
				</tr>
			<%} %>
		</table>
		</form>
	</section>
	
	<footer>
		<h4>HRDKOREA Copyright &copy; All rights Reserved. Human Resources Development Service of Korea.</h4>
	</footer>

</body>
</html>









