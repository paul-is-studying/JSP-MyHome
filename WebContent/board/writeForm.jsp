<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="member.*"%>
<!-- writeForm.jsp -->
<%@ include file="../top.jsp"%>
<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert("�̸��� �Է��� �ּ���!!")
			f.writer.focus()
			return false
		}
		if (f.subject.value==""){
			alert("������ �Է��� �ּ���!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("������ �Է��� �ּ���!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("��й�ȣ�� �Է��� �ּ���!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<%
		MemberDTO dto = (MemberDTO)session.getAttribute("getMember");
		if (dto == null){
			response.sendRedirect("list.jsp");
			return;
		}
%>
<div align="center">
	<form name="f" action="writePro.jsp" method="post" 
													onsubmit="return check()">
	<table border="1" width="500">
		<tr bgcolor="yellow">
			<td align="center" colspan="2">�� �� ��</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�� ��</th>
			<td><input type="text" name="writer" 
						value="<%=dto.getName()%>" readOnly></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�� ��</th>
			<td><input type="text" name="subject" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">Email</th>
			<td><input type="text" name="email" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�� ��</th>
			<td><textarea rows="11" cols="50" name="content"></textarea></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">��й�ȣ</th>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="�۾���">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="��Ϻ���" 
									onclick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>





