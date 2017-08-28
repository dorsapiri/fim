<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/28/17
  Time: 12:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registry Monitor</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/mdb/js/mdb.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/mdb/css/mdb.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/stylesheet.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.min.css"/>" rel="stylesheet">
</head>
<body>
<jsp:include page="header-first.jsp"/>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">

        <div class="col-md-12">
            <hr>
            <%--<a href="#"><strong><i class="glyphicon glyphicon-list-alt"></i> Reports</strong></a>--%>
            <%--${client.clientIP}--%>
            <hr>
        </div>
        <div class="col-md-9">

            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Key</th>
                    <th>Value</th>
                    <th>Change Type</th>
                    <th>Time</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${regLogs}" var="log">
                    <tr>
                        <td>${log.regKey}</td>
                        <td>${log.regValue}</td>
                        <td>${log.event}</td>
                        <td>${log.date}</td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>

            <hr>



        </div>
    </div>
</div>
</body>
</html>
