<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/14/17
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
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
        .container{
            margin-top: 100px;
        }
        label.control-label {
            font-size: 14px;
            color: #000;
        }
    </style>
</head>
<body>
<jsp:include page="header-first.jsp"/>
<div id="body">

    <div class="container">

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="well well-sm">
                    <c:url var="loginUrl" value="login" />
                    <form class="form-horizontal" action="${loginUrl}" method="post">
                        <fieldset>
                            <legend class="text-center">Loin</legend>

                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger">
                                    <p>Invalid username and password.</p>
                                </div>
                            </c:if>
                            <c:if test="${param.logout != null}">
                                <div class="alert alert-success">
                                    <p>You have been logged out successfully.</p>
                                </div>
                            </c:if>
                            <!-- UserName or Email input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="username">Username</label>
                                <div class="col-md-9">
                                    <input id="username" name="ssoId" type="text" placeholder="Username" class="form-control" required>
                                </div>
                            </div>

                            <!-- Password input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="password">Password</label>
                                <div class="col-md-9">
                                    <input id="password" name="password" type="password" placeholder="Password" class="form-control" required>
                                </div>
                            </div>

                            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                            <!-- Form actions -->
                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <button type="submit" class="btn btn-primary btn-lg">Login</button>
                                    <%--<input type="button" onclick="location.href='newuser'"  class="btn btn-primary btn-lg" value="create account"/>--%>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
