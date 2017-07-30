<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 7/25/17
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html>
<head>
    <title>Admin</title>
    <%--<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>
    <style>
        .container{
            margin-top: 100px;
        }
        .row{
            margin-bottom: 5%;
        }
        .dropdown-menu>li>a{
            display: inline-block;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="actions">
            <div class="col-md-2">
                <a href="#modal-dialog" id="add-client" class="btn btn-default modal-toggle" data-toggle="modal">Add Client</a>
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
                    <%--<th>Address1</th>
                    <th>SubTree1</th>
                    <th>Address2</th>
                    <th>SubTree2</th>
                    <th>Address3</th>
                    <th>SubTree3</th>--%>
                    <th>Addresses</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${clients}" var="client">
                    <tr>
                        <td>${client.clientIP}</td>
                        <%--<td>${client.address1}</td>
                        <td>${client.subTree1}</td>
                        <td>${client.address2}</td>
                        <td>${client.subTree2}</td>
                        <td>${client.address3}</td>
                        <td>${client.subTree3}</td>--%>
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Addresses
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu" id="address-list">
                                    <c:if test="${client.address1!=''}">
                                        <li>
                                            <a href="#">${client.address1}</a>
                                            <input type="checkbox" <c:if test="${client.subTree1}">checked</c:if> >
                                        </li>
                                    </c:if>
                                    <c:if test="${client.address2!=''}">
                                        <li>
                                            <a href="#">${client.address2}</a>
                                            <input type="checkbox" <c:if test="${client.subTree2}">checked</c:if> >
                                        </li>
                                    </c:if>
                                    <c:if test="${client.address3!=''}">
                                        <li>
                                            <a href="#">${client.address3}</a>
                                            <input type="checkbox" <c:if test="${client.subTree3}">checked</c:if> >
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                        </td>
                        <%--<td><input type="button" value="+" class="btn btn-success"></td>--%>
                        <td><a href="<c:url value="remove-client-${client.state}"/> " class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
<script>
$(document).ready(function () {
//    $('#address-list').appendChild()
});
</script>
</body>
</html>
