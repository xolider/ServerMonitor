<%--
  Created by IntelliJ IDEA.
  User: 1882721
  Date: 12/10/2020
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ServerMonitor</title>
    <%@include file="css.jsp"%>
</head>
<body class="bg-blue text-light overflow-hidden">

<jsp:include page="navbar.jsp">
    <jsp:param name="active" value="1"/>
</jsp:include>

<div class="container mt-4">
    <div class="row col-12 h-25 align-content-end justify-content-center index-header">
        <h1>ServerMonitor</h1>
    </div>
    <div class="row h-25 mt-4 index-header">
        <div class="col-12 text-center">
            <a href="#" class="neon-button-orange">Voir mon serveur</a>
        </div>
    </div>
    <div class="row col-12 bg-white index-content w-100 text-dark h-100">
        <div class="row w-100">
            <div class="col-6">
                <h3 class="display-4 text-uppercase">Servername</h3>
            </div>
            <div class="col-6 text-right">
                <h3 class="display-4 text-uppercase <%= true == true ? "text-success" : "text-danger" %>">NORMAL</h3>
            </div>
        </div>
    </div>
</div>

<%@include file="scripts.jsp"%>
</body>
</html>
