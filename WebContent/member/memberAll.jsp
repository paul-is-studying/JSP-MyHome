<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, member.*"%>
<!-- memberAll.jsp -->
<jsp:useBean id="mbdao" class="member.MemberDAO" />
<%@ include file="../top.jsp"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String mode = request.getParameter("mode");
		if (mode == null || mode.trim().equals("")){
			mode = "all";
		}
%>
<div align="center">
	<hr color="green" width="300">
<%	if(mode.equals("all")){ %>	
	<h2>회 원 목 록 보 기</h2>
<%	}else { %>
	<h2>회 원 찾 기</h2>
	<form name="f" method="post">
		<select name="search">
			<option value="name">회원명</option>
			<option value="id">아이디</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="찾기">
	</form>
	<jsp:setProperty property="*" name="mbdao"/>
<%	} %>	
	<hr color="green" width="300">
	<table border="1" width="100%">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>가입일</th>
			<th>수정|삭제</th>
		</tr>
<%	List<MemberDTO> list = null;
		if (mode.equals("all")) list = mbdao.listMember();
		else list = mbdao.findMember();
		if (list == null || list.size()==0){%>
		<tr>
			<td colspan="7">등록된 회원이 없습니다.</td>
		</tr>
<%	} else {
			for(MemberDTO dto : list){%>
		<tr>
			<td><%=dto.getNo()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getAllHp()%></td>
			<td><%=dto.getJoindate()%></td>
			<td>
			<a href="member_edit.jsp?no=<%=dto.getNo()%>">수정</a> | 
			<a href="member_delete.jsp?no=<%=dto.getNo()%>">삭제</a></td>
		</tr>	
<%		}
		}%>							
	</table>
</div>
<%@ include file="../bottom.jsp"%>






