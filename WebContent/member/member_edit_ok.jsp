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
			alert("회원수정 성공하였습니다. 회원목록페이지로 이동합니다.")
			location.href="memberAll.jsp"
		</script>
<%	}else { %>
		<script type="text/javascript">
			alert("회원수정 실패 하였습니다. 회원목록페이지로 이동합니다.")
			location.href="memberAll.jsp"
		</script>
<%	} %>	



