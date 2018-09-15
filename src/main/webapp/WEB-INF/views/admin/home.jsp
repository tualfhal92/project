<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Home" name="pageTitle" />
</c:import>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">
			Home <small>Statistics Overview</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-dashboard"></i> Home</li>
		</ol>
	</div>

	<div class="row">
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-user fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${today_SignupCount}</div>
							<div>New Users!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-green">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-shopping-cart fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${today_PurchaseCount}</div>
							<div>New Purchase!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-yellow">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-pencil fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${today_CommuCount}</div>
							<div>New Community Write!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-red">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-comments-o fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${today_CommuReply}</div>
							<div>New Community Reply!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>