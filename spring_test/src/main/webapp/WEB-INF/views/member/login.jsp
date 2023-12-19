<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">

<h1>Member Login Page</h1><br>

	<form action="/member/login" method="post">
	
		<div class="mb-3">
			<label for="id" class="form-label">ID</label> 
			<input type="text" name="id" class="form-control" id="id" placeholder="ID">
		</div>
		<div class="mb-3">
			<label for="pw" class="form-label">PASSWORD</label> 
			<input type="password" name="pw" class="form-control" id="pw" placeholder="PASSWORD">
		</div>
		
		<button type="submit" class="btn btn-primary">login</button>
		
	</form>	
	
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>
