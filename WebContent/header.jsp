<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <header>
    	Tree
    	<div id="nickname" style="float : right">
    		<%
    			if(!(session.getAttribute("nickname") == null))
    				out.println(session.getAttribute("nickname")+"<a href='logoutUser.jsp'> 로그아웃</a>");
    		%>
    	</div>
    </header>