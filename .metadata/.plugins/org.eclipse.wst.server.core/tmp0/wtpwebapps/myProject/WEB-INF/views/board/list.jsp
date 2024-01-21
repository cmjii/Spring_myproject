<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>


<div class="container"  style="max-width: 1100px; margin-top: 40px;">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
      <th scope="col">댓글</th>
      <th scope="col">조회</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
  	<c:forEach items="${list }" var="bvo">
    <tr id="table" style="cursor: pointer">
      <th scope="row">${bvo.bno }</th>
      <td><a href="/board/detail?bno=${bvo.bno }" id="url">${bvo.title }</a></td>
      <td>${bvo.writer }</td>
      <td>${bvo.regAt }</td>
      <td>${bvo.cmtQty }</td>
      <td>${bvo.readCount }</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</div>


<script>
document.getElementById('table').addEventListener('click',(e)=>{
    document.getElementById('url').click();
})
</script>