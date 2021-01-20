<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style type="text/css">
        p[class=card-text]{
	        overflow: hidden; 
	        text-overflow: ellipsis;
	        white-space: normal;
	        line-height: 1.2;
	        height: 2.4rem;
	        text-align: left; 
	        word-wrap: break-word;
        }
        .main_div{
        	background-image: url("./resources/img/dog.jpg");
        	background-position: center;
        	height: 300px;
        	border-radius: 10px;
        }
      </style>
</head>
<body>
	<%@ include file="common/nav.jsp"%>
      <main>

        <section class="py-5 text-center container">
	        <div class="row py-lg-5 main_div">
	        </div>
        </section>
    
        <div class="album py-5 bg-light">
        <div class="container">
        
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div class="col">
                    <div class="card shadow-sm">
	                    <img class="card-img-top" src="./resources/img/ramen.jpg">
	                    <div class="card-body">
	                        <p class="card-text">후쿠오카 라멘 + 생맥주</p>
	                        <div class="d-flex justify-content-between align-items-center">
	                        <div class="btn-group">
	                            <button type="button" class="btn btn-sm btn-outline-secondary">버튼1</button>
	                            <button type="button" class="btn btn-sm btn-outline-secondary">버튼2</button>
	                        </div>
	                        <small class="text-muted">날짜 표시</small>
	                        </div>
	                    </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
	                    <img class="card-img-top" src="./resources/img/hotel.jpg">
	                    <div class="card-body">
	                        <p class="card-text">후쿠오카 헤이와다이 호테루 아라토</p>
	                        <div class="d-flex justify-content-between align-items-center">
	                        <div class="btn-group">
	                            <button type="button" class="btn btn-sm btn-outline-secondary">버튼1</button>
	                            <button type="button" class="btn btn-sm btn-outline-secondary">버튼2</button>
	                        </div>
	                        <small class="text-muted">날짜 표시</small>
	                        </div>
	                    </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
	                    <img class="card-img-top" src="./resources/img/menu.jpg">
	                    <div class="card-body">
	                        <p class="card-text">후쿠오카 정식 가게 메뉴</p>
	                        <div class="d-flex justify-content-between align-items-center">
		                        <div class="btn-group">
		                            <button type="button" class="btn btn-sm btn-outline-secondary">버튼1</button>
		                            <button type="button" class="btn btn-sm btn-outline-secondary">버튼2</button>
		                        </div>
		                        <small class="text-muted">날짜 표시</small>
	                        </div>
	                    </div>
                    </div>
                </div>
            <div>
        </div>
        </div>
    </main>

    <footer class="text-muted py-5">
        <div class="container">
        <p class="float-end mb-1">
            <a href="#">맨 위로</a>
        </p>
        <p class="mb-1">이 사이트는 ©Bootstrap으로 디자인, Spring과 AWS로 서버를 구축했습니다.</p>
        <p class="mb-0">여기로오세요 <a href="/">Visit the homepage</a> or read our <a href="/docs/5.0/getting-started/introduction/">getting started guide</a>.</p>
        </div>
    </footer>
</body>
</html>