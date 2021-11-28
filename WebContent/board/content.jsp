<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.*"%>
<!-- content.jsp -->
<%@ include file="../top.jsp"%>
<jsp:useBean id="bdao" class="board.BoardDataBean" />
<%
		if (!isLogin){%>
			<script type="text/javascript">
				alert("로그인을 하셔야만 볼 수 있는 페이지 입니다.")
				location.href="list.jsp"
			</script>		
<%		return;
		}
		String num = request.getParameter("num");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		  
		BoardDBBean dto = bdao.getBoard(Integer.parseInt(num), "content");
%>
<div align="center">
	<b>글내용 보기</b>
	<table border="1" width="600">
		<tr>
			<th bgcolor="yellow" width="20%">글번호</th>
			<td align="center" width="30%"><%=dto.getNum()%></td>
			<th bgcolor="yellow" width="20%">조회수</th>
			<td align="center" width="30%"><%=dto.getReadcount()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">작성자</th>
			<td align="center" width="30%"><%=dto.getWriter()%></td>
			<th bgcolor="yellow" width="20%">작성일</th>
			<td align="center" width="30%"><%=dto.getReg_date()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">글제목</th>
			<td width="80%" colspan="3">
				<%=dto.getSubject()%>
			</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">글내용</th>
			<td width="80%" colspan="3">
				<%=dto.getContent()%>
			</td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
				<input type="button" value="글수정"
									onclick="window.location='updateForm.jsp?num=<%=dto.getNum()%>'">
				<input type="button" value="글삭제"
									onclick="window.location='deleteForm.jsp?num=<%=dto.getNum()%>'">
				<input type="button" value="글목록" 
									onclick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp"%>









