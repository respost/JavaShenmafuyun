package com.smfy.entity;

import java.io.Serializable;

public class UserGroup implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String disc;
	
	public UserGroup() {
		super();
	}
	public UserGroup(String name, String disc) {
		super();
		this.name = name;
		this.disc = disc;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDisc() {
		return disc;
	}
	public void setDisc(String disc) {
		this.disc = disc;
	}


}
