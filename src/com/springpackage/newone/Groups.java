package com.springpackage.newone;

import java.util.List;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
@PersistenceCapable
public class Groups {

	@PrimaryKey
	@Persistent
	String groupName;

	@Persistent
	List<String> memberNames;

	@Persistent
	String wallPaper;

	@Persistent
	String ringTone;

	@Persistent
	int memberCount;

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public List<String> getMemberNames() {
		return memberNames;
	}

	public void setMemberNames(List<String> memberNames) {
		this.memberNames = memberNames;
	}

	public String getWallPaper() {
		return wallPaper;
	}

	public void setWallPaper(String wallPaper) {
		this.wallPaper = wallPaper;
	}

	public String getRingTone() {
		return ringTone;
	}

	public void setRingTone(String ringTone) {
		this.ringTone = ringTone;
	}

	public Groups(String groupName,List<String> memberNames, String wallPaper,
			String ringTone) {
		this.groupName = groupName;
		this.memberNames = memberNames;
		this.wallPaper = wallPaper;
		this.ringTone = ringTone;
		}

}
