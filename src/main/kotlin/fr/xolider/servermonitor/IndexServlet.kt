package fr.xolider.servermonitor

import fr.xolider.servermonitor.utils.Utils
import org.hyperic.sigar.Sigar
import java.io.File
import java.net.Inet4Address
import java.net.InetAddress
import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class IndexServlet: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val installExists = File(req.servletContext.getRealPath("."), "WEB-INF/settings.json").exists()
        if(!installExists) {
            resp.sendRedirect(req.servletContext.contextPath + "/install")
        }
        else {
            req.setAttribute("hostname", Utils.hostname)
            req.setAttribute("address", Utils.address)
            req.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp)
        }
    }
}