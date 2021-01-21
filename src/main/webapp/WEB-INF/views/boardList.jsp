<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String memId = (String) session.getAttribute("memId");
%>

<div class="container" id="container">
	<!-- Content-Header (게시판) -->
	<div class="row">
		<h5>| 게시판</h5>
	</div>
	<hr>

	<div class="col">
		<!-- 탭 (공지사항|이벤트) -->
		<div>
			<div>
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#notice">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#event">이벤트</a></li>
				</ul>
			</div>
		</div>
		<br>

		<div class="tab-content">
			<!-- 공지사항 -->
			<div class="tab-pane fade show active" id="notice">
				<div>
					<table class="table table-striped" style="width: 100%; text-align: center;">
						<tr class="thead-dark">
							<th style="width: 10%;">No</th>
							<th style="width: 70%;">제목</th>
							<th style="width: 20%;">작성일</th>
						</tr>
						<c:forEach items="${noticeList.content}" var="noList">
							<tr>
								<td>${noList.bbsNo}</td>
								<td><a type="hidden" href="bbsDetail?bbsNo=${noList.bbsNo}">${noList.bbsTitle}</a></td>
								<td>${noList.bbsStart}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br>

				<!-- Pagination -->
				<div>
					<ul class="pagination justify-center" style="justify-content: center;">
						<c:if test="${!noticeList.first}">
							<li class="page-item"><a href="?sort=bbsNo,desc$page=" class="page-link">&laquo;</a></li>
							<li class="page-item"><a href="?sort=bbsNo,desc&page=${noticeList.number - 1}" class="page-link">&lt;</a></li>
						</c:if>
						<c:set var="pageRange" scope="session" value="5" />
						<fmt:parseNumber var="pageIndex" integerOnly="true" value="${noticeList.number div pageRange}" />
						<c:choose>
							<c:when test="${pageIndex * pageRange + pageRange > noticeList.totalPages - 1}">
								<c:set var="lastPage" scope="session" value="${noticeList.totalPages}" />
							</c:when>
							<c:otherwise>
								<c:set var="lastPage" scope="session" value="${pageIndex * pageRange + pageRange}" />
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${pageIndex * pageRange + 1}" end="${lastPage}">
							<c:choose>
								<c:when test="${noticeList.number + 1 == i}">
									<li class="page-item active"><a href="#" class="page-link"><c:out value="${i}" /></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a href="?sort=bbsNo,desc&page=${i}" class="page-link"><c:out value="${i}" /></a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${!noticeList.last}">
							<li class="page-item"><a href="?sort=bbsNo,desc&page=${noticeList.number + 1}" class="page-link">&gt;</a></li>
							<li class="page-item"><a href="?sort=bbsNo,desc&page=${noticeList.totalPages - 1}" class="page-link">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
				<!-- 글작성_관리자 -->
				<%
					if (memId != null && memId.equals("admin")) {
				%>
				<div style="position: absolute; right: 3%; top: 0; align-self: center;">
					<a href="/adBoardInsert"><button type="button">글작성</button></a>
				</div>
				<%
					}
				%>
			</div>

			<!-- 이벤트 -->
			<div class="tab-pane fade" id="event">
				<div>
					<table class="table" style="width: 100%; text-align: center;">
						<tr class="thead-dark">
							<th style="width: 10%;">No</th>
							<th style="width: 70%;">제목</th>
							<th style="width: 20%;">종료기간</th>
						</tr>
						<c:forEach items="${eventList.content}" var="evenList">
							<tr>
								<td>${evenList.bbsNo}</td>
								<td><a type="hidden" href="bbsDetail?bbsNo=${evenList.bbsNo}">${evenList.bbsTitle}</a></td>
								<td>${evenList.bbsEnd}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br>

				<!-- Pagination -->
				<div>
					<ul class="pagination justify-center" style="justify-content: center;">
						<c:if test="${!eventList.first}">
							<li class="page-item"><a href="?sort=bbsNo,desc" class="page-link">&laquo;</a></li>
							<li class="page-item"><a href="?sort=bbsNo,desc&page=${eventList.number - 1}" class="page-link">&lt;</a></li>
						</c:if>
						<c:set var="pageRange2" scope="session" value="5" />
						<fmt:parseNumber var="pageIndex2" integerOnly="true" value="${eventList.number div pageRange2}" />
						<c:choose>
							<c:when test="${pageIndex2 * pageRange2 + pageRange2 > eventList.totalPages - 1}">
								<c:set var="lastPage2" scope="session" value="${eventList.totalPages}" />
							</c:when>
							<c:otherwise>
								<c:set var="lastPage2" scope="session" value="${pageIndex2 * pageRange2 + pageRange2}" />
							</c:otherwise>
						</c:choose>
						<c:forEach var="k" begin="${pageIndex2 * pageRange2 + 1}" end="${lastPage2}">
							<c:choose>
								<c:when test="${eventList.number + 1 == k}">
									<li class="page-item active"><a href="#" class="page-link"><c:out value="${k}" /></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a href="?sort=bbsNo,desc&page=${k - 1}" class="page-link"><c:out value="${k}" /></a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${!eventList.last}">
							<li class="page-item"><a href="?sort=bbsNo,desc&page=${eventList.number + 1}" class="page-link">&gt;</a></li>
							<li class="page-item"><a href="?sort=bbsNo,desc&page=${eventList.totalPages - 1}" class="page-link">&raquo;</a></li>
						</c:if>
					</ul>
					<!-- 글작성_관리자 -->
					<%
						if (memId != null && memId.equals("admin")) {
					%>
					<div style="position: absolute; right: 3%; top: 0; align-self: center;">
						<a href="/adBoardInsert"><button type="button">글작성</button></a>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</div>