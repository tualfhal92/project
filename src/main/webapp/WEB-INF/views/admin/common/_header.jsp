<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>LAR : Admin-${param.pageTitle}</title>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/tagInput.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/lar-admin.min.js"></script>
		
		<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tagInput.min.css" />
		<link href="${pageContext.request.contextPath}/resources/css/lar-admin.min.css" rel="stylesheet">
		
		<style>
			.modal-body{
				max-height: calc(100vh - 210px);
	    		overflow-y: auto;
	    		overflow-x: auto;
    		}
		</style>
	</head>
	
	<body>
		<div id="wrapper">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#admin-nav-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/lar/admin/"><span class="fa fa-fw fa-home"></span> LAR : Admin</a>
				</div>
				
				<div class="collapse navbar-collapse" id="admin-nav-collapse">
					<ul class="nav navbar-nav side-nav">
						<li>
							<a href="/lar"><i class="fa fa-fw fa-backward"></i> Go LAR</a>
						</li>
						<li>
							<a href="/lar/user/signout"><i class="fa fa-fw fa-power-off"></i> Sign Out</a>
						</li>
						<li>
							<a href="/lar/admin/charts"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
						</li>
						<li>
							<a href="/lar/admin/users/list/1"><i class="fa fa-fw fa-address-book"></i> Users</a>
						</li>
						<li>
							<a href="/lar/admin/lectures/list/1"><i class="fa fa-fw fa-book"></i> Lectures</a>
						</li>
						<li>
							<a href="javascript:;" data-toggle="collapse" data-target="#commuDropdown"><i class="fa fa-fw fa-globe"></i> Community <i class="fa fa-fw fa-caret-down"></i></a>
							<ul id="commuDropdown" class="collapse">
								<li>
									<a href="/lar/admin/commu/notice/list/1"><i class="fa fa-fw fa-exclamation-circle"></i> Notice</a>
								</li>
								<li>
									<a href="/lar/admin/commu/board/list/1"><i class="fa fa-fw fa-sticky-note"></i> Board</a>
								</li>
								<li>
									<a href="/lar/admin/commu/qa/list/1"><i class="fa fa-fw fa-question"></i> Q & A</a>
								</li>
								<li>
									<a href="/lar/admin/commu/news/list/1"><i class="fa fa-fw fa-newspaper-o"></i> News</a>
								</li>
								<li>
									<a href="/lar/admin/commu/trash/list/1"><i class="fa fa-fw fa-trash"></i> Trash</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="javascript:;" data-toggle="collapse" data-target="#manageDropdown"><i class="fa fa-fw fa-cogs"></i> Management <i class="fa fa-fw fa-caret-down"></i></a>
							<ul id="manageDropdown" class="collapse">
								<li>
									<a href="/lar/admin/management/coupon/list/1"><i class="fa fa-fw fa-ticket"></i> Coupon</a>
								</li>
								<li>
									<a href="/lar/admin/management/category/list/1"><i class="fa fa-fw fa-bookmark-o"></i> Lecture Category</a>
								</li>
								<li>
									<a href="/lar/admin/management/lecture"><i class="fa fa-fw fa-registered"></i> Lecture Registered</a>
								</li>
							</ul>
						</li>
					</ul>
				</div> <!-- /.navbar-collapse -->
			</nav>

			<div id="page-wrapper">
				<div class="container-fluid">