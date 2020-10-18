<%--
  Created by IntelliJ IDEA.
  User: 1882721
  Date: 16/10/2020
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html>
<head>
    <title>ServerMonitor | Connexion</title>
    <%@include file="css.jsp"%>
</head>
<body class="bg-blue text-light overflow-hidden">
<jsp:include page="navbar.jsp">
    <jsp:param name="active" value="3"/>
</jsp:include>

<div class="d-flex align-items-center justify-content-center h-100">
    <div class="container bg-white text-dark rounded shadow-lg p-4">
        <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="row col-12 justify-content-center">
                <h2>Connexion</h2>
            </div>
            <div class="row justify-content-center form-group">
                <div class="col-6 mt-4">
                    <!-- Username -->
                    <label for="user">Identifiant</label>
                    <input class="form-control" type="text" id="user" name="user" placeholder="Entrez votre identifiant" required>
                </div>
            </div>
            <div class="row justify-content-center form-group">
                <div class="col-6">
                    <label for="pass">Mot de passe</label>
                    <input type="password" id="pass" name="pass" class="form-control" placeholder="Entrez votre mot de passe" required>
                </div>
            </div>
            <div class="row justify-content-center mt-4">
                <div class="col-6 text-center">
                    <input type="submit" class="btn btn-primary" value="Connexion">
                </div>
            </div>
        </form>
    </div>
</div>


<%@include file="scripts.jsp"%>
</body>
</html>
