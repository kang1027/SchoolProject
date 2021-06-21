<%@page import="java.text.SimpleDateFormat"%>
<%@page import="VO.CampaignVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		request.setCharacterEncoding("utf-8");
   		TreeInfoDAO dao = new TreeInfoDAO();
		String sort = request.getParameter("sort");
   		if(sort == null || sort.equals(""))
   			sort = "";

		ArrayList<CampaignVO> list = dao.getCampaignList(sort);
		dao.updateCampaignState(list);
		list = dao.getCampaignList(sort);
		int max = dao.maxCampaign();
		int ableTc = dao.ableCampaign();
	
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인</title>
<link rel="stylesheet" href="css/head.css">
<style>
#campainTable{
	width : 1500px;
	margin : auto;
	text-align : center;
	border : none;
	margin-left : 350px;
}
tr{
	float : left;
	width : 50%;
	border : none;
	margin-top : 100px;
}
th{border : none;}
td{
	padding : 30px;
	border-radius : 15px;
	font-family : "content";}
td a{color : black;}
select{
	border : none;
	font-size : 1.0em;
	font-family : "content";
	font-weight : bold;
}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div id="start"><img src="Image/Campaign.JPG"></div>
	
	<table border="1" id="campainTable" >
<!-- 	<tr>
		<th width="3%">캠페인 코드</th>
		<th width="12%">기업이름</th>
		<th width="20%">캠페인사진</th>
		<th width="15%">캠페인이름</th>
		<th width="25%">캠페인소개</th>
		<th width="10%">캠페인 문의</th>
		<th width="10%">상태</th>
	</tr>
 -->
 	<tr><th>총 캠페인 수 : <%=max %></th><th>&nbsp;&nbsp;&nbsp;모집중인 캠페인 수 : <%=ableTc %></th></tr>
	<tr><th style="padding-left : 370px;">
		<div id="sorttext">
			<select id="CampaignSort" name="sort" onchange="chageSelect()">
				<option value="">전체</option>
				<option value="able">모집중</option>
				<option value="unable">모집마감</option>
			</select>
			</div>
	</th></tr>
	<%
	for(CampaignVO vo : list){
	%>
		<tr>
			<td><a href="<%=vo.getTcurl() %>" target="_blank"><img src="<%=request.getContextPath()+"/uploadCampaign/"+vo.getTcphoto() %>" style="width : 400px; height : 300px">
			<br><%=vo.getTcname() %></a>
			<div id="tcintro">
				<br><%=vo.getTcintro().substring(0,30) %>
				<br><%=vo.getTcintro().substring(30,60) %>
				<br><%=vo.getTcintro().substring(60,70) %>...
			</div>
			<br>주최 : <%=vo.getCpname()%> <a href="<%=vo.getCpurl()%>" target="_blank">바로가기</a>
			<br>문의 : <%=vo.getTccall() %><br>
			<br><%if(vo.getTcstate().equals("모집")) out.println("<div id='state' style='color : green;'>"+vo.getTcstate()+"</div>"); 
			else out.println("<div id='state' style='color : red;'>"+vo.getTcstate()+"</div>"); %><br><br>
			<br><%if(!(session.getAttribute("id") == null)){ %><a href="updateCampaign.jsp?code=<%=vo.getTccode()%>"><%=vo.getTccode() %></a><%} %>
			</td>		
		</tr>
	<%} %>
	</table>
	<%@ include file="footer.jsp" %>
	<script>
	window.onload = function(){
		var value = <%="\""+(sort)+"\""%>;
		var abc = document.querySelector("#CampaignSort");
		for(var i = 0; i < abc.length; i++)
			if(abc[i].value == value)
				abc[i].selected = true;
	}
		function chageSelect(){
			var value = document.getElementById("CampaignSort").value;
			location.replace('campaignList.jsp?sort='+value);
		}
	</script>
</body>
</html>