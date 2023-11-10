<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../inn/head/databaseList.jsp"/>
<title>신고 목록</title>
  <c:if test="${empty emp_id}">
		<c:redirect url="./Login.emp"/>
  </c:if>
  
<%
	String link = "./ComplainList.emp?";
	String pageCategory = request.getParameter("pageCategory");
	link += "pageCategory=";
	link += pageCategory == null ? "all" : pageCategory;
%>

<jsp:include page="../inn/navbar.jsp"/>
      <main role="main" class="main-content" data-select2-id="9">
        <div class="container-fluid" data-select2-id="8">
          <div class="row justify-content-center" data-select2-id="7">
            <div class="col-12" data-select2-id="6">
              <h2 class="h3 mb-3 page-title">문의 목록</h2>
              <div class="row mb-4 items-align-center">
                <div class="col-md">
                  <ul class="nav nav-pills justify-content-start">
                  <c:if test="${empty pageCategory or pageCategory == 'all'}">
                  	<li class="nav-item">
                      <a class="nav-link active bg-transparent pr-2 pl-0 text-primary" href="<%=link %>&pageNum=1">전체 <span class="badge badge-pill bg-primary text-white ml-2">${count[0]}</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-muted px-2" href="<%=link %>&pageNum=1">답변 완료 <span class="badge badge-pill bg-white border text-muted ml-2">${count[1]}</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-muted px-2" href="<%=link %>&pageNum=1">미완료 <span class="badge badge-pill bg-white border text-muted ml-2">${count[2]}</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-muted px-2" href="<%=link %>&pageNum=1">피신고자 목록</a>
                    </li>
                  </c:if>
                  <c:if test="${pageCategory == '1'}">
                  	<li class="nav-item">
                      <a class="nav-link text-muted px-2" href="<%=link %>&pageNum=1">전체 <span class="badge badge-pill bg-white border text-muted ml-2">${count[0]}</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active bg-transparent pr-2 pl-0 text-primary" href="<%=link %>&pageNum=1">답변 완료 <span class="badge badge-pill bg-primary text-white ml-2">${count[1]}</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-muted px-2" href="<%=link %>&pageNum=1">미완료 <span class="badge badge-pill bg-white border text-muted ml-2">${count[2]}</span></a>
                    </li>
                  </c:if>
                  <c:if test="${pageCategory == '0'}">
                  	<li class="nav-item">
                      <a class="nav-link text-muted px-2" href="<%=link %>&pageNum=1">전체 <span class="badge badge-pill bg-white border text-muted ml-2">${count[0]}</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-muted px-2" href="<%=link %>&pageNum=1">답변 완료 <span class="badge badge-pill bg-white border text-muted ml-2">${count[1]}</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active bg-transparent pr-2 pl-0 text-primary" href="<%=link %>&pageNum=1">미완료 <span class="badge badge-pill bg-primary text-white ml-2">${count[2]}</span></a>
                    </li>
                  </c:if>
                  </ul>
                </div>
                <div class="col-md-auto ml-auto text-right">
                  <button type="button" class="btn" data-toggle="modal" data-target=".modal-slide"><span class="fe fe-filter fe-16 text-muted"></span></button>
                  <button type="button" class="btn" onclick="./ComplainList.emp"><span class="fe fe-refresh-ccw fe-16 text-muted"></span></button>
                </div>
              </div>
              <c:if test="${list == null}">
              	0건
              </c:if>
              <c:if test="${list != null }">
              <table class="table border table-hover bg-white">
                <thead>
                  <tr role="row">       
                    <th>글 번호</th>
                    <th>아이디</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>게시일자</th>
                    <th>답변 상태</th>
                    <th>답변자</th><!-- emp_id -->
                    <th>기타</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="i" items="${list}">
                  <tr>
                    <td>${i.bno}</td>
                    <td>
                    	<p class="mb-0 text-muted">
                    		<a href="./UserInfo.emp?user_id=${i.user_id}" class="text-muted">${i.user_id}</a>
                    	</p>
                    </td>
                    <td>${inquiryReason[i.category - 1]}</td>
                    <td>
                    	<p class="mb-0 text-muted">
                    		<a href="./InquiryContent.emp?bno=${i.bno}" class="text-muted">${i.subject}</a>
                    	</p>
                    </td>
                    <td>${i.content}</td>
                    <td>${i.uploadDate}</td>
                    <td>
                    	<!-- 답변 완료 -->
                    	<c:if test="${i.complete}">
                    		<span class="dot dot-lg bg-success mr-2"></span>
                    	</c:if>
                    	<!-- 답변 x -->
                    	<c:if test="${!i.complete}">
                    		<span class="dot dot-lg bg-secondary mr-2"></span>
                    	</c:if>
                    </td>
                    <td>
                    	<c:if test="${i.complete}">${i.emp_id}</c:if>
                    </td>
                    <td>
                      <div class="dropdown">
                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" style="">
                          <a class="dropdown-item" href="./InquiryContent.emp?bno=${i.bno}&pageNum=${pageNum}">상세보기</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  </c:forEach>            
                </tbody>
              </table>
              </c:if>
              <nav aria-label="Table Paging" class="my-3">
                <ul class="pagination justify-content-end mb-0">
                <c:if test="${1 < pageNum}">
					<li class="page-item"><a class="page-link" href="<%=link%>&pageNum=${pageNum-1}">이전</a></li>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
					<c:if test="${i == pageNum}">
						<li class="page-item active"><a class="page-link" href="<%=link%>&pageNum=${i}">${i}</a></li>
					</c:if>
					<c:if test="${i != pageNum }">	
						 <li class="page-item"><a class="page-link" href="<%=link%>&pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageNum < pageCount}">
					<li class="page-item"><a class="page-link" href="<%=link%>&pageNum=${pageNum+1}">다음</a></li>
				</c:if>
                </ul>
              </nav>
            </div>
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
      </main>
    </div>
<jsp:include page="../inn/footer.jsp"/>