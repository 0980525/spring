<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/nav.jsp"/>

<c:set value="${bdto.bvo }" var="bvo"></c:set>
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
									<a href="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" download="${fvo.fileName }">
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-minus" viewBox="0 0 16 16">
											<path d="M5.5 9a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z"/>
											<path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
										</svg>
									</a>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="ms-2 me-auto">
							<div class="fw-bold">${fvo.fileName }</div>
							<span class="badge text-bg-primary">${fvo.fileSize}Byte</span>
						</div>
					</li>
				</c:forEach>
			</ul>
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
		
		<ul class="list-group list-group-flush" id="cmtListArea">
			<li class="list-group-item">
				<div class="mb-3">
					<div class="fw-bold">Writer</div>
					content
				</div>
				<span class="badge text-bg-primary">modAt</span>
			</li>
		</ul>
		
		<!-- 더보기 -->
		<div>
			<button type="button" id="moreBtn" data-page="1" class="btn btn-outline-dark" style="visibility:hidden ">More +</button>
		</div>
		
		<!-- 모달창 라인 -->
		<div class="modal" id="myModal" tabindex="-1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Writer</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<div class="input-group mb-3">
		        	<input type="text" class="form-control" id="cmtTextMod">
			        <button type="button" class="btn btn-primary" id="cmtModBtn">Post</button>
			    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	</div>

<script type="text/javascript">
	let bnoVal=`<c:out value="${bdto.bvo.bno}"/>`;
	console.log(bnoVal);
</script>
<script type="text/javascript" src="/resources/js/boardComment.js"></script>
<script type="text/javascript">
spreadCommentList(bnoVal);
</script>
<jsp:include page="../layout/footer.jsp"/>