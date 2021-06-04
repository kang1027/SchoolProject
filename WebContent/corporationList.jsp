<%@page import="VO.CorporationVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
		TreeInfoDAO dao = new TreeInfoDAO();
		ArrayList<CorporationVO> list = dao.getCorporationList();

   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인</title>
<style>
	#corporationTable{
		width : 1500px;
		margin : auto;
		text-align : center;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<table border="1" id="corporationTable" >
	<tr>
		<th>기업 사진</th>
		<th >기업 이름</th>
		<th >기업 소개</th>
		<th >기업 전화</th>
	</tr>
	<%
	for(CorporationVO vo : list){
	%>
		<tr>
			<td><img src="<%=request.getContextPath()+"/uploadCorporation/"+vo.getCpphoto()%>"></td>
			<td><a href="<%=vo.getCpurl()%>" target="_blank"><%=vo.getCpname()%></a></td>
			<td><%=vo.getCpintro() %></td>
			<td><%=vo.getCpcall() %></td>
		</tr>
	<%} %>
	</table>
</body>
</html>