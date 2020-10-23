<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 1882721
  Date: 12/10/2020
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="fr.xolider.servermonitor.utils.Utils" %>
<% int active = Integer.parseInt(request.getParameter("active")); %>
<nav class="navbar navbar-expand-md navbar-dark bg-blue">
    <a class="navbar-brand" href="#">ServerMonitor</a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarContent">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarContent">
        <ul class="navbar-nav mr-auto">
            <li class="<%= active == 1 ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/" class="nav-link"><i class="fas fa-home"></i> Acceuil</a>
            </li>
            <li class="<%= active == 2 ? "active" : "" %>">
                <a href="#" class="nav-link"><i class="fas fa-server"></i> Mon serveur</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <c:choose>
                <c:when test="${sessionScope.containsKey(\"user\") == true}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="accountDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">
                            <i class="fas fa-user"></i>
                            <%= Utils.Companion.getUser().getUsername() %>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="accountDropdown">
                            <a class="dropdown-item" href="#"><i class="fas fa-tools"></i> Paramètres</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/reboot"><i class="fas fa-redo-alt"></i> Redémarrer</a>
                            <a class="dropdown-item" href="#"><i class="fas fa-power-off"></i> Eteindre</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Déconnexion</a>
                        </div>
                    </li>
                </c:when>
                <c:when test="${sessionScope.containsKey(\"user\") == false}">
                    <li class="nav-item <%= active == 3 ? "active" : "" %>">
                        <a href="${pageContext.request.contextPath}/login" class="nav-link"><i class="fas fa-user"></i> Connexion</a>
                    </li>
                </c:when>
            </c:choose>
        </ul>
    </div>
</nav>
