<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.*"%>
<!-- content.jsp -->
<%@ include file="../top.jsp"%>
<jsp:useBean id="bdao" class="board.BoardDataBean" />
<%
		if (!isLogin){%>
			<script type="text/javascript">
				alert("�α����� �ϼž߸� �� �� �ִ� ������ �Դϴ�.")
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
	<b>�۳��� ����</b>
	<table border="1" width="600">
		<tr>
			<th bgcolor="yellow" width="20%">�۹�ȣ</th>
			<td align="center" width="30%"><%=dto.getNum()%></td>
			<th bgcolor="yellow" width="20%">��ȸ��</th>
			<td align="center" width="30%"><%=dto.getReadcount()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td align="center" width="30%"><%=dto.getWriter()%></td>
			<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td align="center" width="30%"><%=dto.getReg_date()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">������</th>
			<td width="80%" colspan="3">
				<%=dto.getSubject()%>
			</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�۳���</th>
			<td width="80%" colspan="3">
				<%=dto.getContent()%>
			</td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
				<input type="button" value="�ۼ���"
									onclick="window.location='updateForm.jsp?num=<%=dto.getNum()%>'">
				<input type="button" value="�ۻ���"
									onclick="window.location='deleteForm.jsp?num=<%=dto.getNum()%>'">
				<input type="button" value="�۸��" 
									onclick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp"%>









