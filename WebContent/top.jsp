<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>jspȨ������</title>
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
		<h2>J S P Ȩ������</h2>
		<hr color="green" width="300">
		<table border="1" width="800" height="550">
			<tr height="10%">
				<td colspan="2" align="center">
					<a href="<%=request.getContextPath()%>/main.jsp">home</a> | 
					<a href="javascript:member()">ȸ������</a> | 
<%		if (isLogin){ %>
					<a href="<%=request.getContextPath()%>/login/logout.jsp">�α׾ƿ�</a> |
<%		}else { %>					
					<a href="<%=request.getContextPath()%>/login/login.jsp">�α���</a> |
<%		} %>					 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp">ȸ������</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">ȸ��ã��</a> | 
					<a href="<%=request.getContextPath()%>/board/list.jsp">�Խ���</a></td>
			</tr>
			<tr>
				<td width="20%">���⿣ ����޴�</td>
				<td width="80%">
				
				
				
				
				