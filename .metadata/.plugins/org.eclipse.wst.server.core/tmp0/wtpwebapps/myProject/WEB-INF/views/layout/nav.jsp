<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>

<!-- 부트스트랩 설정 -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<!-- 폰트 설정 -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">


</head>
<body>
<div class="container-xxl">
<ul class="nav nav-underline d-flex justify-content-evenly" style="font-family: 'Jua', sans-serif; font-size: 25px;">
  <li class="nav-item">
    <a class="nav-link order-5" href="/board/list">게시판</a>
  </li>
  <li class="nav-item">
	<a class="nav-link" href="/board/register">글쓰기</a> <!-- 컨트롤러 경로로 가는거임 -->
  </li>
  <!-- 로그인한 사용자만 보이는 화면 -->
  <sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal.mvo.email" var="authEmail"/>
  <sec:authentication property="principal.mvo.nickName" var="authNick"/>
  <sec:authentication property="principal.mvo.authList" var="auths"/>
  
 <c:choose>
 	<c:when test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
 	 <li class="nav-item">
    	<a class="nav-link" href="/member/list">회원리스트</a>
  	 </li>
 	 <li class="nav-item">
    	<a class="nav-link" href="/member/modify">정보수정</a>
 	 </li>
	</c:when>
	<c:otherwise>
    <li class="nav-item">
   	 <a class="nav-link" href="/member/modify">정보수정</a>
    </li>
	</c:otherwise>
 </c:choose>
  	<li class="nav-item">
     <a class="nav-link" id="logoutlink" href="">로그아웃</a>
  	<form action="/member/logout" method="post" id="logoutForm">
  		<input type="hidden" name="email" value="${authEmail }">
  	</form>
  	</li>
</sec:authorize>
  
		<sec:authorize access="isAnonymous()">
        <li class="nav-item">
          <a class="nav-link" href="/member/login">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/member/register">회원가입</a>
        </li>
		</sec:authorize>
</ul>
</div>



<script type="text/javascript">
document.getElementById('logoutlink').addEventListener('click',(e)=>{
    e.preventDefault();  /* 원래 있는 이벤트들을 다 없애워 href 무효화 */
    document.getElementById('logoutForm').submit();
});
</script>
</body>
</html>


