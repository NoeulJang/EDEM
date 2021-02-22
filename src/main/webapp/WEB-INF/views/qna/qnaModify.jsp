<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-color: #ccc;
	border-spacing: 0;
}

.tg td {
	background-color: #fff;
	border-color: #ccc;
	border-style: solid;
	border-width: 1px;
	color: #333;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	background-color: #f0f0f0;
	border-color: #ccc;
	border-style: solid;
	border-width: 1px;
	color: #33                   3;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}
</style>
<h2>게시글 수정</h2>
<!-- 컨트롤러가 읽어들이게끔 페이지 이동시킴 -->

<tbody width="600" border="1" bordercolor="gray" bgcolor="skyblue">
	<form action="/qna/qnaModify" method="post">

		<table class="tg" style="margin: auto; width: 60%;">
			<colgroup>
				<col style="width: 25px">
				<col style="width: 337px">
			</colgroup>
			<thead>
				<tr>
					<th class="tg-0pky" ><p align="center">제 목</p></th>
					<td><textarea name="answerTitle">${read.answerTitle}</textarea></td>
				</tr>
			</thead>
			
			
			<tbody>
				<tr>
					<td class="tg-0lax"><p align="center">글내용</p></td>
					<td><textarea name="answerCon" rows="5" cols="30"> ${read.answerCon}</textarea>
					<input type="submit" onclick="return confirm('정말로 수정하시겠습니까?')" class="btn-primary-comments" value="수정완료"></td>
				</tr>
				<input type="hidden" value="${read.answerNo}" name="answerNo">
				
				
			</tbody>
		</table>

	</form>



	<%@ include file="../include/footer.jspf"%></tbody>