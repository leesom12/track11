<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*" %>
<%
	SmartDao dao = new SmartDao();
	ArrayList<Sub3Dto> arr = dao.getProductSize();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이소민_스마트공정</title>
<link href="index.css" rel="stylesheet">
</head>
<script type="text/javascript">
	function goSave(){
		if(smart.w_workno.value==""){
			alert("작업지시번호가 입력되지 않았습니다!");
			smart.w_workno.focus();
			return;
		}
		if(smart.w_quentity.value==""){
			alert("수량이 입력되지 않았습니다!");
			smart.w_quentity.focus();
			return;
		}
		if(smart.w_workdate.value==""){
			alert("작업시작일이 입력되지 않았습니다!");
			smart.w_workdate.focus();
			return;
		}
		
		smart.method="post";
		smart.action="DbWorkListSave.jsp";
		smart.submit();
	}
	
	function goReset(){
		alert("모든 정보를 지우고 다시 시작합니다");
		smart.reset();
		smart.w_workno.focus();
	}
</script>
<body>

	<header>
		<h1>(과정형평가 정보처리산업기사)스마트공장 공정관리 프로그램 ver2019-09</h1>
	</header>
	<nav>
		<ul>
			<li><a href="제품조회.jsp">제품조회</a></li>
			<li><a href="작업지시조회.jsp">작업지시조회</a></li>
			<li><a href="작업지시등록.jsp">작업지시등록</a></li>
			<li><a href="작업공정등록.jsp">작업공정등록</a></li>
			<li><a href="작업공정조회.jsp">작업공정조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<section>
		<h2>작업 지시 등록</h2>
		<form name="smart">
			<table class="save">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>작업지시번호</th>
					<td class="input"><input type="text" name="w_workno" value=""></td>
				</tr>
				<tr>
					<th>제품코드</th>
					<td class="input">
						<select name="p_code">
							<%for(int i=0;i<arr.size();i++) {%>
								<option value="<%=arr.get(i).getP_code()%>">[<%=arr.get(i).getP_code()%>]&nbsp;<%=arr.get(i).getP_name()%></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>수량</th>
					<td class="input"><input type="text" name="w_quentity" value=""></td>
				</tr>
				<tr>
					<th>작업시작일</th>
					<td class="input"><input type="text" name="w_workdate" value=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onclick="goSave()">작업지시등록</button>
						<button type="button" onclick="goReset()">다시쓰기</button>
					</td>
				</tr>

			</table>
		</form>
	</section>
	<footer>
		<h4>HRDKOREA Copyright &copy; All rights Reserved. Human Resources Development Service of Korea.</h4>
	</footer>
	
</body>
</html>