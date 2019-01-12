<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>管理员界面</title>
<!--
        	作者：wangxiang2284@126.com
        	时间：2019-01-01
        	描述：easyUI必要引用文件！
        -->
<link rel="stylesheet" type="text/css"
	href="easyUI/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css" />
<script src="easyUI/jquery.min.js"></script>
<script src="easyUI/jquery.easyui.min.js"></script>
<script src="easyUI/locale/easyui-lang-zh_CN.js"></script>

<style>
#divTop {
	position: relative;
	/*定义容器定位方式为相对定位*/
	height: 80px;
	/*background: url(../img/firstpicture.jpg);*/
}

#divTop #divTopMenu {
	/*选择器为快捷导航容器*/
	position: absolute;
	/*定位方式为绝对定位*/
	left: 500px;
	top: 20px;
}

#divTopMenu ul {
	/*清除无序列表默认样式*/
	margin: 0;
	padding: 0;
	list-style: none;
}

#divTopMenu li, #divTopMenu li a {
	display: inline-block;
	padding: 10px;
	font: bold 15px "微软雅黑";
	color: #FF0000;
	text-decoration: none;
}
</style>

<script>
	function addTab(title, url) {
		if ($('#main').tabs('exists', title)) {
			$('#main').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto"   frameborder="0"  src=" '
					+ url
					+ ' " style="width:100%;weight:400px;"  onload="adaptiveHeight(this)"></frame>';
			$('#main').tabs('add', {
				title : title,
				content : content,
				closable : true,
				iconCls : "icon-page_white_text"
			});
		}
	}

	function adaptiveHeight(obj) {
		var mainheight = $(obj).contents().find("body").height() + 250;
		$(obj).height(mainheight);
	}
</script>

</head>

<body class="easyui-layout" id="divLayout">

	<div data-options="region: 'north' " id="divTop"
		class="col-lg-12  col-md-12">
		<div class="col-lg-4 col-md-4">
			<img src="img/weblogo.jpg" alt="这是网站logo" width="400" heigh="40" />
		</div>
		<div class="col-lg-4 col-md-4"></div>
		<div id="divTopMenu" align="right" class="col-lg-4 col-md-4">
			<ul>
				<li>欢迎您，超级管理员:${mamagename}</li>
				<li><a href="default.jsp">前台首页</a></li>
				<li><a href="admin/change_password.jsp">修改密码</a></li>
				<li><a href="/bravewang/ManageServlet?action=managelogout">退出管理</a></li>
			</ul>
		</div>
	</div>

	<div data-options="region:'west',split:true" title="导航菜单"
		style="width: 270px;">
		<!--
			<ul class="easyui-tree" data-options="url:'../data/tree_data.json',method:'get' ,animate:true,lines:true"></ul>
			-->
		<ul class="easyui-tree">
			<li><span>常用功能</span>
				<ul>
					<li><span><a href="#"
							onclick="addTab('栏目管理','admin/tabManage.jsp')">栏目管理</a></span></li>
					<li><span><a href="#"
							onclick="addTab('产品管理','UserServlet?action=schProduct&currPage=1')">产品管理</a></span></li>
					<li><span><a href="#"
							onclick="addTab('用户管理','UserServlet?action=schUser&currPage=1')">用户管理</a></span></li>
					<!-- href="UserServlet?action=schUser&currPage=1"-->
					<li><span><a href="#"
							onclick="addTab('评论管理','UserServlet?action=schComment&currPage=1')">评论管理</a></span></li>
					<li><span><a href="#"
							onclick="addTab('数据统计','admin/chart.jsp')">数据统计</a></span></li>
				</ul></li>
			<li><span>系统工具</span>
				<ul>
					<li><span><a href="admin/Is_developing.jsp">网站设置</a></span></li>
					<li><span><a href="admin/Is_developing.jsp">查看日志</a></span></li>
					<li><span><a href="admin/Is_developing.jsp">数据备份</a></span></li>
					<li><span><a href="#"
							onclick="addTab('数据统计','admin/chart/samples/chart.html')">数据统计</a></span></li>
				</ul></li>
		</ul>
		<!--
				折叠面板
			<div class="easyui-panel" title="一个测试" collapsible="true" style="width: 240px;height: auto;padding: 10px;">
				<ul>
					<li><span><a href="#">one</a></span></li>
					<li><span><a href="#">one</a></span></li>
				</ul>
			</div>
			-->
	</div>
	<div data-options="region:'center',border:false">
		<div id="main" class="easyui-tabs" style="width: 100%; height: 400px;"
			data-options="fit:true">
			<div title="后台管理首页" iconCls="icon-page_white_text">
				<iframe scrolling="auto" frameborder="0" src="admin/welcome.jsp"
					style="width: 100%;" onload="adaptiveHeight(this)"></iframe>
			</div>
		</div>
	</div>
</body>

</html>