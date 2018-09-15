<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Charts" name="pageTitle" />
</c:import>

<script type="text/javascript">
	google.charts.load("current", {packages:['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawYearlySignupChart);
	google.charts.setOnLoadCallback(drawYearlyPurchaseCountChart);
	google.charts.setOnLoadCallback(drawYearlyPurchaseAmountChart);
	google.charts.setOnLoadCallback(drawYearlyCommuChart);
	google.charts.setOnLoadCallback(drawYearlyCommuReplyChart);
</script>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">
			Charts
		</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-bar-chart"></i> Charts</li>
		</ol>
	</div>

	<table>
		<tr>
			<td><div id="YearlySignupChart"></div></td>
		</tr>
		<tr>
			<td>
				<div id="YearlyPurchaseCountChart"></div>
			</td>
			<td>
				<div id="YearlyPurchaseAmountChart"></div>
			</td>
		</tr>
		<tr>
			<td><div id="YearlyCommuChart"></div></td>
			<td><div id="YearlyCommuReplyChart"></div></td>
		</tr>
	</table>
	
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>