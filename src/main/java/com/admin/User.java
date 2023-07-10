package com.admin;

public class User {
	public static int id;
	public static String name;
	public static String email;
	public static String mobileno;
	public static String location;
	public static String city;
	public static String taluka;
	public static String password;
	public static double latitude;
	public static double longitude;
	
	public static double getLatitude() {
		return latitude;
	}
	public static void setLatitude(double latitude) {
		User.latitude = latitude;
	}
	public static double getLongitude() {
		return longitude;
	}
	public static void setLongitude(double longitude) {
		User.longitude = longitude;
	}
	public static int getId() {
		return id;
	}
	public static void setId(int id) {
		User.id = id;
	}
	public static String getName() {
		return name;
	}
	public static void setName(String name) {
		User.name = name;
	}
	public static String getEmail() {
		return email;
	}
	public static void setEmail(String email) {
		User.email = email;
	}
	public static String getMobileno() {
		return mobileno;
	}
	public static void setMobileno(String mobileno) {
		User.mobileno = mobileno;
	}
	public static String getLocation() {
		return location;
	}
	public static void setLocation(String location) {
		User.location = location;
	}
	public static String getCity() {
		return city;
	}
	public static void setCity(String city) {
		User.city = city;
	}
	public static String getTaluka() {
		return taluka;
	}
	public static void setTaluka(String taluka) {
		User.taluka = taluka;
	}
	public static String getPassword() {
		return password;
	}
	public static void setPassword(String password) {
		User.password = password;
	}
}
