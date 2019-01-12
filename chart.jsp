<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>网站流量统计</title>
<script src="chart/amcharts/amcharts.js" type="text/javascript"></script>
<script src="chart/amcharts/serial.js"></script>
<script src="chart/amcharts/pie.js"></script>
<script src="../js/chart-step.js"></script>
</head>

<body>
	<center>
		<h1>网站访问量统计</h1>
	</center>
	<div id="chartdiv" style="width: 100%; height: 400px;"></div>
	<table align="center" cellspacing="20">
		<tr>
			<td><input type="radio" name="group" checked="checked" id="rb1"
				onclick="column3D()" /> 月访问量3D柱状图 
				<input type="radio" name="group"
				id="rb2" onclick="pie3D()" /> 月访问量标签外置3D饼状图
				 <input type="radio"
				name="group" id="rb3" onclick="setLabelPosition()" /> 月访问量标签内置3D饼状图
				<input type="radio" name="group" id="rb4" onclick="lineGraph()" />
				年访问量对比折线图 
				<input type="radio" name="group" id="rb5"
				onclick="timeVisitedChart()" /> 区域时间访问量统计</td>
		</tr>
	</table>
</body>

</html>