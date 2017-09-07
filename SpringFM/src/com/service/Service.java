package com.service;

import java.util.*;
import com.dao.*;
import com.model.*;

public class Service implements ServiceIn {

	private DAO dao;

	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}

	@Override
	public User getUser(String username, String password) {
		return this.dao.getUser(username, password);
	}

	@Override
	public User validateUser(User u1) {
		return this.dao.validateUser(u1);
	}

	@Override
	public List<Products> getProducts() {
		return this.dao.getProducts();
	}

	@Override
	public void closeSession() {
		this.dao.closeSession();
	}

	@Override
	public void exceptional() {
		this.dao.exceptional();
	}

	@Override
	public User SingupDAO(User u1) {
		return this.dao.SingupDAO(u1);
	}

	@Override
	public List<Products> SectonItemsList(String type) {
		return this.dao.SectonItemsList(type);
	}

	@Override
	public List<Products> SectonItemsListfR(String type) {
		return this.dao.SectonItemsListfR(type);
	}

	@Override
	public boolean ReplaceItems(Shopping s1) {
		return this.dao.ReplaceItems(s1);
	}

	@Override
	public boolean RShopItemUpdating(int id, String prname, String type, int qta, double price) {
		return this.dao.RShopItemUpdating(id, prname, type, qta, price);
	}

	@Override
	public List<Products> DPSections() {
		return this.dao.DPSections();
	}

	@Override
	public boolean SectionDeletion(String type) {
		return this.dao.SectionDeletion(type);
	}

	@Override
	public boolean ItemDeletion(String id) {
		return this.dao.ItemDeletion(id);
	}

	@Override
	public boolean ItemUpdating(Products p) {
		return this.dao.ItemUpdating(p);
	}

	@Override
	public boolean ItemInserting(Products p) {
		return this.dao.ItemInserting(p);
	}

	@Override
	public Shopping Commander(int n, int a, double p, String ft, String i, String u, double total) {
		return this.dao.Commander(n, a, p, ft, i, u, total);
	}

	@Override
	public List<Shopping> shoppingtable() {
		return this.dao.shoppingtable();
	}

	@Override
	public void ShoppingTruncate() {
		this.dao.ShoppingTruncate();
	}

	@Override
	public boolean ReplaceSingleItem(Shopping s1) {
		return this.dao.ReplaceSingleItem(s1);
	}

	@Override
	public Shopping latestCommander(Products p, double total) {
		return this.dao.latestCommander(p, total);
	}
		
}
