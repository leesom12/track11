<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_header.jsp" %>


<c:choose>
	<c:when test="${sessionLevel eq 'admin'}">
		<div id="b_left">
			<P>Admin</P>
			<ul>
				<li><a href="Admin">
					MEMBER
				</a></li>
				<li><a href="Product">
					<span class="fnt"><i class="fas fa-apple-alt"></i></span>
					PRODUCT
				</a></li>
				<li><a href="ProductSale">
					판매리스트
				</a></li>
				<li><a href="javascript:goSaleTrend()">
					판매현황
				</a></li>
			</ul>
		</div>
	</c:when>
	<c:otherwise>
			<div id="b_left">
			<P>Product</P>
			<ul>
				<li><a href="Product">
					<span class="fnt"><i class="fas fa-apple-alt"></i></span>
					PRODUCT
				</a></li>
			</ul>
		</div>
	</c:otherwise>
</c:choose>


<script type="text/javascript">
	function goSaleTrend(){
		product.t_gubun.value="saleTrend";
		product.method="post";
		product.action="ProductSale";
		product.submit();
	}
	
	function goWriteForm(){
		product.t_gubun.value="writeForm";
		product.method= "post";
		product.action="Product";
		product.submit();
	}
	
	function goSearch(){
		searchForm.method="post";
		searchForm.action="Product";
		searchForm.submit();
	}
	
	function goPage(pageNum){
		searchForm.t_nowPage.value= pageNum;
		searchForm.method="post";
		searchForm.action="Product";
		searchForm.submit();
	}
	
	function goView(no){
		product.t_gubun.value="view";
		product.t_no.value=no;
		product.method="post";
		product.action="Product";
		product.submit();
	}
</script>

<form name="product">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_no">
</form>

		<div id="b_right">
			<p class="n_title">
				PRODUCT
			</p>
			<div class="record_group record_group_left">
				<p><i class="fa-solid fa-bell"></i> 총게시글<span> ${t_totalCount} </span>건</p>
			</div>			
			
			<form name="searchForm">
			<input type="hidden" name="t_nowPage">
			<p class="select_box select_box_right">
				<select name="t_pageNum" class="sel_box" style="width:90px;">
					<option value="5">5개씩정렬</option>
					<option value="10" <c:if test="${t_list_count eq 10}">selected</c:if> >10개씩정렬</option>
				</select>
				<select name="t_select" class="sel_box">
					<option value="no">제품번호</option>
					<option value="p_name" <c:if test="${t_select eq 'p_name'}">selected</c:if>>제품명</option>
				</select>
				<input type="text" name="t_search" class="sel_text" value="${t_search}">
				<button type="button" onclick="goSearch()"  class="sel_button"><i class="fa fa-search"></i> SEARCH</button>
			</p>
			</form>			
			
			<table class="boardList">
				<colgroup>
					<col width="20%">
					<col width="8%">
					<col width="30%">
					<col width="15%">
					<col width="20%">
					<col width="7%">
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>제품번호</th>
						<th>제품명</th>
						<th>가격</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${t_arr}" var="arr">
						<tr>
							<td><a href="javascript:goView('${arr.getNo()}')"><img src="attach/product/${arr.getAttach()}" width="50px" height="50px"></a></td>
							<td class="t_left"><a href="javascript:goView('${arr.getNo()}')">${arr.getNo()}</a></td>
							<td><a href="javascript:goView('${arr.getNo()}')">${arr.getP_name()}</a></td>
							<td>${arr.getStrPrice()}</td>
							<td>${arr.getReg_date()}</td>
							<td>${arr.getHit()}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="paging">
				${t_paging}
			<c:if test="${sessionLevel eq 'admin'}">
				<a href="javascript:goWriteForm()" class="write">제품등록</a>
			</c:if>

			</div>
		</div>	
	</div>
<%@include file="../common_footer.jsp" %>
</body>
</html>






    