<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/13/17
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>client profile</title>
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
        .page-top-margin{
            margin-top: 100px;
        }

        .error {
            color: #ff0000;
        }

        .errorblock {
            color: #000;
            background-color: #ffEEEE;
            border: 3px solid #ff0000;
            padding: 8px;
            margin: 16px;
        }
    </style>
</head>
<body>
<jsp:include page="header-first.jsp"/>

<div class="container page-top-margin">
    <div class="row">
        <div>
            <label for="client-ip">IP</label>
            <input id="client-ip" value="${client.clientIP}">
        </div>
    </div>
    <form:form method="post" commandName="address">
        <form:input path="id" id="id" type="hidden"/>
        <form:input path="clientIP" value="${client.clientIP}" type="hidden"/>
        <div class="row">
            <form:errors path="*" cssClass="errorblock" element="div" />
        </div>
        <div class="row">
            <form:input path="address"/>
            <form:errors path="address" cssClass="error"/>
        </div>
        <div class="row">
            <button type="submit" class="btn btn-default">Add Address</button>
        </div>
    </form:form>
    <c:forEach items="${clientAddresses}" var="cliAdd">
        <div>${cliAdd.address} <a href="<c:url value="remove-address-${cliAdd.id}"/> "><i class="fa fa-remove"></i></a> </div>
    </c:forEach>
    <c:if test="${alert}">
        <div>This address exist!</div>
    </c:if>
</div>



</body>
</html>
