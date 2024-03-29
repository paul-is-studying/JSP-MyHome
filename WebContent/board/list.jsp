<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, board.*"%>
<!-- list.jsp -->
<%@ include file="../top.jsp"%>
<jsp:useBean id="bdao" class="board.BoardDataBean" />
<div align="center">
	<b>글목록</b>
<%	if (isLogin){ %>	
	<table border="0" width="100%">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm.jsp">글쓰기</a></td>
		</tr>
	</table>
<%	} %>	
	<table border="1" width="100%">
		<tr bgcolor="green">
			<th>번호</th>
			<th width="30%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
		</tr>
<%
		List<BoardDBBean> list = bdao.listBoard();		 
		if (list == null && list.size()==0){%>
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>		
<%	}else {
			for(BoardDBBean dto : list){%>
		<tr>
			<td><%=dto.getNum()%></td>
			<td>
				<a href="content.jsp?num=<%=dto.getNum()%>">
					<%=dto.getSubject()%>
				</a>
			</td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getReg_date()%></td>
			<td><%=dto.getReadcount()%></td>
			<td><%=dto.getIp()%></td>
		</tr>		
<%		}
		}%>
	</table>
</div>
<%@ include file="../bottom.jsp" %>
