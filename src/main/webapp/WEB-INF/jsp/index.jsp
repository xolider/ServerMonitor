<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 1882721
  Date: 12/10/2020
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="true" %>
<html>
<head>
    <title>ServerMonitor</title>
    <%@include file="css.jsp"%>
</head>
<body class="bg-blue text-light overflow">

<jsp:include page="navbar.jsp">
    <jsp:param name="active" value="1"/>
</jsp:include>

<div class="container mt-4">
    <div class="row col-12 h-25 mx-0 align-content-end justify-content-center index-header">
        <h1 class="h1">ServerMonitor</h1>
    </div>
    <div class="row mt-4 index-headerr">
        <div class="col-12 text-center">
            <a href="#" class="neon-button-orange">Voir mon serveur</a>
        </div>
    </div>
    <div class="row col-12 bg-white index-content text-dark rounded shadow-lg h-40 mt-5 mx-0">
        <div class="container-fluid p-4">
            <div class="row">
                <div class="col-6">
                    <h4 class="text-uppercase"><% out.println(request.getAttribute("hostname")); %></h4>
                </div>
                <div class="col-6 text-right">
                    <h4 class="text-uppercase <%= true == true ? "text-success" : "text-danger" %>">NORMAL</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <h4><%= request.getAttribute("address") %></h4>
                </div>
            </div>
            <div class="row h-50 align-content-center justify-content-center">
                <c:if test="${sessionScope.containsKey(\"username\") == false}">
                    <div class="col-12 text-center">
                        <p class="text-muted text-connection-required">Connectez vous pour accéder aux informations</p>
                    </div>
                </c:if>
                <c:if test="${sessionScope.containsKey(\"username\") == true}">
                    <div class="col-6 justify-content-end d-flex">
                        <div class="progress-circle over50 p60">
                            <span>60%</span>
                            <div class="left-half-clipper">
                                <div class="first50-bar"></div>
                                <div class="value-bar"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 d-flex">
                        <div class="progress-circle p40">
                            <span>40%</span>
                            <div class="left-half-clipper">
                                <div class="first50-bar"></div>
                                <div class="value-bar"></div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<%@include file="scripts.jsp"%>
</body>
</html>
