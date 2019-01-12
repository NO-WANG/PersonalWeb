<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>
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
<link rel="stylesheet" type="text/css" href="css/list-group-item.css" />
<link rel="stylesheet" type="text/css" href="css/img-thumbnail.css" />
<link rel="stylesheet" type="text/css" href="css/carousel-caption.css" />
<link rel="stylesheet" type="text/css" href="css/divChannelLink.css" />
<link rel="stylesheet" type="text/css" href="css/userRegisterInput.css" />
<link rel="stylesheet" type="text/css" href="css/divFooter.css" />
<script src="js/dropdownopen.js"></script>

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
	/*用户-删除*/
	function member_del(obj, id) {
		layer.confirm('确认要删除吗？', function(index) {
			$.ajax({
				type : 'POST',
				url : 'UserServlet?action=initEditUser',
				dataType : 'json',
				success : function(data) {
					$(obj).parents("tr").remove();
					layer.msg('已删除!', {
						icon : 1,
						time : 1000
					});
				},
				error : function(data) {
					console.log(data.msg);
				},
			});
		});
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
				title : 'ID'
			}, {
				field : 'uname',
				title : '用户名'

			}, {
				field : 'upwd',
				title : '用户密码'
			}, {
				field : 'usex',
				title : '用户性别'
			}, {
				field : 'uemail',
				title : '用户邮箱'
			} ] ]
		});
		var pager = $('#userList').datagrid('getPager');
		pager.pagination({
			pageSize : 10,
			pageList : [ 5, 10, 15 ]
		});

	})
</script>

<script type="text/javascript">
	var xhr;
	var checkUserFlag = 0;
	function checkUname() {

		var uname = document.getElementById("loginUser").value;

		if (uname != '') {
			$.ajax({
				url : "UserServlet",
				method : "POST",
				async : true,
				data : {
					"action" : "checkUname",
					"uname" : uname
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					checkUserFlag = result.msg_code;
					document.getElementById("unameMsg").innerHTML = result.msg;
				}
			})
		}

		console.log("代码运行测试........." + checkUserFlag);
	}

	function checkForm() {
		var uname = document.getElementById("loginUser").value;
		if (uname == '') {
			document.getElementById("unameMsg").innerHTML = "请输入用户名！";
			return false;
		} else {
			if (checkUserFlag == 1) {
				return false;
			}
		}
		return true;
	}
</script>
<script type="text/javascript">
	function add() {
		
		var uname = document.getElementById("loginUser").value;
		var upwd = document.getElementById("loginPwd").value;
		var x = document.getElementById("loginSex").selectedIndex;
		var usex = document.getElementsByTagName("option")[x].value;
		var uemail = document.getElementById("loginEmail").value;
		alert(usex);
		if (uname != ' ') {
			$.ajax({
				url : "UserServlet",
				method : "POST",
				async : true,
				data : {
					"action" : "adduser",
					"uname" : uname,
					"upwd" : upwd,
					"usex" : usex,
					"uemail" : uemail
				},
				dataType : "json",
				success : function(data) {
					alert('来自后台的消息!');
					alert(data);
				},
				error : function(data) {
					alert('来自后台的消息!');
					alert(data);
				}
			})
		}

		console.log("代码运行测试.........");
	}
</script>
</head>
<body>
	<div class="page-container">
		<div class="usermanage ">
			<form action="UserServlet" method="POST">
				<input type="hidden" name="action" value="">
				<table id="userList" class="easyui-datagrid">
				</table>

				<div id="userTool" style="padding: 8px 0;">
					<a href="#" class="easyui-linkbutton" data-toggle="modal"
						data-target="#userRegisterModal"
						data-options="iconCls:'icon-add',plain:true">添加用户</a> <a href="#"
						onclick="datadel()" class="easyui-linkbutton"
						data-options="iconCls:'icon-cancel',plain:true">批量删除</a>
					<div
						style="display: inline-block; padding-left: 30px; border-left: 1px solid #CCCACC;">
						<input type="hidden" name="action" value="schUser"> <input
							type="hidden" name="currPage" value="1"> <input
							type="text" class="input-text" style="width: 250px"
							placeholder="输入用户名称" id="inputsch" name="schUsername">
						<button type="submit" id="" name="">搜用户</button>
					</div>
				</div>

			</form>
		</div>
	</div>

	<!-- 可以采用弹出界面来实现界面中输入，然后引用数据库操作，进行相关操作 -->
	<div class="modal fade" id="userRegisterModal" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<input type="button" value="&times;" class="close"
						data-dismiss="modal" aria-hidden="ture" />
					<h4 class="modal-title">
						<span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;添加用户
					</h4>
				</div>

				<!--使用js和ajax进行异步添加，但是没有在数据库更新？？？-->
				<form name="myForm" onsubmit="return checkForm()">
					<!-- 隐藏表单域 -->
					<input type="hidden" name="action" value="addUser" />
					<div class="modal-body">
						<div class="row">
							<div class="userRegisterText">
								用户名<font color="red" id="unameMsg"></font>
							</div>
							<div class="userRegisterInput">
								<input type="text" class="form-control" name="uname"
									id="loginUser" />
								<p class="userRegisterNotice">6~18个字符，可使用字母、数字、下划线，需要用字母开头</p>
							</div>
						</div>
						<div class="row">
							<div class="userRegisterText">密码</div>
							<div class="userRegisterInput">
								<input type="password" class="form-control" name="upwd"
									id="loginPwd" />
								<p class="userRegisterNotice">6~16个字符，区分大小写</p>
							</div>
						</div>
						<div class="row">
							<div class="userRegisterText">确认密码</div>
							<div class="userRegisterInput">
								<input type="password" class="form-control" name="againpwd" />
								<p class="userRegisterNotice">再次输入密码</p>
							</div>
						</div>

						<div class="row">
							<div class="userRegisterText">性别</div>
							<div class="userRegisterInput">
								<select id="loginSex">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
								<p class="userRegisterNotice">选择你的性别</p>
							</div>
						</div>

						<div class="row">
							<div class="userRegisterText">Email</div>
							<div class="userRegisterInput">
								<input type="text" class="form-control" name="uemail"
									id="loginEmail" />
								<p class="userRegisterNotice">Email格式：xxx@xxx.com</p>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<input type="button" class="btn btn-success" onclick="add()"
							value="添加用户" />
					</div>
				</form>
			</div>
		</div>
</body>
</html>
