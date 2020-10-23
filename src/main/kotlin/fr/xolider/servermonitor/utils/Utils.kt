package fr.xolider.servermonitor.utils

import fr.xolider.servermonitor.models.User
import org.json.JSONObject
import java.io.File
import java.io.FileReader
import java.io.FileWriter
import java.lang.Exception
import java.net.Inet4Address
import java.net.InetAddress
import java.net.NetworkInterface
import java.sql.Connection
import java.sql.DriverManager
import java.util.*
import javax.servlet.http.HttpServletRequest

class Utils {

    companion object {
        val hostname = InetAddress.getLocalHost().hostName
        val address = InetAddress.getLocalHost().hostAddress
        var user: User? = null

        init {
            Class.forName("com.mysql.cj.jdbc.Driver")
        }

        fun getDatabase(dbhost: String, dbport: Int, dbuser: String, dbpass: String, dbname: String): Connection {

            val url = "jdbc:mysql://$dbhost:$dbport/$dbname?serverTimezone=${TimeZone.getDefault().id}"

            println(url)

            return DriverManager.getConnection(url, dbuser, dbpass)
        }

        fun getDatabase(req: HttpServletRequest): Connection {
            val config = getConfig(req)
            val db = config["db"] as JSONObject
            return getDatabase(db["dbhost"] as String, (db["dbport"] as String).toInt(), db["dbuser"] as String, db["dbpass"] as String, db["dbname"] as String)
        }

        fun writeConfig(json: JSONObject, req: HttpServletRequest) {
            val file = File(req.servletContext.getRealPath("."), "WEB-INF/settings.json")
            if(!file.exists()) file.createNewFile()
            val writer = FileWriter(file)
            writer.write(json.toString())
            writer.flush()
            writer.close()
        }

        fun getConfig(req: HttpServletRequest): JSONObject {
            val file = File(req.servletContext.getRealPath("."), "WEB-INF/settings.json")
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