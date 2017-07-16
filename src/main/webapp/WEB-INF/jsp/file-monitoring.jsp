<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 7/12/17
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>File Monitoring</title>
    <%--<link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">--%>

    <style>
        .form-row{
            padding-bottom: 25px;
        }
    </style>
</head>
<body>
    <div class="container-fluid form-group">
        <div class="row form-row">
            <div class="col-md-2"><h5>Assign Template</h5></div>
            <div class="col-md-4">
                <select class="form-control">
                    <option>0 Selected</option>
                </select>
            </div>
        </div>
    <div class="row form-row">
            <div class="col-md-2"><h5>Assign Host</h5></div>
            <div class="col-md-4">
                <textarea class="form-control" placeholder="search and select hosts"></textarea>
            </div>
        </div>
    <div class="row form-row">
            <div class="col-md-2"><h5>Location(s) File(s)</h5></div>
            <div class="col-md-4">
                <textarea class="form-control" placeholder="Enter Comma separated"></textarea>
            </div>
        </div>
    <div class="row form-row">
            <div class="col-md-2"><h5>Exclude</h5></div>
            <div class="col-md-4">
                <textarea class="form-control" placeholder="Exclude Location(s)/ File(s)"></textarea>
            </div>
        </div>
    <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-4"></div>
        </div>
        <input type="submit" class="btn btn-primary" value="Save Monitoring">
        <input type="button" class="btn btn-primary" value="Cancel">
    </div>
</body>
</html>
