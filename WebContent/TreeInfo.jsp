<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conn.jdbcConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	int treecode = Integer.parseInt(request.getParameter("treecode"));
    	Connection conn = jdbcConn.getC();
    	ResultSet rs = null;
    			
    	String treename = "";
    	String treelife = "";
    	String treepoint = "";
    	try(PreparedStatement stmt = conn.prepareStatement("select * from treeinfo where treecode = ?")){
    		stmt.setInt(1, treecode);
    		rs = stmt.executeQuery();
    		
    		if(rs.next()){
    			treename = rs.getString("treename");
    			treelife = rs.getString("treelife");
    			treepoint = rs.getString("treepoint");
    		}
    	}
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
	<table border="1" width="500px" >
	 	<tr>
	 		<th width="15%">나무 이름</th>
	 		<th width="15%">나무 수명</th>
	 		<th>나무 특징</th>
	 	</tr>
		<tr>
			<th><%=treename%></th>
			<th><%=treelife%>년</th>
			<th><%=treepoint%></th>
		</tr>
	</table>
</body>
</html>