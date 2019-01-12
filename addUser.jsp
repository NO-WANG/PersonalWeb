<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>添加用户界面</title>
<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="shortcut" href="/favicon.ico" />
<link rel="bookmark" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/userRegisterInput.css" />
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
</head>

<body>

	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">
					<span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;用户注册
				</h4>
			</div>
			<!-- 注册发送表单 -->
			<form name="myForm" action="UserServlet" method="POST"
				onsubmit="return checkForm()">
				<!-- 隐藏表单域 -->
				<input type="hidden" name="action" value="reg" />
				<div class="modal-body">
					<div class="row">
						<div class="userRegisterText">
							用户名<font color="red" id="unameMsg"></font>
						</div>
						<div class="userRegisterInput">
							<input type="text" class="form-control" name="uname"
								id="loginUser"  onblur="checkUname()" />
							<p class="userRegisterNotice">6~18个字符，可使用字母、数字、下划线，需要用字母开头</p>
						</div>
					</div>
					<div class="row">
						<div class="userRegisterText">密码</div>
						<div class="userRegisterInput">
							<input type="password" class="form-control" name="upwd"
								id="loginPsw" />
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
							<input type="text" list="sexlist" id="sex" name="usex">
							<datalist id="sexlist">
								<option value="男">
								<option value="女">
							</datalist>
							<p class="userRegisterNotice">选择你的性别</p>
						</div>
					</div>

					<div class="row">
						<div class="userRegisterText">Email</div>
						<div class="userRegisterInput">
							<input type="text" class="form-control" name="uemail" />
							<p class="userRegisterNotice">Email格式：xxx@xxx.com</p>
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<input type="submit" class="btn btn-success" value="立即注册" />
				</div>
			</form>
		</div>
	</div>


</body>

</html>