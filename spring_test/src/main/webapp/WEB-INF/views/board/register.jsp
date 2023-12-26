<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="../layout/header.jsp"></jsp:include>


<div class="container-md">
	<form action="/board/register" method="post" enctype="multipart/form-data">

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
		<!-- 파일 입력 라인 추가 
		multiple="multiple" 파일 끌어서 여러개 입력할때 사용
		-->
		<div class="mb-3">
			<label for="file" class="form-label">Files..</label> 
			<input type="file" name="files" class="form-control" id="file" multiple="multiple" style="display:none"><br>
			<button type="button" class="btn btn-primary" id="trigger"> FileUpload </button>
		</div>
		<!-- 파일 목록 표시 라인 -->
		<div class="mb-3" id="fileZone"> 
		
		
		</div>
		
		<button type="submit" id="regBtn" class="btn btn-primary">Register</button>
	</form>
</div>
<script src="/resources/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>