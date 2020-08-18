package com.sds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Db;
import db.Pos;
import db.PosDb;

@WebServlet({ "/AdminUpdateMenuImpServlet", "/admin/updateMenuImp" })
public class AdminUpdateMenuImpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Pos pos = null;
		String name = request.getParameter("name");
		String stock = request.getParameter("stock");
		String price = request.getParameter("price");
		String img = request.getParameter("img");
		System.out.println(name + stock + price + img);
		Db<String, Pos> db = new PosDb("db", "db");
		try {
			pos = new Pos(name, Integer.parseInt(stock), Integer.parseInt(price), img);
			System.out.println(pos);
			db.update(pos);
			response.sendRedirect("selectAll.mc");
		} catch (Exception e) {
			System.out.println("Select Fail");
			e.printStackTrace();
		}

	}

}
