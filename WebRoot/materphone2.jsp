<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>手提课</title>
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="css/wxpublic/wxpublic.css"/>
<link rel="stylesheet" type="text/css" href="css/matertexts/materphone.css"/>
</head>
<body onLoad="document.user.telephone.focus()">
<div class="wx_wrap">
	<div class="phone_con">
			<form action="addphone2" method="post" id="reg-form" name="user">
			<ul>
				<li class="phone_text">
					<div>
						<input type="tel" placeholder="手机号码" id="myUserName" name="telephone"  />
					</div>
				</li>
				<li class="phone_yzm">
					<div>
						<input type="number" name="" id="CheckCode" value="" class="code_yzm" placeholder="请输入验证码" onblur="checkrandomSpan();"/>
					</div>
					<span class="get_yzm" id="getKey">获取验证码</span>
					<span id="randomSpan" style="font-size: 13px"></span>
				</li>
				<li class="phone_error"><p id="error"></p></li>
			</ul>
			<div>
				<input type="submit" value="确定" class="phone_btn" id="zc_btn"/>
			</div>
			
		</form>
		
	</div>
</div>
</body>
</html>
<script type="text/javascript" src="jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="js/wxpublic.js"></script>
<script type="text/javascript" src="js/wxphoneyzm.js"></script>
<script type="text/javascript">
	$('ul input').focus(function(){
		$(this).css('outline','none');
	});
</script>