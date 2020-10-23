package fr.xolider.servermonitor

import fr.xolider.servermonitor.models.User
import fr.xolider.servermonitor.utils.Utils
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class LoginServlet: HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        req.servletContext.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, resp)
    }

    override fun doPost(req: HttpServletRequest, resp: HttpServletResponse) {
        val user = req.getParameter("user")
        val password = req.getParameter("pass")

        val conn = Utils.getDatabase(req)

        val st = conn.createStatement()
        val rs = st.executeQuery("SELECT * FROM users WHERE username = '$user' AND password = '$password'")
        if(rs.next()) {

            Utils.user = object : User {
                override val id: Int
                    get() = rs.getInt("id")
                override val username: String
                    get() = rs.getString("username")
                override val password: String
                    get() = rs.getString("password")
                override val isAdmin: Boolean
                    get() = rs.getBoolean("isAdmin")
            }

            val sess = req.getSession(true)
            sess.setAttribute("user", user)
            resp.sendRedirect(req.servletContext.contextPath + "/")
        }
        else {
            resp.sendRedirect(req.servletContext.contextPath + "/login")
        }
    }
}