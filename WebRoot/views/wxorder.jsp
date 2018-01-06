<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
			
			
			String appId = request.getParameter("appid");
			String timeStamp = request.getParameter("timeStamp");
			String nonceStr = request.getParameter("nonceStr");
			String packageValue = request.getParameter("package");
			String paySign = request.getParameter("sign");



		String title=request.getParameter("titles");
		String ur=request.getParameter("ur");
		String pi=request.getParameter("pi");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>手提课</title>
		<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
		
		
		<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		
		
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/wxpublic/wxpublic.css" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/wxorder.css" />
	</head>

	<body>
		<div class="wx_wrap">
			<!--商品信息-->
			<div class="order_xq">
				<h2>商品信息</h2>
				<div class="wxkc_xq">
					<dl>
						<dt><img src="http://www.shoutike.com/cover/<%=ur%>"/></dt>
						<dd>
							<h5><%=title%></h5>
							<p>￥<%=pi%> <em>有效期三个月</em></p>
						</dd>
					</dl>
				</div>
			</div>
			<!--微信支付-->
			<div class="kc_pay">
				<h5>支付方式</h5>
				<div class="wx_pay">
					<p></p>
					<i></i>
				</div>
			</div>
			<!--支付价钱和优惠-->
			<div class="kc_sum">
				<h5>
			<span>订单金额</span>
			<em>￥<%=pi%></em>
		</h5>
				<!--<h6>
			<span>优惠金额</span>
			<em>-￥0.00</em>
		</h6>-->
			</div>
			<!--用户付费协议-->
			<div class="pay_agreen">
				<i class="agreen_btn"></i>
				<span>我已阅读并同意</span>
				<span class="user_xy">《用户付费协议》</span>
			</div>
			<!--确认支付-->
			<div class="now_pay">
				<p class="now_money">
					<span>实付金额</span>
					<em>￥<%=pi%></em>
				</p>
				<p class="now_btn">
					<a onclick="callpay()">立即支付</a>
				</p>
			</div>
		</div>
		<div class="agreen_mask">
			<div class="mask_con">
				<p class="content-title">用户付费协议</p>
				<div class="container">
					<p>
						<strong>第一条 总则<br/></strong><br/>
						欢迎使用手提课平台，为保障用户权益，请用户在付费之前，详细阅读此服务协议（以下简称“本协议”）所有内容。当用户点选“【我已经阅读并同意《用户付费协议》】”，即表示用户同意并承诺遵守本协议。<br/><br/>
						收费课程是指在手提课平台上有偿提供给用户的视频、文字、图片、答疑、辅导等内容及服务。<br/><br/>
						手提课平台已经发布的或将来可能发布的各类规则,均为本协议不可分割的组成部分，与协议正文具有同等法律效力。<br/><br/><br/>
						<strong>第二条 用户规则</strong>
						<br/><br/>
						用户对以其帐号发生的或通过其帐号发生的一切活动和事件（包括但不限于用户发表的任何内容以及由此产生的任何结果）负全部法律责任。<br/><br/>
						1、用户在手提课平台有偿获得课程内容或服务时，用户需先登录或注册手提课平台帐号，或通过页面提示选用其他可用帐号进行登录。用户在使用手提课平台服务时登录的帐号是确认您身份的唯一依据。<br/><br/>
						2、用户理解并同意：手提课平台提供有偿内容或服务实行先付款后使用的方式，用户及时、足额、合法的支付所需的款项，是您使用手提课平台有偿内容或服务的前提。<br/><br/>
						3、用户理解并同意：手提课平台发布的收费课程将采用整体购买的方式，即用户只需购买一次，就可以学习该课程所有已发布或即将发布的课时。已购买的收费课程，用户可以在学习有效期内重复学习，无需再次付费。如需添加更多增值服务将适当性收取费用（如云容器使用期限）。收费课程一经购买使用后，不得申请退款。<br/><br/>
						4、用户知悉并同意：用户无权对已购买的课程进行修改、出租、租赁、出借、出售、分发、复制、创作衍生品。若用户违反本条规定，手提课平台有权视情况采取如下措施：<br/>
						4.1取消用户继续使用该课程的权利；<br/>
						4.2 限制/冻结用户的帐号；<br/>
						4.3 要求用户退还其通过出售、转让、许可等其他方式取得的收益；<br/>
						4.4其他可以采取的补救措施。<br/><br/>
						5、用户了解并同意：手提课平台可能不定期的对收费课程进行更新（包括但不限于：更新课程内容、改进课程安排）而无需经过用户的事先同意。<br/><br/>
						6、支付宝、微信是用户支付款项的支付平台。用户可以通过手提课平台支付页面提示，选用支付平台账号支付，并承担交易所产生的法律后果。<br/><br/>
						7、用户应保管好自己的帐号和密码（包括但不限于：手提课平台帐号密码、支付平台账号密码），如因用户未保管好自己的帐号和密码而对自己、对手提课平台造成损害的，用户将负全部责任。另外，用户应对用户帐号中的所有活动和事件负全责。用户同意若发现有非法使用用户的帐号或出现安全漏洞的情况，立即通告手提课平台，手提课平台将会尽力予以妥善解决。<br/><br/><br/>
						<strong>第三条 本协议的修订</strong><br/><br/>
						手提课平台有权对本协议进行调整或补充，除非另有明确规定，手提课平台所推出的新功能和新服务，均无条件的适用本协议。<br/><br/><br/>
						<strong>第四条 其他约定</strong><br/><br/>
						1、所有权及知识产权：手提课平台上服务中包含的任何文字、图表、音频、视频（包括但不限于图表、动画、音频、视频、界面、数据和程序、代码、文档）等信息或材料均受著作权法、商标法和/或其它法律法规的保护。非经手提课平台书面同意用户不得擅自使用、修改、复制、传播、改变、散布、发行或发表上述内容。如有违反，用户同意承担由此给手提课平台造成的一切损失。<br/><br/>
						2、用户在手提课平台学习中所产生的评论、答疑、讨论，代码，个人作品（包括但不限于代码，图片，数据等），手提课平台均有权在手提课平台及相关宣传媒体/品进行展示，并无须支付任何费用。<br/><br/>
						3、本协议适用中华人民共和国的法律。当本协议的任何内容与中华人民共和国法律相抵触时，应当以法律规定为准，同时相关内容将按法律规定进行修改或重新解释，而本协议其他部分的法律效力不变。<br/><br/>
						4、本协议自发布之日起实施，并构成用户和手提课平台之间的共识。<br/><br/>
						5、手提课平台不行使、未能及时行使或者未充分行使本协议或者按照法律规定所享有的权利，不应被视为放弃该权利，也不影响手提课平台在将来行使该权利。<br/><br/>
						6、如果您对本协议内容有任何意见或疑问，请给我们的客服邮箱发邮件：[kf@imooc.com]。<br/>
					</p>
				</div>
				<span class="mask_close">X</span>
			</div>
		</div>
	</body>

