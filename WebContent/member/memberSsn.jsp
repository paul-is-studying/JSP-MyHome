<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- memberSsn.jsp -->
<html>
<head>	
	<title>�������</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>ȸ �� �� �� �� ��</h2>
		<hr color="green" width="300">
		<form name="f" action="memberCheck.jsp" method="post">
			<table border="1" width="500">
				<tr>
					<th>�̸�</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>�ֹι�ȣ</th>
					<td><input type="text" name="ssn1">
							- <input type="password" name="ssn2">		
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="Ȯ��">
						<input type="reset" value="���">
					</td>
				</tr>
			</table>
		</form>
		
	</div>
</body>
</html>