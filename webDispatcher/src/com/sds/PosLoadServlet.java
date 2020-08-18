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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PosLoadServlet
 */
@WebServlet({ "/PosLoadServlet", "/posload" })
public class PosLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Db<String, Pos> db = new PosDb("db", "db");
	ArrayList<Pos> aList = new ArrayList<Pos>();
	
    public PosLoadServlet() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			aList = db.selectAll();
			for (Pos pos : aList) {
				System.out.println(pos);
			}
			
		} catch (Exception e) {
			System.out.println("select All error");
			e.printStackTrace();
		}
		
		request.setAttribute("poslist", aList);
		request.setAttribute("centerpage", "posload");
		RequestDispatcher rd = 
			request.getRequestDispatcher("main.jsp");
			rd.forward(request, response);
	}

}