</html>
 <script type="text/javascript">
  
  
  	function callpay(){
  
		 WeixinJSBridge.invoke('getBrandWCPayRequest',{
  		 "appId" : "<%=appId%>","timeStamp" : "<%=timeStamp%>", "nonceStr" : "<%=nonceStr%>", "package" : "<%=packageValue%>","signType" : "MD5", "paySign" : "<%=paySign%>" 
   			},function(res){
				WeixinJSBridge.log(res.err_msg);
 				
	            if(res.err_msg == "get_brand_wcpay_request:ok"){ 
	           // alert("用户成功支付!");
	            
	               $.post("<%=path%>/getTephone","ID="+${user.ID},
	               function(data){
	        	   if(data=="exist"){
	        		   window.location.href="<%=path%>/wxser?id=191";
	        	   }else{
	        		   window.location.href="wxmaterialpay.jsp";
	        	   }
	           });  
	            }else if(res.err_msg == "get_brand_wcpay_request:cancel"){  
	                alert("用户取消支付!");  
	           }else{  
	           alert(res.err_msg);
	               alert("支付失败!");  
	            }  
			})
		}
		
		
		
		
		
  </script>


<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path%>/js/wxpublic.js"></script>
<script type="text/javascript">
	$('.user_xy').on('touchstart', function() {
		$('.agreen_mask').show();
	});
	$('.mask_close').on('touchstart', function() {
		$('.agreen_mask').hide();
	});
</script>