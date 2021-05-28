<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
	<form action="addTreeCtrl.jsp">
		<table border="1">
			<tr>
				<th>나무 이름</th>
				<td><input type="text" name="treename" value=""
					placeholder="나무 이름을 입력해주세요..."></td>
			</tr>
			<tr>
				<th>나무 수명</th>
				<td><input type="text" name="treelife" value=""
					placeholder="나무 수명을 입력해주세요..."></td>
			</tr>
			<tr>
				<th>나무 특징</th>
				<td><textarea name="treepoint" cols="30" rows="10"
						placeholder="나무 특징 입력해주세요..."></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="나무 등록하기"></th>
			</tr>
		</table>
	</form>
</body>
</html>