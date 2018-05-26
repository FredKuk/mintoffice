<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#wBoardDiv .tablecal {
	margin: 10px
}
</style>
<script>
	$(function() {
		$('#files')
				.change(
						function() {
							const target = document
									.getElementsByName('files[]');
							var html = '';
							$
									.each(
											target[0].files,
											function(index, file) {
												const fileName = file.name;
												html += '<div class="file">';
												html += '<img src="'
														+ URL
																.createObjectURL(file)
														+ '">'
												html += '<span>' + fileName
														+ '</span>';
												html += '<a href="#" id="removeImg">╳</a>';
												html += '</div>';
												const fileEx = fileName
														.slice(
																fileName
																		.indexOf(".") + 1)
														.toLowerCase();
												if (fileEx != "jpg"
														&& fileEx != "png"
														&& fileEx != "gif"
														&& fileEx != "bmp"
														&& fileEx != "wmv"
														&& fileEx != "mp4"
														&& fileEx != "avi") {
													alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");
													resetFile();
													return false;
												}
												$('.fileList').html(html);
											});
						});

	});
</script>
<div id='wBoardDiv'>
	<table class="tablecal">
		<tbody>
			<tr>
				<th style="width: 100px: margin:5px; text-align: center;">제목:</th>
				<td><input type="text" style="width: 500px;"
					placeholder="제목을 입력하세요. " name="subject" class="form-control" /></td>
			</tr>
			<tr>
				<th style="width: 100px: margin:5px; text-align: center;">내용:</th>
				<td><textarea cols="10" style="width: 500px; height: 300px;"
						placeholder="내용을 입력하세요. " name="content" class="form-control"></textarea></td>
			</tr>
			<tr>
				<th style="width: 100px: margin:5px; text-align: center;">첨부파일:
				</th>
				<td><input type="text" readonly="readonly"
					style="width: 500px;" placeholder="파일을 선택하세요. " name="filename"
					class="form-control" /></td>
			</tr>
			<tr>
				<td></td> &nbsp&nbsp
				<td><input multiple="multiple" name="files[]" id="files"
					type="file" /></td>
			</tr>

			<tr>
				<td colspan="2"><br>
					<table style="width: 100%;">
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</td>
							<td><div
									style="display: inline-block; width: 250px; padding: 10px; text-align: center;">
									<input type="button" class="btn btn-outline-primary"
										value="확인 ">
								</div> <input type="button" id="cancle"
								class="btn btn-outline-success" onclick="window.close()"
								value='취소'>
								</button>
							<td></td>
						</tr>
					</table></td>
			</tr>
		</tbody>
	</table>
</div>