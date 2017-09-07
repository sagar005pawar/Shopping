package com.control;

import java.util.stream.Collectors;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.model.Products;
import com.service.ServiceIn;

@org.springframework.stereotype.Controller
@PropertySource(value = { "classpath:/SpringFM.properties" })
public class AdminControl {

	@Autowired
	private ServiceIn service;

	@SuppressWarnings("unused")
	@Autowired
	private Environment environment;
	
	@Autowired
	private HttpSession sess;

	
	@RequestMapping("/Homepage")
	public ModelAndView homepage() {
		return new ModelAndView("Homepage");
	}	

	@RequestMapping("/DisplayProductSections")
	public ModelAndView home() {
		try {			
			sess.setAttribute("sc", (service.getProducts()).stream().sorted((f1, f2)->f1.getType().toLowerCase().compareTo(f2.getType().toLowerCase())).map(Products::getType).distinct().collect(Collectors.toList()));
			return new ModelAndView("Home");
		} catch (Exception e) {
			return new ModelAndView("logout");
		}

	}	
	
	@RequestMapping(value="/SectionItemsList/{type}", method=RequestMethod.GET)
	public ModelAndView sectionItemsList(@PathVariable("type") String type) {
		try {
			System.out.println("SectionItemsListToUser.. "+ type);
			sess.setAttribute("asi", (service.getProducts()).stream().filter(p->p.getType().equals(type)).sorted((h1, h2)->h1.getPrName().compareToIgnoreCase(h2.getPrName())).collect(Collectors.toList()));
			return new ModelAndView("Products");
		} catch (Exception e) {
			return new ModelAndView("logout");
		}
	}	

	@RequestMapping("/LinkItemDeletion/{idsa}")
	public ModelAndView linkItemDeletion(@PathVariable("idsa") int id) {		
		try{
			if(service.ItemDeletion(String.valueOf(id))) {
				System.out.println("Deleted Product");
				return new ModelAndView("redirect:/Homepage");
			}else{
				System.out.println("Deletion Failure");
				return new ModelAndView("DeleteItem", "msg", "Deletion Failure ID= "+id);
			}												
		} catch (Exception e) {
			System.out.println("Deletion Failure");
			return new ModelAndView("DeleteItem", "msg", "Deletion Failure ID= " + id);
		}
	}	

	
	@RequestMapping("/LinkSectionDeletion/{type}")
	public ModelAndView linkSectionDeletion(@PathVariable("type") String type) {		
		try {
			if(service.SectionDeletion(type)) {
				System.out.println("Deleted Section");
				return new ModelAndView("redirect:/Homepage");
			} else {
				System.out.println("Deletion Failure");
				return new ModelAndView("DeleteItem", "msg", "Deletion Failure Section= " + type);
			}						
		} catch (Exception e) {
			System.out.println("Deletion Failure");
			return new ModelAndView("DeleteItem", "msg", "Deletion Failure Section= " + type);
		}
	}	

	@RequestMapping("/ItemDeletion")
	public ModelAndView itemDeletion(@ModelAttribute("id") int id) {		
		try{
			if(service.ItemDeletion(String.valueOf(id))) {
				System.out.println("Deleted Product");
				return new ModelAndView("DeleteItem", "msg", "Deleted ID= "+id);
			}else{
				System.out.println("Deletion Failure");
				return new ModelAndView("DeleteItem", "msg", "Deletion Failure ID= "+id);
			}												
		} catch (Exception e) {
			System.out.println("Deletion Failure");
			return new ModelAndView("DeleteItem", "msg", "Deletion Failure ID= " + id);
		}
	}	
	
	@RequestMapping("/SectionDeletion")
	public ModelAndView sectionDeletion(@ModelAttribute("type") String type) {		
		try {
			if(service.SectionDeletion(type)) {
				System.out.println("Deleted Section");
				return new ModelAndView("DeleteItem", "msg", "Deleted Section= " + type);
			} else {
				System.out.println("Deletion Failure");
				return new ModelAndView("DeleteItem", "msg", "Deletion Failure Section= " + type);
			}						
		} catch (Exception e) {
			System.out.println("Deletion Failure");
			return new ModelAndView("DeleteItem", "msg", "Deletion Failure Section= " + type);
		}
	}	

	@RequestMapping("/UpdateItem/{id}/{prname}/{type}/{qty}/{price}")
	public ModelAndView updateItem(@PathVariable("id") String id1,@PathVariable("prname") String prname,@PathVariable("type") String type,@PathVariable("qty") String qty,@PathVariable("price") String price) {
		Products p1 = new Products(Integer.parseInt(id1), prname, Integer.parseInt(qty), Double.parseDouble(price), type);
		System.out.println("Updating..");
		return new ModelAndView("Updating", "pro", p1);
	}	
	
	@RequestMapping("/UpdateProduct")
	public ModelAndView updateProduct(@ModelAttribute Products p, BindingResult br) {
		if(br.hasErrors()){
			return new ModelAndView("Updating", "msg", br.getAllErrors());			
		}
		System.out.println("Updating=  " + p);
		if (service.ItemUpdating(p)) {
			return new ModelAndView("Updating", "msg", p.getPrName() + " Updated...");	
		} else {
			return new ModelAndView("Updating", "msg", p.getPrName() + " NOT Updated...");
		}
	}

	@RequestMapping("/InsertItem/{type}")
	public ModelAndView insertItem(@PathVariable("type") String type) {		
		return new ModelAndView("InsertItem", "type", type);
	}

	@RequestMapping("/ItemInserting")
	public ModelAndView InsertingItem(@ModelAttribute() Products p, BindingResult br) {
		if(br.hasErrors()){
			return new ModelAndView("Updating", "msg", br.getAllErrors());			
		}
		System.out.println("Inserting=  " + p);
		if (service.ItemInserting(p)) {
			return new ModelAndView("InsertItem", "msg", p.getType() + " Inserted...");
		} else {
			return new ModelAndView("InsertItem", "msg", p.getType() + " NOT Inserted...");
		}
	}

	@RequestMapping(value="/AdminLogin", method = RequestMethod.POST)
	public ModelAndView validation(@RequestParam("usname") String usname, @RequestParam("pass") String pass) {
		if(usname.equals("admin")&&pass.equals("test")){
			sess.setAttribute("userLog", "login");
			return new ModelAndView("AdminHomePage");						
		} else {
			return new ModelAndView("AdminLoginPage");									
		}
	}	

	@RequestMapping("/AdminLogout")
	public String logout(){
		System.runFinalization();
//		service.exceptional();

		sess.setAttribute("userLog", "logout");
		sess.invalidate();

		Cookie c = new Cookie("name", "");
		c.setMaxAge(0);

		System.gc();
		System.out.println("logout");		
		return "AdminLoginPage";					
	}

	
	@RequestMapping(value="/updateItem", method=RequestMethod.GET)
	public String update(){
		return "UpdateItem";					
	}
	@RequestMapping(value="/insertItem", method=RequestMethod.GET)
	public String insert(){
		return "InsertItem";					
	}
	@RequestMapping(value="/deleteItem", method=RequestMethod.GET)
	public String delete(){
		return "DeleteItem";					
	}

	@RequestMapping(value="/Admin", method=RequestMethod.GET)
	public String admin(){
		return "AdminLoginPage";					
	}
	
	@RequestMapping(value="/AdminHome", method=RequestMethod.GET)
	public String adminHome(){
		return "AdminHomePage";					
	}
	
	
}
