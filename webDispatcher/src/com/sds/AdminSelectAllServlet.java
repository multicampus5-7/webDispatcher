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

@WebServlet({ "/AdminSelectAllServlet", "/admin/selectAll" })
public class AdminSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		ArrayList<Pos> list = null;
		Db<String, Pos> db = new PosDb("db", "db");

		try {
			list = db.selectAll();
			for (Pos pos : list) {
				System.out.println(pos);

			}
		} catch (Exception e) {
			System.out.println("Select Fail");
			e.printStackTrace();
		}
		request.setAttribute("menulist", list);
		request.setAttribute("centerpage", "menuList");
		
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
		rd.forward(request, response);
	}

}
