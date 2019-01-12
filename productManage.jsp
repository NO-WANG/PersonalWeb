<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>产品管理</title>

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

</head>

<body>

	<div class="page-container">
		<div class="text-c">
			<form action="UserServlet" method="POST">
				<div class="col-md-4 col-lg-4">
					<a title="添加" href="UserServlet?action=addProduct" class="ml-5"
						style="text-decoration: none">
						<button class="glyphicon glyphicon-add">添加</button>
					</a>
				</div>

				<div class="col-md-6   col-lg-6">

					<input type="hidden" name="action" value="schUser"> <input
						type="hidden" name="currPage" value="1"> <input
						type="text" class="input-text" style="width: 250px"
						placeholder="输入产品名称" id="" name="schUsername">
					<button type="submit" class="btn btn-success radius" id="" name="">
						搜产品</button>
				</div>
			</form>


		</div>

		<div class="mt-20">
			<form action="UserServlet" method="post">
				<table
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="30"><input type="checkbox" name="" value=""></th>
							<th width="50">序号</th>
							<th width="200">产品名</th>
							<th width="100">产品价格</th>
							<th width="80">产品数量</th>
							<th width="80">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productList}" var="p" varStatus="ps">
							<tr class="text-c">
								<%
									System.out.println("产品展示，说明数据读取成功！");
								%>
								<td><input type="checkbox" value="${p.pid }"></td>
								<td>${ps.count + (currPage-1)*pageSize}</td>
								<td>${p.pname }</td>
								<td>${p.price }</td>
								<td>${p.pnum}</td>
								<td><a title="编辑"
									href="UserServlet?action=initEditProduct&pid=${p.pid }"
									class="ml-5" style="text-decoration: none"> 编辑&nbsp;</a><a
									title="删除" href="UserServlet?action=delProduct&pid=${p.pid} "
									class="ml-5" style="text-decoration: none">&nbsp;删除</a></td>
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