package com.india.digit.shop.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int category_Id;
	private String category_Title;
	private String category_Description;
	
	@OneToMany(mappedBy = "category")
	//@JoinColumn(name = "category")
	//private Set<Product> product=new HashSet<Product>();
	private List<Product> products = new ArrayList<Product>();
	
	
	
	
	public Category(int category_Id, String category_Title, String category_Description) {
		super();
		this.category_Id = category_Id;
		this.category_Title = category_Title;
		this.category_Description = category_Description;
	}
	public Category(String category_Title, String category_Description,List<Product> products) {
		super();
		this.category_Title = category_Title;
		this.category_Description = category_Description;
		this.products=products;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Category [category_Id=" + category_Id + ", category_Title=" + category_Title + ", category_Description="
				+ category_Description + "]";
	}
	public int getCategory_Id() {
		return category_Id;
	}
	public void setCategory_Id(int category_Id) {
		this.category_Id = category_Id;
	}
	public String getCategory_Title() {
		return category_Title;
	}
	public void setCategory_Title(String category_Title) {
		this.category_Title = category_Title;
	}
	public String getCategory_Description() {
		return category_Description;
	}
	public void setCategory_Description(String category_Description) {
		this.category_Description = category_Description;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProduct(List<Product> products) {
		this.products = products;
	}
	
	

}
