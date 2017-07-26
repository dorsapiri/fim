<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 7/25/17
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <style>
        .container{
            margin-top: 100px;
        }
        .row{
            margin-bottom: 5%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <input class="btn btn-defualt" value="Add Client">
        </div>
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <table class="table table-responsive">
                <thead>
                <tr>
                    <th>IP</th>
                    <th>Address1</th>
                    <th>SubTree1</th>
                    <th>Address2</th>
                    <th>SubTree2</th>
                    <th>Address3</th>
                    <th>SubTree3</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${clients}" var="client">
                    <tr>
                        <td>${client.clientIP}</td>
                        <td>${client.address1}</td>
                        <td>${client.subTree1}</td>
                        <td>${client.address2}</td>
                        <td>${client.subTree2}</td>
                        <td>${client.address3}</td>
                        <td>${client.subTree3}</td>
                        <%--<td><input type="button" value="+" class="btn btn-success"></td>--%>
                        <td><input type="button" value="-" class="btn btn-danger"></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
<script>
    function newClient() {
        var newRow = "<tr></tr>";
        $(".table");
    }
</script>
</body>
</html>
