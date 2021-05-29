<%@page import="Crawler.NaverImageCrawler"%>
<%@page import="Crawler.NaverImageRequestCrawler"%>
<%@page import="Crawler.NaverImageCompareCrawler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		NaverImageRequestCrawler requestImg = new NaverImageRequestCrawler();
		String key = requestImg.RequestKey();
		NaverImageCrawler img = new NaverImageCrawler();
		String imageKey = key.substring(8,24);
//		String isCreateImage = img.Image(imageKey);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp" %>


	<form method="post" action="insertUserCtrl.jsp"
		onsubmit="return checkValue()">
		<div id="insert">
			<div id="insertform">
				<div id="inserttxt">
					<h1>회원가입</h1>
				</div>
				<div id="id">
					<input type="text" name="inId" placeholder="아이디를 입력해주세요."
						id="inputid" autofocus>
					<input type="button" onclick="CheckId()" value="아이디 중복확인">
				</div>
				<br>
				<div id="pw">
					<input type="password" name="inPw" placeholder="비밀번호를 입력해주세요."
						id="inputpw">
				</div>
				<br>
				<div id="pw-check">
					<input type="password" placeholder="비밀번호를 다시 입력해주세요."
						id="inputpw-check">
				</div>
				<br>
				<div id="email">
					<input type="email" name="inEmail" placeholder="이메일을 입력해주세요."
						id="inputemail">
				</div>
				<br>
				<div id="name">
					<input type="text" name="inName" placeholder="이름을 입력해주세요."
						id="inputname">
				</div>
				<br> 
			</div>
		</div><br>
		보안문자 : <br><br>
		<iframe src="https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=<%=imageKey %>" style="width : 200px; height : 90px"></iframe>
		<br>
		<input type="text" placeholder="보안문자를 입력해주세요..."><br>
		<input type="submit" value="회원가입" id="insertbtn">
	</form>
	<script>
		function CheckId(){
			var id = document.getElementById("inputid").value;
			<%-- 아이디 중복확인 해주삼. --%>
		}
		function checkValue() {

			if (document.getElementById("inputid").value === "") {
				alert('아이디가 입력되지 않았습니다');
				document.getElementById("inputid").focus();
				return false;
			}
			if (document.getElementById("inputpw").value === "") {
				alert('비밀번호가 입력되지 않았습니다');
				document.getElementById("inputpw").focus();
				return false;
			}
			if (document.getElementById("inputemail").value === "") {
				alert('이메일이 입력되지 않았습니다');
				document.getElementById("inputemail").focus();
				return false;
			}
			if (document.getElementById("inputname").value === "") {
				alert('이름이 입력되지 않았습니다');
				document.getElementById("inputname").focus();
				return false;
			}
			if (document.getElementById("inputpw").value != document
					.getElementById("inputpw-check").value) {
				alert('비밀번호를 다시 확인해주세요.');
				document.getElementById("inputpw").focus();
				return false;
			}

			return true;
		}
	</script>
</body>
</html>