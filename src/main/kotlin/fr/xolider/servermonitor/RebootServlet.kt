package fr.xolider.servermonitor

import fr.xolider.servermonitor.utils.Utils
import java.awt.Toolkit
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class RebootServlet: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        if(Utils.user != null && Utils.user!!.isAdmin) {
            Runtime.getRuntime().exec("")
            resp.sendRedirect(req.servletContext.contextPath + "/")
        }
        else {
            resp.sendRedirect(req.servletContext.contextPath + "/")
        }
    }
}