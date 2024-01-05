<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/nav.jsp"/>

	<div class="container-md">
		<div class="mb-3">
			<label for="bno" class="form-label">Bno</label> 
			<input type="text" name="bno" class="form-control" id="bno" value="${ bvo.bno} " readonly="readonly">
		</div>
		<div class="mb-3">
			<label for="title" class="form-label">title</label> 
			<input type="text" name="title" class="form-control" id="title" value="${ bvo.title}"readonly="readonly">
		</div>
		<div class="mb-3">
			<label for="writer" class="form-label">Writer</label> 
			<input type="text" name="writer" class="form-control" id="writer" value="${bvo.writer }" readonly="readonly">
		</div>
		<div class="mb-3">
			<label for="content" class="form-label">Content</label> 
			<input type="text" name="content" class="form-control" id="content" value="${ bvo.content}" >
		</div>
		<div class="mb-3">
			<label for="regAt" class="form-label">Reg_date</label> 
			<input type="text" name="regAt" class="form-control" id="reg_date" value="${bvo.regAt }" readonly="readonly">
		</div>
	</div>


	<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
	<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-warning">modify</button></a>

<jsp:include page="../layout/footer.jsp"/>