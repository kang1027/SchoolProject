<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Crawler.NaverCrawlerMain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String word = request.getParameter("word") + " 키우기";
    	List<Map<String, Object>> blogs = null;
    	boolean isSearch = false;
    	if(word == null || word.equals(""))
    		out.println("<script>alert('검색단어를 입력해주세요.')</script>");
    	else{
    	    	NaverCrawlerMain blog = new NaverCrawlerMain();
    	    	blogs = blog.getBlog(word);
    	    	isSearch = true;
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
	
	<form action="searchGrowTree.jsp">
		<input type="text" name="word" value="" placeholder="키울 나무를 입력해주세요.">
		<input type="submit" value="검색">
	</form>
	<%
	if(isSearch){
		if(blogs.size() == 0)
			out.println("<script>alert('없는 결과입니다. 다시 입력해주세요.')</script>");
		String[] fields = {"title", "link", "description"};
		for(int i = 0; i < blogs.size(); i++){
			out.println(blogs.get(i).get("title")+"<br>");
			out.println(blogs.get(i).get("link")+"<br>");
			out.println(blogs.get(i).get("description")+"<br>");
			out.println("<br><br><br>");
		}
		
	}
	%>
</body>
</html>