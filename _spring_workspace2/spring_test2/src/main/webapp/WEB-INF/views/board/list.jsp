<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/nav.jsp"/>
    
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">title</th>
      <th scope="col">Writer</th>
      <th scope="col">regAt</th>
      <th scope="col">readCount</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list }" var="bvo">
    <tr>
      <th scope="row">${bvo.bno }</th>
      <td><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></td>
      <td>${bvo.writer }</td>
      <td>${bvo.regAt }</td>
      <td>${bvo.readCount }</td>
    </tr>
    </c:forEach>
  </tbody>
</table>
<jsp:include page="../layout/footer.jsp"/>