<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h1>Board Modify Page</h1>
<form action="/board/modify" method="post">
	<br>
	<div class="mb-3">
			<label for="bno" class="form-label">Bno</label> 
			<input type="text" name="bno" class="form-control" id="bno" value="${ bvo.bno} " readonly="readonly">
		</div>
		<div class="mb-3">
			<label for="title" class="form-label">title</label> 
			<input type="text" name="title" class="form-control" id="title" value="${ bvo.title}">
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
			<label for="reg_date" class="form-label">Reg_date</label> 
			<input type="text" name="reg_date" class="form-control" id="reg_date" value="${bvo.reg_date }" readonly="readonly">
		</div>
		<!-- <span class="badge text-bg-primary">Primary</span> --><!-- 배지 -->
		<a href="/board/modify"><button type="buttom" >modify</button></a>
		<a href="/board/list"><button type="button" >list</button></a>
		
		</form>
		</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
		