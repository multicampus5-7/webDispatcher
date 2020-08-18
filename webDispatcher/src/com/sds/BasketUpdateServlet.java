package com.sds;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Db;
import db.Pos;
import db.PosDb;
import db.Sales;
import db.SalesDb;


@WebServlet({ "/BasketUpdateServlet", "/basketupdate" })
public class BasketUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Db<String, Pos> pdb = new PosDb("db", "db");
	ArrayList<Pos> psList = new ArrayList<Pos>(); //pos select
	
	Db<String, Sales> sdb = new SalesDb("db", "db");
	ArrayList<Sales> ssList = new ArrayList<Sales>(); //sales select
	
    public BasketUpdateServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		String name = request.getParameter("name");
		String func = request.getParameter("func"); //plus or minus
		int amount = 0;
		Sales sales = null;
		Sales upsales = null;
		//Sales upsales = new Sales(name, amount);
		
		if(func.equals("plus")) { //plus
			try {
				sales = sdb.select(name);
				amount = sales.getAmount();
				amount ++;
				
				upsales = new Sales(name, amount);
				sdb.update(upsales);
				
				response.sendRedirect("posload.mc");
			} catch (Exception e) {
				System.out.println("plus error");
				e.printStackTrace();
			}
		} else { //minus
			try {
				sales = sdb.select(name);
				amount = sales.getAmount();
				amount --;
				
				upsales = new Sales(name, amount);
				sdb.update(upsales);
				
				response.sendRedirect("posload.mc");
			} catch (Exception e) {
				System.out.println("plus error");
				e.printStackTrace();
			}
		}
		
//		request.setAttribute("poslist", psList);
//		request.setAttribute("saleslist", ssList);
//		request.setAttribute("centerpage", "posload");
//		RequestDispatcher rd = 
//			request.getRequestDispatcher("main.jsp");
//			rd.forward(request, response);
		
	}

}
