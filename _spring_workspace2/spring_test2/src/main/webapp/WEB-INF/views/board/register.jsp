<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/nav.jsp"/>


	<form action="/board/register" method="post" >

		<h1>Board Register Page</h1>
		<br>
		<div class="mb-3">
			<label for="t" class="form-label">Title</label> 
			<input type="text" name="title" class="form-control" id="t" placeholder="Title">
		</div>
		<div class="mb-3">
			<label for="w" class="form-label">Writer</label> 
			<input type="text" name="writer" class="form-control" id="w" placeholder="Writer" >
		</div>
		<div class="mb-3">
			<label for="c" class="form-label">Content</label>
			<textarea name="content" class="form-control" id="c" rows="3"></textarea>
		</div>
		
		<button type="submit" id="regBtn" class="btn btn-primary">Register</button>
	</form>
	
	
<jsp:include page="../layout/footer.jsp"/>