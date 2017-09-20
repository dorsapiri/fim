<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 7/12/17
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>panel</title>
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

</head>
<body>
<jsp:include page="header-first.jsp"/>

<div class="affix-container"></div>

<script>
    /*$(document).ready(function () {
        $('#report').click(function () {
            $('.affix-container').load("log");
        });
        $('#settings').click(function () {
            $('.affix-container').load("settings");
        });
        $('#dashboard').click(function () {
            $('.affix-container').load("dashboard");
        });
        $('#admin').click(function () {
            $('.affix-container').load("admin");
        });
    });*/
</script>
</body>
</html>
