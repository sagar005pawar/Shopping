package com.model;

import java.io.Serializable;
import java.util.Comparator;

public class Products implements Cloneable, Serializable, Comparable<Products> {
	private int Id;
	private String PrName;
	private int QA;
	private double Price;
	private String Type;
	
	private int QN;
	private double Amt;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getPrName() {
		return PrName;
	}

	public void setPrName(String prName) {
		PrName = prName;
	}

	public int getQA() {
		return QA;
	}

	public void setQA(int qA) {
		QA = qA;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public int getQN() {
		return QN;
	}

	public void setQN(int qN) {
		QN = qN;
	}

	public double getAmt() {
		return Amt;
	}

	public void setAmt(double amt) {
		Amt = amt;
	}

	public Object clone() throws CloneNotSupportedException{
		return super.clone();
	}
	
	public Products(int id, String prName, int qA, double price, String type) {
		super();
		Id = id;
		PrName = prName;
		QA = qA;
		Price = price;
		Type = type;
	}

	public Products() {
		super();
		Id = 0;
		PrName = null;
		QA = 0;
		Price = 0.0d;
		Type = null;
	}
	
	@Override
	public String toString() {
		return "Products [Id=" + Id + ", PrName=" + PrName + ", QA=" + QA + ", Price=" + Price + ", Type=" + Type + ", QN=" + QN + "]";
	}

	@Override
	public int compareTo(Products p) {
		return this.Id-p.Id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(Amt);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + Id;
		result = prime * result + ((PrName == null) ? 0 : PrName.hashCode());
		temp = Double.doubleToLongBits(Price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + QA;
		result = prime * result + QN;
		result = prime * result + ((Type == null) ? 0 : Type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Products other = (Products) obj;
		if (Double.doubleToLongBits(Amt) != Double.doubleToLongBits(other.Amt))
			return false;
		if (Id != other.Id)
			return false;
		if (PrName == null) {
			if (other.PrName != null)
				return false;
		} else if (!PrName.equals(other.PrName))
			return false;
		if (Double.doubleToLongBits(Price) != Double.doubleToLongBits(other.Price))
			return false;
		if (QA != other.QA)
			return false;
		if (QN != other.QN)
			return false;
		if (Type == null) {
			if (other.Type != null)
				return false;
		} else if (!Type.equals(other.Type))
			return false;
		return true;
	}
	
}
