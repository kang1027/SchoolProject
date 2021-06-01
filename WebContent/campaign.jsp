<%@page import="VO.CampainVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		TreeInfoDAO dao = new TreeInfoDAO();
   		ArrayList<CampainVO> list = dao.getCampainList();
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인</title>
<style>
	#campainTable{
		width : 1200px;
		margin : auto;
		text-align : center;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<table border="1" id="campainTable" >
	<tr>
		<th width="20%">캠페인이름</th>
		<th width="20%">캠페인소개</th>
		<th width="10%">기업이름</th>
		<th width="20%">캠페인 주소</th>
		<th width="20%">캠페인 문의</th>
		<th width="10%">상태</th>
	</tr>
	<%for(CampainVO vo : list){%>
		<tr>
			<td><%=vo.getTcname() %></td>
			<td><%=vo.getTcintro() %></td>
			<td><%=vo.getCpname()%></td>
			<td><%=vo.getTcurl() %></td>
			<td><%=vo.getTccall() %></td>
			<td><%=vo.getTcstate() %></td>
		</tr>
	<%} %>
	</table>
</body>
</html>