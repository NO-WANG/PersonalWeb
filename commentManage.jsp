<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论管理</title>
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

</head>
<body>


	<div class="mt-20">
		<form action="UserServlet" method="post">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="30"><input type="checkbox" name="" value=""></th>
						<th width="50">序号</th>
						<th width="100">购买用户名</th>
						<th width="200">评论内容</th>
						<th width="80">评论时间</th>
						<th width="80">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${commentList}" var="c" varStatus="cs">
						<tr class="text-c">
							<%
								System.out.println("用户评论展示，说明数据读取成功！");
							%>
							<td><input type="checkbox" value="${c.commentid }"
								name="ids"></td>
							<td>${cs.count + (currPage-1)*pageSize}</td>
							<td>${c.commentuser }</td>
							<td>${c.commentword }</td>
							<td>${c.commentdate}</td>
								<td><a
									title="删除" href="UserServlet?action=delComment&commentid=${c.commentid} "
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

	
</body>
</html>