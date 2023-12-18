<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h1>Board Detail Page</h1>
	<br>
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
			<label for="reg_date" class="form-label">Reg_date</label> 
			<input type="text" name="reg_date" class="form-control" id="reg_date" value="${bvo.reg_date }" readonly="readonly">
		</div>
		<!-- <span class="badge text-bg-primary">Primary</span> --><!-- 배지 -->
		<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
		<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-success">modify</button></a>
		<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-danger">remove</button></a>
	
<%-- <table class="table">
	<tr>
		<th>글 번호</th>
		<td>${ bvo.bno}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${ bvo.title}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${ bvo.writer}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${ bvo.content}</td>
	</tr>
	<tr>
		<th>reg_date</th>
		<td>${ bvo.reg_date}</td>
	</tr>
	<tr>
		<th>read_count</th>
		<td>${ bvo.read_count}</td>
	</tr>


</table> --%>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>

     