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
<title>Insert title here</title>

</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	<form action="loginUserCtrl.jsp" method="post" onsubmit="return checkValue()">
		<div id="loginform">
			<div id="logintxt"><h1>로그인</h1></div><br>
			<input type="text" name="id" id="id"  placeholder="아이디를 입력하세요." value="<%=id %>" autofocus><br><br>
			<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요." ><br><br>
			<input type="submit" value="로그인" id="loginbtn"><br><br>
			<a href="addUser.jsp">회원가입하기</a><br><br>
		</div>
	</form>
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