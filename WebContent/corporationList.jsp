<%@page import="VO.CorporationVO"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		ArrayList<CorporationVO> list = dao.getCorporationList(sort);
		int max = dao.maxCorporation();

   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업</title>
<link rel="stylesheet" href="css/head.css">
<link rel="stylesheet" href="css/page.css">
<style>
	#corporationTable{	width : 1500px;
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
	font-family : "content";
}
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
	<table border="1" id="corporationTable" >
	
	 	<tr><th>등록된 기업 수 : <%=max %></th></tr>
		<tr><th style="padding-left : 360px;">
			<div id="sorttext">
				<select id="CampaignSort" name="sort" onchange="chageSelect()">
					<option value="">이름순</option>
					<option value="cba">이름역순</option>
				</select>
			</div>
		</th></tr>
		<%
		for(CorporationVO vo : list){
		%>
			<tr>
				<td><a href="<%=vo.getCpurl() %>" target="_blank"><img src="<%=request.getContextPath()+"/uploadCorporation/"+vo.getCpphoto() %>" style="width : 400px; height : 300px">
				<br><%=vo.getCpname() %></a>
				<div id="tcintro" style="width : 550px;">
					<br><%=vo.getCpintro()%>
				</div>
				<br>문의 : <%=vo.getCpcall() %><br>
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
			location.replace('corporationList.jsp?sort='+value);
		}
	</script>
</body>
</html>