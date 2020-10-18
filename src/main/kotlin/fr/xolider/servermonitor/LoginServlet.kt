package fr.xolider.servermonitor

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
            val sess = req.getSession(true)
            sess.setAttribute("username", rs.getString("username"))
            sess.setAttribute("password", rs.getString("password"))
            resp.sendRedirect(req.servletContext.contextPath + "/")
        }
        else {
            resp.sendRedirect(req.servletContext.contextPath + "/login")
        }

    }
}