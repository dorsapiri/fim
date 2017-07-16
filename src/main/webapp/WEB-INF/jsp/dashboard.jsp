<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 7/12/17
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <%--<script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>--%>
    <%--<link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">--%>
    <script src="<c:url value="/resources/mdb/js/mdb.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/mdb/css/mdb.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/stylesheet.css"/>" rel="stylesheet">

    <style>
        .affix-row{
            padding-top: 100px;
        }

    </style>
</head>
<body>
<div class="row affix-row">
    <div class="col-sm-10 col-md-8 col-sm-offset-1 col-md-offset-2">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4>Report</h4>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <canvas id="myChart"></canvas>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">

                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>File Name</th><th>Username</th><th>Change Type</th><th>Time</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>C:\fimsanyam\everything\logs\serverout_2017-09-10.txt</td>
                                <td>admin</td>
                                <td>MODIFIED</td>
                                <td>11 Sep 2017, 14:23:09</td>
                            </tr>
                            <tr>
                                <td>C:\fimsanyam\everything\logs\serverout_2017-09-10.txt</td>
                                <td>admin</td>
                                <td>MODIFIED</td>
                                <td>11 Sep 2017, 14:23:09</td>
                            </tr>
                            <tr>
                                <td>C:\fimsanyam\everything\logs\serverout_2017-09-10.txt</td>
                                <td>admin</td>
                                <td>MODIFIED</td>
                                <td>11 Sep 2017, 14:23:09</td>
                            </tr>
                            <tr>
                                <td>C:\fimsanyam\everything\logs\serverout_2017-09-10.txt</td>
                                <td>admin</td>
                                <td>MODIFIED</td>
                                <td>11 Sep 2017, 14:23:09</td>
                            </tr>
                            <tr>
                                <td>C:\fimsanyam\everything\logs\serverout_2017-09-10.txt</td>
                                <td>admin</td>
                                <td>MODIFIED</td>
                                <td>11 Sep 2017, 14:23:09</td>
                            </tr>
                            </tbody>
                        </table>


                        <hr>

                        <div class="panel panel-default">
                            <div class="panel-heading"><h4>New Requests</h4></div>
                            <div class="panel-body">
                                <div class="list-group">
                                    <a href="#" class="list-group-item active">Hosting virtual mailbox serv..</a>
                                    <a href="#" class="list-group-item">Dedicated server doesn't..</a>
                                    <a href="#" class="list-group-item">RHEL 6 install on new..</a>
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="alert alert-info">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            Please remember to <a href="#">Logout</a> for classified security.
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        var data = {
            labels: ["MODIFIED", "DELETED", "CREATED", "RENAMED"],
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(220,220,220,0.2)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [65, 59, 80, 81, 56, 55, 40]
                },
                {
                    label: "My Second dataset",
                    fillColor: "rgba(151,187,205,0.2)",
                    strokeColor: "rgba(151,187,205,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: [28, 48, 40, 19, 86, 27, 90]
                }
            ]
        };

        var option = {
            responsive: true
        };

        // Get the context of the canvas element we want to select
        var ctx = document.getElementById("myChart").getContext('2d');
        var myLineChart = new Chart(ctx).Line(data, option); //'Line' defines type of the chart.
    });
</script>
</body>
</html>
