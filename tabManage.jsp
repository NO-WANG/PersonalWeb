<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>栏目管理</title>

<link rel="stylesheet" type="text/css"
	href="../easyUI/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css" />
<script src="../easyUI/jquery.min.js"></script>
<script src="../easyUI/jquery.easyui.min.js"></script>
<script src="../easyUI/locale/easyui-lang-zh_CN.js"></script>

<script>
	$(function() {
		$(document).bind('contextmenu', function(e) {
			e.preventDefault();
			$('#rMenu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		});
	});
</script>

<script type="text/javascript">
	var editingId;

	function edit() {
		/*编辑栏目*/
		if (editingId != undefined) {
			$('#tabTreegrid').treegrid('select', editingId);
			return;
		}
		var row = $('#tebTreegrid').treegrid('getSelected');
		if (row) {
			editingId = row.id
			$('#tebTreegrid').treegrid('beginEdit', editingId);
		}
	}

	function save() { /*保存编辑*/
		if (editingId != undefined) {
			var t = $('#tebTreegrid');
			t.treegrid('endEdit', editingId);
			editingId = undefined;
			var persons = 0;
			var rows = t.treegrid('getChildren');
			for (var i = 0; i < rows.length; i++) {
				var p = parseInt(rows[i].persons);
				if (!isNaN(p)) {
					persons += p;
				}
			}
			var frow = t.treegrid('getFooterRows')[0];
			frow.persons = persons;
			t.treegrid('reloadFooter');

		}
	}

	function cancel() {
		/*取消编辑*/
		if (editingId != undefined) {
			$('#tabTreegrid').treegrid('cancelEdit', editingId);
			editingId = undefined;
		}
	}
</script>

<style>
#addTabWindow {
	position: relative;
	width: 400px;
	height: 250px;
	padding-top: 10px;
}

#addTabWindow label {
	display: inline-block;
	width: 90px;
	text-align: right;
	margin-right: 20px;
}

#addTabWindow input[type="text"] {
	width: 200px;
}

#addTabWindow .divfoot {
	background: #F3F3F3;
	height: 50px;
	text-align: center;
	position: absolute;
	width: 100%;
	bottom: 0;
	padding-top: 10px;
	border-top: 1px solid #95B8E7;
}

.divfoot a {
	width: 100px;
}
</style>

<script>
	$(function() {
		$("#aDel").click(function() {
			$.messager.confirm("操作提示", "您确定要执行操作吗？", function(cdata) {
				if (cdata) {/*点击“确定”按钮要执行的代码*/
				} else {
					/*点击“取消”按钮要执行的代码*/
				}
			})
		})
	})
</script>

</head>

<body>
	<div style="padding: 10px; margin: 10px 0; width: 100%;"
		class="easyui-panel">
		<a id="test" href="#" class="easyui-linkbutton" iconCls="icon-add"
			onclick="$('#addTabWindow').window('open')">新增栏目</a>
		<script>
			$(function() {
				$("#test")
						.click(
								function() {
									var options = {
										title : "消息提示",
										msg : "<a href='#'>站内短消息一</a><br><a href='#'>站内短消息二</a><br>",
										showType : 'slide',
										timeout : 5000
									};
									$.messager.show(options);
								})
			});
		</script>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" onclick="edit()">编辑栏目</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-save" onclick="save()">保存编辑</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-undo" onclick="cancel()">取消编辑</a> <a id="aDel"
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel">删除栏目</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-map_clipboard">合并栏目</a>
	</div>

	<div id="addTabWindow" class="easyui-window" title="新增栏目"
		data-options="iconCls:'icon-add',closed:true,inline:true">
		<form id="frmAddTab" method="post">
			<p>
				<label>父栏目</label> <input type="text" class="easyui-combotree"
					data-options="url:'../data/tab_treegrid_data.json',method:'get'">
			</p>
			<p>
				<label> 栏目名称</label> <input type="text" class="easyui-textbox" />
			</p>
			<p>
				<label> 栏目链接</label> <input type="text" class="easyui-textbox" />
			</p>
			<p>
				<label> 是否可用 </label> <input type="radio" name="ruse" />是 <input
					type="radio" name="ruse" />否
			</p>
			<div class="divfoot">
				<a href="#" class="easyui-linkbutton">提交</a>
			</div>
		</form>
	</div>

	<div id="rMenu" class="easyui-menu" style="width: 120px;">
		<div data-options="iconCls:'icon-add'">新增栏目</div>
		<div class="menu-sep"></div>
		<div data-options="iconCls:'icon-edit'">
			<a href="javascript:void(0)" onclick="edit()">编辑栏目</a>
		</div>
		<div class="menu-sep"></div>
		<div data-options="iconCls:'icon-cancle'">删除栏目</div>
		<div class="menu-sep"></div>
		<div data-options="iconCls:'icon-map_clipboard'">合并栏目</div>
	</div>
	<!--
        	作者：wangxiang2284@126.com
        	时间：2019-01-01
        	描述：新增和编辑功能都还无法操作和实现，虽然按照书上的方法完成了。
        	在这之后需要花时间去进行处理
        -->

	<table id="tg" title="网站栏目列表" class="easyui-treegrid"
		style="width: 100%; height: 400px;"
		data-options="url:'../data/tab_treegrid_data.json', method: 'get' , rownumbers:true, idField:'id' , treeField:'text' ">
				<!-- 在这里 无法更新json中的栏目数据-->
		<thead>
			<tr>
				<!--
			editor:'text'
		-->
				<th data-options="field: 'text' , width: 140">名称</th>
				<th data-options="field: 'url' , width:140">链接</th>
				<th data-options="field: 'status' , width:140">状态</th>
			</tr>
		</thead>
	</table>

</body>

</html>