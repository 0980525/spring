<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
	<h1>Board Register Page</h1>
	<br>	
	
	<!-- 검색라인 
	타이틀, 검색어 유지하는거 => ${ph.pgvo.type == 't'? 'selected':''}
	,토탈카운트 =>${ph.totalCount } 
	-->
	
	<div>
		<form action="/board/list" method="get">
		<div class="input-group mb-3">
			<select name="type" class="form-select" id="search">
				<option ${ph.pgvo.type == null? 'selected':''}>Choose..</option>
				<option value="t" ${ph.pgvo.type == 't'? 'selected':''}>Title</option>
				<option value="w" ${ph.pgvo.type == 'w'? 'selected':''}>Writer</option>
				<option value="c" ${ph.pgvo.type == 'c'? 'selected':''}>Content</option>
				<option value="tc" ${ph.pgvo.type == 'tc'? 'selected':''}>Title & Content</option>
				<option value="wt" ${ph.pgvo.type == 'tw'? 'selected':''}>Title & Writer</option>
				<option value="wc" ${ph.pgvo.type == 'wc'? 'selected':''}>Writer & Content</option>
				<option value="twc" ${ph.pgvo.type == 'twc'? 'selected':''}>All</option>
			</select>
			
			<input type="text" name="keyword" class="form-control" value="${ph.pgvo.keyword }" placeholder="Search...">
			<input type="hidden" name="pageNo" value="1">
			<input type="hidden" name="qty" value="10">
			
			<button type="submit" class="btn btn-primary position-relative">
				search
				  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
				    ${ph.totalCount }
				    <span class="visually-hidden">unread messages</span>
				  </span>
				</button>
			</div>
		</form>
	</div>
	
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">title</th>
      <th scope="col">Writer</th>
      <th scope="col">reg_date</th>
      <th scope="col">commentCount</th>
      <th scope="col">fileCount</th>
      <th scope="col">read_count</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list }" var="bvo">
    <tr>
      <th scope="row">${bvo.bno }</th>
      <td><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></td>
      <td>${bvo.writer }</td>
      <td>${bvo.reg_date }</td>
      <td>${bvo.commentCount }</td>
      <td>${bvo.fileCount }</td>
      <td>${bvo.read_count }</td>
    </tr>
    </c:forEach>
  </tbody>
</table>

<!-- 페이지네이션 -->
<nav aria-label="Page navigation example">
  <ul class="pagination">
  
  	<!-- 이전 -->
  	<c:if test="${ph.prev }">
    <li class="page-item">
      <a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Previous">
        <span aria-hidden="true"> ◁ </span>
      </a>
    </li>
    </c:if>
    
    <!-- 페이지 번호 -->
    <c:forEach  var="i" begin="${ph.startPage }" end="${ph.endPage }">
    <li class="page-item">
    	<a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">
    		${i }
    	</a>
    </li>
    </c:forEach>
    
  	<!-- 다음 -->
  	<c:if test="${ph.next }">
    <li class="page-item">
      <a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
        <span aria-hidden="true"> ▷ </span>
      </a>
    </li>
    
    </c:if>
    <li class="page-item">
    	<a class="page-link" href="/board/list">
    		전체보기
    	</a>
    </li>
    
  </ul>
</nav>
</div>
<script>
	const isDel = `<c:out value="${isDel}" />`;
	if(isDel == 1){
		alert("게시글이 삭제되었습니다.");
	}
</script>














<jsp:include page="../layout/footer.jsp"></jsp:include>

     