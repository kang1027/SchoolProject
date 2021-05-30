<%@page import="VO.TreeInfoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		TreeInfoDAO dao = new TreeInfoDAO();
   		ArrayList<TreeInfoVO> list = dao.getTreeInfoList();
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<table border="1">
	<%for(TreeInfoVO vo : list){%>
		<tr>
			<td><a href="treeInfo.jsp?treename=<%=vo.getTreename()%>"><%=vo.getTreename()%></a></td>
		</tr>
	<%} %>
	</table>
</body>
</html>