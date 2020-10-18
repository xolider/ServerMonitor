package fr.xolider.servermonitor.install

import fr.xolider.servermonitor.utils.Utils
import org.apache.ibatis.jdbc.ScriptRunner
import org.json.JSONObject
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class FillDB: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val dbhost = InstallConfig.instance.dbCredentials["dbhost"].toString()
        val dbport = InstallConfig.instance.dbCredentials["dbport"].toString().toInt()
        val dbuser = InstallConfig.instance.dbCredentials["dbuser"].toString()
        val dbpass = InstallConfig.instance.dbCredentials["dbpass"].toString()
        val dbname = InstallConfig.instance.dbCredentials["dbname"].toString()

        val user = InstallConfig.instance.siteCredentials["user"]
        val pass = InstallConfig.instance.siteCredentials["pass"]

        try {
            val conn = Utils.getDatabase(dbhost, dbport, dbuser, dbpass, dbname)
            conn.autoCommit = true

            val st = conn.createStatement()
            st.executeUpdate("INSERT INTO users(username, password) VALUES ('$user', '$pass');")

            st.close()

            conn.close()

            val config = JSONObject()
            config.put("db", InstallConfig.instance.dbCredentials)
            config.put("id", InstallConfig.instance.siteCredentials)

            Utils.writeConfig(config, req)

            InstallConfig.instance.siteCredentials.clear()
            InstallConfig.instance.dbCredentials.clear()

            val obj = JSONObject()
            obj.put("state", "success")

            resp.status = 200
            resp.contentType = "text/json;charset=UTF-8"
            resp.writer.write(obj.toString())
        }
        catch (e: Exception) {
            e.printStackTrace()
            val obj = JSONObject()
            obj.put("state", "error")

            resp.status = 500
            resp.contentType = "text/json;charset=UTF-8"
            resp.writer.write(obj.toString())
        }
    }
}