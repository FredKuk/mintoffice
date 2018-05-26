<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<style>
#eachInfoForm img{
    width:180px;
}
#eachInfoForm #select {
	padding: 5px;
}

#eachInfoForm div {
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

#eachInfoForm td {
	height: 50px;
	text-align: left;
}

#eachInfoForm .fname {
	vertical-align: middle;
}
</style>

<script>
//우편번호 검색

$(function(){
	$('#eachInfoForm').submit(function(){
		//데이터 저장
		alert('저장되었습니다');
		return false;
	});
	
	$('#select').click(function(){
		window.open('contents/personal/findzip.html', 'winzip', 'width=500px height=300px');	//winzip은 이름 지정
			
	}); 
	
	$('#files').change(function(){
		const target = document.getElementsByName('files[]');
		var html = '';
		$.each(target[0].files, function(index, file){
			 const fileName = file.name;
		        html += '<div class="file">';
		        html += '<img src="'+URL.createObjectURL(file)+'">'
		        html += '<span>'+fileName+'</span>';
		        html += '<a href="#" id="removeImg">╳</a>';
		        html += '</div>';
		        const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
		        if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
		            alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");
		            resetFile();
		            return false;
		        }
		        $('.fileList').html(html);
		});
	});

});



</script>
<br>
<br>
<form id="eachInfoForm">
	<table style="width: 80%; height: 50%" id="eachInfo">
		<tbody>
			<tr>
				<td rowspan="4"><div class="fileList" style=" width:180px; height:200px; margin:10px"><img src="noimg.png" style="margin:10px"></div><br> 
			<!-- 	<input type="button" class="btn btn-primary" value="사진변경">
				<input class="btn btn-primary" multiple="multiple" name="files[]" id="files" type="file"/> -->
				
				<div class="fileBox">
					<label for="files" class="btn btn-primary" style="display:inline-block;border:1px solid #000;">사진변경</label>
					<input multiple="multiple" name="files[]" id="files" type="file" style="width:1px;height:1px;padding:0;overflow:hidden;clip:rect(0,0,0,0);border:0"/>
				</div>
					<button type="button" class="btn btn-primary disabled">삭제</button>
				<td class="fname" style="width: 100px" >아이디</td>
				<td colspan="3" class="fname"><div class="form-group">
 				<input class="form-control form-control-sm" type="text" style="width: 300px" placeholder="아이디를 입력해주세요" id="inputSmall" required></div>
			<tr>
				<td class="fname">사번</td>
				<td colspan="3" class="fname"><div class="form-group">
 				<input class="form-control form-control-sm" type="text" style="width: 300px" placeholder="사번을 입력해주세요" id="inputSmall" required></div>
			</tr>
			<tr>
				<td class="fname">이름</td>
				<td colspan="3" class="fname"><div class="form-group">
 				<input class="form-control form-control-sm" type="text" style="width: 300px" placeholder="이름을 입력해주세요" id="inputSmall" required></div>
			</tr>
			<tr>
				<td class="fname">부서이름</td>
				<td class="fname">
				  <div class="form-group">
  				  <select class="custom-select">
     				 <option selected="">선택하세요</option>
     				 <option value="1">개발부</option>
     				 <option value="2">회계부</option>
   	  				 <option value="3">영업부</option>
  				  </select>
  				</div></td>
				<td class="fname">부서번호</td>
				<td class="fname"><div class="form-group"><input class="form-control form-control-sm" type="text" readonly="readonly" style="width: 250px" id="inputSmall"></div></td>
			</tr>
			<tr>
				<td rowspan="4"><img src="sign.JPG" width="180px" height="200px" style="margin: 10px"><br> 
				<input type="button" class="btn btn-primary" value="사인변경" onclick=document.all.file.click();> 
					<input type="file" name="file2" id="file2" style="display: none" />
					<button type="button" class="btn btn-primary disabled">삭제</button>
				<td class="fname">직급이름</td>
				<td class="fname">
				  <div class="form-group">
    <select class="custom-select">
      <option selected="">선택하세요</option>
      <option value="1">사원</option>
      <option value="2">대리</option>
      <option value="3">과장</option>
    </select>
  </div></td>
				<td class="fname">직급번호</td>
				<td class="fname"><div class="form-group"><input class="form-control form-control-sm" type="text" readonly="readonly" style="width: 250px" id="inputSmall"></div></td>
			</tr>
			<tr>
				<td class="fname">주소 <br> </td>
				<td colspan="3"><div class="form-group">
				
 				<!-- <input class="address1" type="text" readonly="readonly" style="width: 300px" placeholder="주소를 입력해주세요" id="inputSmall"></div> -->
 				<output class='address1' readonly="readonly" style="width: 320px" id="inputSmall"></div>
				<button type="button" class="btn btn-info" id="select" style="margin: 5px">우편번호검색</button>
				<input class="form-control form-control-sm" type="text" style="width: 300px" id="inputSmall" required></div></td>
			</tr>
			<tr>
				<td class="fname">이메일</td>
				<td colspan="3" class="fname"><div class="form-group">
 				<input class="form-control form-control-sm" type="text" style="width: 300px" placeholder="이메일을 입력해주세요" id="inputSmall" required></div></td>
			</tr>
			<tr>
				<td class="fname" style="width:100px">상태메세지  </td>
				<td colspan="3" class="fname"><div class="form-group">
 				<input class="form-control form-control-sm" type="text" style="width: 300px" placeholder="상태메세지를 입력해주세요" id="inputSmall" required></div></td>
			</tr>
		</tbody>
	</table>

	<br>

	<button type="button" style="width:150px" class="btn btn-outline-primary" id="save">저장</button>

</form>