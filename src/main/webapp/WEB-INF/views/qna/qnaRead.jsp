<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>






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
	color: #333;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-c3ow {
	border-color: inherit;
	text-align: center;
	vertical-align: top
}

.tg .tg-tjwp {
	background-color: #efefef;
	border-color: #c0c0c0;
	text-align: center;
	vertical-align: top
}

.tg .tg-3xi5 {
	background-color: #ffffff;
	border-color: inherit;
	text-align: center;
	vertical-align: top
}

.tg .tg-0pky {
	border-color: inherit;
	text-align: left;
	vertical-align: top
}
</style>






<div class="box" style="text-align: center; margin: auto;"></div>
<div class="box-header with-border"></div>
<br>
<h3 class="box-title">
	<p align="center">문의 게시판</p>
</h3>

<table class="tg" style="margin: auto; width: 80%;"
	class="table table-striped">

	<colgroup>
		<col style="width: 90px">
		<col style="width: 485px">
	</colgroup>



	<form name="readForm" role="form" method="post">
		<input type="hidden" id="answerNo" name="answerNo"
			value="${read.answerNo}"> <input type="hidden" id="page"
			name="page" value="${scri.page}"> <input type="hidden"
			id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
		<input type="hidden" id="searchType" name="searchType"
			value="${scri.searchType}"> <input type="hidden" id="keyword"
			name="keyword" value="${scri.keyword}">
	</form>




	<tr>
		<th class="tg-tjwp">글번호</th>
		<th class="tg-3xi5">${read.answerNo}</th>
	</tr>
	<tr>
		<td class="tg-tjwp">작성자</td>
		<td class="tg-c3ow">${read.id}</td>
	</tr>
	<tr>
		<td class="tg-tjwp">제목</td>
		<td style="text-align: center;">${read.answerTitle}</td>
	</tr>
	<tr>
		<td class="tg-tjwp">내용</td>
		<td style="height: 200px; vertical-align: text-top;">${read.answerCon}</td>
	</tr>



	<tr>
		<td colspan="2"><c:set var="pageNo"
				value="${empty param.pageNo ? '1' : param.pageNo}" /> <a
			style="float: left;" id="goList" class="btn-primary-comments"
			href="/qna/qnaList">목록 </a> <c:if
				test="${authUser.id == qnaanswer.id}">
				<form action="${pageContext.request.contextPath}/qna/qnaModify" method="get">
					<input type="hidden" value="${read.answerNo}" name="answerNo">
					<input type="hidden" value="${read.answerTitle}" name="answerTitle">
					<input type="hidden" value="${read.answerCon}" name="answerCon">
					<input type="submit" class="btn-primary-comments" value="글수정">
				</form>
			</c:if> <a href="/qna/delete?answerNo=${read.answerNo}">
				<button class="btn-primary-comments"
					onclick="return confirm('정말로 삭제하시겠습니까?')">글삭제</button>

		</a> 
			</td>
			</tr>
			</table>



<%@include file="../include/footer.jspf"%>