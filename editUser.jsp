<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑用户信息</title>
<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/angular.min.js"></script>
<!-- 图标 -->
<link rel="shortcut" href="/favicon.ico" />
<link rel="bookmark" href="/favicon.ico" type="image/x-icon" />

<link rel="stylesheet" type="text/css"
	href="../easyUI/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css" />
<script src="../easyUI/jquery.min.js"></script>
<script src="../easyUI/jquery.easyui.min.js"></script>
<script src="../easyUI/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<div align="center">
		<%
			System.out.println("来到修改界面");
		%>

		<form action="UserServlet" method="post">
			<input type="hidden" name="uid" value="${user.uid }"> 
			<input type="hidden" name="action" value="editUser"> 
				用户名：<input type="text" name="uname" value="${user.uname }"> <br>
			密码：<input type="text" name="upwd" value="${user.upwd }"> <br>
			性别：<input type="text" name="usex" value="${user.usex}"> <br>
			邮箱：<input type="text" name="uemail" value="${user.uemail }"> <br>
			<input type="submit" value="修改">
		</form>

	</div>


</body>
</html>