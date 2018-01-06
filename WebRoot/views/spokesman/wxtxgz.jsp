<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>手提课</title>
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/wxpublic/wxpublic.css" />
<style type="text/css">
.wx_wrap{
	padding-top: 0.8rem;
}
h3{
	width: 100%;
	height: 1rem;
	line-height: 1rem;
	text-align: center;
	font-size: 0.68rem;
	color: #000;
	margin-bottom: 0.5rem;
}
ol{
	width: 100%;
	padding: 0 0.8rem;
}
ol li{
	width: 100%;
	min-height: 0.8rem;
	line-height: 0.8rem;
	font-size: 0.56rem;
	margin-bottom: 0.2rem;
}
</style>
</head>
<body>
<div class="wx_wrap">
	<h3>《提现规则》</h3>
	<ol>
		<li>1，每月20日-25日是提现日。</li>
		<li>2，当月提现日所提现的金额，为上个月整月（自然月）的收入总和。</li>
		<li>3，若用户在当月提现日没有提现上个月的收入总和，该收入总和会累积到当月，与当月新产生的收入总和累加在下个月的提现日提现，以此类推。</li>
		<li>4，用户在发出提现申请后，平台将安排财务人员在2个工作日内，通过微信平台的方式给用户转账。</li>
	</ol>
</div>
</body>
</html>
<script type="text/javascript" src="<%=path%>/js/wxpublic.js"></script>