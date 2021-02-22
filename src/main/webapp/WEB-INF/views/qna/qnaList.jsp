<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<!-- <section class="content-header">
		<h1>
			게시글 목록 <small>it all starts here</small>
		</h1>
		
	</section> -->

	<!-- Main content -->
	<section class="content">

		<!-- Default box -->

		<div class="box" style="text-align: center;">
			<div class="box-header with-border">
				<head>

<h3 class="box-title">문의 게시판</h3>

				</head>

			</div>
			<div class="search">
				<select name="searchType">
					<option value="n"
						<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					<option value="t"
						<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					<option value="c"
						<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					<option value="w"
						<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					<option value="tc"
						<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				</select> <input type="text" name="keyword" id="keywordInput"
					value="${scri.keyword}" />

				<button id="searchBtn" type="button">검색</button>
				<script>
					$(function() {
						$('#searchBtn').click(
								function() {
									self.location = "qnaList"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($('#keywordInput').val());
								});
					});
				</script>
			</div>



			<table style="text-align: center; margin: auto; width: 80%;"
				class="table table-striped">

				<tr>
					<td colspan="10">
						<form action="/qna/write" method="get">

							<div>
								<input type="hidden" value="write" name="write" />
								<button class="btn-primary-comments">글쓰기</button>

							</div>
						</form>
					</td>

				</tr>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>등록일</td>
					<td>조회수</td>
				</tr>

				<c:forEach var="qna" items="${list}">

					<tr>
						<td>${qna.answerNo}<p></td>
						<td><a
							href="/qna/qnaRead?answerNo=${qna.answerNo}&page=${scri.page}&perPageNum=
							${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
						 <c:out value="${qna.answerTitle}" /></a></td>
						
			           <td>${qna.id}</td>
						<td><fmt:formatDate value="${qna.postDate}"
								pattern="yyyy-MM-dd" /></td>
						<td><span class="badge bg-red">${qna.postCount }</span></td>

					</tr>


				</c:forEach>

			</table>

			<div class="col-md-offset">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a
							href="qnaList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li><a href="qnaList${pageMaker.makeSearch(idx)}">${idx}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="qnaList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>

		</div>

	</section>

</div>







<%@ include file="../include/footer.jspf"%>

