<%@page import="DAO.UserDAO"%>
<%@page import="Crawler.NaverImageCrawler"%>
<%@page import="Crawler.NaverImageRequestCrawler"%>
<%@page import="Crawler.NaverImageCompareCrawler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		NaverImageRequestCrawler requestImg = new NaverImageRequestCrawler();
		String key = requestImg.RequestKey();
		NaverImageCrawler img = new NaverImageCrawler();
		String imageKey = key.substring(8,24);
		boolean checkId = false;
		
		if(!(id == null) && !id.equals("")){
			UserDAO dao = new UserDAO();
	    	int state = dao.idDoubleCheck(id);
	    	if(state > 0){
	    		out.println("<script>alert('사용 가능한 아이디입니다.');</script>");
				checkId = true;	    		
	    	}
	    	else
	    		out.println("<script>alert('이미 있는 아이디입니다. 아이디를 다시 입력해주세요.');</script>");			
		}
		else
			id = "";
		
//		String isCreateImage = img.Image(imageKey);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<body>
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp" %>


	<form method="post" action="addUserCtrl.jsp" onsubmit="return checkValue()">
		<div id="insertform">
			<h1>회원가입</h1>
			아이디 : <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." value="<%=id%>" <%if(checkId){ %> disabled <%}%> autofocus>
			<input type="button" onclick="CheckId()" value="아이디 중복확인" <%if(checkId){ %> disabled <%}%>>
			<br><br>
			비밀번호 : <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요.">
			<br><br>
			비밀번호 확인 : <input type="password" id="cpw" placeholder="비밀번호를 다시 입력해주세요.">
			<br><br>
			이름 : <input type="text" name="name" id="name" placeholder="이름을 입력해주세요.">
			<br><br>
			성별 : 
			<label for="m">남</label>
			<input type="radio" name="gender" id="m" value="m">
			<label for="f">여</label>
			<input type="radio" name="gender" id="f" value="f">
			<br> <br>
			닉네임 : <input type="text" name="nickName" id="nickName" placeholder="닉네임을 입력해주세요.">
			<br><br>
			보안문자 : <br><br>
			<iframe src="https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=<%=imageKey %>" style="width : 200px; height : 90px"></iframe>
			<br>
			<input type="text" id="capcha" placeholder="보안문자를 입력해주세요..."><br>
			<input type="submit" value="회원가입" id="insertbtn">
		</div><br>
	</form>
	<script>
	var isCheck = false;
	// 새로고침 시 파라미터 없앰.
		window.onkeydown = function() {
			var kcode = event.keyCode;
			if(kcode == 116) {
				history.replaceState({}, null, location.pathname);
			}
		}
	
		function CheckId(){
			if (document.getElementById("id").value === "") {
				alert('아이디가 입력되지 않았습니다');
				document.getElementById("id").focus();
				return false;
			}
			
			var id = document.getElementById("id").value;
			//var w = window.open('idDoubleCheckPop.jsp?id='+id+'','','width=430,height=500, left =50%, top =50%');
			location.replace('addUser.jsp?id='+id);
		}
		function clearCheck(){
			console.log("?");
		}
		function checkValue() {
			if (document.getElementById("id").value === "") {
				alert('아이디가 입력되지 않았습니다');
				document.getElementById("id").focus();
				return false;
			}
			if (document.getElementById("pw").value === "") {
				alert('비밀번호가 입력되지 않았습니다');
				document.getElementById("pw").focus();
				return false;
			}
			if (document.getElementById("cpw").value === "") {
				alert('비밀번호 확인이 입력되지 않았습니다');
				document.getElementById("cpw").focus();
				return false;
			}
			if (document.getElementById("name").value === "") {
				alert('이름이 입력되지 않았습니다');
				document.getElementById("name").focus();
				return false;
			}
			var gender = document.getElementsByName("gender");
			var genderC = "";
			for(var i = 0; i < gender.length; i++){
				if(gender[i].checked)
					genderC = "체크됨";
			}
			if(genderC == "")
			{
				alert('성별이 선택되지 않았습니다.');
				return false;
			}
			if (document.getElementById("nickName").value === "") {
				alert('닉네임이 입력되지 않았습니다.');
				document.getElementById("nickName").focus();
				return false;
			}
			if (document.getElementById("nickName").value === "") {
				alert('닉네임이 입력되지 않았습니다.');
				document.getElementById("nickName").focus();
				return false;
			}
			if (document.getElementById("pw").value != document
					.getElementById("cpw").value) {
				alert('비밀번호가 다릅니다. 다시 확인해주세요.');
				document.getElementById("pw").focus();
				return false;
			}
			if (document.getElementById("capcha").value === "") {
				alert('보안문자를 입력해주세요.');
				document.getElementById("capcha").focus();
				return false;
			}
			if(<%=checkId%> == false)
			{
				alert('아이디 중복확인을 해주세요.');
				return false;
			}
			document.getElementById("id").disabled = false;
			return true;
		}
	</script>
</body>
</html>