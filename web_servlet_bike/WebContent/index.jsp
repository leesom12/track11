<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<link href="css/index_c.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>	
<title>이소민</title>
<script type="text/javascript">
	$(function(){
		$(".main_menu > li > a").hover(function(){
			$(this).css("font-weight","bold");
		},function(){
			$(this).css("font-weight","");
		});		
		
		$(".bu_1").mouseover(function(){
			var imgName = $(this).attr('src');
			if(imgName =="images/bu_01.jpg"){
				$(this).attr("src","images/bu_01_over.jpg");
			} else if(imgName =="images/bu_02.jpg"){
				$(this).attr("src","images/bu_02_over.jpg");
			} else if(imgName =="images/bu_03.jpg"){
				$(this).attr("src","images/bu_03_over.jpg");
			} else if(imgName =="images/bu_04.jpg"){
				$(this).attr("src","images/bu_04_over.jpg");
			} else if(imgName =="images/bu_05.jpg"){
				$(this).attr("src","images/bu_05_over.jpg");
			} else if(imgName =="images/bu_06.jpg"){
				$(this).attr("src","images/bu_06_over.jpg");
			}
		});	
		$(".bu_1").mouseout(function(){
			var imgName = $(this).attr('src');
			if(imgName =="images/bu_01_over.jpg"){
				$(this).attr("src","images/bu_01.jpg");
			} else if(imgName =="images/bu_02_over.jpg"){
				$(this).attr("src","images/bu_02.jpg");
			} else if(imgName =="images/bu_03_over.jpg"){
				$(this).attr("src","images/bu_03.jpg");
			} else if(imgName =="images/bu_04_over.jpg"){
				$(this).attr("src","images/bu_04.jpg");
			} else if(imgName =="images/bu_05_over.jpg"){
				$(this).attr("src","images/bu_05.jpg");
			} else if(imgName =="images/bu_06_over.jpg"){
				$(this).attr("src","images/bu_06.jpg");
			}			
		});				

		$(".allclick").click(function(e){
			e.preventDefault();
			$("#disableDiv").css("display","block");
			$("#b_menu_all").slideDown(500);
			$("#b_menu_all").css("z-index","999");
		});
		
		$(".closeclick").click(function(e){
			e.preventDefault();
			$("#b_menu_all").slideUp(500);
			$("#disableDiv").css("display","none");
		});

	});	
	

</script>
<script type="text/javascript">
	function goWork(gubun){
		bike.t_gubun.value=gubun;
		bike.method="post";
		bike.action="Member";
		bike.submit();
	}
	
	function goNoticeView(no){
		bike.t_gubun.value="view";
		bike.t_no.value= no;
		bike.method="post";
		bike.action="Notice";
		bike.submit();
	}
	
	function goProductView(no){
		bike.t_gubun.value="view";
		bike.t_no.value= no;
		bike.method="post";
		bike.action="Product";
		bike.submit();
	}
	
