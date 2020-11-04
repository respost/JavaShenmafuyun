package com.smfy.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Ô´ÂëÊµÌå
 * @author Administrator
 *
 */
public class Code implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String title;
	private int typeId;
	private String typeName;
	private String typeIco;
	private float price;
	private int adminId;
	private String adminName;
	private String adminPic;
	private int userId;
	private String userName;
	private String userNick;
	private String userPic;
	private String origin;
	private Date update;
	private String keywords;
	private String summary;
	private String content;
	private int sort;
	private int status;
	private int acs;
	private int lookCount;
	private int mentCount;
	private int downCount;
	private int dpCount;
	private String downUrl;
	private String extPwd;
	private String decomPwd;
	private String tbPath;
	private String filePath;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getTypeIco() {
		return typeIco;
	}
	public void setTypeIco(String typeIco) {
		this.typeIco = typeIco;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPic() {
		return adminPic;
	}
	public void setAdminPic(String adminPic) {
		this.adminPic = adminPic;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public Date getUpdate() {
		return update;
	}
	public void setUpdate(Date update) {
		this.update = update;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAcs() {
		return acs;
	}
	public void setAcs(int acs) {
		this.acs = acs;
	}
	public int getLookCount() {
		return lookCount;
	}
	public void setLookCount(int lookCount) {
		this.lookCount = lookCount;
	}
	public int getMentCount() {
		return mentCount;
	}
	public void setMentCount(int mentCount) {
		this.mentCount = mentCount;
	}
	public int getDownCount() {
		return downCount;
	}
	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}	
	public int getDpCount() {
		return dpCount;
	}
	public void setDpCount(int dpCount) {
		this.dpCount = dpCount;
	}
	public String getDownUrl() {
		return downUrl;
	}
	public void setDownUrl(String downUrl) {
		this.downUrl = downUrl;
	}
	public String getExtPwd() {
		return extPwd;
	}
	public void setExtPwd(String extPwd) {
		this.extPwd = extPwd;
	}
	public String getDecomPwd() {
		return decomPwd;
	}
	public void setDecomPwd(String decomPwd) {
		this.decomPwd = decomPwd;
	}
	public String getTbPath() {
		return tbPath;
	}
	public void setTbPath(String tbPath) {
		this.tbPath = tbPath;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
}
