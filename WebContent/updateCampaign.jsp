<%@page import="VO.CampaignVO"%>
<%@page import="VO.CorporationVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
		int code = Integer.parseInt(request.getParameter("code"));
	
		TreeInfoDAO dao = new TreeInfoDAO();
		CampaignVO tcvo = dao.getCampaignInfo(code);
		ArrayList<CorporationVO> list = dao.getCorporationList();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 등록</title>
<link rel="stylesheet" href="css/page.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<form  method="post" action="updateCampaignCtrl.jsp" onsubmit="return checkV()">
		<table border="1">
			<tr>
				<th>기업 선택</th>
				<td><select id="cpname" name="cpname">
					<option value="">기업을 선택해주세요.</option>
					<%for(CorporationVO vo : list){ %>
					<option value="<%=vo.getCpname()%>-<%=vo.getCpurl()%>"><%=vo.getCpname() %></option>
					<%} %>
				</select>  <a href="addCorporation.jsp">기업이 없나요?</a></td>
			</tr>
			<tr>
				<th>캠페인 이름</th>
				<td><input type="text" name="tcname" id="tcname" value="<%=tcvo.getTcname() %>" placeholder="캠페인 이름을 입력해주세요..."></td>
			</tr>
			<tr>
				<th>캠페인 주소</th>
				<td><input type="text" name="tcurl" id="tcurl" value="<%=tcvo.getTcurl() %>" placeholder="캠페인 주소를 입력해주세요..."></td>
			</tr>
			<tr>
				<th>캠페인 소개</th>
				<td><textarea name="tcintro" id="tcintro" cols="30" rows="10" placeholder="캠페인을 소개해주세요.."><%=tcvo.getTcintro() %></textarea></td>
			</tr>
			<tr>
				<th>캠페인 문의</th>
				<td>
					<input type="text" name="tccall" id="tccall" value="<%=tcvo.getTccall() %>" placeholder="캠페인 문의번호를 입력해주세요...">
				</td>
			</tr>
			<tr>
				<th>캠페인 날짜</th>
				<td>
					<input type="date" name="tcdate" id="tcdate" value="<%=tcvo.getTcdate()%>"> <small>※마감날짜를 기재해주세요.</small>
				</td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="캠페인 수정하기"><input type="button" onclick="location.replace('deleteCampaign.jsp?code=<%=tcvo.getTccode() %>')" value="캠페인 삭제하기"><input type="hidden" value="<%=code %>" name="code"></th>
			</tr>
		</table>
	</form>
	
	<%@ include file="footer.jsp" %>
	<script>
	window.onload=function(){
		for(var i = 0; i < document.getElementById("cpname").length; i++)
			if(document.getElementById("cpname")[i].value.split("-")[0] == <%="\""+(tcvo.getCpname())+"\""%>)
				document.getElementById("cpname")[i].selected = true;
	}
		function checkV(){
			var noImage = false;;
			if(document.getElementById('cpname').value==""){
				alert('기업을 선택해주세요.');
				document.getElementById('cpname').focus();
				return false;
			}
			if(document.getElementById('tcname').value==""){
				alert('캠페인 이름을 입력해주세요.');
				document.getElementById('tcname').focus();
				return false;
			}
			if(document.getElementById('tcurl').value==""){
				alert('캠페인 주소를 입력해주세요.');
				document.getElementById('tcurl').focus();
				return false;
			}
			if(document.getElementById('tcintro').value==""){
				alert('캠페인 소개를 입력해주세요.');
				document.getElementById('tcintro').focus();
				return false;
			}
			if(document.getElementById('tcurl').value==""){
				alert('캠페인 주소를 입력해주세요.');
				document.getElementById('tcurl').focus();
				return false;
			}
			if(document.getElementById('tccall').value==""){
				alert('캠페인 문의번호를 입력해주세요.');
				document.getElementById('tccall').focus();
				return false;
			}
			if(document.getElementById('tcdate').value==""){
				alert('캠페인 날짜를 입력해주세요.');
				document.getElementById('tcdate').focus();
				return false;
			}
			return true;
		}
		
	</script>
</body>
</html>