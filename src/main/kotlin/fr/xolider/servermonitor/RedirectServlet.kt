package fr.xolider.servermonitor

import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class RedirectServlet: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        resp.sendRedirect("/home")
    }
}