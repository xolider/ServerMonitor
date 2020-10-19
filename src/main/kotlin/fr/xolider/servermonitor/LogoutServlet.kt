package fr.xolider.servermonitor

import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class LogoutServlet: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        req.session.invalidate()
        resp.sendRedirect(req.servletContext.contextPath + "/")
    }
}