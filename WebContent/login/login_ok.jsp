<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="login.*, member.*"%>
<!-- login_ok.jsp -->
<jsp:useBean id="loginCheck" class="login.LoginCheck"/>
<jsp:setProperty property="*" name="loginCheck"/>
<jsp:useBean id="mbdao" class="member.MemberDAO"/>

<%
		if (loginCheck.getId() == null || loginCheck.getId().trim().equals("")){
			response.sendRedirect("login.jsp");
			return;
		}
		String saveId = request.getParameter("saveId");
		String dbPwd = mbdao.loginCheck(loginCheck.getId());
		int res = loginCheck.loginCheck(dbPwd);
		String msg = null;
		String url = "login.jsp";
		switch(res){
		case LoginCheck.OK :
				Cookie ck = new Cookie("saveId", loginCheck.getId());
				if (saveId == null){
					ck.setMaxAge(0);
				}else {
					ck.setMaxAge(12*60*60);
				}
				response.addCookie(ck);
				MemberDTO dto = mbdao.getMember(loginCheck.getId());
				session.setAttribute("mbId", loginCheck.getId());
				session.setAttribute("getMember", dto);
				msg = "로그인 되었습니다.";
				url = request.getContextPath()+"/main.jsp";
				break;
		case LoginCheck.NOT_ID :
				msg = "없는 아이디 입니다. 다시 확인해 주시고 로그인 해 주세요!!";
				break;
		case LoginCheck.NOT_PW :
				msg = "비밀번호가 틀렸습니다. 다시 확인해 주시고 로그인 해 주세요!!";
				break;
		case LoginCheck.ERROR :
				msg = "DB 오류 발생!! 관리자에게 문의해 주세요";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>







