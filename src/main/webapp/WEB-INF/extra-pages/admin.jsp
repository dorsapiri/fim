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
        /*Alert*/
        .top-alert {
            position: fixed;
            top: 68px;
            width: 100%;
            z-index: 100000;
            left: 0;
            padding: 20px;
            display: inline-block;
            text-align: center;
        }
        .top-alert .alert {
            width: auto !important;
            height: 100%;
            display: inline;
            position: relative;
            margin: 0;
        }
        .top-alert .alert .close {
            position: absolute;
            top: 11px;
            right: 10px;
            color: inherit;
        }
    </style>
</head>
<body>
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
                            <jsp:include page="../jsp/add-client.jsp"/>
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
                                <%--<ul class="dropdown-menu" id="address-list">
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
                                </ul>--%>
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
<script>
$(document).ready(function () {
    window.info = function(msg) {
        var dom = '<div class="top-alert"><div class="alert alert-info alert-dismissible fade in " role="alert"><i class="glyphicon glyphicon-info-sign"></i> ' + msg + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div></div>';
        var jdom = $(dom);
        jdom.hide();
        $("body").append(jdom);
        jdom.fadeIn();
        setTimeout(function() {
            jdom.fadeOut(function() {
                jdom.remove();
            });
        }, 6000);
    }});
</script>
</body>
</html>
