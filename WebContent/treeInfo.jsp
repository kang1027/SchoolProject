<%@page import="VO.TreeInfoVO"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String treename = request.getParameter("treename");
    	
    	TreeInfoDAO dao = new TreeInfoDAO();
    	TreeInfoVO info = dao.getTreeInfo(treename);
		String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=info.getTreename() %>나무 정보</title>
<link rel="stylesheet" href="css/head.css">
<style>
@font-face{
	font-family : "content2";
	src : url("font/CONTENT2.ttf");
}
#wrap{
	margin : auto;
	width : 1200px;
	border : 1px solid #d1d1d1;
	padding : 50px;
	border-radius : 30px;
}
#h{
margin : 20px;
	margin-bottom : 10%;
}
#h h1{
	font-family : "main";
	font-size : 2.5em;
	
}
#h p a{text-decoration : none; color : black; border : 1px solid black; padding : 3px;	}
#treeImg{
	float : left;
	margin-left : 5%;
	margin-bottom : 10%;
}
#treeHeader{
	float : right;
	width : 400px;	
}
#treeInfo{
	clear : both;
}
#treeInfo h1{
	font-family : "main";
}
table{
	border : none;
	font-family : "content2";
}
p{
	font-family : "content2", "바탕체";
	line-height : 25px;
}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div id="padding"></div>
	<div id="wrap">
	<div id="h">
		<h1><%=treename %></h1>
		<p><a href="downTreeImage.jsp?downImage=<%=info.getTreePhoto()%>">이미지 다운</a>
		<%if(!(session.getAttribute("id")==null)){ %>
		<a href="updateTree.jsp?name=<%=info.getTreename() %>">나무 수정 / 삭제</a><%} %></p>
	</div>
		<div id="content">
			<div id="treeImg">
				<img src="<%=path+"/uploadImage/"+info.getTreePhoto() %>" style="width : 400px;">
			</div>
			
			
			<div id="treeHeader">
			<table>
				<tr><td>이름 : </td><td><%=treename%></td></tr>
				<tr><td>수명 : </td><td> <%=info.getTreelife() %>년</td></tr>
				<tr><td>분포 지역 : </td><td><%=info.getTreearea() %></td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td rowspan="8">분류</td></tr>
				<tr><td>계 : <%=info.getTreeclass1() %></td></tr>
				<tr><td>문 : <%=info.getTreeclass2() %></td></tr>
				<tr><td>강 : <%=info.getTreeclass3() %></td></tr>
				<tr><td>목 : <%=info.getTreeclass4() %></td></tr>
				<tr><td>과 : <%=info.getTreeclass5() %></td></tr>
				<tr><td>속 : <%=info.getTreeclass6() %></td></tr>
				<tr><td>종 : <%=info.getTreeclass7() %></td></tr>
			</table>
				
				
			</div>
			<div id="treeInfo">
				<h1>개요</h1>
				<p><%=info.getTreeintro() %></p>
				<h1>특징</h1>
				<p>
				<%=info.getTreePoint()%></p>		
			</div>
		
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>