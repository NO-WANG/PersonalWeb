<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改产品信息界面</title>
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
			<input type="hidden" name="pid" value="${product.pid }"> <input
				type="hidden" name="action" value="editProduct">
				 产品名：<input
				type="text" name="pname" value="${product.pname }"> <br>
			价格：<input type="text" name="price" value="${product.price }">
			<br> 数量：<input type="text" name="pnum" value="${product.pnum}">
			<br> <input type="submit" value="修改">
		</form>

	</div>


</body>
</html>