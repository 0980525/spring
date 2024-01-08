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
		
		<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
		<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-warning">modify</button></a>
		<br>
		<hr>
		<br>
		<!-- 댓글 등록라인 -->
		
		<div class="input-group mb-3">
		  <span class="input-group-text" id="cmtWriter">${bvo.writer }</span>
		  <input type="text" class="form-control" id="cmtText" aria-label="Amount (to the nearest dollar)">
		  <button type="button" class="btn btn-success" id="cmtPostBtn">Post</button>
		</div>
		
		<!-- 댓글 표시라인 -->
		
		<ul class="list-group list-group-flush">
			<li class="list-group-item">
				<div class="mb-3">
					<div class="fw-bold">Writer</div>
					content
				</div>
				<span class="badge text-bg-primary">modAt</span>
			</li>
		</ul>
		
		
	</div>

<script type="text/javascript">
	let bnoVal=`<c:out value="${bvo.bno}"/>`;
	console.log(bnoVal);
</script>
<script type="text/javascript" src="/resources/js/boardComment.js"></script>
<script type="text/javascript">
spreadCommentList(bnoVal);
</script>
<jsp:include page="../layout/footer.jsp"/>