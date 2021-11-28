<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- updatePro.jsp -->
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

		int res = bdao.updateBoard(bdto);
		String msg = null, url = null;
		if (res>0){  
			msg = "�ۼ��� ����!! �۸���������� �̵��մϴ�.";
			url = "list.jsp";
		}else if (res<0){
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���!!";
			url = "updateForm.jsp?num=" + bdto.getNum();
		}else {
			msg = "�ۼ��� ����!! �ۻ󼼺��� �������� �̵��մϴ�.";
			url = "content.jsp?num=" + bdto.getNum();
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>




