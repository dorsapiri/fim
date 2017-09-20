<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/30/17
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
    <%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <%--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
    <script src="<c:url value="/resources/jquery/jquery-1.12.4.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/jquery/jquery-ui.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/mdb/js/mdb.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/mdb/css/mdb.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/stylesheet.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.min.css"/>" rel="stylesheet">

    <style>
        .form-margin{
            margin-top: 10%;
        }
        input[type=text],input[type=password]{
            font-size: 3rem;
        }
        label{
            font-size: 1rem;

        }
        .input + label{
            color: orangered;

        }
    </style>
</head>
<body>
<jsp:include page="header-first.jsp"/>

<div class="container form-margin">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <form:form method="post" commandName="adminuser">
                <form:input path="id" type="hidden"/>

                <form:input path="ssoId" type="hidden"/>
                <form:input path="firstName" type="hidden"/>
                <form:input path="lastName" type="hidden"/>
                <form:input path="email" type="hidden"/>

                <label for="password">New Password</label>
                <form:password  path="password" id="password"/>
                <button type="submit" class="btn btn-default">Change password</button>
            </form:form>
        </div>
    </div>

</div>
</body>
</html>
