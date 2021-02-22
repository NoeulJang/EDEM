<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../include/header.jspf"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<center>

	<tbody width="600" border="1" bordercolor="gray" bgcolor="skyblue">
		<form action="write" method="post" id="qna">
			<h2>게시글 수정</h2>
			<!-- 컨트롤러가 읽어들이게끔 페이지 이동시킴 -->



			<table class="tg" style="margin: auto; width: 80%;">


				<tbody>
					<tr height="40">
						<td align="center">제목</td>
						<td><input type="text" name="answerTitle" id="tt"
							style="width: -webkit-fill-available; height: -webkit-fill-available;"></td>
					</tr>


					<tr height="40">
						<td align="center" width="150">글내용</td>
						<td width="450"><textarea rows="10" cols="50"
								name="answerCon" id="tcon"
								style="width: -webkit-fill-available; height: 500px;"></textarea></td>
					</tr>
					<tr height="40">
						<td align="center" colspan="2"><input type="submit"
							value="글쓰기"></td>
					</tr>
				</tbody>
			</table>

		</form>
		<script>
			$("#qna").submit(
					function(e) {
						if (($.trim($("#tt").val()) == "")
								|| ($.trim($("#tcon").val()) == "")) {
							alert("질문 내용을 입력해주세요.");
							return false;
						}
					});
		</script>
</center>


<%@ include file="../include/footer.jspf"%>

