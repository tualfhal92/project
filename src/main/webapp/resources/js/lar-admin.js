function adminUsersListModal(user_index, list, page, filter, text) {
	filter = typeof filter !== 'undefined' ? filter : null;
	text = typeof text !== 'undefined' ? text : null;

	var modal_header = new Object();

	modal_header.menu = "users";
	modal_header.index = user_index;
	modal_header.list = list;
	modal_header.page = page;

	if (filter != null) {		
		if (text == null || text == '') {
			alert('텍스트를 입력해주세요.');
			return false;
		}
		
		modal_header.filter = filter;
		modal_header.text = text;
	}

	$.ajax({
		type : 'post',
		url : '/lar/admin/modal',
		contentType : 'application/json; charset=utf-8',
		data : JSON.stringify(modal_header),
		success : function(result_html) {
			$('.modal-content').html(result_html);
		}, error : function(error) {
			if (error.status == 400)
				alert("관리자가 아닙니다. 헛짓거리 하지 마세요;");
		}
	});
}

function adminUsersViewModal(user_index, list, target_index, pre_list, pre_page, filter, text) {
	filter = typeof filter !== 'undefined' ? filter : null;
	text = typeof text !== 'undefined' ? text : null;
	
	var modal_header = new Object();

	modal_header.menu = "users";
	modal_header.index = user_index;
	modal_header.list = list;
	modal_header.target_index = target_index;
	modal_header.pre_list = pre_list;
	modal_header.pre_page = pre_page;
	
	if (filter != null) {
		modal_header.filter = filter;
		modal_header.text = text;
	}

	$.ajax({
		type : 'post',
		url : '/lar/admin/modal',
		contentType : 'application/json; charset=utf-8',
		data : JSON.stringify(modal_header),
		success : function(result_html) {
			$('.modal-content').html(result_html);
		}, error : function(error) {
			if (error.status == 400)
				alert("관리자가 아닙니다. 헛짓거리 하지 마세요;");
		}
	});
}

function adminGiveCouponFormView(user_index, pre_list, pre_page) {
	var modal_header = new Object();
	
	modal_header.menu = 'give';
	modal_header.list = 'coupon';
	modal_header.index = user_index;
	modal_header.pre_list = pre_list;
	modal_header.pre_page = pre_page;
	
	$.ajax({
		type : 'post',
		url : '/lar/admin/modal',
		contentType : 'application/json; charset=utf-8',
		data : JSON.stringify(modal_header),
		success : function(result_html) {
			$('.modal-content').html(result_html);
		}, error : function(error) {
			if (error.status == 400)
				alert("관리자가 아닙니다. 헛짓거리 하지 마세요;");
		}
	});
}

function adminActionModal(action, user_index, list, target_index, pre_list, pre_page, filter, text) {
	filter = typeof filter !== 'undefined' ? filter : null;
	text = typeof text !== 'undefined' ? text : null;
	
	var modal_header = new Object();
	
	modal_header.menu = action;
	modal_header.index = user_index;
	modal_header.list = list;
	modal_header.target_index = target_index;
	modal_header.pre_list = pre_list;
	modal_header.pre_page = pre_page;
	
	if (filter != null) {
		modal_header.filter = filter;
		modal_header.text = text;
	}
	
	$.ajax({
		type : 'post',
		url : '/lar/admin/modal',
		contentType : 'application/json; charset=utf-8',
		data : JSON.stringify(modal_header),
		success : function(result_html) {
			$('.modal-content').html(result_html);
		}, error : function(error) {
			if (error.status == 400)
				alert("관리자가 아닙니다. 헛짓거리 하지 마세요;");
		}
	});
}

function drawYearlySignupChart() {
	var jsonData = JSON.parse($.ajax({
		url: '/lar/admin/charts/signup/yearly',
		dataType: 'json',
		async: false
	}).responseText);
	
	console.log(jsonData);
	
	var data = new google.visualization.DataTable();
	
	data.addColumn('string', 'Month');
	data.addColumn('number', 'Value');
	
	for(var i=0; i<jsonData.length; i++) {
		data.addRow(jsonData[i]);
	}
	
	var options = {
		title: '누적 회원 가입 수 변화',
		width: 400,
		height: 300,
		curveType: 'function',
		legend: { position: 'bottom' }
	};

	var chart = new google.visualization.LineChart(document.getElementById('YearlySignupChart'));

	chart.draw(data, options);
}

function drawYearlyPurchaseCountChart() {
	var jsonData = JSON.parse($.ajax({
		url: '/lar/admin/charts/purchase/yearly',
		dataType: 'json',
		data: {
			type: 'count'
		},
		async: false
	}).responseText);
	
	console.log(jsonData);
	
	var data = new google.visualization.DataTable();
	
	data.addColumn('string', 'Month');
	data.addColumn('number', 'Value');
	
	for(var i=0; i<jsonData.length; i++) {
		data.addRow(jsonData[i]);
	}
	
	var options = {
		title: '누적 결제 건 수 변화',
		width: 400,
		height: 300,
		curveType: 'function',
		legend: { position: 'bottom' }
	};

	var chart = new google.visualization.LineChart(document.getElementById('YearlyPurchaseCountChart'));

	chart.draw(data, options);
}

function drawYearlyPurchaseAmountChart() {
	var jsonData = JSON.parse($.ajax({
		url: '/lar/admin/charts/purchase/yearly',
		data: {
			type: 'amount'
		},
		dataType: 'json',
		async: false
	}).responseText);
	
	console.log(jsonData);
	
	var data = new google.visualization.DataTable();
	
	data.addColumn('string', 'Month');
	data.addColumn('number', 'Value');
	
	for(var i=0; i<jsonData.length; i++) {
		data.addRow(jsonData[i]);
	}
	
	var options = {
		title: '누적 결제 총 액 변화',
		width: 400,
		height: 300,
		curveType: 'function',
		legend: { position: 'bottom' }
	};

	var chart = new google.visualization.LineChart(document.getElementById('YearlyPurchaseAmountChart'));

	chart.draw(data, options);
}

function drawYearlyCommuChart() {
	var jsonData = JSON.parse($.ajax({
		url: '/lar/admin/charts/commu/yearly',
		dataType: 'json',
		async: false
	}).responseText);
	
	console.log(jsonData);
	
	var data = new google.visualization.DataTable();
	
	data.addColumn('string', 'Month');
	data.addColumn('number', 'Value');
	
	for(var i=0; i<jsonData.length; i++) {
		data.addRow(jsonData[i]);
	}
	
	var options = {
		title: '누적 글 작성 수 변화',
		width: 400,
		height: 300,
		curveType: 'function',
		legend: { position: 'bottom' }
	};

	var chart = new google.visualization.LineChart(document.getElementById('YearlyCommuChart'));

	chart.draw(data, options);
}
function drawYearlyCommuReplyChart() {
	var jsonData = JSON.parse($.ajax({
		url: '/lar/admin/charts/commuReply/yearly',
		dataType: 'json',
		async: false
	}).responseText);
	
	console.log(jsonData);
	
	var data = new google.visualization.DataTable();
	
	data.addColumn('string', 'Month');
	data.addColumn('number', 'Value');
	
	for(var i=0; i<jsonData.length; i++) {
		data.addRow(jsonData[i]);
	}
	
	var options = {
		title: '누적 댓글 작성 수 변화',
		width: 400,
		height: 300,
		curveType: 'function',
		legend: { position: 'bottom' }
	};

	var chart = new google.visualization.LineChart(document.getElementById('YearlyCommuReplyChart'));

	chart.draw(data, options);
}