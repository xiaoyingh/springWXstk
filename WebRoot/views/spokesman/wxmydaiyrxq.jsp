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
	<h3>《代言人详情》</h3>
	<ol>
		<li>1，关注手提课公众号；</li>
		<li>2，进入代言人中心；</li>
		<li>3，输入手机号并绑定，即可成为手提课代言人；</li>
		<li>4，代言人将”手提课K12”公众号或某一个课程链接转发给他人，转发到朋友圈，或者转发到微信群；</li>
		<li>5，其他人因为点击该链接而关注手提课公众号，则成为该代言人的学员；</li>
		<li>6，当学员在手提课公众号里购买课程时，则代言人就会获得相应的收益；</li>
		<li>7， 收益比例如下：2017年12月29日前称为手提课代言人，享有最高的代言人权益。当学员购买手提课会员时，提成比例是会员金额的30%；当学员购买手提课单个课程时，提成比例是课程金额的20%。</li>
	</ol>
</div>
</body>
</html>
<script type="text/javascript" src="<%=path%>/js/wxpublic.js"></script>