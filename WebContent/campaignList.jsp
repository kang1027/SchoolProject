<%@page import="java.text.SimpleDateFormat"%>
<%@page import="VO.CampaignVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		TreeInfoDAO dao = new TreeInfoDAO();
		ArrayList<CampaignVO> list = dao.getCampaignList();
		dao.updateCampaignState(list);
		list = dao.getCampaignList();

   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인</title>
<style>
	#campainTable{
		width : 1500px;
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
		<th width="3%">캠페인 코드</th>
		<th width="12%">기업이름</th>
		<th width="20%">캠페인사진</th>
		<th width="15%">캠페인이름</th>
		<th width="25%">캠페인소개</th>
		<th width="10%">캠페인 문의</th>
		<th width="10%">상태</th>
	</tr>
	<%
	for(CampaignVO vo : list){
	%>
		<tr>
			<td>
			<%if(!(session.getAttribute("id") == null)){ %><a href="updateCampaign.jsp?code=<%=vo.getTccode()%>"><%} %>
			<%=vo.getTccode() %></a>
			</td>
			<td><a href="<%=vo.getCpurl()%>" target="_blank"><%=vo.getCpname()%></a></td>
			<td><img src="<%=request.getContextPath()+"/uploadCampaign/"+vo.getTcphoto() %>"></td>
			<td><a href="<%=vo.getTcurl() %>" target="_blank"><%=vo.getTcname() %></a></td>
			<td><%=vo.getTcintro() %></td>
			<td><%=vo.getTccall() %></td>
			<td><%=vo.getTcstate() %></td>
		</tr>
	<%} %>
	</table>
</body>
</html>