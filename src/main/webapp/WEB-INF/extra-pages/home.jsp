<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 7/10/17
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <title>Home</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/mdb/js/mdb.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/mdb/css/mdb.css"/>" rel="stylesheet">
    <style>
        .navbar-static-top {
            margin-bottom:20px;
        }

        i {
            font-size:18px;
        }

        footer {
            margin-top:20px;
            padding-top:20px;
            padding-bottom:20px;
            background-color:#efefef;
        }

        .nav>li .count {
            position: absolute;
            top: 10%;
            right: 25%;
            font-size: 10px;
            font-weight: normal;
            background: rgba(41,200,41,0.75);
            color: rgb(255,255,255);
            line-height: 1em;
            padding: 2px 4px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            -ms-border-radius: 10px;
            -o-border-radius: 10px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<!-- Header -->
<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-toggle"></span>
            </button>
            <a class="navbar-brand" href="#">Control Panel</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">

                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#">
                        <i class="glyphicon glyphicon-user"></i> Admin <span class="caret"></span></a>
                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
                        <li><a href="#">My Profile</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-lock"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /container -->
</div>
<!-- /Header -->

<!-- Main -->
<div class="container">

    <!-- upper section -->
    <%--<div class="row">
        <div class="col-sm-3">
            <!-- left -->
            <h3><i class="glyphicon glyphicon-briefcase"></i> Toolbox</h3>
            <hr>

            <ul class="nav nav-stacked">
                <li><a href="http://www.bootply.com/85861" target="ext"><i class="glyphicon glyphicon-flash"></i> Alerts</a></li>
                <li><a href="http://www.bootply.com/85861" target="ext"><i class="glyphicon glyphicon-link"></i> Links</a></li>
                <li><a href="http://www.bootply.com/85861" target="ext"><i class="glyphicon glyphicon-list-alt"></i> Reports</a></li>
                <li><a href="http://www.bootply.com/85861" target="ext"><i class="glyphicon glyphicon-book"></i> Books</a></li>
                <li><a href="http://www.bootply.com/85861" target="ext"><i class="glyphicon glyphicon-briefcase"></i> Tools</a></li>
                <li><a href="http://www.bootply.com/85861" target="ext"><i class="glyphicon glyphicon-time"></i> Real-time</a></li>
                <li><a href="http://www.bootply.com/85861" target="ext"><i class="glyphicon glyphicon-plus"></i> Advanced..</a></li>
            </ul>

            <hr>

        </div><!-- /span-3 -->
        <div class="col-sm-9">

            <!-- column 2 -->
            <h3><i class="glyphicon glyphicon-dashboard"></i>Dashboard</h3>

            <hr>

            <div class="row">
                <!-- center left-->
                <div class="col-md-7">
                    <div class="well">Inbox Messages <span class="badge pull-right">3</span></div>

                    <hr>

                    &lt;%&ndash;<div class="panel panel-default">
                        <div class="panel-heading"><h4>Processing Status</h4></div>
                        <div class="panel-body">

                            <small>Complete</small>
                            <div class="progress">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100" style="width: 72%">
                                    <span class="sr-only">72% Complete</span>
                                </div>
                            </div>
                            <small>In Progress</small>
                            <div class="progress">
                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                    <span class="sr-only">20% Complete</span>
                                </div>
                            </div>
                            <small>At Risk</small>
                            <div class="progress">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                    <span class="sr-only">80% Complete</span>
                                </div>
                            </div>

                        </div><!--/panel-body-->
                    </div>&ndash;%&gt;<!--/panel-->

                </div><!--/col-->

                <!--center-right-->
                <div class="col-md-5">

                    <ul class="nav nav-justified">
                        <li><a href="#"><i class="glyphicon glyphicon-cog"></i></a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-heart"></i></a></li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-comment"></i><span class="count">3</span></a><ul class="dropdown-menu" role="menu"><li><a href="#">1. Is there a way..</a></li><li><a href="#">2. Hello, admin. I would..</a></li><li><a href="#"><strong>All messages</strong></a></li></ul></li>
                        <li><a href="#"><i class="glyphicon glyphicon-user"></i></a></li>
                        <li><a title="Add Widget" data-toggle="modal" href="#addWidgetModal"><span class="glyphicon glyphicon-plus-sign"></span></a></li>
                    </ul>

                    <hr>



                    <hr>

                    <div class="btn-group btn-group-justified">
                        <a href="#" class="btn btn-info col-sm-3">
                            <i class="glyphicon glyphicon-plus"></i><br>
                            Service
                        </a>
                        <a href="#" class="btn btn-info col-sm-3">
                            <i class="glyphicon glyphicon-cloud"></i><br>
                            Cloud
                        </a>
                        <a href="#" class="btn btn-info col-sm-3">
                            <i class="glyphicon glyphicon-cog"></i><br>
                            Tools
                        </a>
                        <a href="#" class="btn btn-info col-sm-3">
                            <i class="glyphicon glyphicon-question-sign"></i><br>
                            Help
                        </a>
                    </div>

                </div><!--/col-span-6-->

            </div><!--/row-->
        </div><!--/col-span-9-->

    </div>--%><!--/row-->
    <!-- /upper section -->
    <%--<div class="row">
        <canvas id="myChart"></canvas>
    </div>--%>
    <!-- lower section -->
    <div class="row">

        <div class="col-md-12">
            <hr>
            <%--<a href="#"><strong><i class="glyphicon glyphicon-list-alt"></i> Reports</strong></a>--%>
            ${client.clientIP}
            <hr>
        </div>
        <div class="col-md-9">

            <table class="table table-striped">
                <thead>
                <tr>
                    <th>File Name</th><th>Change Type</th><th>Time</th>
                </tr>
                </thead>
                <tbody>
                <f:forEach items="${logs}" var="log">
                    <tr>
                        <td>${log.fileName}</td>
                        <td>${log.event}</td>
                        <td>${log.logDate}</td>
                    </tr>
                </f:forEach>


                </tbody>
            </table>

            <hr>

            <!--tabs-->
            <%--<div class="container">
                <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
                    <li><a href="#messages" data-toggle="tab">Messages</a></li>
                    <li><a href="#settings" data-toggle="tab">Settings</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="profile">
                        <h4><i class="glyphicon glyphicon-user"></i></h4>
                        Lorem profile dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate.
                        <p>Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis
                            dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan.
                            Aliquam in felis sit amet augue.</p>
                    </div>
                    <div class="tab-pane" id="messages">
                        <h4><i class="glyphicon glyphicon-comment"></i></h4>
                        Message ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate.
                        <p>Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis
                            dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan.
                            Aliquam in felis sit amet augue.</p>
                    </div>
                    <div class="tab-pane" id="settings">
                        <h4><i class="glyphicon glyphicon-cog"></i></h4>
                        Lorem settings dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate.
                        <p>Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis
                            dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan.
                            Aliquam in felis sit amet augue.</p>
                    </div>
                </div>
            </div>--%>
            <!--/tabs-->

            <hr>

            <%--<div class="panel panel-default">
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
--%>

        </div>
      <%--  <div class="col-md-3">

            <ul class="nav nav-pills nav-stacked">
                <li class="nav-header"></li>
                <li><a href="#"><i class="glyphicon glyphicon-list"></i> Layouts &amp; Templates</a></li>
                <li class="divider"></li>
                <li><a href="#"><i class="glyphicon glyphicon-briefcase"></i> Toolbox</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-link"></i> Widgets</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-list-alt"></i> Reports</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-book"></i> Pages</a></li>
                <li class="divider"></li>
                <li><a href="#"><i class="glyphicon glyphicon-star"></i> Social Media</a></li>
            </ul>

            <hr>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-title">
                        <i class="glyphicon glyphicon-wrench pull-right"></i>
                        <h4>Submit Request</h4>
                    </div>
                </div>
                <div class="panel-body">

                    <form class="form form-vertical">
                        <div class="control-group">
                            <label>Name</label>
                            <div class="controls">
                                <input type="text" class="form-control" placeholder="Enter Name">
                            </div>
                        </div>
                        <div class="control-group">
                            <label>Title</label>
                            <div class="controls">
                                <input type="password" class="form-control" placeholder="Password">

                            </div>
                        </div>
                        <div class="control-group">
                            <label>Details</label>
                            <div class="controls">
                                <textarea class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="control-group">
                            <label>Select</label>
                            <div class="controls">
                                <select class="form-control"><option>General Question</option><option>Server Issues</option><option>Billing Question</option></select>
                            </div>
                        </div>
                        <div class="control-group">
                            <label></label>
                            <div class="controls">
                                <button type="submit" class="btn btn-primary">
                                    Post
                                </button>
                            </div>
                        </div>

                    </form>


                </div><!--/panel content-->
            </div><!--/panel-->

            <div class="panel panel-default">
                <div class="panel-heading"><div class="panel-title"><h4>Engagement</h4></div></div>
                <div class="panel-body">
                    <div class="col-xs-4 text-center"><img src="http://placehold.it/80/BBBBBB/FFF" class="img-circle img-responsive"></div>
                    <div class="col-xs-4 text-center"><img src="http://placehold.it/80/EFEFEF/555" class="img-circle img-responsive"></div>
                    <div class="col-xs-4 text-center"><img src="http://placehold.it/80/EEEEEE/222" class="img-circle img-responsive"></div>
                </div>
            </div><!--/panel-->

        </div>--%><!--/col-->

    </div><!--/row-->

</div><!--/container-->
<!-- /Main -->


<footer class="text-center">This Bootstrap 3 dashboard layout is compliments of <a href="http://www.bootply.com/85861"><strong>Bootply.com</strong></a></footer>


<div class="modal" id="addWidgetModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Add Widget</h4>
            </div>
            <div class="modal-body">
                <p>Add a widget stuff here..</p>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn">Close</a>
                <a href="#" class="btn btn-primary">Save changes</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dalog -->
</div><!-- /.modal -->


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
