package com.nextgen.entities;

import java.util.ArrayList;

public class Invite {
	private String creator;
	private String realm;
	private String email;
	private Entitee invitor;
	private Entitee invitee;
	private Entitee targetOrganization;
	
	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
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

	public Entitee getInvitor() {
		return invitor;
	}

	public void setInvitor(Entitee invitor) {
		this.invitor = invitor;
	}

	public Entitee getInvitee() {
		return invitee;
	}

	public void setInvitee(Entitee invitee) {
		this.invitee = invitee;
	}

	public Entitee getTargetOrganization() {
		return targetOrganization;
	}

	public void setTargetOrganization(Entitee targetOrganization) {
		this.targetOrganization = targetOrganization;
	}

	public class Entitee {
		private String id;
		private String type;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
	}
}
