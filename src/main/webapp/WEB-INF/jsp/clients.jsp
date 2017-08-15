<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/14/17
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Clients</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
    <%--<script src="<c:url value="/resources/js/main.js" />"></script>--%>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>

    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
</head>
<body>
<jsp:include page="header-first.jsp"/>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <div class="actions">
            <div class="col-md-2">
                <c:if test="${clientAddError == false}">
                    <a href="#modal-dialog" id="add-client" class="btn btn-default modal-toggle" data-toggle="modal">Add Client</a>
                </c:if>
                <c:if test="${clientAddError == true}">
                    <a href="#" onclick="info('Please, Remove client and then add another Client.')" id="add-error" class="btn btn-default">Add Client</a>
                </c:if>
            </div>
        </div>
    </div>

    <div id="modal-dialog" class="modal">
        <!-- Modal content -->
        <div class="modal-dialog">
            <div class="modal-content"  style="max-width: 800px;">
                <div class="modal-header">
                    <a href="#" data-dismiss="modal" aria-hidden="true" class="close" id="close">&times;</a>
                    <h3>New Client</h3>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <jsp:include page="add-client.jsp"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <table class="table table-responsive">
                <thead>
                <tr>
                    <th>IP</th>
                    <th>Addresses</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${clients}" var="client">
                    <tr>
                        <td>${client.clientIP}</td>
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Addresses
                                    <span class="caret"></span></button>
                            </div>
                        </td>
                            <%--<td><input type="button" value="+" class="btn btn-success"></td>--%>
                        <td><a href="<c:url value="add-address-client-${client.clientIP}"/> " class="btn btn-danger">Add Address</a></td>
                        <td><a href="<c:url value="remove-client-${client.clientIP}"/> " class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
