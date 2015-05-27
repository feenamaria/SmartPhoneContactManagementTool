package com.springpackage.newone;

import java.util.List;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

/**
 * @author Finu
 *
 */
@PersistenceCapable
public class ContactDetails {

	@PrimaryKey
	@Persistent
	String firstName;

	@Persistent
	String lastName;

	@Persistent
	List<String> phoneNumber;

	@Persistent
	List<String> phoneType;

	@Persistent
	List<String> emailId;

	@Persistent
	List<String> emailType;

	@Persistent
	List<String> address;

	@Persistent
	List<String> addressType;

	@Persistent
	List<String> groups;

	@Persistent
	String messageAlert;

	@Persistent
	String ringTone;

	@Persistent
	String vibrationPattern;

	@Persistent
	String isFavourite;

	public String getMessageAlert() {
		return messageAlert;
	}

	public void setMessageAlert(String messageAlert) {
		this.messageAlert = messageAlert;
	}

	public String getRingTone() {
		return ringTone;
	}

	public void setRingTone(String ringTone) {
		this.ringTone = ringTone;
	}

	public String getVibrationPattern() {
		return vibrationPattern;
	}

	public void setVibrationPattern(String vibrationPattern) {
		this.vibrationPattern = vibrationPattern;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public List<String> getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(List<String> phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public List<String> getPhoneType() {
		return phoneType;
	}

	public void setPhoneType(List<String> phoneType) {
		this.phoneType = phoneType;
	}

	public List<String> getEmailId() {
		return emailId;
	}

	public void setEmailId(List<String> emailId) {
		this.emailId = emailId;
	}

	public List<String> getEmailType() {
		return emailType;
	}

	public void setEmailType(List<String> emailType) {
		this.emailType = emailType;
	}

	public List<String> getAddress() {
		return address;
	}

	public void setAddress(List<String> address) {
		this.address = address;
	}

	public List<String> getAddressType() {
		return addressType;
	}

	public void setAddressType(List<String> addressType) {
		this.addressType = addressType;
	}

	public List<String> getGroups() {
		return groups;
	}

	public void setGroups(List<String> groups) {
		this.groups = groups;
	}

	public String getIsFavourite() {
		return isFavourite;
	}

	public void setIsFavourite(String isFavourite) {
		this.isFavourite = isFavourite;
	}

	public ContactDetails(String firstName, String lastName,
			List<String> phoneNumber, List<String> phoneType,
			List<String> emailId, List<String> emailType, List<String> address,
			List<String> addressType, List<String> groups, String messageAlert,
			String ringTone, String vibrationPattern, String isFavourite) {

		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.phoneType = phoneType;
		this.emailId = emailId;
		this.emailType = emailType;
		this.address = address;
		this.addressType = addressType;
		this.groups = groups;
		this.messageAlert = messageAlert;
		this.ringTone = ringTone;
		this.vibrationPattern = vibrationPattern;
		this.isFavourite = isFavourite;
	}
}