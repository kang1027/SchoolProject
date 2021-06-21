<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 등록</title>
<link rel="stylesheet" href="css/head.css">
<link rel="stylesheet" href="css/addupdate.css">
<style>
	td{padding : 7px;}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="padding"></div>
	<form  method="post" action="addCorporationCtrl.jsp" enctype="multipart/form-data" onsubmit="return checkV()">
	
	<div id="wrap">
		<input type="file" class="hidden_input" id="imageSelector" name="treePhoto" 
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
					<th>기업 이름</th>
					<td><input type="text" name="cpname" id="cpname" value="" placeholder="기업 이름을 입력해주세요..."></td>
				<tr>
					<th>기업 주소</th>
					<td><input type="text" name="cpurl" id="cpurl" value="" placeholder="기업 주소를 입력해주세요..."></td>
				</tr>
				<tr>
					<th>기업 전화</th>
					<td><input type="text" name="cpcall" id="cpcall" value="" placeholder="기업 전화를 입력해주세요..."></td>
				</tr>
				</table>
					
					
				</div>
				<div id="treeInfo">
					<h1>기업 소개</h1>
					<p><textarea name="cpintro" id="cpintro" cols="170" rows="5" placeholder="기업 소개를 입력해주세요..."></textarea></p>
				</div>
			<input type="submit" value="기업 등록하기">
			</div>
		</div>
	</form>
	
	<%@ include file="footer.jsp" %>
	<script>
		function checkV(){
			var noImage = false;;
			if(document.getElementById('cpname').value==""){
				alert('기업이름을 입력해주세요.');
				document.getElementById('cpname').focus();
				return false;
			}
			if(document.getElementById('cpurl').value==""){
				alert('기업주소를 입력해주세요.');
				document.getElementById('cpurl').focus();
				return false;
			}
			if(document.getElementById('cpintro').value==""){
				alert('기업소개를 입력해주세요.');
				document.getElementById('cpintro').focus();
				return false;
			}
			if(document.getElementById('imageSelector').value == ""){
				alert('기업사진을 등록해주세요.');
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