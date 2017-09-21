package com.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.onbarcode.barcode.Code128; 
import javax.servlet.ServletOutputStream; 


@WebServlet("/BarCode")
public class BarCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BarCode() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Code128 barcode = new Code128(); 
        barcode.setData("0123456789"); 

        // Basic barcode size settings here
        barcode.setX(2);
        barcode.setY(60);
        barcode.setLeftMargin(8);
        barcode.setRightMargin(8); 

        //Customize barcode image format into Gif(0), Jpeg(1), and Png(3)
        barcode.setImageFormat(0);
     
        // Set generated barcode image resolution
        barcode.setResolution(96);

        // Set barcode rotation rate. 0 degree(0), 90 degree(1), 180 degree(2), 270 degree(3)
        barcode.setRotate(0);
          

        ServletOutputStream servletoutputstream = response.getOutputStream(); 
       
        response.setContentType("image/jpeg"); 
        response.setHeader("Pragma", "no-cache"); 
        response.setHeader("Cache-Control", "no-cache"); 
        response.setDateHeader("Expires", 0); 
    
        // Generate Code-128 barcode & output to ServletOutputStream
        try {
			barcode.drawBarcode(servletoutputstream);
		} catch (Exception e) {
			System.out.println("e= "+e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
