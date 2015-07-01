package com.nextgen.entities;

import java.util.ArrayList;

public class Address {
	private ArrayList<String> streets;
	private String city;
	private String state;
	private String postal;
	private String country;
	
	public ArrayList<String> getStreet() {
		return streets;
	}
	public void setStreet(ArrayList<String> streets) {
		this.streets = streets;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPostal() {
		return postal;
	}
	public void setPostal(String postal) {
		this.postal = postal;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
}
