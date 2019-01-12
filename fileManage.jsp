<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>文件管理</title>
		<link rel="stylesheet" type="text/css" href="../easyUI/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css" />
		<script src="../easyUI/jquery.min.js"></script>
		<script src="../easyUI/jquery.easyui.min.js"></script>
		<script src="../easyUI/locale/easyui-lang-zh_CN.js"></script>
	</head>

	<body>
		<div class="easyui-layout" style="width: 100%;height: 400px;">
			<div region="west" split="true" title="文件所属栏目" style="width: 200px;">
				<ul class="easyui-tree" data-options="url:'../data/tab_treegrid_data.json',method:'get',animate:true,lines:true"></ul>
			</div>
			<div region="center" title="文件列表">
				<table id="fileList" class="easyui-datagrid"></table>
				<script>
					$(function() {
						//设置easyui数据表格属性
						$('#fileList').datagrid({
							url: '../data/fileList.json', //设置数据源
							method: 'get', //设置数据表格请求远程数据的方法类型
							pagination: true, //设置数据表格是否显示分页
							rownumbers: true, //设置数据表格是否显示行号
							idField: 'fId', //设置数据表格唯一列字段
							toolbar: "#fileTool", //设置数据表格自定义工具栏
							fit: true, //设置数据表格大小是否自适应父容器
							//设置数据表格列字段
							columns: [
								[{
										field: 'ck',
										checkbox: 'true'
									}, //设置复选框
									{
										field: 'fId',
										title: 'ID',
										sortabld: true
									},
									{
										field: 'fName',
										title: '文件名',
										sortabld: true
									},
									{
										field: 'fSize',
										title: '文件大小',
										sortabld: true
									},
									{
										field: 'fType',
										title: '文件类型',
										sortabld: true
									},
									{
										field: 'fUpDate',
										title: '上传时间',
										sortabld: true
									},
									{
										field: 'aTitle',
										title: '所属文章标题',
										sortabld: true
									},
									{
										field: 'tabs',
										title: '所属栏目',
										sortabld: true
									},
									{
										field: 'opt',
										title: '操作'
									}
								]
							]
						})
						//得到easyui数据表格分页控件
						var pager = $('#articleList').datagrid('getPager');
						//设置分页属性
						pager.pagination({
							pageSize: 10,
							pageList: [5, 10, 15],
						});
					})
				</script>
			</div>
		</div>



		<div id="fileTool" style="padding: 8px 0;">
			<a id="aDelFile" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">批量删除文件</a>
			<div style="display: inline-block; padding-left:20px ; border-left: 1px solid #CCCACC;">
				<label>搜索：</label>
				<input type="text" class="easyui-searchbox" style="width: 300px;" data-options="prompt:'请输入要搜索的文件的名称',menu:'#tabList',searcher:doSearch" />
			</div>
		</div>
		

		<div id="tabList">
			<div data-options="name:'allType'">所有类型</div>
			<div data-options="name:'picType'">图片</div>
			<div data-options="name:'docType'">doc文档</div>
		</div>
		<script>
			function doSearch(value, name) { /*搜索框执行代码*/ }
			$(function() {
				$("#aDelFile").click(function() {
					var ids = [];
					var rows = $('#fileList').datagrid('getSelections');
					for(var i = 0; i < rows.length; i++) {
						ids.push(rows[i].fName);
					}
					$.messager.confirm("操作提示", "您确定要删除文件名为【" + ids.join('\t') + "】的文件吗？", function(cdata) {
						if(cdata) {
							/*点击确定之后执行的代码*/
						} else {
							//另外部分代码
						}
					});
				})
			})
		</script>

	</body>

</html>