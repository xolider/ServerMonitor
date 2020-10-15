<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%--
  Created by IntelliJ IDEA.
  User: Clément Vicart
  Date: 15/10/2020
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ServerMonitor | installation</title>
    <%@include file="css.jsp"%>
</head>
<body class="bg-blue text-light">

    <div class="container">
        <div class="row col-12 text-center mt-4">
            <h1>Installation de ServerMonitor</h1>
        </div>
        <div class="row col-12 mt-4 bg-light text-dark rounded shadow-lg">
            <div class="container-fluid p-4">
                <c:choose>
                    <c:when test="${param.step == null}">
                        <div class="row col-12 justify-content-center">
                            <h3>Nom du serveur: <%= request.getAttribute("hostname") %></h3>
                        </div>
                        <div class="row col-12 justify-content-center form-group">
                            <label for="url">URL du serveur</label>
                            <input type="text" class="form-control" id="url" value="<%= request.getRequestURL().toString().replace("/WEB-INF/jsp/install.jsp", "") %>" disabled>
                        </div>
                        <div class="row col-12 justify-content-center">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/install?step=1">Suivant</a>
                        </div>
                    </c:when>
                    <c:when test="${param.step == 1}">
                        <c:if test="${param.error == true}">
                            <div class="row col-12 justify-content-center">
                                <p class="text-danger">La connexion à la base de données a échoué</p>
                            </div>
                        </c:if>
                        <form method="get" action="${pageContext.request.contextPath}/registerdb">
                            <div class="row">
                                <div class="col-md-6 col-12 form-group">
                                    <label for="dbhost">Adresse de la base de données</label>
                                    <input type="text" class="form-control" id="dbhost" name="dbhost" placeholder="Entrez l'adresse de la base de données"
                                        aria-describedby="addressHelp">
                                    <small id="addressHelp" class="form-text text-muted">Si la base se trouve sur ce serveur, entrez: 127.0.0.1</small>
                                </div>
                                <div class="col-md-6 col-12 form-group">
                                    <label for="dbport">Port de la base de données</label>
                                    <input type="number" class="form-control" id="dbport" name="dbport" placeholder="Entrez le port de la base de données"
                                        value="3306">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 form-group">
                                    <label for="dbname">Nom de la base de données</label>
                                    <input type="text" class="form-control" id="dbname" name="dbname" placeholder="Entrez le nom de la base de données">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-12 form-group">
                                    <label for="dbuser">Nom d'utilisateur</label>
                                    <input type="text" class="form-control" id="dbuser" name="dbuser" placeholder="Entrez le nom d'utilisateur">
                                </div>
                                <div class="col-md-6 col-12 form-group">
                                    <label for="dbpass">Mot de passe</label>
                                    <input type="password" class="form-control" id="dbpass" name="dbpass" placeholder="Entrez le mot de passe">
                                </div>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-6 text-right">
                                    <a href="${pageContext.request.contextPath}/install" class="btn btn-primary">Précédent</a>
                                </div>
                                <div class="col-6">
                                    <input type="submit" value="Suivant" class="btn btn-primary" id="firstnext" disabled>
                                </div>
                            </div>
                        </form>
                    </c:when>
                    <c:when test="${param.step == 2}">
                        <div class="row col-12 justify-content-center">
                            <h3>Créer des identifiants d'accès</h3>
                        </div>
                        <form method="get" action="${pageContext.request.contextPath}/registerid">
                            <div class="row col-12 form-group">
                                <label for="user">Nom d'utilistateur</label>
                                <input type="text" class="form-control" id="user" name="user" placeholder="Entrez un identifiant">
                            </div>
                            <div class="row col-12 form-group">
                                <label for="pass">Mot de passe</label>
                                <input type="password" class="form-control" id="pass" name="pass" placeholder="Entrez un mot de passe">
                            </div>
                            <div class="row col-12 form-group">
                                <label for="passConfirm">Confirmation de mot de passe</label>
                                <input type="password" id="passConfirm" class="form-control" placeholder="Entrez la confirmation du mot de passe">
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-6 text-right">
                                    <a href="${pageContext.request.contextPath}/install?step=1" class="btn btn-primary">Précédent</a>
                                </div>
                                <div class="col-6">
                                    <input type="submit" class="btn btn-primary" value="Suivant" id="secondnext" disabled>
                                </div>
                            </div>
                        </form>
                    </c:when>
                    <c:when test="${param.step == 3}">
                        <div class="row col-12 justify-content-center">
                            <h3>Résumé de l'installation</h3>
                        </div>
                        <div class="row col-12 justify-content-center">
                            <p id="serverURL">URL: <%= request.getRequestURL().toString().replace("/WEB-INF/jsp/install.jsp", "") %></p>
                        </div>
                        <div class="row col-12 justify-content-center mt-2">
                            <ul class="list-group">
                                <li class="list-group-item">Initialisation de la base de données</li>
                                <li class="list-group-item">Création des identifiants administrateur</li>
                                <li class="list-group-item">Configuration de ServerMonitor</li>
                            </ul>
                        </div>
                        <div class="row justify-content-center mt-3">
                            <div class="col-6 text-right">
                                <a href="${pageContext.request.contextPath}/install?step=2" class="btn btn-primary">Précédent</a>
                            </div>
                            <div class="col-6">
                                <button type="button" class="btn btn-primary" id="install">Installer</button>
                            </div>
                        </div>
                        <div class="row col-12 mt-4">
                            <div class="progress w-100">
                                <div class="progress-bar progress-bar-striped progress-bar-animated bg-info w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>

<%@include file="scripts.jsp"%>
<c:choose>
    <c:when test="${param.step == 1}">
        <script src="${pageContext.request.contextPath}/static/js/dbcheck.js"></script>
    </c:when>
    <c:when test="${param.step == 2}">
        <script src="${pageContext.request.contextPath}/static/js/idcheck.js"></script>
    </c:when>
    <c:when test="${param.step == 3}">
        <script src="${pageContext.request.contextPath}/static/js/install.js"></script>
    </c:when>
</c:choose>
</body>
</html>
