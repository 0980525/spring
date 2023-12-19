<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
	<h1>Member Modify Page</h1><br>
	
	<form action="/member/modify" method="post">
	<table class="table">
	<tbody>
  
    <tr>
	<input type="hidden" name="id" value="${ses.id }">
      <th>ID</th>
      <td>${ses.id}</td>
    </tr>
    <tr>
      <th>PW</th>
      <td>	<input type="password" name="pw" class="form-control"></td>
    </tr>
    <tr>
      <th>Name</th>
      <td><input type="text" name="name" class="form-control" value="${ses.name }"></td>
    </tr>
    <tr>
      <th>E-Mail</th>
      <td><input type="email" name="email" class="form-control" value="${ses.email }"></td>
    </tr>
    <tr>
      <th>home</th>
      <td><input type="text" name="home" class="form-control" value="${ses.home }"></td>
    </tr>
    <tr>
      <th>age</th>
      <td><input type="text" name="age" class="form-control" value="${ses.age }"></td>
    </tr>
 
  
  </tbody>
  </table>
	<button type="submit" class="btn btn-primary">수정하기</button>
	<a href="/member/remove"><button type="button" class="btn btn-danger">탈퇴하기</button></a>
	</form>
	
	
		<!-- <form action="/member/modify" method="post">

			<div class="mb-3">
				<label for="id" class="form-label">ID</label> 
				<input type="text" name="id" class="form-control" id="id" placeholder="ID" readonly="readonly">
			</div>
			<div class="mb-3">
				<label for="pw" class="form-label">PASSWORD</label> 
				<input type="password" name="pw" class="form-control" id="pw" placeholder="PASSWORD" >
			</div>
			<div class="mb-3">
				<label for="name" class="form-label">NAME</label> 
				<input type="text" name="name" class="form-control" id="name" placeholder="NAME">
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">E-MAIL</label> 
				<input type="email" name="email" class="form-control" id="email" placeholder="E-MAIL">
			</div>
			<div class="mb-3">
				<label for="home" class="form-label">HOME</label> 
				<input type="text" name="home" class="form-control" id="home" placeholder="HOME">
			</div>
			<div class="mb-3">
				<label for="age" class="form-label">AGE</label> 
				<input type="text" name="age" class="form-control" id="age" placeholder="AGE">
			</div>
		<button type="submit" class="btn btn-primary">수정하기</button>
		</form> -->
</div>



<jsp:include page="../layout/footer.jsp"></jsp:include>