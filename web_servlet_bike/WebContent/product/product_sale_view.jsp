<%@page import="common.CommonUtil"%>
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
					PRODUCT
				</a></li>
				<li><a href="ProductSale">
					<span class="fnt"><i class="fas fa-apple-alt"></i></span>
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


<style>
	.viewImg{
		width:200px;
		height:200px;
		margin: 0 0 10px 50px;
	}
</style>

<script type="text/javascript">
	
	function goUpdate(no){
		pro.t_gubun.value="saleProcessUpdate";
		pro.t_no.value= no;
		pro.method="post";
		pro.action="ProductSale";
		pro.submit();
	}
	
	function goSaleTrend(){
		pro.t_gubun.value="saleTrend";
		pro.method="post";
		pro.action="ProductSale";
		pro.submit();
	}
</script>



		<div id="b_right">
			<p class="n_title">
				PRODUCT
			</p>
		
			
<form name="pro">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_no">			
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr>
						<th>주문번호</th>
						<td colspan="3">${t_dto.getNo()}</td>
					</tr>
					<tr>
						<th>상품번호</th>
						<td>${t_dto.getProduct_no()}</td>
						<th>상품명</th>
						<td>${t_dto.getProduct_name()}</td>
					</tr>
					<tr>
						<th>상품</th>
						<td colspan="3">
							<c:if test="${not empty t_dto.getAttach()}">
								<img src="attach/product/${t_dto.getAttach()}" class="viewImg">
								<br><br>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>구매자ID</th>
						<td>${t_dto.getMem_id()}</td>
						<th>구매자 성함</th>
						<td>${t_dto.getMem_name()}</td>
					</tr>
					<tr>
						<th>배송주소</th>
						<td colspan="3">${t_dto.getAddress()}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td colspan="3">${t_dto.getMobile()}</td>
					</tr>
					<tr>
						<th>구매가격</th>
						<td>${t_dto.getStrPrice()}</td>
						<th>구매일자</th>
						<td>${t_dto.getPurchase_date()}</td>
					</tr>
					<tr>
						<th>지불방법</th>
						<td>${t_dto.getPayment()}</td>
						<th>배송상태</th>
						<td>
							<select name="t_process_state">
								<option value="입금확인중" <c:if test="${t_dto.getProcess_state() eq '입금확인중'}">selected</c:if> >입금확인중</option>
								<option value="배송중" <c:if test="${t_dto.getProcess_state() eq '배송중'}">selected</c:if> >배송중</option>
								<option value="배송완료" <c:if test="${t_dto.getProcess_state() eq '배송완료'}">selected</c:if>>배송완료</option>
								<option value="주문취소" <c:if test="${t_dto.getProcess_state() eq '주문취소'}">selected</c:if>>주문취소</option>
							</select>
						</td>
					</tr>
					<c:if test="${t_dto.getProcess_state() eq '배송완료'}">
						<tr>
							<th>배송완료일</th>
							<td colspan="3">${t_dto.getDelivery_date()}</td>
						</tr>
					</c:if>			

				</tbody>
			</table>
</form>
			
			<div class="buttonGroup">
				<a href="javascript:goUpdate('${t_dto.getNo()}')" class="butt">Update</a>
				<a href="ProductSale" class="butt">List</a>
			</div>	
		</div>	

<%@include file="../common_footer.jsp" %>
</body>
</html>






    