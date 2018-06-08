<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#eachInfoJsp img {
	width: 180px;
}

#eachInfoJsp #select {
	padding: 5px;
}

#eachInfoJsp div {
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

#eachInfoJsp td {
	height: 50px;
	text-align: left;
}

#eachInfoJsp .fname {
	vertical-align: middle;
}
</style>

<script>
//우편번호 검색
$(function(){
	$('#eachInfoJsp form').submit(function(){
		alert('저장되었습니다');
	});
	
	$('#select').click(function(){
		window.open('contents/personal/findzip.html', 'winzip', 'width=500px height=300px');
		//winzip은 이름 지정
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
		        $('eachInfoJsp .fileList').html(html);
		});
	});
});
</script>

<br>
<br>
<div id="eachInfoJsp">
<form name="join"
	action="<%=request.getContextPath()%>/EachController?type=join" method="post">
	<table style="width: 80%; height: 50%">
		<tr>
			<td rowspan="4"><div class="fileList"
					style="width: 180px; height: 200px; margin: 10px">
					<img src="noimg.png" style="margin: 10px">
				</div>
				<br>
				<div class="fileBox">
					<label for="files" class="btn btn-primary"
						style="display: inline-block; border: 1px solid #000;">사진변경</label>
					<input multiple="multiple" name="files[]" id="files" type="file"
						style="width: 1px; height: 1px; padding: 0; overflow: hidden; clip: rect(0, 0, 0, 0); border: 0" />
				</div>
				<button type="button" class="btn btn-primary disabled">삭제</button>
			<td class="fname" style="width: 100px">아이디</td>
			<td colspan="3" class="fname"><div class="form-group">
					<input class="form-control form-control-sm" type="text" name="id"
						style="width: 300px" placeholder="아이디를 입력해주세요" id="inputSmall"
						required>
				</div>
		<tr>
			<td class="fname">사번</td>
			<td colspan="3" class="fname"><div class="form-group">
					<input class="form-control form-control-sm" type="text" name="num"
						style="width: 300px" placeholder="사번을 입력해주세요" id="inputSmall"
						required>
				</div>
		</tr>
		<tr>
			<td class="fname">이름</td>
			<td colspan="3" class="fname"><div class="form-group">
					<input class="form-control form-control-sm" type="text" name="name"
						style="width: 300px" placeholder="이름을 입력해주세요" id="inputSmall"
						required>
				</div>
		</tr>
		<tr>
			<td class="fname">부서이름</td>
			<td class="fname">
				<div class="form-group">
					<input type="radio" name="depart" checked="checked" value="개발부" />
					개발부 <input type="radio" name="depart" value="회계부" /> 회계부 <input
						type="radio" name="depart" value="영업부" /> 영업부
				</div>
			</td>
			<td class="fname">부서번호</td>
			<td class="fname"><div class="form-group">
					<input class="form-control form-control-sm" type="text"
						readonly="readonly" style="width: 250px" id="inputSmall">
				</div></td>
		</tr>
		<tr>
			<td rowspan="4"><img src="sign.jpg" style="margin: 10px"><br> <input type="button" class="btn btn-primary" value="사인변경"
				onclick='document.all.file.click()'> <input type="file" style="display:none" name="file2" id="file2">
				<button type="button" class="btn btn-primary disabled">삭제</button>
			<td class="fname">직급이름</td>
			<td class="fname">
				<div class="form-group">
					<input type="radio" name="position" checked="checked" value="사원" />
					사원 <input type="radio" name="position" value="대리" /> 대리 <input
						type="radio" name="position" value="과장" /> 과장
				</div>
			</td>
			<td class="fname">직급번호</td>
			<td class="fname"><div class="form-group">
					<input class="form-control form-control-sm" type="text"
						readonly="readonly" style="width: 250px" id="inputSmall">
				</div></td>
		</tr>
		<tr>
			<td class="fname">주소 <br>
			</td>
			<td colspan="3">
				<div class="form-group">
					<input class='addres' name="address1" style="width: 320px"
						id="inputSmall" readonly>

				</div>
				<button type="button" class="btn btn-info" id="select"
					style="margin: 5px">우편번호검색</button> <input
				class="form-control form-control-sm" name="address2" type="text"
				style="width: 300px" id="inputSmall" required>
			</td>
		</tr>
		<tr>
			<td class="fname">이메일</td>
			<td colspan="3" class="fname"><div class="form-group">
					<input class="form-control form-control-sm" type="text"
						name="email" style="width: 300px" placeholder="이메일을 입력해주세요"
						id="inputSmall" required>
				</div></td>
		</tr>
		<tr>
			<td class="fname" style="width: 100px">상태메세지</td>
			<td colspan="3" class="fname"><div class="form-group">
					<input class="form-control form-control-sm" type="text" name="msg"
						style="width: 300px" placeholder="상태메세지를 입력해주세요" id="inputSmall"
						required>
				</div></td>
		</tr>
		</tbody>
	</table>

	<br> <input type="submit" style="width: 150px"
		class="btn btn-outline-primary" id="save" value="저장">
</form>
</div>