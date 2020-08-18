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

/**
 * Servlet implementation class PosLoadServlet
 */
//POS Select
//SALES Select
//SALES UPDATE

@WebServlet({ "/PosLoadServlet", "/posload" })
public class PosLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Db<String, Pos> pdb = new PosDb("db", "db");
	ArrayList<Pos> psList = new ArrayList<Pos>(); //pos select
	
	Db<String, Sales> sdb = new SalesDb("db", "db");
	ArrayList<Sales> ssList = new ArrayList<Sales>(); //sales select
	
    public PosLoadServlet() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			psList = pdb.selectAll();
			ssList = sdb.selectAll();
			for (Sales sales : ssList) {
				System.out.println(sales);
			}
		} catch (Exception e) {
			System.out.println("select All error");
			e.printStackTrace();
		}
		
		request.setAttribute("poslist", psList);
		request.setAttribute("saleslist", ssList);
		request.setAttribute("centerpage", "posload");
		RequestDispatcher rd = 
			request.getRequestDispatcher("main.jsp");
			rd.forward(request, response);
	}

}
