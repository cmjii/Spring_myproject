<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>


<div class="container"  style="max-width: 1100px; margin-top: 40px;">
<table class="table table-hover">
  <thead>
    <tr class="align-baseline" style="height: 50px; vertical-align:middle">
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
    <tr id="table" style="cursor: pointer; height: 50px; vertical-align:middle">
      <th scope="row">${bvo.bno }</th>
      <td><a href="/board/detail?bno=${bvo.bno }" id="url" style="color: black; text-decoration: none;">${bvo.title }</a></td>
      <td>${bvo.writer }</td>
      <td>${bvo.regAt }</td>
      <td>${bvo.cmtQty }</td>
      <td>${bvo.readCount }</td>
    </tr>
  </c:forEach>
  </tbody>
</table>



<!-- 페이지 네이션 -->

<nav aria-label="Page navigation example"">
  <ul class="pagination justify-content-center">
  
  <!-- prev 이전 페이지 -->
    <li class="page-item ${(ph.prev eq false) ? 'disabled' : '' }">
      <a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    
    <!-- 페이지번호 -->
    <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
    <li class="page-item">
    <a class="page-link" href="/board/list?pageNo=${i}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword}">${i }</a>
    </li>
    </c:forEach>
    
    <!-- next 다음페이지 -->
    <li class="page-item ${(ph.next eq false) ? 'disabled' : '' }">
      <a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword}"  aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
   
  </ul>
</nav>

<form class="d-flex justify-content-center"  action="/board/list" role="search" method="get"style="margin-right: 50px;">
			<c:set value="${ph.pgvo.type}" var="typed"></c:set>
		 	<select class="form-select" name="type" id="inputGroupSelect01" style="max-width: 130px; margin-right: 10px;">
		 		<option ${typed eq null ? 'selected':'' }>선택</option>
		 		<option value="t" ${typed eq 't' ? 'selected':'' }>제목</option>
		 		<option value="w" ${typed eq 'w' ? 'selected':'' }>작성자</option>
		 		<option value="c" ${typed eq 'c' ? 'selected':'' }>내용</option>
		 		<option value="tw" ${typed eq 'tw' ? 'selected':'' }>제목+작성자</option>
		 		<option value="tc" ${typed eq 'tc' ? 'selected':'' }>제목+내용</option>
		 		<option value="wc" ${typed eq 'wc' ? 'selected':'' }>작성자+내용</option>
		 		<option value="twc" ${typed eq 'twc' ? 'selected':'' }>전체</option>
		 	</select>
		 	<input type="hidden" name="pageNo" value="1">
		 	<input type="hidden" name="qty" value="${ph.pgvo.qty }">
        <input class="form-control me-2" name="keyword" style="max-width: 350px;" value="${ph.pgvo.keyword }" type="search" placeholder="검색어를 입력하세요." aria-label="Search">
        <button type="submit" class="btn btn-primary position-relative">
			  검색
			  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
			     ${ph.totalCount }
			    <span class="visually-hidden"></span>
			  </span>
		</button>
</form>

</div>
<script>
document.getElementById('table').addEventListener('click',(e)=>{
    document.getElementById('url').click();
})
</script>

<script>
const delete = `<c:out value="${delete}"/>`;
if(delete ==="1"){
	alert("삭제 완료");
}
</script>