</script>
</head>
<body>
<form name="bike">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_no">
</form>
<style>
#disableDiv { position:absolute; left:0; top:0;width:100%; height:1700px; z-index:995 ; background-color:#EEEEEE; filter:Alpha(opacity=80);opacity:0.8; -moz-opaciry:0.8}
</style>
<div id="disableDiv" class="disableDiv" style="display:none"></div>
<div id="container">

	<div id="container_top">	
			<div id="b_top_menu">
				<ul class="top_menu">
					<li><a href="" class="allclick"><i class="fas fa-bars"></i></a></li>
					<c:if test="${not empty sessionId }">
						<c:if test="${sessionLevel eq 'admin'}">
							<li><a href="Admin">Admin</a></li>
						</c:if>
						<li><a href="javascript:goWork('myPage')">My info</a></li> 
						<li><a href="javascript:goWork('memberLogout')">Logout</a></li>
					</c:if>
					<c:if test="${empty sessionId }">
						<li><a href="javascript:goWork('memberJoin')">Join</a></li>
						<li><a href="javascript:goWork('memberLogin')">Login</a></li>
					</c:if>
					<li><a href="Index"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				</ul>
			</div>	
	</div>
	<div id="container_bottom">			
		<div id="b_menu_all">		
			<div id="b_menu_all_top">
				<div class="menu1"><a href=""><span class="maintitle">Accessories</span></a>
					<ul>
						<li>menu1 sub1</li>
						<li>menu1 sub2</li>
						<li>menu1 sub3</li>
						<li>menu1 sub4</li>
						<li>menu1 sub5</li>
					</ul>
				</div>
				<div class="menu1"><a href=""><span class="maintitle">Bikes & Frames</span></a>
					<ul>
						<li>menu2 sub1</li>
						<li>menu2 sub2</li>
						<li>menu2 sub3</li>
						<li>menu2 sub4</li>
						<li>menu2 sub5</li>
						<li>menu2 sub6</li>
						<li>menu2 sub7</li>
					</ul>
				</div>
				<div class="menu1"><a href=""><span class="maintitle">Clothing</span></a>
					<ul>
						<li>menu3 sub1</li>
						<li>menu3 sub2</li>
						<li>menu3 sub3</li>
						<li>menu3 sub4</li>
						<li>menu3 sub5</li>
						<li>menu3 sub6</li>
						<li>menu3 sub7</li>
						<li>menu3 sub8</li>
					</ul>
				</div>
				<div class="menu1"><a href=""><span class="maintitle">Maintenance</span></a>
					<ul>
						<li>menu4 sub1</li>
						<li>menu4 sub2</li>
						<li>menu4 sub3</li>
						<li>menu4 sub4</li>
						<li>menu4 sub5</li>
					</ul>
				</div>
				<div class="menu1"><a href=""><span class="maintitle">Parts</span></a>
					<ul>
						<li>menu5 sub1</li>
						<li>menu5 sub2</li>
						<li>menu5 sub3</li>
						<li>menu5 sub4</li>
						<li>menu5 sub5</li>
					</ul>
				</div>
				<div class="menu1"><a href="Product"><span class="maintitle">Product</span></a>
					<ul>
						<li>menu6 sub1</li>
						<li>menu6 sub2</li>
						<li>menu6 sub3</li>
						<li>menu6 sub4</li>
						<li>menu6 sub5</li>
					</ul>
				</div>
				<div class="menu1"><a href="Notice"><span class="maintitle">Notice & News</span></a>
					<ul>
						<li><a href="Notice">Notice</a></li>
						<li><a href="">News</a></li>
						<li><a href="">Q & A</a></li>
						<li><a href="">Free Board</a></li>
						<li><a href="">Etc</a></li>
					</ul>
				</div>

				
			</div>
			<div class="menu_close"><a href="#" class="closeclick">[CLOSE]</a></div>
		</div>	
		
		<div id="b_top">
			<div id="b_top_back">
<!--			
				<p class="b_top_text">aaaa</p>
				<p class="b_top_line"></p>
-->				
			</div>
			<ul class="main_menu">
				<li><a href="">Accessories</a></li>
				<li><a href="">Bikes & Frames</a></li>
				<li><a href="">Clothing</a></li>
				<li><a href="">Maintenance</a></li>
				<li><a href="">Parts</a></li>
				<li><a href="Product">Product</a></li>
				<li><a href="Notice">Notice & News</a></li>
			</ul>
		</div>
		
		
		<div id="b_top_2">
			<ul class="b_top_menu">
				<li><a href=""><img src="images/bu_01.jpg" class="bu_1"></a></li>
				<li><a href=""><img src="images/bu_02.jpg" class="bu_1"></a></li>
				<li><a href=""><img src="images/bu_03.jpg" class="bu_1"></a></li>
				<li><a href=""><img src="images/bu_04.jpg" class="bu_1"></a></li>
				<li><a href=""><img src="images/bu_05.jpg" class="bu_1"></a></li>
				<li><a href=""><img src="images/bu_06.jpg" class="bu_1"></a></li>
			</ul>
		</div>		
		<hr><br>
		<div id="b_left">
			<p class="left_top">
				<img src="images/left_top.jpg"><a href="Notice"><img src="images/left_right.jpg"></a>
			</p>
			<div class="left_middle">
				<ul>
					<c:set var="num" value="${n_arr.size()}"></c:set>
					<c:forEach items="${n_arr}" var="arr">
						<c:set var="title" value="${arr.getTitle()}"></c:set>
						<c:if test="${fn:length(arr.getTitle()) > 18}"> 
							<c:set var="title" value="${fn:substring(arr.getTitle(),0,18)}..."></c:set>
						</c:if>
						<li>
							<a href="javascript:goNoticeView('${arr.getNo()}')">
							<span class="noti_t">${num}.${title}</span><span class="noti_d">${arr.getReg_date()}</span>
							</a>
						</li>
						<c:set var="num" value="${num-1}"></c:set>
					</c:forEach>
				</ul>
			</div>
	
