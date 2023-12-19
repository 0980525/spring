<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="layout/header.jsp"></jsp:include>

<h1>
	Hello world!  
</h1>
<c:if test="${ses.id ne null}">
<div>
<p>${ses.id } 님 안녕하세요. </p> 
<span class="badge text-bg-primary">${ses.last_login}</span>
</div>
</c:if>

<script>
	const msg_login = `<c:out value="${msg_login}"/>`;
	const msg_modify = `<c:out value="${msg_modify}"/>`;
	const msg_logout = `<c:out value="${msg_logout}"/>`;
	const msg_remove = `<c:out value="${msg_remove}"/>`
	if(msg_login ==="1"){
		alert(" 로그인 실패 ")
	}
	if(msg_modify === "1"){
		alert("회원정보가 수정되었습니다. 다시 로그인 해주세요.")
	}
	if(msg_logout === "1"){
		alert(" 로그아웃 ");
	}
	if(msg_remove === "1"){
		alert("탈퇴 완료");
	}
</script>
<jsp:include page="layout/footer.jsp"></jsp:include>

