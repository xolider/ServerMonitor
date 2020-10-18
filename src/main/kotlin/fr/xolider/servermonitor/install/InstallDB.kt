package fr.xolider.servermonitor.install

import fr.xolider.servermonitor.utils.Utils
import org.apache.ibatis.jdbc.ScriptRunner
import org.json.JSONObject
import java.io.BufferedReader
import java.io.File
import java.io.FileReader
import java.sql.SQLException
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class InstallDB: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val dbhost = InstallConfig.instance.dbCredentials["dbhost"].toString()
        val dbport = InstallConfig.instance.dbCredentials["dbport"].toString().toInt()
        val dbuser = InstallConfig.instance.dbCredentials["dbuser"].toString()
        val dbpass = InstallConfig.instance.dbCredentials["dbpass"].toString()
        val dbname = InstallConfig.instance.dbCredentials["dbname"].toString()

        try {
            val conn = Utils.getDatabase(dbhost, dbport, dbuser, dbpass, dbname)

            val runner = ScriptRunner(conn)
            runner.runScript(BufferedReader(FileReader(File(req.servletContext.getRealPath("."), "WEB-INF/sql/install.sql"))))

            conn.close()

            val json = Utils.getConfig(req)
            json.put("db", InstallConfig.instance.dbCredentials)

            Utils.writeConfig(json, req)

            val obj = JSONObject()
            obj.put("state", "success")

            resp.status = 200
            resp.contentType = "text/json;charset=UTF-8"
            resp.writer.write(obj.toString())
        }
        catch (e: SQLException) {
            e.printStackTrace()
            val obj = JSONObject()
            obj.put("state", "error")

            resp.status = 500
            resp.contentType = "text/json;charset=UTF-8"
            resp.writer.write(obj.toString())
        }
    }
}