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
		ArrayList<CorporationVO> list = dao.getCorporationList("");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 등록</title>
<link rel="stylesheet" href="css/head.css">
<link rel="stylesheet" href="css/addupdate.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="padding"></div>
	<form  method="post" action="updateCampaignCtrl.jsp" enctype="multipart/form-data" onsubmit="return checkV()">
	
	<div id="wrap">
		<input type="file" class="hidden_input" id="imageSelector" name="tcPhoto" 
					accept="image/jpeg, image/jpg, image/png">
			<div id="content">
				<div id="treeImg">
					<br>
					<img src="" class="thumb"><br>
					<input type="button" id="changeImgSize" value="원본 보기" style="visibility: hidden;">
					<input type="button" id="reChangeImgSize" value="되돌리기" style="visibility: hidden;">
					<img src="" style="width : 400px;">
				</div>
				
				
				<div id="treeHeader">
				<table>
					<tr>
				<th>기업 선택</th>
				<td><select id="cpname" name="cpname">
					<option value="">기업을 선택해주세요.</option>
					<%for(CorporationVO vo : list){ %>
					<option value="<%=vo.getCpname()%>-<%=vo.getCpurl()%>"><%=vo.getCpname() %></option>
					<%} %>
				</select></td>
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
				</table>
					
					
				</div>
				<div id="treeInfo">
					<h1>캠페인 소개</h1>
					<p><textarea name="tcintro" id="tcintro" cols="170" rows="10" placeholder="캠페인을 자세히 소개해주세요.. "><%=tcvo.getTcintro() %></textarea></p>
				</div>
			<input type="submit" value="캠페인 수정하기"><input type="button" onclick="location.replace('deleteCampaign.jsp?code=<%=tcvo.getTccode() %>')" value="캠페인 삭제하기"><input type="hidden" value="<%=code %>" name="code">
			</div>
		</div>
		
		
		
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
		var validateType = function(img){
			  return (['image/jpeg','image/jpg','image/png'].indexOf(img.type) > -1);
			}
		// 파일 선택 필드에 이벤트 리스너 등록
		document.getElementById('imageSelector').addEventListener('change', function(e){
		  var elem = e.target;
		  if(validateType(elem.files[0])){
		      var preview = document.querySelector('.thumb');
		      preview.src = URL.createObjectURL(elem.files[0]); //파일 객체에서 이미지 데이터 가져옴.
		      document.getElementById('changeImgSize').style.visibility = "visible";
		      document.querySelector(".thumb").width = 400;
		      preview.onload = function() {
		          URL.revokeObjectURL(preview.src); //URL 객체 해제
		      }
		      //console.log(document.querySelector('.thumb').offsetWidth);
		      //if(document.querySelector('.thumb').offsetWidth > 300){
		    	//  document.querySelector('.thumb').offsetWidth = 300;
		      //}
		  }else{
		    console.log('이미지 파일이 아닙니다.');
		  }
		});
		document.getElementById('changeImgSize').addEventListener('click',function(){
			document.querySelector(".thumb").width = document.querySelector(".thumb").naturalWidth;
			document.getElementById('changeImgSize').style.visibility = "hidden";
			document.getElementById('reChangeImgSize').style.visibility = "visible";
		})
		document.getElementById('reChangeImgSize').addEventListener('click',function(){
			document.querySelector(".thumb").width = 400;
			document.getElementById('reChangeImgSize').style.visibility = "hidden";
			document.getElementById('changeImgSize').style.visibility = "visible";
		})

		
	</script>
</body>
</html>