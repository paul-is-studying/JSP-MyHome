<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>jsp홈페이지</title>
	<script type="text/javascript">
		function member(){
			window.open("<%=request.getContextPath()%>/member/memberSsn.jsp", "member", "width=650, height=400")
		}
	</script>
</head>
<%
		boolean isLogin = false;
		String mbId = (String)session.getAttribute("mbId");
		if (mbId != null) {
			isLogin = true;
		}
%>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>J S P 홈페이지</h2>
		<hr color="green" width="300">
		<table border="1" width="800" height="550">
			<tr height="10%">
				<td colspan="2" align="center">
					<a href="<%=request.getContextPath()%>/main.jsp">home</a> | 
					<a href="javascript:member()">회원가입</a> | 
<%		if (isLogin){ %>
					<a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a> |
<%		}else { %>					
					<a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a> |
<%		} %>					 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp">회원보기</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">회원찾기</a> | 
					<a href="<%=request.getContextPath()%>/board/list.jsp">게시판</a></td>
			</tr>
			<tr>
				<td width="20%">여기엔 서브메뉴</td>
				<td width="80%">
				
				
				
				
				