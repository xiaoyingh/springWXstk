package com.jcxa.safe.controller;


import java.io.IOException;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;




import com.jcxa.safe.entity.Series;
import com.jcxa.safe.service.PlayService;
import com.utils.CommonUtil;
import com.utils.GetWxOrderno;
import com.utils.RequestHandler;
import com.utils.TenpayUtil;

@Controller
public class PCScansecondController {

	protected Logger log = Logger.getLogger(PCScansecondController.class);

	
	@Autowired
	private PlayService playService;

	@RequestMapping(value="/PCScansecondServlet")
	@ResponseBody
	public void topayServlet(HttpServletRequest request,HttpServletResponse response
			) {
	
				//网页授权后获取传递的参数
				String userId = request.getParameter("userId"); 	
				String orderNo = request.getParameter("orderNo"); 
				String money = request.getParameter("money");
				String code = request.getParameter("code");
				
				String[] strs=userId.split(",");
			    String serid=strs[2].toString();
				
			    int serids = Integer.parseInt(serid);
			    Series sers=playService.getplaySeries(serids);
				
				String title=sers.getTitle();
				String ur=sers.getPicURL();
				int pi=sers.getRealPrice();
		
				//金额转化为分为单位
				float sessionmoney = Float.parseFloat(money);
				String finalmoney = String.format("%.2f", sessionmoney);
				finalmoney = finalmoney.replace(".", "");
				
				//商户相关资料 
				String appid = "wx1d42fa2fba520d22";
				String appsecret = "caf5381cc5b63cb108c0fece2324834c";
				String partner = "1393692002";
				String partnerkey = "caf5381cc5b63cb108c0fece2324834c";
				
				
				String openId ="";
				String URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&secret="+appsecret+"&code="+code+"&grant_type=authorization_code";
				
				JSONObject jsonObject = CommonUtil.httpsRequest(URL, "GET", null);
				if (null != jsonObject) {
					openId = jsonObject.getString("openid");
				}
				
				//获取openId后调用统一支付接口https://api.mch.weixin.qq.com/pay/unifiedorder
						String currTime = TenpayUtil.getCurrTime();
						//8位日期
						String strTime = currTime.substring(8, currTime.length());
						//四位随机数
						String strRandom = TenpayUtil.buildRandom(4) + "";
						//10位序列号,可以自行调整。
						String strReq = strTime + strRandom;
						
						
						//商户号
						String mch_id = partner;
						//子商户号  非必输
						//String sub_mch_id="";
						//设备号   非必输
						String device_info="";
						//随机数 
						String nonce_str = strReq;
						//商品描述
						//String body = describe;
						
						//商品描述根据情况修改
						String body = "课程";
						//附加数据
						String attach = userId;
						//商户订单号
						String out_trade_no = orderNo;
						int intMoney = Integer.parseInt(finalmoney);
						
						//总金额以分为单位，不带小数点
						int total_fee = intMoney;
						//订单生成的机器 IP
						String spbill_create_ip = request.getRemoteAddr();
						//订 单 生 成 时 间   非必输
//						String time_start ="";
						//订单失效时间      非必输
//						String time_expire = "";
						//商品标记   非必输
//						String goods_tag = "";
						
						//这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
						String notify_url ="http://www.shoutike.com/wx/notifyServlet";
						
						String trade_type = "JSAPI";
						String openid = openId;
						//非必输
//						String product_id = "";
						SortedMap<String, String> packageParams = new TreeMap<String, String>();
						packageParams.put("appid", appid);  
						packageParams.put("mch_id", mch_id);  
						packageParams.put("nonce_str", nonce_str);  
						packageParams.put("body", body);  
						packageParams.put("attach", attach);  
						packageParams.put("out_trade_no", out_trade_no);  
						
						
						//这里写的金额为1 分到时修改
						//packageParams.put("total_fee", "1");  
						packageParams.put("total_fee", finalmoney);  
						packageParams.put("spbill_create_ip", spbill_create_ip);  
						packageParams.put("notify_url", notify_url);  
						
						packageParams.put("trade_type", trade_type);  
						packageParams.put("openid", openid);  

						RequestHandler reqHandler = new RequestHandler(request, response);
						reqHandler.init(appid, appsecret, partnerkey);
						
						String sign = reqHandler.createSign(packageParams);
						String xml="<xml>"+
								"<appid>"+appid+"</appid>"+
								"<mch_id>"+mch_id+"</mch_id>"+
								"<nonce_str>"+nonce_str+"</nonce_str>"+
								"<sign>"+sign+"</sign>"+
								"<body><![CDATA["+body+"]]></body>"+
								"<attach>"+attach+"</attach>"+
								"<out_trade_no>"+out_trade_no+"</out_trade_no>"+
								//金额，这里写的1 分到时修改
								//"<total_fee>"+1+"</total_fee>"+
								"<total_fee>"+finalmoney+"</total_fee>"+
								"<spbill_create_ip>"+spbill_create_ip+"</spbill_create_ip>"+
								"<notify_url>"+notify_url+"</notify_url>"+
								"<trade_type>"+trade_type+"</trade_type>"+
								"<openid>"+openid+"</openid>"+
								"</xml>";
						String code_url = "";
						String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
						
						
						code_url = new GetWxOrderno().getCodeUrl(createOrderURL, xml);
						System.out.println("code_url----------------"+code_url);
						
						//return code_url;
						
					
						try {
							response.sendRedirect("https://www.shoutike.com/views/wxorder.jsp?codeurl="+code_url+"&titles="+title+"&ur="+ur+"&pi="+pi);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
		
	}

}
