<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 7/26/17
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
    <div class="container">
        <form:form commandName="client" method="post">
            <fieldset>
                <%--<legend class="text-center">--%>
                   <%--New Client--%>
                <%--</legend>--%>
                <form:input path="state" id="state" type="hidden"/>
                <div class="row">
                    <div class="col-md-3">
                        <label for="client-ip">Client IP</label>
                        <form:input path="clientIP" id="client-ip" class="form-control"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="address1">Address 1</label>
                        <form:input path="address1" id="address1" class="form-control"/>
                    </div>
                    <div class="col-md-2">
                        <label for="sub-tree1">SubTree1</label>
                        <form:checkbox path="subTree1" id="sub-tree1" class="form-control"/>
                    </div>
                </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label for="address2">Address 1</label>
                            <form:input path="address2" id="address2" class="form-control"/>
                        </div>
                        <div class="col-md-2">
                            <label for="sub-tree2">SubTree1</label>
                            <form:checkbox path="subTree2" id="sub-tree2" class="form-control"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label for="address3">Address 1</label>
                            <form:input path="address3" id="address3" class="form-control"/>
                        </div>
                        <div class="col-md-2">
                            <label for="sub-tree3">SubTree1</label>
                            <form:checkbox path="subTree3" id="sub-tree3" class="form-control"/>
                        </div>
                    </div>
                <div class="row">
                    <div class="col-md-3">
                        <c:choose>
                            <c:when test="${editClient}">
                                <button type="submit" class="btn btn-default">Update Client</button>
                            </c:when>
                            <c:otherwise>
                                <button type="submit" class="btn btn-default">Add Client</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </fieldset>
        </form:form>
    </div>
</body>
</html>