<style>
	.b_center_middle .aa{
		position: relative;
		display: inline-block;
		width: 105px;
		height: 75px;
		padding-top: 30px;
		text-align: center;
		border-radius: 10px;
	}
	
	.b_center_middle .aa .aaa{
		position: absolute;
		left: 0;
		top:0;
		width: 105px;
		height: 65px;
		padding-top: 40px;
		text-align: center;
		border: 1px solid #E6E6E6;
		border-radius: 10px;
	}
	
	.b_center_middle img{
		width: 105px;
		height: 105px;
		border: 1px solid grey;
		border-radius: 10px;
	}
	
	.b_center_middle a{
		position: relative;
		display: inline-block;
		width: 105px;
		height: 105px;
	}
	
	.b_center_middle a .over{
		position: absolute;
		top: 0;
		opacity:0;
		background: white;
		width: 105px;
		height: 75px;
		padding-top: 30px;
		text-align: center;
		transform:translate(0, 50px);
		transition: 0.5s;
		color: black;
		font-weight: 600;
		border-radius: 10px;
	}
	
	.b_center_middle a:hover .over{
		opacity: 0.8;
		transform:translate(0,0);
	}
	
	.over .p_name{
		font-size: 13px;
	}
	
	.over .price{
		font-size: 11px;
		color: blue;
	}
</style>
		
		</div>
		<div id="b_center">
			<p class="b_center_top"><a href="Product"><img src="images/center_top.jpg"></a></p>
			<div class="b_center_middle">
					
				<c:forEach items="${p_arr}" var="arr">
					<c:choose>
						<c:when test="${arr ne null}">
							<a href="javascript:goProductView('${arr.getNo()}')">
								<img src="attach/product/${arr.getAttach()}">
								<div class="over">
									<p class="p_name">${arr.getP_name()}</p>
									<p class="price">${arr.getStrPrice()}</p>
								</div>
							</a>
						</c:when>
						<c:otherwise>
							<div class="aa">
								<a class="aaa">상품 준비중</a>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>		
				
			</div>

		</div>
		<div id="b_right">
			<img src="images/center_right.jpg">
		</div>
		<div id="b_bottom_2">
			<a href=""><img src="images/cello.png"></a>
		</div>		
	</div>
</div>	
<div id="footer_div">	
	<div id="footer">
		<div class="b_bottom_left">
			<img src="images/footer_logo_4.jpg">
		</div>
		<div class="b_bottom_center">
			<p>개인정보처리방침  | 개인정보보호정책 | 이용약관 | 협회소개</p>
			우편번호 (26349) 강원 원주시 호저면 우무개로 365 2층, 2호 | 사업자번호 : 209-82-64664<br>
			TEL: 033-747-4012 | FAX: 033-747-4014 | E-mail: korbamtb@daum.net<br>
			COPYRIGHT 2012 KOREA OFF ROAD BIKE ASSOCIATION. ALL RIGHT RESERVED		
		</div>
		<div class="b_bottom_right">
			서울사무소: (02) 4545- 8545<br>
			대전사무소: (042) 5417- 8842<br>
			광주사무소: (052) 4545- 2214<br>
			부산사무소: (048) 4545- 7546
		</div>
	</div>
</div>
</body>
</html>















    