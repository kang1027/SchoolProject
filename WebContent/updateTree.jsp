<%@page import="VO.TreeInfoVO"%>
<%@page import="DAO.TreeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		
		TreeInfoDAO dao = new TreeInfoDAO();
		TreeInfoVO vo = dao.getTreeInfo(name);
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나무 수정</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
	<form  method="post" action="updateTreeCtrl.jsp" enctype="multipart/form-data" onsubmit="return checkV()">
		<table border="1">
			
			<tr>
				<th>나무 이름</th>
				
				<td><input type="text" name="treename" id="treename" value="<%=vo.getTreename() %>" placeholder="나무 이름을 입력해주세요..."></td>
			</tr>
			<tr>
				<th>나무 수명</th>
				<td><input type="text" name="treelife" id="treelife" value="<%=vo.getTreelife() %>" placeholder="나무 수명을 입력해주세요..."></td>
			</tr>
			<tr>
				<th>나무 특징</th>
				<td><textarea name="treepoint" id="treepoint" cols="30" rows="10" placeholder="나무 특징 입력해주세요..."><%=vo.getTreePoint()%></textarea></td>
			</tr>
			<tr>
				<th>나무사진</th>
				<td>
					<input type="file" class="hidden_input" id="imageSelector" name="treePhoto" 
					accept="image/jpeg, image/jpg, image/png"><br>
					<img src="" class="thumb">
					<input type="button" id="changeImgSize" value="원본 보기" style="visibility: hidden;">
					<input type="button" id="reChangeImgSize" value="되돌리기" style="visibility: hidden;">
				</td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="나무 수정하기"><input type="button" onclick="location.replace('deleteTree.jsp?name=<%=name %>')" value="나무 삭제하기"> <input type="hidden" name="name" value="<%=name %>"></th>
			</tr>
		</table>
	</form>
	
	<script>
		function checkV(){
			var noImage = false;;
			if(document.getElementById('treename').value==""){
				alert('나무이름을 입력해주세요.');
				document.getElementById('treename').focus();
				return false;
			}
			if(document.getElementById('treelife').value==""){
				alert('나무수명을 입력해주세요.');
				document.getElementById('treelife').focus();
				return false;
			}
			if(document.getElementById('treepoint').value==""){
				alert('나무특징을 입력해주세요.');
				document.getElementById('treepoint').focus();
				return false;
			}
			if(document.getElementById('imageSelector').value == ""){
				alert('나무 사진을 등록해주세요.');
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
		      document.querySelector(".thumb").width = 200;
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
			document.querySelector(".thumb").width = 200;
			document.getElementById('reChangeImgSize').style.visibility = "hidden";
			document.getElementById('changeImgSize').style.visibility = "visible";
		})
	</script>
</body>
</html>