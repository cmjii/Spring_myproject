<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<br>
<div class="container-md" style="max-width: 1100px; border: 0.5px solid gray; padding: 50px; border-radius: 20px;">
<h2 style="font-family: 'Jua', sans-serif;">글수정</h2>
<br>
<c:set value="${bdto.bvo }" var="bvo"></c:set>
<form action="/board/modify" method="post" enctype="multipart/form-data">
    <input type="text" name="bno" type="hidden" style="display: none" value="${bvo.bno }">
  <div class="col-12">
    <label for="inputEmail4" class="form-label">제목</label>
    <input type="text" name="title" class="form-control" value="${bvo.title }" id="inputEmail4">
  </div> <br>
  <div class="col-12">
    <label for="inputPassword4" class="form-label">작성자</label>
    <input type="text" name="writer" class="form-control" value="${bvo.writer }" readonly="readonly" id="inputPassword4">
  </div> <br>
  <div class="col-12" >
    <label for="inputAddress" class="form-label">내용</label>
    <textarea rows="15" name="content"  cols="10" class="form-control">${bvo.content }</textarea>
  </div><br>
  
  
<div class="input-group mb-3">
<c:set value="${bdto.flist }" var="flist"></c:set>
	    <ul class="list-group list-group-flush">
	    	<c:forEach items="${flist }" var="fvo">
	    		<li class="list-group-item">
	    			<c:choose>
	    				<c:when test="${fvo.fileType ==1 }">
	    					<div>
	    						<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_th_${fvo.fileName}">
	    					</div>
	    				</c:when>
	    				<c:otherwise>
	    					<div>
	    					<!-- 일반 파일 표시할 아이콘 -->
	    					<a href="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" download="${fileName }">
	    						<i class="bi bi-card-heading" style="font-size: 50px;"></i>
	    					</a>
	    					</div>
	    				</c:otherwise>
	    			</c:choose>
	    			<div class="ms-2 me-auto">
	    				<div class="fw-bold">${fvo.fileName }</div>
	    				<span class="badge text-bg-secondary">${fvo.fileSize }</span>
	    				<button type="button" data-uuid="${fvo.uuid }" class="btn btn-outline-danger file-x">삭제</button>
	    			</div>
	    		</li>
	    	</c:forEach>
	    </ul>
</div>
  
  
  
  <!-- 파일 입력 라인 -->
  <div class="mb-3">
  <input class="form-control" name="file" type="file" id="file" multiple="multiple">
  </div>
  <!-- 안에는 js에서 처리 -->
  <div class="mb-3" id="fileZone">
  </div>
  
  <br>
<a href="/"><button type="button"class="btn btn-outline-secondary" style="float: right;">돌아가기</button></a>
  <button type="submit" class="btn btn-outline-success" id="btn" style="float: right; margin-right: 10px;">수정</button>
</form>
</div>



<script src="/resources/js/BoardRegister.js"></script>
<script src="/resources/js/BoardModify.js" ></script>