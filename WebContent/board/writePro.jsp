<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writePro.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bdto" class="board.BoardDBBean" />
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="board.BoardDataBean" />
<%
		if (bdto.getWriter() == null || bdto.getWriter().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		bdto.setIp(request.getRemoteAddr());//사용자 ip주소 가져오기
		int res = bdao.insertBoard(bdto);
		String msg = null, url = null;
		if (res>0){
			msg = "게시글 등록 성공!! 게시글 목록페이지로 이동합니다.";
			url = "list.jsp";
		}else {
			msg = "게시글 등록 실패!! 게시글 등록페이지로 이동합니다.";
			url = "writeForm.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>







