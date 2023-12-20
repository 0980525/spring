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
	<br>
	<br>
	<hr>
	
	<!-- 댓글 등록 라인 -->
	
	<div class="input-group mb-3">
	
		<span id="cmtWriter"class="input-group-text">${ses.id }</span>
		<input type="text" id="cmtText"class="form-control" placeholder="ADD Comment..">
		<button type="button" id="cmtAddBtn" class="btn btn-outline-secondary">댓글 등록</button>
		<!-- dataset / c:out 으로 bno받아오기  -->
		
	</div>	
	
	<hr>
	
	<!-- 댓글 표시 라인 -->
		<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        no. cno,writer,reg_date
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>ADD Comment..</strong> 
      </div>
    </div>
  </div>
  
  
</div>
	</div>
	<script type="text/javascript">
	const bnoVal = `<c:out value="${bvo.bno}"/>`
</script>
<script src="/resources/js/boardComment.js"></script>

<br>
<jsp:include page="../layout/footer.jsp"></jsp:include>

     