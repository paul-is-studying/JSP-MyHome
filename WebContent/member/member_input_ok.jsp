<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_input_ok.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdao" class="member.MemberDAO" />
<jsp:useBean id="mbdto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="mbdto"/>
<!-- 	mbdto.setName(request.getParameter("name"));
		mbdto.setId(request.getParameter("id"));
 -->
 <%
 		int res = mbdao.insertMember(mbdto);
 		if (res>0){ %>
 		<script type="text/javascript">
 			alert("ȸ������ ����!!")
 			self.close()
 		</script>
<%	}else { %>
		<script type="text/javascript">
 			alert("ȸ������ ����!! �ٽ� �Է��� �ּ���")
 			location.href="memberSsn.jsp"
 		</script>
<%	} %> 		
 