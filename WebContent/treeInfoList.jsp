<%@page import="VO.TreeInfoVO"%>
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
   		int max = dao.maxTree();
   				
   		ArrayList<TreeInfoVO> list = dao.getTreeInfoList(sort);
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나무 정보</title>
<link rel="stylesheet" href="css/head.css">
<link rel="stylesheet" href="css/page.css">
<style>

#TreeInfoText{
	margin-bottom : 70px;
	margin-left : 15px;
	font-family : "main";
	font-size : 1.2em;
	line-height : 60px;
}
hr{
border : 1px solid #e0e0e0;
margin-bottom : 70px;}
table{
	width : 1500px;
	margin-left : 12%;
	border : none;
}
tr{float : left; width : 25%; }
td, th{border : none;
	font-family : "content";}
th{font-size : 1.3em;}
#treetext{padding-left : 130px;}
#sorttext{padding-left : 220px;}
tr{text-align : center;}
td a{
	text-decoration : none;
	color : black;
}
select{
	border : none;
	font-size : 0.8em;
	font-family : "content";
	font-weight : bold;
}



</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div id="padding"></div>
	<div id="TreeInfoText">
		<h1>다양한 나무들<br>숲에 한 그루</h1>
	</div>
	<hr>
	<table border="1">
	<tr><th>나무 수 : <%=max %></th></tr>
	<tr><th><div id="treetext">&nbsp;</div></th></tr>
	<tr><th><div id="treetext">&nbsp;</div></th></tr>
	<tr><th>
		<div id="sorttext">
			<select id="TreeSort" name="sort" onchange="chageSelect()">
				<option value="">등록순</option>
				<option value="reverse">등록역순</option>
				<option value="abc">이름순</option>
				<option value="cba">이름역순</option>
			</select>
		</div>
	</th></tr>
	<%for(TreeInfoVO vo : list){%>
		<tr><%String path = request.getContextPath();%>
			
			<td> <a href="treeInfo.jsp?treename=<%=vo.getTreename()%>"><img src="<%=path+"/uploadImage/"+vo.getTreePhoto() %>" style="height : 300px; width : 300px;"><br>
			<%=vo.getTreename()%></a></td>
		</tr>
	<%} %>
	</table>
	<%@ include file="footer.jsp" %>
	<script>
	window.onload = function(){
		var value = <%="\""+(sort)+"\""%>;
		var abc = document.querySelector("#TreeSort");
		for(var i = 0; i < abc.length; i++)
			if(abc[i].value == value)
				abc[i].selected = true;
	}
		function chageSelect(){
			var value = document.getElementById("TreeSort").value;
			location.replace('treeInfoList.jsp?sort='+value);
		}
	</script>
</body>
</html>