<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String money = request.getParameter("money");
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
<link rel="stylesheet" type="text/css" href="<%=path%>/css/spokesman/wxtxok.css"/>
</head>
<body >
<div class="wx_wrap">
	<div class="top">
		<img src="<%=path%>/img/wxabout/wxtx.png"/>
	</div>
	<div class="section">
		<h5>提现金额</h5>
		<h6>
			<em>￥</em>
			<input type="text" name="number" id="mytxmoney" value="" autofocus="autofocus"  />
			<span class="jeclear"></span>
		</h6>
		<div class="txje">
			<div class="txcon">
				<b class="txpic">可提现金额<em class="pic"><%=money %></em>元</b>
				<strong class="tx_error"></strong>
			    <span class="txje_btn">全部提现</span>
			</div>
			
		</div>
		<p class="nowtx">提现</p>
	</div>
</div>
</body>
</html>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path%>/js/wxpublic.js"></script>
<script type="text/javascript">
	//点击输入框右边的按钮 清除输入的金额 并获取焦点
	$('.jeclear').on('touchstart',function(){
		$('#mytxmoney').val('');
		$('#mytxmoney').focus();
		$('.tx_error').hide();
		$('.txpic').show();
		$('.tx_error').html('');
	});
	//点击全部提现时 把所有可提现金额 都提现
	$('.txje_btn').on('touchstart',function(){
		var num = $('.pic').html();
		$('#mytxmoney').val(num);
	});
	//失去焦点时的提醒
	$('#mytxmoney').blur(function(){
		txyz($(this));
	});
	//监控输入只能是数字和两个小数点 并且金额超过可提现时 报错
	$('#mytxmoney').bind('input propertychange', function() { 

        $number($(this));
        txyz($(this));
    }); 
    
    $('.nowtx').on('touchstart',function(){
    	if(txyz($('#mytxmoney'))){
    		
    		var my=$('#mytxmoney').val();
    		alert('可提现，进入提现页面');
    		window.location.href = '<%=path%>/tixianmoney?money='+my;
    	}else{
    		alert('输入的提现金额有误，无法提现');
    	}
    });
  //验证输入金额规范
	function $number(obj){
		obj.val(obj.val().replace(/[^\d.]/g,"")); //清除"数字"和"."以外的字符
		obj.val(obj.val().replace(/^\./g,"")); //验证第一个字符是数字
//		obj.val(obj.val().replace(/\.{2,}/g,".")); //只保留第一个, 清除多余的
//		obj.val(obj.val().replace(".","$#$").replace(/\./g,"").replace("$#$","."));
//		obj.val(obj.val().replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3')); //只能输入两个小数
		obj.val(obj.val().replace(/[^0-9]/g,"")); //只能输入整数
	}
	
    //验证金额是否超出
    function txyz(obj){
    	var txtnum = parseFloat(obj.val());
        var picnum = parseFloat($('.pic').html());
        console.log(txtnum,picnum);
        if(txtnum > picnum){
        	$('.txpic').hide();
        	$('.tx_error').show();
			$('.tx_error').html('金额已超过可提现金额');
			return false;
		}else if(obj.val() == ''||txtnum == ''){
			$('.txpic').hide();
			$('.tx_error').show();
			$('.tx_error').html('请输入提现金额');
			return false;
		}else{
			$('.tx_error').hide();
			$('.txpic').show();
			$('.tx_error').html('');
			return true;
		}
    }

</script>
