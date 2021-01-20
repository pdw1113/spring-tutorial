<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<style>
	.aaa{
		display: inline !important;
	}
</style>
</head>
<body>
	<%@ include file="../common/nav.jsp"%>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- 게시글 전체 -->
			<div class="col-lg-8">

				<!-- 제목 -->
				<h2 class="mt-4 shadow-sm p-2 bg-white">${board.bSubject}</h2>

				<!-- 작성자 -->
				<p class="lead">
					<span class="fs-6 fw-bold text-dark">작성자 : </span>
					<a href="#">
						<span class="badge bg-primary bg-gradient">${board.bWritter}</span>
					</a>
				</p>

				<hr>

				<!-- 작성일 -->
				<p>
					<span class="fs-6 fw-bold text-dark">
						작성일 :
						<fmt:formatDate value="${board.bRegDate}" pattern="yy년 MM월 dd일 kk:mm"/>
					</span>
				</p>

				<hr>
				
				<!-- 내용 -->
				<p class="lead">
					${board.bContent}
				</p>
					
				<hr>
				
				<!-- 이전, 목록, 다음-->
				<table class="table">
					<thead>
						<tr>
							<td class="col-sm-4 text-start">
								<!-- 이전 글 -->
								<c:if test="${board.prebNo ne -1}">
									<c:url var="prebNo" value="/board/view">
										<c:param name="bNo" value="${board.prebNo}"/>
										<c:param name="currentPage" value="${currentPage}"/>
									</c:url>
									<a class="btn btn-sm btn-primary" href="${prebNo}">← 이전</a>
								</c:if>
								<c:if test="${board.prebNo eq -1}">
									<a class="btn btn-sm btn-primary" onclick="alert('가장 이전글입니다.')">← 이전</a>
								</c:if>
									
								<!-- 다음 글 -->
								<c:if test="${board.nextbNo ne -1}">
									<c:url var="nextbNo" value="/board/view">
										<c:param name="bNo" value="${board.nextbNo}"/>
										<c:param name="currentPage" value="${currentPage}"/>
									</c:url>
									<a class="btn btn-sm btn-primary" href="${nextbNo}">다음→</a>
								</c:if>
								<c:if test="${board.nextbNo eq -1}">
									<a class="btn btn-sm btn-primary" onclick="alert('가장 최신글입니다.')">다음 →</a>
								</c:if>
							</td>
							
							<!-- 목록 -->
							<c:url var="boardList" value="/board">
								<c:param name="currentPage" value="${currentPage}"/>
							</c:url>
							<td class="col-sm-4 text-center"><a class="btn btn-sm btn-primary" href="${boardList}">목록</a></td>
							
							<td class="col-sm-4 offset-sm-4 text-end">
							<form action="/tutorial/board/update" method="post">
								<input type="hidden" value="${board.bNo}" name="bNo"/>
								<input class="form-control form-control-sm d-inline w-25" type="hidden" placeholder="4자리" id="pwdInput" name="pwdInput"/>
								<a class="btn btn-sm btn-success" onclick="pwdConfirm(this);" id="updateInput">수정</a>
								<button type="button" class="btn btn-sm btn-danger" onclick="pwdConfirm(this);" id="deleteInput">삭제</button>
							</form>
							</td>
						</tr>
					</thead>
				</table>

				<!-- 댓글 입력 창 -->
				<div class="card my-3 border border-2">
					<span class="card-header fs-6 fw-bold text-dark">댓글</span>
					<form action="/tutorial/board/comment" method="post" onsubmit="return regExp();">
						<div class="container my-2">
							<div class="row mb-2">
								<div class="col-6 col-sm-3">
									<input type="text" class="form-control" id="cWritter" placeholder="작성자 (6자리)" name="bWritter">
								</div>
								<div class="col-6 col-sm-3">
									<input type="password" class="form-control" id="cPassword" placeholder="비밀번호 (4자리)" name="bPassword">
								</div>
								<div class="col-6 text-end">
									<button type="submit" class="btn btn-primary">등록</button>
								</div>
							</div>
							<div class="row text-end">
								<div class="form-group">
									<textarea class="form-control" rows="3" style="resize: none" id="cContent"></textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
				
			</div>
			
			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">검색인데 아직 미완성</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="검색어 입력..."> <span
								class="input-group-append">
								<button class="btn btn-secondary" type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">인기 링크</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">구암의</a></li>
									<li><a href="#">현자</a></li>
									<li><a href="#">그는 어디에..?</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">동원</a></li>
									<li><a href="#">참치</a></li>
									<li><a href="#">1캔당 얼마..?</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">여기에 뭘 만들까</h5>
					<div class="card-body">아이디어 추천좀</div>
				</div>

			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<script>
		// 1. 유효성검사
		function regExp(){
			// 작성자
			var bWritter  = document.getElementById('bWritter');
			// 비밀번호
			var bPassword  = document.getElementById('bPassword');
			// 내용
			var bContent  = document.getElementById('summernote');
			
			if(!chk(/^.{1,6}$/,bWritter,"작성자는 1글자 이상 6글자 이하로 입력해주세요.")){
				return false;
			}
			if(!chk(/^.{1,4}$/,bPassword,"비밀번호는 1글자 이상 4글자 이하로 입력해주세요.")){
				return false;
			}
          	if(!bContent.value){
                alert("내용을 입력해주세요.");
                return false;
          	}
		
		}
   
	    // 2. 유효성 검사 콜백 함수
	    function chk(re,ele,msg){
	        if(!re.test(ele.value)){
	           // alert 메시지
	           alert(msg);   
	           // 드래그
	           ele.select(); 
	           // 넘어가지 않게 한다.
	           return false; 
	        }
	        // 위의 값이 아니면 넘긴다.
	        return true;
	    }
	    
	    // 3. input hidden 열기
	    function pwdConfirm(el){
	    	
	    	// 1. hidden → password 변경
	    	pwdInput.type="password";
	    	
			// 2. 버튼 value 변경
    		el.innerHTML = "완료";
			
	    	// 3. 버튼 숨김 / action 변경 
	    	if(el.id === "updateInput"){
	    		el.nextElementSibling.style.display = "none";
	    	}else{
	    		el.previousElementSibling.style.display = "none";
	    	}
	    	
	    	// 4. onclick 변경 / form 전송
	    	el.onclick = function(){
	    		if(el.id == "deleteInput"){
	    			if(window.confirm("정말 삭제하시겠습니까?")){
	    				makeRequest();
	    			}
	    			return; //삭제 방지
	    		}else{
		    		el.parentElement.submit();
	    		}
    		}
	    }
	    
	    
	    // 4. w
    	let xhr;
    	
    	function makeRequest(){

	    	// 1. 비밀번호
	    	let pwdInput = document.getElementById("pwdInput").value;
	    	
	    	if(pwdInput){
	    		// 2. ajax 객체 생성
	    		xhr = new XMLHttpRequest();
	    		// 3. onreadystatechange : XMLHttpRequest 객체의 readyState 프로퍼티 값이 변할 때마다 자동으로 호출되는 함수
	    		xhr.onreadystatechange = function(){
	    			// 4. readyState === 4 : 접속 성공
	    			if(xhr.readyState === 4){
	    				// 5. status === 200 : 응답 성공
	    				if(xhr.status === 200){
	    					// 6. responseText : 전달받은 String
	    					if(xhr.responseText === "no"){
		    					alert("비밀번호가 다릅니다!");
	    					}else if(xhr.responseText === "success"){
	    						alert("삭제 완료");
	    						location.href = "/tutorial/board";
	    					}
	    				}
	    			}
	    		}
	    		// 7. 전송 방식, URL, 비동기 유무
	    		xhr.open("post", "/tutorial/board/delete", true);
	    		// 8. DataType
	    		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	    		// 9. Data 전송
	    		xhr.send("bNo=${board.bNo}&pwdInput=" + pwdInput);
	    	}else{
	    		alert("비밀번호를 입력하세요.");
	    	}
	    }
    	
    	if("${msg}"){
    		alert("${msg}");
    	}
	</script>
</body>
</html>