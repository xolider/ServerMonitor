package fr.xolider.servermonitor

import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class LoginServlet: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        req.servletContext.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, resp)
    }

    override fun doPost(req: HttpServletRequest, resp: HttpServletResponse) {
        //TODO: Post request
    }
}