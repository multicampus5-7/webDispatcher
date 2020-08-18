package com.sds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/AdminDispatcherServlet", "/adminDispatcher" })
public class AdminDispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDispatcherServlet() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		path = path.substring(1, path.lastIndexOf("."));
		String next = "main.jsp";
		if (path.equals("main")) {
			next = "main.jsp";
		} else if (path.equals("menuList")) {
			next = "main.jsp";
			request.setAttribute("centerpage", "menuList");
		} else if (path.equals("search")) {
			next = "main.jsp";
			request.setAttribute("centerpage", "search");
		} else if (path.equals("weather")) {
			next = "main.jsp";
			request.setAttribute("centerpage", "weather");
		} else {
			next = path;
			System.out.println("go to " + path);
		}
		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);

	}

}
