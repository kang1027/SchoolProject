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
	<form  method="post" action="addTreeCtrl.jsp" enctype="multipart/form-data">
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
				<th>나무사진</th>
				<td>
					<input type="file" class="hidden_input" id="imageSelector" name="treePhoto" 
					accept="image/jpeg, image/jpg, image/png"><br>
					<img src="" class="thumb" style="width : 200px; height : 300px;">
				</td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="나무 등록하기"></th>
			</tr>
		</table>
	</form>
	
	<script>
		var validateType = function(img){
		  return (['image/jpeg','image/jpg','image/png'].indexOf(img.type) > -1);
		}
		
		// 파일 선택 필드에 이벤트 리스너 등록
		document.getElementById('imageSelector').addEventListener('change', function(e){
		  var elem = e.target;
		  if(validateType(elem.files[0])){
		      var preview = document.querySelector('.thumb');
		      preview.src = URL.createObjectURL(elem.files[0]); //파일 객체에서 이미지 데이터 가져옴.
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
		
		
	</script>
</body>
</html>