<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- memberCheck.jsp -->
<jsp:useBean id="mbdao" class="member.MemberDAO" />
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		if (name==null || ssn1==null || ssn2==null || name.trim().equals("") || 
				ssn1.trim().equals("") || ssn2.trim().equals("")){
			response.sendRedirect("memberSsn.jsp");
			return;
		}
		
		boolean isMember = mbdao.isMember(name, ssn1, ssn2);
		if (isMember){%>
		<script type="text/javascript">
			alert("�̹� ȸ���̽ʴϴ�. �α����� �� �ּ���!!")
			self.close()
		</script>	
<%	}else {%>
		<form name="f" action="member_input.jsp" method="post">
			<input type="hidden" name="name" value="<%=name%>"/>	
			<input type="hidden" name="ssn1" value="<%=ssn1%>"/>	
			<input type="hidden" name="ssn2" value="<%=ssn2%>"/>	
			
		</form>
		<script type="text/javascript">
			alert("ȸ�������������� �̵��մϴ�.")
			document.f.submit()
		</script>	
<%	}%>

