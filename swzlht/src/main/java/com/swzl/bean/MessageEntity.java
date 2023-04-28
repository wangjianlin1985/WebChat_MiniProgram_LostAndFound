package com.swzl.bean;

/**
 * 留言信息对象
 * @author Administrator
 */
public class MessageEntity {
	private String id;
	private String userId;
	private String lostId;
	private String content;
	private String userName;

	public String getLostId() {
		return lostId;
	}

	public void setLostId(String lostId) {
		this.lostId = lostId;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
