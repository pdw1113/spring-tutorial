<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<%@ include file="../common/nav.jsp" %>
	<div class="container">
		<div class="row justify-content-md-center mb-3">
		    <h1 class="col-md-auto">
		    <span class="badge bg-success bg-gradient">
				글쓰기
		    </span>
		    </h1>
		</div>
		<form action="/tutorial/board/write/complete" method="post" onsubmit="return regExp();">
			<div class="row mb-3">
				<div class="col-6 col-sm-3">
					<label for="bWriter" class="form-label"><strong>작성자</strong></label>
					<input type="text" class="form-control" id="bWritter" placeholder="작성자 (6자리)" name="bWritter">
				</div>
				<div class="col-6 col-sm-3">
					<label for="bPassword" class="form-label"><strong>비밀번호</strong></label>
					<input type="password" class="form-control" id="bPassword" placeholder="비밀번호 (4자리)" name="bPassword">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<label for="bSubject" class="form-label"><strong>제목</strong></label>
					<input type="text" class="form-control" id="bSubject" placeholder="제목을 입력해주세요. (16자리)" name="bSubject">	
				</div>
			</div>
		    <div class="row mb-3">
				<div class="col">
			    	<textarea id="summernote" style="resize: none;" name="bContent"></textarea>
		    	</div>
		    </div>
		    <div class="row justify-content-end">
		    	<div class="col text-end">
					<button type="button" class="btn btn-danger me-1" onclick="location.href='/tutorial/board'">취소</button>
					<button type="submit" class="btn btn-primary">완료</button>
		    	</div>
		    </div>
		</form>
		
	    <script>
		    // SUMMERNOTE
	      	$('#summernote').summernote({
		        placeholder: 'Hello stand alone ui',
		        tabsize: 2,
		        height: 360,
		        placeholder: '당신의 생각을 적어주세요!',
		        toolbar: [
		          ['style', ['style']],
		          ['font', ['bold', 'underline', 'clear']],
		          ['color', ['color']],
		          ['para', ['ul', 'ol', 'paragraph']],
		          ['table', ['table']],
		          ['insert', ['link', 'picture', 'video']],
		          ['view', ['fullscreen', 'codeview', 'help']]
		        ]
	      	});
	    </script>
	    
		<script>
			// 유효성검사
			function regExp(){
				// 작성자
				var bWritter  = document.getElementById('bWritter');
				// 비밀번호
				var bPassword  = document.getElementById('bPassword');
				// 제목
				var bSubject  = document.getElementById('bSubject');
				// 내용
				var bContent  = document.getElementById('summernote');
				
				if(!chk(/^.{1,6}$/,bWritter,"작성자는 1글자 이상 6글자 이하로 입력해주세요.")){
					return false;
				}
				if(!chk(/^.{1,4}$/,bPassword,"비밀번호는 1글자 이상 4글자 이하로 입력해주세요.")){
					return false;
				}
				if(!chk(/^.{1,16}$/,bSubject,"제목은 1글자 이상 16글자 이하로 입력해주세요.")){
					return false;
				}
	          	if(!bContent.value){
	                alert("내용을 입력해주세요.");
	                return false;
	          	}
			
			}
    
		    // 유효성 검사 콜백 함수
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
		</script>
	</div>
</body>
</html>