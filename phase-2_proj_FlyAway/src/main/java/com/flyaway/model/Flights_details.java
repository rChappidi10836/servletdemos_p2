package com.flyaway.model;

public class Flights_details {
	
	private int id;
	private String company;
	private String dates;
	private String source;
	private String destination;
	private int seats;
	private int price;
	
	
	
	public Flights_details(String company, String dates, String source, String destination, int seats, int price) {
		super();
		this.company = company;
		this.dates = dates;
		this.source = source;
		this.destination = destination;
		this.seats = seats;
		this.price = price;
	}
	public Flights_details(int id, String company, String dates, String source, String destination, int seats,
			int price) {
		super();
		this.id = id;
		this.company = company;
		this.dates = dates;
		this.source = source;
		this.destination = destination;
		this.seats = seats;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

}
