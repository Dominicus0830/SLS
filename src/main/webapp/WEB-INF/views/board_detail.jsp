<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>DOMI's Library</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />
</head>

<body>
    <c var="boardDTO" items="${boardDTO}">
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg bg-schoolgreen static-top ">
            <div class="container px-5">
                <%
					// 세션값 가져오기
					String id = (String) session.getAttribute("loginMemberName"); // Object 타입이므로 다운캐스팅
					if (id == null){%>
                    <a class="navbar-brand" href="/">DOMI's Library</a>
                    <%}else{%>
                    <a class="navbar-brand" href="/member_index">DOMI's Library</a>
                    <%}
				%>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <%
					// 세션값 가져오기

					if (id == null){%>
						<li class="nav-item"><a class="nav-link" href="/member/register">회원가입</a></li>
	                    <li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
					<%}else{%>
						<li class="nav-item"><a class="nav-link" href="/member/my_page">마이페이지</a></li>
                    	<li class<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
					<%}
					%>
   
                </ul>
                </div>
            </div>
        </nav>

        <!-- Navigation-->
    <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
        <div class="container">
            <!-- 로고 추가 -->
            <a class="navbar-brand d-flex align-items-center" href="/">
                <img src="http://localhost:8080/assets/img/schoolFullLogo.png" alt="School Logo" style="height: 90px; margin-right: 18px;">
            </a>

            <!-- 기존 버튼들 -->
            <a class="btn" style="background-color: #e3f2fd; color: black;" href="/book/unified_search">자료 검색</a>

            <div class="dropdown show">
                <a class="btn dropdown-toggle" style="background-color: #e3f2fd; color: black;" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    신청 / 참여
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <%
                        if (id == null) {
                    %>
                    <a class="dropdown-item disabled" href="/member/member_hope">희망 도서 신청</a>
                    <a class="dropdown-item" href="/board/unified_search">자유 게시판</a>
                    <% } else { %>
                    <a class="dropdown-item" href="/member/member_hope">희망 도서 신청</a>
                    <a class="dropdown-item" href="/board/unified_search">자유 게시판</a>
                    <% } %>
                </div>
            </div>

            <div class="dropdown show">
                <a class="btn dropdown-toggle" style="background-color: #e3f2fd; color: black;" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    도서관 이용
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="/good/unified_search">사서 추천 도서</a>
                    <a class="dropdown-item" href="/book/new_unified_search">신간 도서</a>
                </div>
            </div>

            <div class="dropdown show">
                <a class="btn dropdown-toggle" style="background-color: #e3f2fd; color: black;" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    도서관 정보
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

                    <a class="dropdown-item" href="/notice/unified_search">공지 사항</a>
                </div>
            </div>
        </div>
    </nav>




        <div class="container mt-5">
            <!--        중앙정렬-->
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${boardDTO.boardTitle}</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">${boardDTO.boardDate}</div>

                            <!-- Post categories -->
                            <div class="badge bg-secondary text-decoration-none link-light">${boardDTO.boardEmail}</div>
                        </header>
                        <!-- Preview image figure 이미지 넣는 파트인데 지금 우리 게시판 테이블엔 이미지 넣는게 없다.
                    <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure>-->
                        <!-- Post content-->
                        <section class="mb-5">
                            <p class="fs-5 mb-4">${boardDTO.boardContent}</p>
                        </section>
                    </article>

                    <!-- Comments section-->
                    <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- Comment form-->
                                <!--
                            <form class="mb-4">
                                <textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea>
                            </form>
-->
                                <!-- 							댓글 추가 창 -->
                                <div class="mb-3">
                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="text-center font-weight-light my-2">댓글</h3>
                                        </div>
                                        <div class="card-body">
                                            <form action="/board/board_detail?boardID=${boardDTO.boardID}" method="POST">

                                                <div class="form-group">
                                                    <textarea class="form-control" id="inputCommentContent" placeholder="댓글을 입력해주세요." rows="3" name="inputCommentContent"></textarea>
                                                </div>
                                                <div id="inputCommentContentCount">(0 / 1000)</div>

                                                <div class="mt-4 mb-0">
                                                    <div class="d-grid">
                                                        <input type="submit" class="btn btn-primary btn-block" value="댓글 추가" />
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <!--                             댓글 나오는 창-->
                                <c:forEach var="commentDTO" items="${commentDTOList}">
                                <div class="d-flex mb-4 ">
                                    <!-- Parent comment-->
                                    <div class="ms-3">
                                        <div class="fw-bold">${commentDTO.commentName}</div>
                                        ${commentDTO.commentContent}
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- Single comment-->
                            </div>
                        </div>
                    </section>

                </div>

                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">Categories</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                    <%
										// 세션값 가져오기
										if (id == null){%>
				                    <li><a href="/board/unified_search">게시판 목록</a></li>
				                    <%}else{%>
				                    <li><a href="/board/unified_search">게시판 목록</a></li>
                                        <li><a href="/board/board_write">게시판 글쓰기</a></li>
                                        <li><a href="/board/board_delete?boardID=${boardDTO.boardID}">현재 게시글 삭제</a></li>
				                    <%}
									%>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>

        <!-- Footer-->
        <footer class="footer bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                        <ul class="list-inline mb-2">


                        </ul>
                        <p class="text-muted small mb-4 mb-lg-0">&copy; Domi's Library
                            2024. All Rights Reserved.</p>
                    </div>
                    <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                        <ul class="list-inline mb-0">

                        </ul>
                    </div>
                </div>
            </div>
        </footer>
        <!-- <!-- Bootstrap core JS 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	Core theme JS <script type="text/javascript"
		src="js/scripts.js"></script>    사용자 정의 추가용 <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
	   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/css/bootstrap.min.css" rel="stylesheet" />

	       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script src="/js/scripts.js"></script> <script src="/js/dataTables.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>  -->
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script> <!--    회원 정의 추가용-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>-->
        <!--    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/css/bootstrap.min.css" rel="stylesheet" />-->

        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">-->
        <!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/dataTables.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/fixedheader/3.1.8/js/dataTables.fixedHeader.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </c>
</body>

</html>
