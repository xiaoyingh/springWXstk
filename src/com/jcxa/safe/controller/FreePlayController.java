package com.jcxa.safe.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jcxa.safe.entity.Prolocutor;
import com.jcxa.safe.entity.Series;
import com.jcxa.safe.entity.Seriesvideo;
import com.jcxa.safe.entity.Users;
import com.jcxa.safe.entity.WxUser;
import com.jcxa.safe.service.OrderService;
import com.jcxa.safe.service.PlayService;
import com.jcxa.safe.service.ProlocutorService;
import com.jcxa.safe.service.VipService;
import com.jcxa.safe.service.ZanService;




@Controller
public class FreePlayController {

	protected Logger log = Logger.getLogger(FreePlayController.class);
	@Autowired
	private OrderService orderService;
	@Autowired
	private PlayService playService;
	@Autowired
	private VipService vipService;
	@Autowired
	private ZanService zanService;
	
	@Autowired
	private ProlocutorService prolocutorService;
	
	@RequestMapping(value = "/freeplay")
	public String freeplay(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID,
			@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value="prolocutor",required = false,defaultValue="a") String prolocutor) {
		
		playService.ClickRate(seriesID);
		int vid=0;
		
		List<Seriesvideo> lsvideo = null;// 免费视频集合
		List<Seriesvideo> videopay = null;// 付费视频集合
		
		int sid=0;
		String eqq=null;
		//取出用户信息
		Users user = (Users) session.getAttribute("user");
		WxUser wxuser = (WxUser) session.getAttribute("wxuser");
		String prolocutorplay="a";
		if(user!=null){
			prolocutorplay=prolocutorService.selspro(user.getID());
		}
		//
		if(!prolocutor.equals("a")){
			
			//当前自己的状态
			String openid=wxuser.getOpenid();
			//int proid=prolocutorService.selproid(prolocutor);
			int WXopenid=0;
			try {
				WXopenid=prolocutorService.selproopenidd(prolocutor);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			String Openidchuan="a";
			//传过来的状态
			if(WXopenid!=0){
				 Openidchuan=prolocutorService.wxuseropenidd(WXopenid);
			}
				if(openid != Openidchuan){		
					//自己是否已经成为了下级
				  if(prolocutorService.onlydaiyan(openid)){
					  //判断自己是否已经主动成为了代理人
					//String spro=prolocutorService.selspro(nowid);
					  int zhuid=prolocutorService.openidzhu(openid);
					  
					  String spro="a";
					  try {
						  spro=prolocutorService.wxprolocutor(zhuid);
						  if(spro==null){
							  spro="a";  
						  }
					} catch (Exception e) {
						// TODO: handle exception
						spro="a";
					}
					 
					  if("a".equals(spro)){
						java.sql.Date nowSql = new java.sql.Date(System.currentTimeMillis());
						Prolocutor ps=new Prolocutor();
						ps.setProlocutor(prolocutor);
						ps.setOpenid(openid);
						ps.setCreateTime(nowSql);
						prolocutorService.adddaiyan(ps);	
						}
					}
				}
			}
		//
		
		lsvideo = orderService.getvideo(seriesID);
		int ids = 0;
		if(id ==null){
			//得到封面默认的第一个视频ID
			for (int i = 0; i < lsvideo.size(); i++) {
				ids = lsvideo.get(0).getID();
			}
			
		}
		//给具体视频的ID赋值
				if(id==null){
					vid=ids;
				}else{
					vid=id;
				}
				
				//得到每一个具体视频的信息
				Seriesvideo itemvo = orderService.playvideo(vid);
				//得到下一个具体视频的信息
				int maxsort = 0;
				if(id != null){	
					 maxsort = lsvideo.get(lsvideo.size() - 1).getSort();
				}
				int nextsort = 0;
				int nextid = 0;
				if(id != null){
					if (itemvo.getSort() < maxsort) {
						nextsort = itemvo.getSort() + 1;
					} else {
						nextsort = maxsort;
					}
					Seriesvideo nextitemvo = orderService.selnext(seriesID, nextsort);
					//得到下一个具体视频的ID
					nextid = nextitemvo.getID();
		}
		//查询课程封面的信息
		Series sers=playService.getplaySeries(seriesID);
		String Title=sers.getTitle();
		Integer userid;
		//视频点赞
//		if(wxuser!=null){
//			System.out.println("weixin用户748565441"+wxuser.toString());
//			userid=wxuser.getID();
//			boolean flag = zanService.selectVideoService(userid, vid);
//			map.put("flag", flag);
//			System.out.println(flag+"789878999");
//
//		}else{
//			System.out.println("user用户748565441"+wxuser.toString());
//			userid=user.getID();
//			boolean flag = zanService.selectVideoService(userid, vid);
//			map.put("flag", flag);
//			System.out.println(flag+"789878999");
//
//		}
		if(user!=null){
			boolean flag = zanService.selectVideoService(user.getID(), vid);
			map.put("flag", flag);
		}else{
			//boolean flag = zanService.selectVideoService(wxuser.getID(), vid);
			boolean flag=false;
			map.put("flag", flag);
		}
		Integer voZan = zanService.selectZanVService(vid);
		System.out.println("视频点赞+++++++++" + voZan);
		map.put("voZan", voZan);
		
				//封面的Title
				map.put("Title", Title);
				//免费视频
				map.put("lsvideo", lsvideo);
				map.put("playing", vid);
				//视频的详细信息
				map.put("itemvo", itemvo);
				//下一个视频的ID
				map.put("nextid", nextid);
				map.put("nowserid", seriesID);
				map.put("show", null);
				map.put("zhuanqu", "free");
				map.put("prolocutorplay", prolocutorplay);
				return "views/wxplay.jsp";
	}
	
}
