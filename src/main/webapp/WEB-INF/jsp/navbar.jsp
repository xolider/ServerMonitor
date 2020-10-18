<%--
  Created by IntelliJ IDEA.
  User: 1882721
  Date: 12/10/2020
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% int active = Integer.parseInt(request.getParameter("active")); %>
<nav class="navbar navbar-expand-md navbar-dark bg-blue">
    <a class="navbar-brand" href="#">ServerMonitor</a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarContent">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarContent">
        <ul class="navbar-nav mr-auto">
            <li class="<%= active == 1 ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/" class="nav-link">Acceuil</a>
            </li>
            <li class="<%= active == 2 ? "active" : "" %>">
                <a href="#" class="nav-link">Mon serveur</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="<%= active == 3 ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/login" class="nav-link">Connexion</a>
            </li>
        </ul>
    </div>
</nav>
