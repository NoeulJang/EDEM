<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="false"%>

<script>
	var join = confirm('그룹에 가입해야 그룹 게시물을 열람할 수 있습니다.\n 가입하시겠습니까?');
	if (join == true) {
		location.href = "${pageContext.request.contextPath}/group/groupJoin";
	} else {
		location.href = history.go(-1);
	}
</script>

