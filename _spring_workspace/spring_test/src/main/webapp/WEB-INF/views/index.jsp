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
	const msg_logout= `<c:out value="${msg_logout}"/>`;
	if(msg_login ==="1"){
		alert(" 로그인 실패 ")
	}
	if(msg_logout === "1"){
		alert(" 로그아웃 ");
	}
</script>
<jsp:include page="layout/footer.jsp"></jsp:include>

