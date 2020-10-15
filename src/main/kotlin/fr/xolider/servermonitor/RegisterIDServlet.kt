package fr.xolider.servermonitor

import fr.xolider.servermonitor.install.InstallConfig
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class RegisterIDServlet: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val user = req.getParameter("user")
        val pass = req.getParameter("pass")

        InstallConfig.instance.siteCredentials["user"] = user
        InstallConfig.instance.siteCredentials["pass"] = pass

        resp.sendRedirect(req.servletContext.contextPath + "/install?step=3")
    }
}