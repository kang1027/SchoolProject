<%@page import="VO.TreeInfoVO"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String treename = request.getParameter("treename");
    	
    	TreeInfoDAO dao = new TreeInfoDAO();
    	TreeInfoVO info = dao.getTreeInfo(treename);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=info.getTreename() %>나무 정보</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<%if(!(session.getAttribute("id")==null)){ %><a href="downTreeImage.jsp?downImage=<%=info.getTreePhoto()%>">이미지 다운</a>
	<a href="updateTree.jsp?name=<%=info.getTreename() %>">나무 수정 / 삭제</a><%} %>
	
	<table border="1" width="1000px" >
	 	<tr>
	 		<th width="15%">나무 이름</th>
	 		<th width="15%">나무 수명</th>
	 		<th width="30%">나무 특징</th>
	 		<th width="40%">나무 사진</th>
	 	</tr>
		<tr>
			<th><%=treename%></th>
			<th><%=info.getTreelife()%>년</th>
			<th><%=info.getTreePoint()%></th>
			<%String path = request.getContextPath();%>
			<th><img src="<%=path+"/uploadImage/"+info.getTreePhoto() %>" style="height : 300px;"></th>
		</tr>
	</table>
</body>
</html>