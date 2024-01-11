<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/nav.jsp"/>

<form action="/board/modify" method="post" enctype="multipart/form-data">

<c:set value="${bdto.bvo }" var="bvo"></c:set>

<div class="container-md">
		<div class="mb-3">
			<label for="bno" class="form-label">Bno</label> 
			<input type="text" name="bno" class="form-control" id="bno" value="${ bvo.bno} " readonly="readonly" >
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
		
	</div>

<!-- file line -->
	<c:set value="${bdto.flist }" var="flist"></c:set>
	
	<div class="mb-3">
			<label for="f" class="form-label">File</label> 
			<ul class="list-group list-group-flush">
				<c:forEach items="${flist }" var = "fvo">
					<li class="list-group-item">
						<c:choose>
							<c:when test="${fvo.fileType == 1 }">
								<div>
									<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_th_${fvo.fileName}">
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<!-- 일반파일 표시할 아이콘  -->
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-minus" viewBox="0 0 16 16">
  <path d="M5.5 9a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z"/>
  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
</svg>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="ms-2 me-auto">
							<div class="fw-bold">${fvo.fileName }</div>
							<span class="badge text-bg-primary">${fvo.fileSize}Byte</span>
							<button type="button" data-uuid="${fvo.uuid }" class="btn btn-sm btn-outline-danger file-x">X</button>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	
	<!-- 파일 등록 -->
	
	<div class="mb-3">
			<input type="file" name="files" class="form-control" id="files" >
			<button type="button" id="trigger" class="btn btn-outline-primary">File Upload</button>
		</div>
		<!-- 첨부파일 표시될 영역 -->
		<div class="mb-3" id="fileZone"> 
		
		</div>

	<button type="submit" class="btn btn-primary" id="regBtn">수정하기</button>
</form>
	<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
	<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-danger">삭제하기</button></a>
<script src="/resources/js/boardRegister.js"></script>
<script type="text/javascript" src="/resources/js/boardModify.js"></script>
<jsp:include page="../layout/footer.jsp"/>