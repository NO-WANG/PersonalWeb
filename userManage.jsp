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
<script src="js/dropdownopen.js"></script>

</head>
<body>

	<div class="page-container">
		<div class="text-c">
			<div class="col-md-4"></div>

			<div class="col-md-6">
				<form action="UserServlet" method="POST">
					<input type="hidden" name="action" value="schUser"> <input
						type="hidden" name="currPage" value="1"> <input
						type="text" class="input-text" style="width: 250px"
						placeholder="输入用户名称" id="" name="schUserName">
					<button type="submit" class="btn btn-success radius" id="" name="">
						 搜用户
					</button>
					
					<!-- 查询产品还不是很成功！！！能够传值但是不能返回对应的查询结果 -->
					
				</form>
			</div>


		</div>

		<div class="mt-20">
			<form action="UserServlet" method="post">
				<!-- 页面复选框获取值 
				<input type="hidden" name="action" value="delUsers">-->

				<table
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="50"><input type="checkbox" name="" value=""></th>
							<th width="80">序号</th>
							<th width="100">用户名</th>
							<th width="100">密码</th>
							<th width="100">性别</th>
							<th width="120">邮箱</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="u" varStatus="vs">
							<%
								System.out.println("数据读取成功！");
							%>
							<tr class="text-c">
								<td><input type="checkbox" value="${u.uid }" name="ids"></td>
								<td>${vs.count + (currPage-1)*pageSize}</td>
								<td>${u.uname }</td>
								<td>${u.upwd }</td>
								<td>${u.usex }</td>
								<td>${u.uemail}</td>
								<td><a title="编辑"
									href="UserServlet?action=initEditUser&uid=${u.uid }"
									class="ml-5" style="text-decoration: none"> 编辑</a> <a
									title="删除" href="UserServlet?action=delUser&uid=${u.uid} "
									class="ml-5" style="text-decoration: none">删除</a></td>

							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="text-c">
							<td colspan="6">总页数：${totalPage}页 &nbsp;&nbsp;&nbsp;&nbsp;
								当前第${currPage}页 &nbsp;&nbsp;&nbsp;&nbsp; <a
								href="UserServlet?action=schUser&currPage=${currPage-1 }">上一页</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="UserServlet?action=schUser&currPage=${currPage+1 }">下一页</a>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>

</body>
</html>
