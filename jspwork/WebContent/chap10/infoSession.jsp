<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
	<h3>[세션 정보를 얻어오는 메소드를 사용한 예제]</h3>
	</center>
	<hr>
	<%
	 	String id_str = session.getId();
		long lasttime = session.getLastAccessedTime();
		long createdtime = session.getCreationTime();
		long time_used = (lasttime - createdtime) / 60000; //lasttime - createdtime은 서버에 세션이 머문 시간
		int inactive = session.getMaxInactiveInterval() / 60;
		boolean b_new = session.isNew();
	%>
		[1] 세션 ID는 [<%= id_str %>]입니다.<br><hr>
		[2] 당신이 웹 사이트에 머문 시간은<%= time_used %>분 입니다.<br><hr>
		[3] 세션의 유효 시간은 <%= inactive %>분 입니다.<br><hr>
		[4] 세션이 새로 만들어 졌나요???<br><hr>
		
		<%
			if(b_new){
				out.println("예!! 새로운 세션을 만들었습니다.");
			}else{
				out.println("아니오!! 새로운 세션을 만들지 않았습니다.");
			}
		%>
		
</body>
</html>