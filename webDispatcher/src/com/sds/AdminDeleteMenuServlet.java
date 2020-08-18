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

@WebServlet({ "/AdminDeleteMenuServlet", "/admin/deleteMenu" })
public class AdminDeleteMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name").replace("\"", "");

		Db<String, Pos> db = new PosDb("db", "db");

		try {
			db.delete(name);
			System.out.println("Delete OK");
			request.setAttribute("centerPage", "menuList");
		} catch (Exception e) {
			System.out.println("Delete Fail");
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
		rd.forward(request, response);
	}

}
