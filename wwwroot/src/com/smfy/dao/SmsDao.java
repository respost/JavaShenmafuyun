package com.smfy.dao;

public interface SmsDao {
	/**
	 * 发送短信
	 * @param phoneNumber 手机号码
	 * @return 返回发送的短信验证码
	 */
	int	sendSms(String phoneNumber);
}
