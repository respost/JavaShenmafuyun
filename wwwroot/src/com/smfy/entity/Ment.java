package com.smfy.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Ment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private int cid;
	private String content;
	private Timestamp mentDate;
	private String reply;
	private Date reDate;
	private int uid;
	private int dpCount;//点赞次数
	private int status;
	private String title;//源码标题
	private String userName;
	private String userNick;
	private String userPic;//用户头像路径
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getMentDate() {
		return mentDate;
	}
	public void setMentDate(Timestamp mentDate) {
		this.mentDate = mentDate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getReDate() {
		return reDate;
	}
	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getDpCount() {
		return dpCount;
	}
	public void setDpCount(int dpCount) {
		this.dpCount = dpCount;
	}	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	
}
