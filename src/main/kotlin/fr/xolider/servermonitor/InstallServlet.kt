package fr.xolider.servermonitor

import fr.xolider.servermonitor.utils.Utils
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class InstallServlet: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        req.setAttribute("hostname", Utils.hostname)
        req.getRequestDispatcher("/WEB-INF/jsp/install.jsp").forward(req, resp)
    }
}