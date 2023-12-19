<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="../layout/header.jsp"></jsp:include>


<div class="container-md">
	<form action="/board/register" method="post">

		<h1>Board Register Page</h1>
		<br>
		<div class="mb-3">
			<label for="title" class="form-label">Title</label> 
			<input type="text" name="title" class="form-control" id="title" placeholder="Title">
		</div>
		<div class="mb-3">
			<label for="writer" class="form-label">Writer</label> 
			<input type="text" name="writer" class="form-control" id="writer" placeholder="Writer">
		</div>
		<div class="mb-3">
			<label for="content" class="form-label">Content</label>
			<textarea name="content" class="form-control" id="content" rows="3"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">Register</button>
	</form>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>