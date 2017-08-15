<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/13/17
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logs</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
    <%--<script src="<c:url value="/resources/js/main.js" />"></script>--%>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>

    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <%--<style>
        .container{
            margin-top: 100px;
        }
    </style>--%>
</head>
<body>
<jsp:include page="header-first.jsp"/>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <table class="table table-responsive">
                <thead>
                <tr>
                    <th>IP</th>
                    <th>created</th>
                    <th>deleted</th>
                    <th>modified</th>
                    <th>renamed</th>
                    <th>security</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${logEventss}" var="log">
                    <tr>
                        <td>${log.clientIP}</td>
                        <td>
                            ${log.created}
                        </td>
                        <td>
                                ${log.deleted}
                        </td>
                        <td>
                                ${log.modified}
                        </td>
                        <td>
                                ${log.renamed}
                        </td>
                        <td>
                                ${log.security}
                        </td>
                            <%--<td><input type="button" value="+" class="btn btn-success"></td>--%>
                        <td><a href="<c:url value="full-logs-${log.clientIP}"/> " class="btn btn-danger">all logs</a></td>
                        <%--<td><a href="<c:url value="remove-client-${client.clientIP}"/> " class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
