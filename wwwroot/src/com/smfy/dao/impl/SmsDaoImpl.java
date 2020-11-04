package com.smfy.dao.impl;

import com.smfy.dao.SmsDao;
import com.smfy.util.SmsSet;

import java.util.ArrayList;

import com.qcloud.sms.SmsSingleSender;
import com.qcloud.sms.SmsSingleSenderResult;

public class SmsDaoImpl implements SmsDao {

	@Override
	public int sendSms(String phoneNumber) {
		// TODO Auto-generated method stub
		//SDK AppID
		int appid = SmsSet.appid;
		//App Key
		String appkey = SmsSet.appkey;
		//模板Id
		int tmplId = SmsSet.tmplId;
		//随机生成6个验证码
		int max=999999;
		int min=100000;
		int number=(int) (Math.random()*(max-min))+min;
		System.out.println("生成的6位随机验证码是："+number);			
		try {
			 //初始化单发
	    	SmsSingleSender singleSender = new SmsSingleSender(appid, appkey);
	    	SmsSingleSenderResult singleSenderResult;
	    	 //指定模板单发
	    	 //假设短信模板 id 为 1，模板内容为：{1}为您的动态登录验证码，请于{2}分钟内填写。如非本人操作，请忽略本短信。
	    	ArrayList<String> params = new ArrayList<>();
	    	params.add(number+"");
	    	params.add("5");
	    	singleSenderResult = singleSender.sendWithParam("86", phoneNumber, tmplId, params, "", "","");
	    	System.out.println(singleSenderResult);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return number;
	}

}
