<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询到的用户</title>

<link rel="stylesheet" type="text/css"
	href="../easyUI/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css" />
<script src="../easyUI/jquery.min.js"></script>
<script src="../easyUI/jquery.easyui.min.js"></script>
<script src="../easyUI/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	function delUser(uid) {
		if (confirm("确定删除吗？")) {
			window.location.href = "/bravewang/UserServlet?action=delUser&uid="
					+ uid;
		}
	}
	function datadel() {
		if (confirm("确定删除选中数据吗？")) {
			document.forms[1].submit();
		}
	}
</script>
<script>
	$(function() {
		$('#userList').datagrid({
			title : '用户列表',
			url : '../UserServlet?action=showAllUser',//显示所有用户信息
			method : 'get',
			pagination : true,
			rownumbers : true,
			idField : 'uid',
			toolbar : "#userTool", //actrcleTool必须与自定义工具栏容器id值一致
			columns : [ [ {
				field : 'ck',
				checkbox : 'true'
			}, //设置复选框，方便批量设置
			{
				field : 'uid',
				title : 'ID',
				sortable : true
			}, {
				field : 'uname',
				title : '用户名',
				sortable : true
			}, {
				field : 'upwd',
				title : '用户密码',
				sortable : true
			}, {
				field : 'usex',
				title : '用户性别',
				sortable : true
			}, {
				field : 'uemail',
				title : '用户邮箱',
				sortable : true
			}, {
				field : 'opt',
				title : '操作'
			} ] ]
		});
		var pager = $('#userList').datagrid('getPager');
		pager.pagination({
			pageSize : 10,
			pageList : [ 5, 10, 15 ]
		});

	})
</script>
</head>
<body>
	<div class="usermanage ">
		<form action="UserServlet" method="POST">
			<input type="hidden" name="action" value="">
			<table id="userList" class="easyui-datagrid">
			</table>

			<div id="userTool" style="padding: 8px 0;">
				<a href="/bravewang/UserServlet?action=addUser"
					class="easyui-linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">删除用户</a>
					 <a title="编辑" href="/bravewang/UserServlet?action=initEditUser&uid=${u.uid }"
					style="text-decoration: none" class="easyui-linkbutton"
					data-options="iconCls:'icon-edit',plain:true">编辑 </a> <a title="修改密码"
					style="text-decoration: none"
					href="/bravewang/UserServlet?action=initEditUserpwd&uid=${u.uid }"
					class="easyui-linkbutton"
					data-options="iconCls:'icon-lock',plain:true"></a>
			</div>
		</form>
	</div>

</body>
</html>