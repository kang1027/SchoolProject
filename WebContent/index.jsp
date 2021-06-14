
<%@page import="DAO.TreeInfoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="Crawler.NaverCrawlerMain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	TreeInfoDAO dao = new TreeInfoDAO();
    	int maxTree = dao.maxTree();
    	int maxCampaign = dao.ableCampaign();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tree 홈페이지</title>
<link rel="stylesheet" href="css/main.css">
<style>
#TreeCnt a, #CampaignCnt a, #CorporationCnt a{
	color : #00bfff;
	text-decoration : none;
}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div id="slide">
		<div>
			<a href="#"><img src="Image/IndexTree11.png"></a>
			<a href="#"><img src="Image/IndexTree22.png"></a>
			<a href="#"><img src="Image/IndexTree33.jpg"></a>
			<a href="#"><img src="Image/IndexTree44.png"></a>
			<a href="#"><img src="Image/IndexTree55.jpg"></a>
		</div>
	</div>
	<div id="contents">
	<br><br><br><br><br><br>
		<h1>트티파이는 환경을 생각합니다.</h1>
		<br><br>
		<div id="TreeCnt">
			<h1><a href="treeInfoList.jsp"><%=maxTree %></a></h1>
			<h2>등록된 나무 수</h2>
		</div>
		<div id="CampaignCnt">
			<h1><a href="campaignList.jsp"><%=maxCampaign %></a></h1>
			<h2>모집중인 캠페인 수</h2>
		</div>
		<div id="CorporationCnt">
			<h1><a href="corporationList.jsp">6</a></h1>
			<h2>등록된 기업 수</h2>
		</div>
	
		<div id="TreeInfo">
			<h1>반려나무와 <br><br>숲을 만드는 여정에<br><br>함께하세요.</h1>
			<div id="TreeInfoImg">
				<a href="https://treepla.net/tree/?idx=232" target="_blank"><img src="Image/TreeInfo1-1.jpg" style="width : 500px; height : 500px;" id="firstTree">
					<p>숲 속에 있는 듯, 소라고사리<br><span id="price">35,000원</span><br><span id="point1">반려동물 안전</span> <span id="point2">공기정화</span></p>
				</a>
				<a href="https://treepla.net/tree/?idx=231" target="_blank"><img src="Image/TreeInfo2-1.jpg" style="width : 500px; height : 500px;" id="secondTree">
					<p>당신에게 행운을 드릴게요, 청페페<br><span id="price">35,000원</span><br><span id="point1">반려동물 안전</span> <span id="point2">공기정화</span></p>
				</a>
			</div>
			<div id="TreeInfoImg">
				<a href="https://treepla.net/tree/?idx=229" target="_blank"><img src="Image/TreeInfo3-1.jpg" style="width : 500px; height : 500px;" id="thirdTree">
					<p>천연 가습기, 아디안텀<br><span id="price">35,000원</span><br><span id="point1">반려동물 안전</span> <span id="point2">공기정화</span></p>
				</a>
				<a href="https://treepla.net/tree/?idx=108" target="_blank"><img src="Image/TreeInfo4-1.jpg" style="width : 500px; height : 500px;" id="fourTree">
					<p>[가정의 달] 숲 만드는 카네이션 + 메세지카드 set<br><span id="price">38,000원</span><br><span id="point3">BEST</span> <span id="point2">공기정화</span></p>
				</a>
			</div>
		</div>
		<div id="padding"></div>
		<hr>
		<h1>당신의 관심으로 변하는 세상</h1>
		<br><br>
		<div id="Tree">
			<a href="treeInfoList.jsp"><img src="Image/IndexTree.jpg"> </a>
		</div>
		<div id="Campaign">
			<a href="campaignList.jsp"><img src="Image/IndexCampaign.jpg"> </a>
		</div>
		<div id="Corporation">
			<a href="corporationList.jsp"><img src="Image/IndexCorporation.jpg"> </a>
		</div>
	</div>
	<%@ include file="mainFooter.jsp" %>
</body>
</html>