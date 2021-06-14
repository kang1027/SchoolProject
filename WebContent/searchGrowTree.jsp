<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Crawler.NaverCrawlerMain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	int currPage = 1;
    	int firstIndex = 0;
    	int endIndex = firstIndex+3;
    	if(!(request.getParameter("currPage") == null)){
    		currPage = Integer.parseInt(request.getParameter("currPage"));    
    		firstIndex = currPage * 3 - 3;
			endIndex = firstIndex+3;
    	}else
    		currPage = 1;
    	List<Map<String, Object>> blogs = null;
    	boolean isSearch = false;
    	String a = request.getParameter("word");
    	String word = a + " 키우기";
    	if(a == null || a.equals(""))
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
<title>키서치</title>
<link rel="stylesheet" href="css/head.css">
<link rel="stylesheet" href="css/page.css">
<style>
	#serachTable{
		width : 600px;
		height : 400px;
		margin : auto;
		border : none;
	}
	tr{border : none;}
	tr:last-child th{border : none;}
	tr:first-child{
		height : 50px;
	}
	th{font-family : "content";}
	#currpage{float : right; padding-right : 10px;}
	#searchResultText{
		padding-left : 100px;
	}
	#serachTable img{
		width : 30px;
	}
	#search{
		text-align : center;
		height : 40px;
		width : 400px;
		border : 1px solid #00d2ff;
		background : white;
		margin : auto;
	}
	#word{
		font-size : 16px;
		width : 325px;
		padding : 10px;
		border : 0;
		outline : none;
		float : left;
	}
	#submit{
		width : 50px;
		height : 100%;
		border : 0px;
		background : #00d2ff;
		outline : none;
		float : right;
		color : white;
		cursor : pointer;
	}
	#SearchText{
	margin-bottom : 70px;
	margin-left : 15px;
	font-family : "main";
	font-size : 1.2em;
	line-height : 60px;
	
}
hr{
border : 1px solid #e0e0e0;
margin-bottom : 70px;}

</style>
</head>
<body>

	<%@ include file="header.jsp" %>
	<div id="padding"></div>
	<div id="SearchText">
		<h1>내 나무는 어떻게 키워야 할까?<br>그럴땐 키서치</h1>
	</div>
	<hr>
	
	<form action="searchGrowTree.jsp" onsubmit="return checkV()">
		<div id="search">
			<input type="text" id="word" name="word" value="" placeholder="키울 나무를 입력해주세요.">
			<input type="submit" id="submit" value="검색">
		</div>
	</form>
	<br><br>
	<%
	if(isSearch){
		if(blogs == null)
		{
			out.println("<script>alert('당신에게 딱 맞는 곳..'); location.replace('https://0129ambulence.modoo.at/?gclid=Cj0KCQjw78yFBhCZARIsAOxgSx0owyBQ0i3bCPTJ66282U0DORoELL7Dv0oM1QISW_o3PhiD6YdbrbIaAhHyEALw_wcB')</script>");
			return;
		}
		if(blogs.size() == 0 || blogs.size() == 1 || blogs.size() == 2)
			out.println("<script>alert('없는 결과입니다. 다시 입력해주세요.')</script>");
		else{
			String[] fields = {"title", "link", "description"};
			out.println("<table border='1px' id='serachTable'");
			out.println("<tr><th colspan='3'><span id='searchResultText'>"+word+" 검색 결과입니다.</span> <span id='currpage'>현재 페이지 : "+currPage +"</span></th></tr>");
			out.println("<tr><th width='20%'>제목</th>");
			out.println("<th width='70%'>내용</th>");
			out.println("<th width='10%'>포탈</th></tr>");
			try{
				for(int i = firstIndex; i < endIndex; i++){
					out.println("<tr><th>");
					out.println("<a href='"+blogs.get(i).get("link") +"'title='"+ blogs.get(i).get("link") +"'target='_blank' >"+blogs.get(i).get("title") +"</a>");
					out.println("</th>");
					out.println("<th>");
					out.println(blogs.get(i).get("description")+"<br>");
					out.println("</th>");
					out.println("<th><a href='https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=2&groupId=0' target='_blank'><img src='Image/Naver_Logo.png'></a></th></tr>");
				}
			}catch (Exception e)
			{
				System.out.println("검색 결과 9개 미만.");
			}
			
			out.println("<tr><th colspan='2'><input type='button' onclick='movePage(0)' value='이전'><input type='button' onclick='movePage(1)' value='다음'></th>");
			out.println("</tr></table>");
		}
		
	}
	%>
	<%@ include file="footer.jsp" %>
<script>
	function movePage(num){
		var nextPage = <%=currPage+1%>;
		var beforePage = <%=currPage-1%>;
		var word = <%="\""+(a)+"\""%>;
		if(num == 1){
			<%if(currPage == 1 || currPage == 2){%>
				location.replace('searchGrowTree.jsp?word='+word+'&currPage='+nextPage);
			<%}else{}%>
		}
		else{
			<%if(currPage == 3 || currPage == 2){%>
				location.replace('searchGrowTree.jsp?word='+word+'&currPage='+beforePage);
			<%}else{}%>
		}
			
			
	} 
	function checkV(){
		if(document.getElementById('word').value == "")
		{
			alert('검색단어를 입력해주세요.');
			return false;
		}
		return true;
	}
</script>
</body>
</html>