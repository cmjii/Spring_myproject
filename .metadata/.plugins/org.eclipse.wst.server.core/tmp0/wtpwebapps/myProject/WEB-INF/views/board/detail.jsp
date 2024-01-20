<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>


<div class="container-md" style="max-width: 1100px; border: 0.5px solid gray; padding: 50px; border-radius: 20px; margin-top: 50px;">
<c:set value="${bdto.bvo }" var="bvo"></c:set>
<h2 style="font-family: 'Jua', sans-serif;">글보기</h2>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
<div class="mb-3" >
${bvo.regAt }
</div>
<div class="mb-3" >
조회 : ${bvo.readCount }
</div>
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">제목</span>
  <input type="text" class="form-control"  value="${bvo.title}" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">작성자</span>
  <input type="text" class="form-control"  value="${bvo.writer}" readonly="readonly">
</div>


<div class="input-group">
  <span class="input-group-text">내용</span>
  <textarea class="form-control" readonly="readonly">"${bvo.content}"</textarea>
</div>
<br>
<div class="input-group mb-3">
<c:set value="${bdto.flist }" var="flist"></c:set>
	    <ul class="list-group list-group-flush">
	    	<c:forEach items="${flist }" var="fvo">
	    		<li class="list-group-item">
	    			<c:choose>
	    				<c:when test="${fvo.fileType ==1 }">
	    					<div>
	    						<img alt="" src="/upload/${fvo.saveDir}/${fvo.uuid}_th_${fvo.fileName}">
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
	    			</div>
	    		</li>
	    	</c:forEach>
	    </ul>
</div>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.mvo.email" var="authEmail"/>
    <sec:authentication property="principal.mvo.nickName" var="authNick"/>
    <sec:authentication property="principal.mvo.authList" var="auths"/>
    
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <c:choose>
            <c:when test="${authEmail eq bvo.writer}">
                <a href="/board/modify?bno=${bvo.bno}">
                    <button type="button" class="btn btn-outline-secondary" id="regBtn" style="float: right;">수정</button>
                </a>
                <a href="/board/delete?bno=${bvo.bno}">
                    <button type="button" class="btn btn-outline-danger" id="regBtn" style="float: right;">삭제</button>
                </a>
            </c:when>
        </c:choose>
    </div>
</sec:authorize>

<div class="mb-3" >
<h5 style="font-family: 'Jua', sans-serif;">댓글</h5>
</div>
<!-- 댓글 등록 라인 -->
   <br><div class="input-group mb-3" style="max-width: 1100px;">
	  <span class="input-group-text" id="cmtWriter">${bvo.writer }</span>
	  <input type="text" class="form-control" id="cmtText" aria-label="Amount (to the nearest dollar)">
	  <button type="button" class="btn btn-success" id="cmtPostBtn">등록</button>
	</div>
   
      <!-- 댓글 표시 라인 -->
   <ul class="list-group list-group-flush" id="cmtListArea">
	  <li class="list-group-item">
	  	<div class="mb-3">
	  		<div class="fw-bold">Writer</div>
	  		content
	  	</div>
	  	<span class="badge rounded-pill text-bg-warning">modAt</span>
	  </li>
	</ul>
   
	<br>
	
	<!-- 댓글 더보기 버튼 -->
	<div>
		<button type="button" id="moreBtn" data-page="1" class="btn btn-outline-dark" style="visibility:hidden" >MORE+</button>
	</div>
    
    <!-- Modal -->
	<div class="modal" id="myModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">writer</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	           <div class="input-group mb-3">
	           	  <input type="text" class="form-control" id="cmtTextMod">
			       <button type="button" id="cmtModBtn" class="btn btn-primary">post</button>
	           </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	 
    
    </div>

<script type="text/javascript">
let bnoVal = `<c:out value="${bdto.bvo.bno}" />`;
console.log(bnoVal);
</script>



<script src="/resources/js/BoardComment.js" ></script>

<script type="text/javascript">
spreadCommentList(bnoVal);
</script>




