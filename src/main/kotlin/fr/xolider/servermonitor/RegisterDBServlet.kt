package fr.xolider.servermonitor

import fr.xolider.servermonitor.install.InstallConfig
import fr.xolider.servermonitor.utils.Utils
import java.sql.DriverManager
import java.sql.SQLException
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class RegisterDBServlet: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val dbhost = req.getParameter("dbhost") as String
        val dbport = req.getParameter("dbport") as String
        val dbname = req.getParameter("dbname") as String
        val dbuser = req.getParameter("dbuser") as String
        val dbpass = req.getParameter("dbpass") as String

        try {
            val conn = Utils.getDatabase(dbhost, dbport.toInt(), dbuser, dbpass, dbname)

            InstallConfig.instance.dbCredentials["dbhost"] = dbhost
            InstallConfig.instance.dbCredentials["dbport"] = dbport
            InstallConfig.instance.dbCredentials["dbuser"] = dbuser
            InstallConfig.instance.dbCredentials["dbpass"] = dbpass
            InstallConfig.instance.dbCredentials["dbname"] = dbname

            conn.close()

            resp.sendRedirect(req.servletContext.contextPath + "/install?step=2")
        }
        catch (e: SQLException) {
            e.printStackTrace()
            resp.sendRedirect(req.servletContext.contextPath + "/install?step=1&error=true")
        }
    }
}