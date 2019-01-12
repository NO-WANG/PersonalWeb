<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>产品管理</title>

<link rel="stylesheet" type="text/css"
	href="../easyUI/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css" />
<script src="../easyUI/jquery.min.js"></script>
<script src="../easyUI/jquery.easyui.min.js"></script>
<script src="../easyUI/locale/easyui-lang-zh_CN.js"></script>

<script>
	$(function() {
		$('#productList').datagrid({
			title : '产品列表',
			url : '../UserServlet?action=showAllProduct',//显示所有用户信息
			method : 'get',
			pagination : true,
			rownumbers : true,
			idField : 'pid',
			toolbar : "#productTool", //actrcleTool必须与自定义工具栏容器id值一致
			columns : [ [ {
				field : 'ck',
				checkbox : 'true'
			}, //设置复选框，方便批量设置
			{
				field : 'pid',
				title : '产品ID'
			}, {
				field : 'pname',
				title : '产品名'
			}, {
				field : 'price',
				title : '价格'
			}, {
				field : 'pnum',
				title : '数量'
			} ] ]
		});
		var pager = $('#productList').datagrid('getPager');
		pager.pagination({
			pageSize : 10,
			pageList : [ 5, 10, 15 ]
		});

	})
</script>

<script>
	function addArticle(title, url) {
		var jq = top.jQuery; //获取父框架
		if (jq("#main").tabs('exists', title)) {
			jq("#main").tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src = "'
					+ url
					+ '" style="width:100%;" onload = "adaptiveHeight(this)"></iframe>';
			jq("#main").tabs('add', {
				title : title,
				content : content,
				closable : true,
				iconCls : "icon-page_white_text"
			});
		}
	}
</script>

</head>

<body>

	<form action="UserServlet" method="POST">

		<table id="productList" class="easyui-datagrid"></table>

		<div id="productTool" style="padding: 8px 0;">
			<a id="addProduct" style="text-decoration: none"
				href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true">增加产品</a> <a
				id="delProduct" href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-ok',plain:true">删除产品</a>
			<div
				style="display: inline-block; padding-left: 30px; border-left: 1px solid #CCCACC;">
				<label>搜索：</label> <input type="text" class="easyui-searchbox"
					style="width: 300px;" data-options="prompt:'请输入要搜索的文章标题'">
			</div>
		</div>
	</form>

</body>

</html>