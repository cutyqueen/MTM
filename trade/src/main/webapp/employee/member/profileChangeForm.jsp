<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- ������ ���� ������ -->
	<!-- ������ ���� �� ��� ��ư Ŭ��,  -->
	<form action="./profileChangeAction.emp" method="post">
		<!-- ���/�̸��� ����, �ּ�, ��ȭ��ȣ ���� ����, ��й�ȣ ���� ���� -->
		<input type="text" readonly name="emp_id" value="${dto.id}">
		<input type="text"  name="name" value="${dto.name}">
		<input type="email" readonly name="email" value="${dto.email}">
		<input type="tel" name="tel" value="${dto.tel}">
		<input type="radio" name="pw_change" value="on">
		<input type="radio" name="pw_change" value="off" checked>
		<input type="submit" value="����">
	</form>
</body>
</html>