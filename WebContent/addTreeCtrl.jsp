<%@page import="TreeDAO.TreeInfoDAO"%>
<%@page import="TreeVO.TreeInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String treename = request.getParameter("treename");
	String treelife = request.getParameter("treelife");
	String treepoint = request.getParameter("treepoint");
	
	TreeInfoVO vo = new TreeInfoVO();
	
	vo.setTreename(treename);
	vo.setTreelife(treelife);
	vo.setTreePoint(treepoint);
	
	TreeInfoDAO dao = new TreeInfoDAO();
	int cnt = dao.addTree(vo);
	if(cnt > 0)
		response.sendRedirect("TreeInfoList.jsp");
	else
		response.sendRedirect("addTree.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>

</body>
</html>