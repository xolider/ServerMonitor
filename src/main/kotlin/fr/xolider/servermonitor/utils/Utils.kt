package fr.xolider.servermonitor.utils

import org.json.JSONObject
import java.io.File
import java.io.FileReader
import java.io.FileWriter
import java.lang.Exception
import java.net.InetAddress
import java.sql.Connection
import java.sql.DriverManager
import java.util.*
import javax.servlet.http.HttpServletRequest

class Utils {

    companion object {
        val hostname = InetAddress.getLocalHost().hostName

        fun getDatabase(dbhost: String, dbport: Int, dbuser: String, dbpass: String, dbname: String): Connection {

            Class.forName("com.mysql.cj.jdbc.Driver")

            val url = "jdbc:mysql://$dbhost:$dbport/$dbname?serverTimezone=${TimeZone.getDefault().id}"

            println(url)

            return DriverManager.getConnection(url, dbuser, dbpass)
        }

        fun writeConfig(json: JSONObject, req: HttpServletRequest) {
            val file = File(req.servletContext.getRealPath("."), "settings.json")
            if(!file.exists()) file.createNewFile()
            val writer = FileWriter(file)
            writer.write(json.toString())
            writer.flush()
            writer.close()
        }

        fun getConfig(req: HttpServletRequest): JSONObject {
            val file = File(req.servletContext.getRealPath("."), "settings.json")
            if(!file.exists()) return JSONObject()
            val reader = FileReader(file)
            var json = JSONObject()
            try {
                json = JSONObject(reader.readText())
            }
            catch (e: Exception) {

            }
            reader.close()
            return json
        }
    }
}