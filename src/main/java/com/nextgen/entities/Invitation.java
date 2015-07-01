package com.nextgen.entities;

public class Invitation {
	private String id;
	private long version;
	private String creator;
	private long creation;
	private String realm;
	private String email;
	private Invitor invitor;
	private Organization targetOrganization;
	private String invitationCode;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getVersion() {
		return version;
	}
	public void setVersion(long version) {
		this.version = version;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public long getCreation() {
		return creation;
	}
	public void setCreation(long creation) {
		this.creation = creation;
	}
	public String getRealm() {
		return realm;
	}
	public void setRealm(String realm) {
		this.realm = realm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Invitor getInvitor() {
		return invitor;
	}
	public void setInvitor(Invitor invitor) {
		this.invitor = invitor;
	}
	public Organization getTargetOrganization() {
		return targetOrganization;
	}
	public void setTargetOrganization(Organization targetOrganization) {
		this.targetOrganization = targetOrganization;
	}
	public String getInvitationCode() {
		return invitationCode;
	}
	public void setInvitationCode(String invitationCode) {
		this.invitationCode = invitationCode;
	}
}
