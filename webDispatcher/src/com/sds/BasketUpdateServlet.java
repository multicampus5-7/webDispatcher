package com.sds;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet({ "/BasketUpdateServlet", "/basketupdate" })
public class BasketUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BasketUpdateServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		String name = request.getParameter("name");
		String func = request.getParameter("func");
		int cnt = Integer.parseInt((request.getParameter("cnt")));
		
		if(func.equals("plus")) {
			System.out.println("++++");
		} else {
			System.out.println("----");

		}
	}

}
