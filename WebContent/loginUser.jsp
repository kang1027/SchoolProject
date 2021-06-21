<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
    	if(id == null || id.equals(""))
    		id = "";	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/head.css">
<style>
	h1{
		font-family : "main";
	}
	#loginform{
		margin : auto;
		text-align : center;
		border : 1px solid black;
		padding : 30px;
		border-radius : 25px;
		width : 600px;
	}
	#id, #pw{
		font-size : 16px;
		padding : 10px;
		outline : none;
		border : 1px solid #00d2ff;
	}
	#submit{
		width : 150px;
		border-radius : 10px;
		padding : 10px;
		font-size : 14px;
		border : 0px;
		background-color : #00d2ff;
		outline : none;
		color : white;
		cursor : pointer;
		transition : 0.2s;
	}
	#submit:hover{
		background-color : #00a6ff;
	}
	form a{
		padding : 10px;
		width : 70px;
		text-decoration : none;
		color : black;
		transition : 0.2s;
		border-bottom : 1px solid black;
	}
	form a:hover{
		background-color : #00a6ff;	
		border : none;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div id="padding"></div>
	<form action="loginUserCtrl.jsp" method="post" onsubmit="return checkValue()">
		<div id="loginform">
			<div id="logintxt"><h1>로그인</h1></div><br>
			<input type="text" name="id" id="id"  placeholder="아이디를 입력하세요." value="<%=id %>" autofocus><br><br>
			<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요." ><br><br>
			<input type="submit" id="submit" value="로그인" id="loginbtn"><br><br>
			<a href="addUser.jsp">회원가입하기</a><br><br>
		</div>
	</form>
	<%@ include file="footer.jsp" %>
	<script>
	function checkValue() {
		
		if(document.getElementById("id").value === "") {
			alert('아이디가 입력되지 않았습니다');
			document.getElementById("id").focus();
			return false;
		}
		if(document.getElementById("pw").value === "") {
			alert('비밀번호가 입력되지 않았습니다');
			document.getElementById("pw").focus();
			return false;
		}
		
		return true;
	}
	</script>
	
</body>
</html>