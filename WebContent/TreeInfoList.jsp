<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conn.jdbcConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
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

	 <%
    	try(Connection conn = jdbcConn.getC();
    			PreparedStatement stmt = conn.prepareStatement("select * from treeinfo");
    			ResultSet rs = stmt.executeQuery()){
    		while(rs.next()){
    			%>
    			<tr>
    				<td><a href="TreeInfo.jsp?treecode=<%=rs.getInt("treecode")%>"><%= rs.getString("treename") %></a></td>
    			</tr>
    			<%
    		}
    	}
    %>
	</table>
</body>
</html>