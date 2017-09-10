package com.control;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.*;
import java.util.stream.Collectors;
import com.google.gson.Gson;
import com.model.*;
import com.service.ServiceIn;
import rest.ProductForm;

@org.springframework.stereotype.Controller
@PropertySource(value = { "classpath:/SpringFM.properties" })
public class Controller {

	//@SessionAttributes({"user", "userLog", "sc", "asi", "shopping", "total"})
	private static final Logger logger = LoggerFactory.getLogger(Controller.class);

	@Autowired
	private ServiceIn service;
	
	@Autowired
	private Environment environment;
	
	@Autowired
	private HttpSession sess;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/sortList/{var}/{from}/{type}", method=RequestMethod.GET)
	public ModelAndView sortList(@PathVariable("var") String var, @PathVariable("from") String from, @PathVariable("type") String type) {		
		try {
			System.out.println("Sorted By " + var+" "+type+" "+from);
			List<Products> a1 = new ArrayList<>();
			a1 = (ArrayList<Products>) sess.getAttribute("asi");
			switch (var) {
				case "id":
					Collections.sort(a1);
					break;
				case "name":
					Collections.sort(a1, (p1, p2)->p1.getPrName().compareToIgnoreCase(p2.getPrName()));
					break;
				case "qty":
					Collections.sort(a1, new QaComparator());
					break;
				case "price":
					Collections.sort(a1, new PriceComparator());
					break;
				default:
					break;
			}
			sess.setAttribute("asi", a1);				
			if(from.equals("admin")){
				return new ModelAndView("Products");
			} else{
				return new ModelAndView("UserProducts");
			}

		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("Wel");
		}
	}	

	@RequestMapping("/searchAJAX/{term}")
	public void searchAJAX(HttpServletResponse resp, @PathVariable("term") String term) {
		try {
			String t = term.trim();
			if (t!="" && t!=null && t!=" ") {
                String searchList = new Gson().toJson(((List<Products>) sess.getAttribute("Products")).stream().filter(p->p.getPrName().toLowerCase().contains(t.toLowerCase())).map(Products::getPrName).distinct().limit(4).collect(Collectors.toList()));
                System.out.println("searchList= " + searchList);
                resp.getWriter().write(searchList);
			} else {
	            resp.getWriter().write(" ");					
			}
		} catch (Exception e) {
			System.out.println(e);
		}							
	}
	
	@RequestMapping("/searchAJAXpro/{prname}")
	public ModelAndView searchAJAXpro(@PathVariable("prname") String prname){
		try {
			sess.setAttribute("asi", (service.getProducts()).stream().filter(p->p.getPrName().toLowerCase().equals(prname.toLowerCase())).collect(Collectors.toList()));
			return new ModelAndView("UserProducts");
		} catch (Exception e) {
			return new ModelAndView("redirect:/logout");
		}		
	}
	
