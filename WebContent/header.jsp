<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div id="header-inner">
<header>
	<div id="h_logo"><a href="index.jsp">트티파이</a></div>
	
	<%if(!(session.getAttribute("nickname") == null)){ %>
	<div id="nickname" style="margin-right : 50px; font-size : 1.5em; margin-top : 40px;">
		<%
			out.println("<a href='logoutUser.jsp'>"+session.getAttribute("nickname")+"</a>");
		%>
	</div>
	<%}else{ %>
	<div id="login" style="margin-right : 50px; font-size : 1.5em; margin-top : 40px;"><a href="loginUser.jsp">로그인</a></div>
	<%} %>
	<div id="sub_back"></div>
</header>

<ul id="menu">
	<li>
		<a href="treeInfoList.jsp">나무</a>
		<div id="sub-menu">
			<a href="treeInfoList.jsp">나무 정보</a>
			<%if(!(session.getAttribute("id") == null)){ %>
			<a href="addTree.jsp">나무 등록</a><%} %>
		</div>
	</li>
	<li>
		<a href="campaignList.jsp">캠페인</a>
		<div id="sub-menu">
			<a href="campaignList.jsp">캠페인 정보</a>
			<%if(!(session.getAttribute("id") == null)){ %>
			<a href="addCampaign.jsp">캠페인 등록</a><%} %>
		</div>
	</li>
	<li>
		<a href="corporationList.jsp">기업</a>
		<div id="sub-menu">
			<a href="corporationList.jsp">기업 정보</a>
			<%if(!(session.getAttribute("id") == null)){ %>
			<a href="addCorporation.jsp">기업 등록</a><%} %>
		</div>
	</li>
	<li>
		<a href="searchGrowTree.jsp">키서치</a>
		<div id="sub-menu">
			<a href="searchGrowTree.jsp">키서치 하기</a>
		</div>
	</li>
	</ul>
</div>