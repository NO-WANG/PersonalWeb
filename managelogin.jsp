<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>

<head>
<meta charset="UTF-8">
<title>网站后台登录页面</title>

<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#frmLogin .input-group {
	/*设置每个输入框组之间的垂直距离*/
	margin-bottom: 40px;
}

#frmLogin div {
	/*设置表单文字的样式*/
	font-family: "microsoft yahei";
	font-weight: bold;
}

#frmLogin #codeE {
	/*设置动态生成验证码标签的样式*/
	font-size: 20px;
	border: 1px dashed #999999;
	display: inline-block;
	padding: 5px;
}
</style>

<script>
	function createCode() {
		var code = " ";
		var codeLength = 5;
		var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c',
				'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
				'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A',
				'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
		for (var i = 0; i < codeLength; i++) {
			var charNum = Math.floor(Math.random() * 52);
			code += codeChars[charNum];
		}
		return code;
	}

	$(function() {
		$('#codeE').text(createCode); //页面加载完全后，动态生成验证码标签内容
		$('#aChangeCode').click(function() { //点击换一张链接。动态生成验证码标签内容
			$('#codeE').text(createCode);
		});
	});

	/*
	 * 判断输入框是否为空函数
	 */
	function checkNull(val, tip) {
		var uName = $(val).val();
		if (uName.length == 0) {
			//如果输入框为空，使用bootstrap提示框组件显示相应提示信息
			$(val).tooltip({
				title : tip,
				placement : 'auto'
			});
			$(val).tooltip('show');
			return false;
		} else {
			//如果输入框不为空，设置提示框组件提示信息为“空字符串”
			$(val).tooltip({
				title : ' ',
				placement : 'auto'
			});
			return false;
		}
	}

	/*
	 * 判断验证码输入框输入值与动态生成验证码标签内容是否一致
	 */
	function matchCode() {
		var buildCode = $('#codeE').text(); //动态生成验证码标签内容
		var inputCode = $('#txtCode').val(); //验证码输入框输入值
		if (buildCode != inputCode) {
			//如果验证码不一致，使用bootstrap提示框组件显示相应提示信息
			$('#txtCode').tooltip({
				title : '验证码输入不正确',
				placement : 'auto'
			});
			$('#txtCode').tooltip('show');
			return false;
		} else {
			$('#txtCode').tooltip({
				title : ' ',
				placement : 'auto'
			});
			return true;
		}
	}

	$(function() {
		$('#frmLogin').submit(function() { /*点击用户登录按钮进行表单验证*/
			checkNull('#txtManage', '管理员账号不能为空！');
			checkNull('#txtPwd', '密码不能为空！');
			matchCode();
		});
		$('#txtManage').blur(function() {
			/*焦点离开用户名输入框验证用户名是否为空*/
			checkNull('#txtManage', '用户名不能为空！！！');
		});
		$('#txtPwd').blur(function() {
			/*焦点离开用户名输入框验证密码是否为空*/
			checkNull('#txtPwd', '密码不能为空！！！');
		});
		$('#txtCode').blur(matchCode); //焦点离开验证码输入框检查验证码是否一致
	})
</script>

</head>

<body>


	<div class="container">
		<div class="col-sm-8 col-sm-offset-2">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h2 class="panel-title">
						<span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;网站管理员登录
					</h2>
				</div>

				<form id="frmLogin" action="/bravewang/ManageServlet" method="POST">
					<input type="hidden" name="action" value="managelogin">
					<div class="panel-body">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user">&nbsp;用户名</i>
							</span> <input id="txtManage" name="mname" type="text" 
								class="form-control" placeholder="输入管理员账号 " />
						</div>
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-lock">&nbsp;密&nbsp;码</i>
							</span> <input id="txtPwd" name="mpwd" type="password" 
								class="form-control" placeholder=" 输入密码" />
						</div>

						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-eye-open">&nbsp;验证码</i>
							</span> <input id="txtCode" type="text" class="form-control" 
								placeholder="输入验证码 " />
						</div>

						<div class="input-group">
							验证码:<label id="codeE"></label>&nbsp; <a 
								href="javascript:void(0)">换一张</a>
						</div>
						<input type="submit" class="btn btn-primary pull-right" id="frmLogin" 
							value="管理员登录" />
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

</html>