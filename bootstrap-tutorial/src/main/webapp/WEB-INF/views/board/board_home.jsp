<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=PT+Sans:wght@700&family=Poppins:wght@600&display=swap');

* {
    box-sizing: border-box;
}

body {
    background-color: #d9ecf2;
    color: #666;
}
table{border-spacing:10px;}

thead {
    font-weight: bolder;
    font-size: 20px;
    color: #666;
}

img {
    width: 40px;
    height: 40px;
}

.name {
    display: inline-block;
}

.bg-blue {
    background-color: #EBF5FB;
    border-radius: 8px;
}

.fa-check,
.fa-minus {
    color: blue;
}

.bg-blue:hover {
    background-color: #3e64ff;
    color: #eee;
    cursor: pointer;
}

.bg-blue:hover .fa-check,
.bg-blue:hover .fa-minus {
    background-color: #3e64ff;
    color: #eee;
}

.table thead th,
.table td {
    border: none;
}

.table tbody td:first-child {
    border-bottom-left-radius: 10px;
    border-top-left-radius: 10px;
}

.table tbody td:last-child {
    border-bottom-right-radius: 10px;
    border-top-right-radius: 10px;
}

@media(max-width:575px) {
    .container {
        width: 125%;
        padding: 20px 10px;
    }
}

.no-before{
color:#D3D3D3 !important;
}

#spacing-row {
    height: 10px
}
</style>
</head>
<body>
	<%@ include file="../common/nav.jsp" %>
    <div class="container rounded mt-5 bg-white p-md-5">
    
	    <div class="h2 bold">
			게시판
	    </div>
	    
	    <div class="table-responsive">
	        <table class="table">
	            <thead>
	                <tr>
	                    <th scope="col" class="pt-2 col-sm-1">번호</th>
	                    <th scope="col" class="pt-2 col-sm-6">제목</th>
	                    <th scope="col" class="pt-2 col-sm-2">작성자</th>
	                    <th scope="col" class="pt-2 col-sm-2">날짜</th>
	                    <th scope="col" class="pt-2 col-sm-1">조회수</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:forEach var="board" items="${boardList}">
	            	
		            	<c:url var="detail" value="/board/view">
							<c:param name="bNo" value="${board.bNo}"/>
							<c:param name="currentPage" value="${paging.currentPage}"/>
						</c:url>
						
		            	<tr class="bg-blue" onclick="location.href='${detail}'">
		                    <td>${board.bNo}</td>
		                    <td>${board.bSubject}</td>
		                    <td>${board.bWritter}</td>
		                    <td><fmt:formatDate value="${board.bRegDate}" pattern="yy-MM-dd"/></td>
		                    <td>${board.bCount}</td>
		                </tr>
						<tr id="spacing-row">
		                    <td></td>
		                </tr>
	            	</c:forEach>
	            </tbody>
	        </table>
	    
	    	<hr>
	        
	    	<a class="btn btn-primary" href="/tutorial/board/write">글쓰기</a>
	    	
	    </div>
	</div>

	<!-- 페이징 처리 -->
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
        
        	<!-- 이전 -->
        	<c:if test="${paging.currentPage eq 1}">
	        	<li class="page-item">
	          		<a class="page-link no-before" tabindex="-1" aria-disabled="true">이전</a>
	          	</li>
        	</c:if>
        	<c:if test="${paging.currentPage ne 1}">
        		<c:url var="before" value="/board">
        			<c:param name="currentPage" value="${paging.currentPage - 1}"/>
        		</c:url>
        		
	        	<li class="page-item">
	          		<a class="page-link" tabindex="-1" href="${before}" aria-disabled="true">이전</a>
	          	</li>
        	</c:if>
        	
        	<!-- 페이지 -->
        	<c:forEach var="page" begin="${paging.startPage}" end="${paging.endPage}">
        		<c:if test="${page eq paging.currentPage }">
        			<li class="page-item"><a class="page-link bg-primary text-light">${page}</a></li>
        		</c:if>
        		
        		<c:if test="${page ne paging.currentPage }">
	    		    <c:url var="pagination" value="/board">
	        			<c:param name="currentPage" value="${page}"/>
	        		</c:url>
	        		
        			<li class="page-item"><a class="page-link" href="${pagination}">${page}</a></li>
        		</c:if>
        	</c:forEach>
        	
        	<!-- 다음 -->
     	    <c:if test="${paging.currentPage eq paging.maxPage}">
	        	<li class="page-item">
	          		<a class="page-link no-before" tabindex="-1" aria-disabled="true">다음</a>
	          	</li>
        	</c:if>
        	<c:if test="${paging.currentPage ne paging.maxPage}">
        		<c:url var="after" value="/board">
        			<c:param name="currentPage" value="${paging.currentPage + 1}"/>
        		</c:url>
        		
	        	<li class="page-item">
	          		<a class="page-link" tabindex="-1" href="${after}" aria-disabled="true">다음</a>
	          	</li>
        	</c:if>
        </ul>
    </nav>
</body>
</html>