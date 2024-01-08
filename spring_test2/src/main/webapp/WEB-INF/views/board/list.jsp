<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/nav.jsp"/>
    
  <div class="col-sm-12 col-md-6">
    	<form action="/board/list" method="get">
    	  <div class="input-group mb-3">
    	  <c:set value="${ph.pgvo.type }" var="typed"></c:set>
  		

    	<select class="form-select" name="type" id="input" aria-label="Default select example">
    		<option ${typed eq null ? 'selected':'' }>Choose..</option>
    		<option value="t"  ${typed eq 't' ? 'selected':'' }>Title</option>
    		<option value="w"  ${typed eq 'w' ? 'selected':'' }>Writer</option>
    		<option value="c"  ${typed eq 'c' ? 'selected':'' }>Content</option>
    		<option value="tw"  ${typed eq 'tw' ? 'selected':'' }>Title & Writer</option>
    		<option value="wc"  ${typed eq 'wc' ? 'selected':'' }>Writer & Content</option>
    		<option value="ct"  ${typed eq 'ct' ? 'selected':'' }>Content & Title</option>
    		<option value="twc"  ${typed eq 'twc' ? 'selected':'' }>All</option>
    	</select>
    		
    		<input type="hidden" name="pageNo" value ="1">
    		<input type="hidden" name="qty" value="${ph.pgvo.qty }">
    		<input class="form-control me-2" name="keyword" type="search" >
    		<button type="submit" class="btn btn-outline-secondary">
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
      <th scope="col">readCount</th>
     <th scope="col">comment_qty</th> 
     <th scope="col">File_qty</th>
     <th scope="col">Mod At</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list }" var="bvo">
    <tr>
      <th scope="row">${bvo.bno }</th>
      <td><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></td>
      <td>${bvo.writer }</td>
      <td>${bvo.readCount }</td>
      <td>${bvo.cmtQty }</td>
      <td>${bvo.hasFile }</td>
      <td>${bvo.modAt }</td>
    </tr>
    </c:forEach>
  </tbody>
</table>

<!-- 페이징 라인 -->

<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item ${(ph.prev eq false)? 'disabled':'' }" >
    	<a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}">◀</a>
    </li>
    
    
    <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
    <li class="page-item"><a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a></li>
 	</c:forEach>
	
    <li class="page-item ${(ph.next eq false)? 'disabled':'' }">
    	<a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}">▶</a>
    </li>
  </ul>
</nav>


<jsp:include page="../layout/footer.jsp"/>