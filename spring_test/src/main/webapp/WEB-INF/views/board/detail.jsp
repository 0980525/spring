<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h1>Board Detail Page</h1>
	<br>
	<c:set value="${boardDTO.bvo }" var="bvo" />
	<div class="mb-3">
			<label for="bno" class="form-label">Bno</label> 
			<input type="text" name="bno" class="form-control" id="bno" value="${ boardDTO.bvo.bno} " readonly="readonly">
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
		
		<!-- 파일표시 라인 -->
		<c:set value="${boardDTO.flist }" var="flist" />
		
		<div>
			<ul> 
			<!-- 파일 개수만큼 li를 추가하여 파일을 표시, 타입이 1인 경우만 표시 -->
			<!-- 
				li => div => img 그림 표시
					  div =>파일이름,작성일,span size
			 -->
			 <!-- 파일리스트 중 하나만 가져와서 fvo로 저장 -->
			 <c:forEach items="${flist }" var="fvo">
				<li style="list-style:none" class="">
					<c:choose>
						<%-- <c:when test="${fvo.file_type == 1 }"> --%>
						<c:when test="${fvo.file_type > 0 }">
							<div>
							<!-- /upload/save_dir/uuid_file_name -->
							
								<img alt="" class="" src="/upload/${fvo.save_dir }/${fvo.uuid}_${fvo.file_name}">
								<%-- 
								<img alt="" class="img-thumbnail" src="/upload/${fn:replace(fvo.save_dir,'\\','/') }/${fvo.uuid}_${fvo.file_name}"> 
								\\ => / replace로 변경하고 경로 찾은버전 -위에와 동일/replace안써도 됨
								--%>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<!-- 아이콘 모양 하나 가져와서 넣기 -->
							</div>
						</c:otherwise>
					</c:choose>
					<div>
						<!-- div =>파일이름,작성일,span size -->
						<div>${fvo.file_name }</div>
						${fvo.reg_date }
					</div>
					<span class="badge text-bg-warning">${fvo.file_size }Byte</span>
					<hr>
				</li> 
			</c:forEach>
			</ul>
		</div>
		
		<!-- <span class="badge text-bg-primary">Primary</span> --><!-- 배지 -->
		<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
		<c:if test="${ses.id ne null }">
		<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-success">modify</button></a>
		</c:if>
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
<script type="text/javascript">
spreadCommentList(bnoVal);
</script>
<br>
<jsp:include page="../layout/footer.jsp"></jsp:include>

     