<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400;500;700&family=Noto+Serif+KR:wght@400;500&display=swap" rel="stylesheet">
</head>
<style>
	.btn-search{
	    width: 5rem;
	}
	
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-primary bg-gradient mb-5">
        <div class="container-fluid">
          <span class="navbar-brand text-light" href="#">🐶스프링 튜토리얼🐶</span>
          <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active text-light" aria-current="page" href="/tutorial/main">홈</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-light" href="/tutorial/board">게시판</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-light" href="#" tabindex="-1" aria-disabled="true" onclick="alert('..미완성 코딩중..')">채팅</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  고객센터
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="#" onclick="alert('..미완성 코딩중..')">Q&A</a></li>
                  <li><a class="dropdown-item" href="#" onclick="alert('..미완성 코딩중..')">1:1 문의</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#" onclick="alert('..미완성 코딩중..')">만든 이</a></li>
                </ul>
              </li>
            </ul>
            <form class="d-flex">
              <input class="form-control me-2" type="search" placeholder="검색" aria-label="Search">
              <button class="btn btn-outline-light btn-search" type="submit" onclick="alert('..미완성 코딩중..')">검색</button>
            </form>
          </div>
        </div>
	</nav>
</body>
</html>