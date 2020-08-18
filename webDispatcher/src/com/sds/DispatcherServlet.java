package com.sds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/DispatcherServlet", "/dispatcher" })
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DispatcherServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("EUC-KR");
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		path = path.substring(1, path.lastIndexOf("."));
		System.out.println("request:"+path);
		String next = "main.jsp";
		if(path.equals("main")) {
			next = "main.jsp";
		}else if(path.equals("map")) {
			next = "main.jsp";
			request.setAttribute("centerpage", "map");
		}else {
			next = path;
		}
		RequestDispatcher rd = 
			request.getRequestDispatcher(next);
			rd.forward(request, response);

	}

}





