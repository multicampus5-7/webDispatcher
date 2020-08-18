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

@WebServlet({ "/AdminSelectMenuServlet", "/admin/selectMenu" })
public class AdminSelectMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Pos pos = null;
		String name = request.getParameter("name");
		System.out.println(name);
		name = name.replace("\'", "");
		Db<String, Pos> db = new PosDb("db", "db");
		try {
			pos = db.select(name);
			request.setAttribute("pos", pos);
			request.setAttribute("centerpage", "menuDetail");
		} catch (Exception e) {
			System.out.println("Select Fail");
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
		rd.forward(request, response);
	}

}
