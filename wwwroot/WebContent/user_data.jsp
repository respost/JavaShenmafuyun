<%@page import="com.smfy.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 引入JDK时间格式 -->
<%@page import="java.text.SimpleDateFormat" %>
	<% 
	String userName="";
	float userMoney=0;
	float userAvail=0;
	String userNick="";
	String realName="";//真实姓名
	float points=0;//积分
	String phone="";//手机号码
	String qq="";//QQ号码
	String email="";//邮箱
	String bankName="";//银行
	String bankCard="";//卡号
	String bankAddress="";//地址    
    String loginDate="";//最近登入时间
    String regDate="";//注册时间	
	String loginIp="电信";
    String vipIco="../images/vip/vip0.png";//vip图标
    String headPic="../images/head/default.jpg";//会员头像
	//获取Session的值
	User user=(User)session.getAttribute("user");
	//用户登录状态
	int status=user==null?0:1;
	if(user!=null){
		//获取对象的参数
		if(user.getGroupId()>1){
			vipIco="../images/vip/vip"+(user.getGroupId()-1)+".png";
		}
		headPic="../"+user.getPicPath();
		userMoney=user.getMoney();	
		userAvail=user.getAvail();
		points=user.getPoints();
		if(user.getName()!=null){
			userName=user.getName();
		}			
		if(user.getIp()!=null){
			loginIp=user.getIp();
		}
		if(user.getNick()!=null){
			userNick=user.getNick();
		}		
		if(user.getRealName()!=null){
			realName=user.getRealName();
		}
		if(user.getBankCard()!=null){
			bankCard=user.getBankCard();
		}
		if(user.getBankName()!=null){
			bankName=user.getBankName();
		}
		if(user.getBankAddress()!=null){
			bankAddress=user.getBankAddress();
		}	
		if(user.getPhone()!=null){
			phone=user.getPhone();			
		}
		if(user.getQq()!=null){
			qq=user.getQq();			
		}
		if(user.getEmail()!=null){
			email=user.getEmail();
		}
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	
		
		if(user.getLoginDate()!=null){
			loginDate=sdf.format(user.getLoginDate());
		}
		if(user.getRegDate()!=null){
			regDate=sdf.format(user.getRegDate());		
		}
				
	}
	%>	
