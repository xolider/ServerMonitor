package fr.xolider.servermonitor

import java.net.Inet4Address
import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class IndexServlet: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        var hostname = "Unknown"
        val addr = Inet4Address.getLocalHost()
        hostname = addr.hostName
        req.setAttribute("hostname", hostname)
        req.servletContext.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp)
    }
}