	@RequestMapping("/AsearchAJAXpro/{prname}")
	public ModelAndView asearchAJAXpro(@PathVariable("prname") String prname){
		try {
			System.out.println("SectionItemsListToUser.. "+ prname);
			sess.setAttribute("asi", (service.getProducts()).stream().filter(p->p.getPrName().toLowerCase().equals(prname.toLowerCase())).collect(Collectors.toList()));
			return new ModelAndView("Products");
		} catch (Exception e) {
			return new ModelAndView("redirect:/AdminLogout");
		}		
	}

	
	@SuppressWarnings("unchecked")
	@RequestMapping("/removeItem/{prname}")
	public ModelAndView removeItem(@PathVariable("prname") String prname){
		try {
			Shopping T = (Shopping) sess.getAttribute("total");
			List<Shopping> a3 = new ArrayList<Shopping>();
			if((T.getTotal())!=0){
				for (Shopping s2:(ArrayList<Shopping>) sess.getAttribute("shopping")) {
					if(prname.equals(s2.getPrName())){
						boolean status=service.ReplaceSingleItem(s2);
						if(status){
							T.setTotal(T.getTotal()-s2.getAmt());
							sess.setAttribute("total", T);
							System.out.println("Repalced Item= "+s2.getPrName());
						}								
					} else {
						a3.add(s2);
					}
				}
				sess.setAttribute("shopping", a3);
			}
			return new ModelAndView("Pay");
		} catch (Exception e) {
//			d1.closeSession();
			System.out.println("Exception at Replacing Item case" +e);
			return new ModelAndView("Wel");
		}		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/ShoppingClear")
	public ModelAndView shoppingClear(){
		try {
			Shopping T = (Shopping) sess.getAttribute("total");
			if((T.getTotal())!=0){
				for (Shopping s5:(ArrayList<Shopping>) sess.getAttribute("shopping")) {
					boolean status = (service.ReplaceItems(s5));
					if(status==true){System.out.println("Repalced Item= "+s5);}
				}
			}
			service.ShoppingTruncate();
			T.setTotal(0.0d);
			sess.setAttribute("total", T);
			sess.setAttribute("shopping", service.shoppingtable());						
			return new ModelAndView("Pay");
		} catch (Exception e) {
			return new ModelAndView("Wel");
		}
	} 
	
	@RequestMapping("/LatestCommander")
	public ModelAndView latestCommander(@ModelAttribute("products") ProductForm p, BindingResult br) {
		if(br.hasErrors()){
			System.out.println("errors= " + br.getErrorCount());
			System.out.println(br.getAllErrors());
			return new ModelAndView("Wel.jsp");
		}
		try {
			System.out.println("LatestCommander..");
			Shopping T = (Shopping) sess.getAttribute("total");
			for(Products p1:p.getProdList()){
				if(p1.getQN()>0){
					System.out.println(p1);
					T = service.latestCommander(p1, T.getTotal());
				}
			}
			sess.setAttribute("total", T);
			sess.setAttribute("shopping", service.shoppingtable());						
			return new ModelAndView("Pay");
		} catch (Exception e) {
			return new ModelAndView("Wel");
		}
	}	

	@RequestMapping("/UserHomepage")
	public ModelAndView userHomepage() {
		sess.setAttribute("Products", (service.getProducts()).stream().collect(Collectors.toList()));
		return new ModelAndView("UserHomepage");
	}	

	@RequestMapping("/DisplayProductSectionsUserHome")
	public ModelAndView userHome() {
		try {			
			sess.setAttribute("sc", (service.getProducts()).stream().sorted((f1, f2)->f1.getType().toLowerCase().compareTo(f2.getType().toLowerCase())).map(Products::getType).distinct().collect(Collectors.toList()));
			return new ModelAndView("UserHome");
		} catch (Exception e) {
			return new ModelAndView("redirect:/logout");
		}

	}	
	
	@RequestMapping("/SectionItemsListToUser/{type}")
	public ModelAndView sectionItemsListToUser(@PathVariable("type") String type) {
		try {
			System.out.println("SectionItemsListToUser.. "+ type);
			sess.setAttribute("asi", (service.getProducts()).stream().filter(p->p.getType().equals(type)).sorted((h1, h2)->h1.getPrName().compareToIgnoreCase(h2.getPrName())).collect(Collectors.toList()));
			return new ModelAndView("UserProducts");
		} catch (Exception e) {
			return new ModelAndView("Wel");
		}
	}	
	
	@RequestMapping("/SignupCntl")
	public ModelAndView signupCntl(@ModelAttribute("user") User u, BindingResult br) {
		String msg = null;
		if(br.hasErrors()){
			System.out.println("errors= " + br.getErrorCount());
			msg = "NOT Register ERROR in: " + br.getFieldError().getField();
		}
		if(!br.hasErrors()){
			System.out.println(u);
			service.SingupDAO(u);
			msg = "User Registered..";
		}
		return new ModelAndView("Login", "msg", msg);			
	}			
	

	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView valid(@ModelAttribute User u, BindingResult br) {
		User u1 = service.validateUser(u);
		if(u1!=null && u1.getCity()!=null) {
			sess.setAttribute("userLog", "login");
			sess.setAttribute("user", u1);
			service.ShoppingTruncate();
			Shopping T =  new Shopping();
			T.setTotal(0.0d);
			sess.setAttribute("total", T);
			return new ModelAndView("welcome", "user", u1);						
		} else {
			return new ModelAndView("Login", "msg", "Invalid User..");									
		}
	}	
	
	@RequestMapping("/PrintBill")
	public ModelAndView printBill() {
		try {				
			User u2 = (User) sess.getAttribute("user");
	   		File Fb = new File(environment.getRequiredProperty("Bill.File.Location") + File.separator + u2.getUsername() + ".txt");
			FileWriter Fwb = new FileWriter(Fb);			   		
//			FileWriter Fwb = new FileWriter(Fb,true);
			BufferedWriter Bwb = new BufferedWriter(Fwb);
			PrintWriter Pwb = new PrintWriter(Bwb);

			Shopping T = (Shopping) sess.getAttribute("total");
   		
			if((T.getTotal())==0){
				Pwb.println("\n\t\t\tShopping-Cart\n\n");
				Pwb.println("\tNot Purchased any thing (0:-Item purchase)\n\n");
				Pwb.println("\t\t\tTOTAL AMT is:=" + T.getTotal());
			} else {
				@SuppressWarnings("unchecked")
				List<Shopping> a2=(ArrayList<Shopping>) sess.getAttribute("shopping");
				Pwb.println("\n\t\t\t\tShopping-Cart\n\n");
				Pwb.println("\tQtN\t*\tPrice\t=\tAmount\t=>\tItem\n");						
				for (Shopping s: a2) {
					Pwb.println("\t"+s.getQN() + "\t*\t" + s.getPrice() + "\t=\t " + s.getAmt() +"\t=>\t"+s.getPrName());
				}
				Pwb.println("\n\n\t\t\tTOTAL AMT is:=" + T.getTotal());						
			}
			Pwb.close();
			service.ShoppingTruncate();
			T.setTotal(0.0d);
			sess.setAttribute("total", T);

			System.out.println("logout");		
			return new ModelAndView("redirect:/logout");
		} catch (Exception e) {
			System.out.println("Exception= "+e);
			return new ModelAndView("redirect:/logout");
		}	
	}	
	
	@RequestMapping("/Receipt")
	public ModelAndView receipt() {
		return new ModelAndView("Receipt");
	}	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/logout")
	public String logout(){
		try {
			System.runFinalization();
			Shopping T = (Shopping) sess.getAttribute("total");
			if((T.getTotal())!=0){
				for (Shopping s1 : (ArrayList<Shopping>) sess.getAttribute("shopping")) {
					if(service.ReplaceItems(s1))
						System.out.println("Repalced Item= "+s1);
					else 
						System.out.println("NOT Repalced Item= "+s1);
				}
			}
			service.ShoppingTruncate();
//			service.exceptional();

			sess.setAttribute("userLog", "logout");
			T.setTotal(0.0d);
			sess.setAttribute("total", T);
			sess.invalidate();

			Cookie c = new Cookie("name", "");
			c.setMaxAge(0);

			System.gc();
			System.out.println("logout");		

		} catch (NullPointerException e) { 
			Cookie c = new Cookie("name", "");
			c.setMaxAge(0);
			System.gc();
			System.out.println("logout");		
			return "Login";					
		} catch (Exception e) {
			Cookie c = new Cookie("name", "");
			c.setMaxAge(0);
			System.gc();
			System.out.println("logout");		
			return "Login";								
		}
		return "Login";					
	}
	
	@RequestMapping(value="/Wel", method=RequestMethod.GET)
	public String wel(){
		return "Wel";					
	}

	@RequestMapping(value="/Pay", method=RequestMethod.GET)
	public String pay(){
		return "Pay";					
	}

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index(){
		return "Login";					
	}

	@PostConstruct
	public void init(){
		System.out.println("initialized..");

		PropertyConfigurator.configure(environment.getRequiredProperty("log4j.properties.file"));
		logger.trace("TRACE");
		logger.debug("DEBUG");
		logger.info("INFO");
		logger.warn("WARN");
		logger.error("ERROR");		
	}
	
	@PreDestroy
	public void destroy(){
		System.out.println("Destroying..");
	}

}
