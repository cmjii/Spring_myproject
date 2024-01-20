<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<br>
<div class="container-md" style="max-width: 1100px; border: 0.5px solid gray; padding: 50px; border-radius: 20px;">
<h2 style="font-family: 'Jua', sans-serif;">글쓰기</h2>
<br>
<sec:authentication property="principal.mvo.email" var="authEmail"/>
<form action="/board/register" method="post" enctype="multipart/form-data">
  <div class="col-12">
    <label for="inputEmail4" class="form-label">제목</label>
    <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요." id="inputEmail4">
  </div> <br>
  <div class="col-12">
    <label for="inputPassword4" class="form-label">작성자</label>
    <input type="text" name="writer" class="form-control"value="${authEmail}"  readonly id="inputPassword4">
  </div> <br>
  <div class="col-12">
    <label for="inputAddress" class="form-label">내용</label>
    <textarea rows="15" name="content"  cols="10" class="form-control" placeholder="내용을 입력하세요."></textarea>
  </div><br>
  
  <!-- 파일 라인 -->
  <div class="mb-3">
  <input class="form-control" name="file" type="file" id="file" multiple="multiple">
  </div>
  <!-- 안에는 js에서 처리 -->
  <div class="mb-3" id="fileZone">
  </div>
  
  <br>
<a href="/"><button type="button"class="btn btn-outline-secondary" style="float: right;">돌아가기</button></a>
  <button type="submit" class="btn btn-outline-success" id="btn" style="float: right; margin-right: 10px;">등록</button>
</form>
</div>



<script src="/resources/js/BoardRegister.js"></script>























<jsp:include page="../layout/footer.jsp"></jsp:include>