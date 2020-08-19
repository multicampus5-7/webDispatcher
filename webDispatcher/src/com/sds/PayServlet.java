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
import db.Sales;
import db.SalesDb;


@WebServlet({ "/PayServlet", "/pay" })
public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PayServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//sales로부터 받아오고
		Db<String, Sales> db = new SalesDb("db", "db");
		ArrayList<Sales> ssList = new ArrayList<Sales>(); //SALES select
		ArrayList<Sales> tempList = new ArrayList<Sales>(); //price에 토탈가격 넣어서 반환
		
		int totalprice = 0;
		try {
			ssList = db.selectAll();
			for (Sales sales : ssList) {
				if(sales.getAmount() != 0) {
					String name = sales.getName();
					int amount = sales.getAmount();
					int price = sales.getPrice();
					int total = amount*price;
					totalprice += total;
					
					//input total price to tempList
					Sales s = new Sales(name,amount,total);
	        		tempList.add(s);
	        		
	        		//SALES table reset (amount : 0)
	        		Sales rset = new Sales(name,0);
	        		db.update(rset);
				}
			}
		} catch (Exception e) {
			System.out.println("select All error");
			e.printStackTrace();
		}
		
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("totallist", tempList);
		request.setAttribute("centerpage", "pay");
		RequestDispatcher rd = 
			request.getRequestDispatcher("main.jsp");
			rd.forward(request, response);
	}

}
