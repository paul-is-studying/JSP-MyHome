<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_edit_ok.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdao" class="member.MemberDAO"/>
<jsp:useBean id="mbdto" class="member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto"/>
<%
		int res = mbdao.editMember(mbdto);
		if (res>0){%>
		<script type="text/javascript">
			alert("ȸ������ �����Ͽ����ϴ�. ȸ������������� �̵��մϴ�.")
			location.href="memberAll.jsp"
		</script>
<%	}else { %>
		<script type="text/javascript">
			alert("ȸ������ ���� �Ͽ����ϴ�. ȸ������������� �̵��մϴ�.")
			location.href="memberAll.jsp"
		</script>
<%	} %>	



