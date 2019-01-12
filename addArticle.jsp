<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>增加文章</title>

<link rel="stylesheet" type="text/css"
	href="../easyUI/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css" />
<script src="../easyUI/jquery.min.js"></script>
<script src="../easyUI/jquery.easyui.min.js"></script>
<script src="../easyUI/locale/easyui-lang-zh_CN.js"></script>
<script src="js/test.js"></script>

<style type="text/css">
.easyui-accordion ul {
	list-style-type: none;
	margin: 0px;
	padding: 10px;
}

.easyui-accordion ul li {
	padding: 0px;
}

.easyui-accordion ul li a {
	line-height: 24px;
}

.easyui-accordion ul li div {
	margin: 2px 0px;
	padding-left: 10px;
	padding-top: 2px;
}

.easyui-accordion ul li div.hover {
	border: 1px dashed #99BBE8;
	background: #E0ECFF;
	cursor: pointer;
}

.easyui-accordion ul li div.hover a {
	color: #416AA3;
}

.easyui-accordion ul li div.selected {
	border: 1px solid #99BBE8;
	background: #E0ECFF;
	cursor: default;
}

.easyui-accordion ul li div.selected a {
	color: #416AA3;
	font-weight: bold;
}
</style>
</head>

<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
	<div region="center"
		style="width: 500px; height: 400px; padding: 1px; background: #eee; overflow-y: hidden">
		<div id="grid" fit="true"></div>
	</div>
	<div id="eidt-window" title="编辑窗口" style="width: 350px; height: 200px;">
		<div style="padding: 20px 20px 40px 80px;">
			<form action="UserServlet" method="post">
				<input type="hidden" name="action" value="editUser">
				<table>
					<tr>
						<td>名称：</td>
						<td><input name="title" style="width: 150px;" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div style="text-align: center; padding: 5px;">
			<a href="#" onclick="saveData()" id="btn-save" icon="icon-save">保存</a>
			<a href="#" onclick="closeWindow()" id="btn-cancel"
				icon="icon-cancel"> 取消</a>
		</div>
	</div>
	<div id="search-window" title="查询窗口"
		style="width: 350px; height: 200px;">
		<div style="padding: 20px 20px 40px 80px;">
			<form method="post">
				<table>
					<tr>
						<td>名称：</td>
						<td><input name="s_title" id="s_title" style="width: 150px;" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div style="text-align: center; padding: 5px;">
			<a href="#" onclick="SearchOK()" id="btn-search" icon="icon-ok">确定</a>
			<a href="#" onclick="closeSearchWindow()" id="btn-search-cancel"
				icon="icon-cancel"> 取消</a>
		</div>
	</div>

</body>

</html>