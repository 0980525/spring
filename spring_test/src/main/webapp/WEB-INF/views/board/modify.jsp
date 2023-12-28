<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
     
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h1>Board Modify Page</h1>
<c:set value="${boardDTO.bvo }" var="bvo" />
<form action="/board/modify" method="post" enctype="multipart/form-data">
	<br>
	<div class="mb-3">
			<label for="bno" class="form-label">Bno</label> 
			<input type="text" name="bno" class="form-control" id="bno" value="${ bvo.bno}" readonly="readonly">
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
		
		<!-- 파일표시 라인 -->
		<c:set value="${boardDTO.flist }" var="flist" />
		
		<div>
			<ul> 
			
			 <c:forEach items="${flist }" var="fvo">
				<li style="list-style:none" class="">
					<c:choose>
						<c:when test="${fvo.file_type > 0 }">
							<div>
								<img alt="" class="" src="/upload/${fvo.save_dir }/${fvo.uuid}_${fvo.file_name}">
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<!-- 아이콘 모양 하나 가져와서 넣기 -->
							</div>
						</c:otherwise>
					</c:choose>
					
					<div>
						<div>${fvo.file_name }</div>
						${fvo.reg_date }
					</div>
					<span class="badge text-bg-warning">${fvo.file_size }Byte</span>
					<button type="button" data-uuid="${fvo.uuid }" class="file-x">X</button>
					<hr>
				</li> 
			</c:forEach>
			</ul>
		</div>
		
		<!-- 수정파일 등록 라인 -->
		
		
		
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
		
	
		
		<button type="submit" class="btn btn-success" id="regBtn">수정하기</button>
		<a href="/board/list"><button type="button" class="btn btn-primary">리스트로 돌아가기</button></a>
		
		</form>
		</div>
		
		<script src="/resources/js/boardModify.js"></script>
		<script src="/resources/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>
		