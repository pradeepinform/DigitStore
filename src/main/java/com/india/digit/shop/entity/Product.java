 package com.india.digit.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int product_Id;
	private String product_Name;
	@Column(length = 5000)
	private String product_Description;
	private String product_Photo;
	private int  product_Price;
	private int  product_Discount;
	private int product_Quantity;
	private String link;
	
	@ManyToOne
	private Category category;
	
	

	public int getProduct_Id() {
		return product_Id;
	}

	public void setProduct_Id(int product_Id) {
		this.product_Id = product_Id;
	}

	public String getProduct_Name() {
		return product_Name;
	}

	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}

	public String getProduct_Description() {
		return product_Description;
	}

	public void setProduct_Description(String product_Description) {
		this.product_Description = product_Description;
	}

	public String getProduct_Photo() {
		return product_Photo;
	}

	public void setProduct_Photo(String product_Photo) {
		this.product_Photo = product_Photo;
	}

	public int getProduct_Price() {
		return product_Price;
	}

	public void setProduct_Price(int product_Price) {
		this.product_Price = product_Price;
	}

	public int getProduct_Discount() {
		return product_Discount;
	}

	public void setProduct_Discount(int product_Discount) {
		this.product_Discount = product_Discount;
	}

	public int getProduct_Quantity() {
		return product_Quantity;
	}

	public void setProduct_Quantity(int product_Quantity) {
		this.product_Quantity = product_Quantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	
	
}