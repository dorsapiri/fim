<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/15/17
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/mdb/js/mdb.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/mdb/css/mdb.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/stylesheet.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.min.css"/>" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="navbar navbar-default navbar-fixed-top">
            <header id="header-site">

                <div class="logo-site">
                    <h1><a href="#">Leistung</a></h1>
                </div>

                <!--Begin::Mobile View Navigation-->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!--End::Mobile View Navigation-->

                <!--Begin::Header right-->
                <%--<ul class="nav navbar-right pull-right top-nav">
                    <li class="dropdown dropdown-notification"> <a class="dropdown-toggle" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" aria-expanded="true"> <i class="fa fa-bell-o"></i> <span class="badge badge-default"> 3 </span> </a>
                        <ul class="dropdown-menu">
                            <li class="external">
                                <h3> <span class="bold">12 pending</span> notifications</h3>
                                <a href="page_user_profile_1.html">view all</a>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list">
                                    <li> <a href="javascript:;"> <span class="time">just now</span> <span class="details"> <span class="label label-sm label-icon label-success"> <i class="fa fa-plus"></i> </span> New user registered. </span> </a> </li>
                                    <li> <a href="javascript:;"> <span class="time">3 mins</span> <span class="details"> <span class="label label-sm label-icon label-danger"> <i class="fa fa-bolt"></i> </span> Server #12 overloaded. </span> </a> </li>
                                    <li> <a href="javascript:;"> <span class="time">10 mins</span> <span class="details"> <span class="label label-sm label-icon label-warning"> <i class="fa fa-bell-o"></i> </span> Server #2 not responding. </span> </a> </li>
                                    <li> <a href="javascript:;"> <span class="time">14 hrs</span> <span class="details"> <span class="label label-sm label-icon label-info"> <i class="fa fa-bullhorn"></i> </span> Application error. </span> </a> </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                            <img alt="" class="img-circle" src="<c:url value="/resources/images/defualt-person-pic.png"/>" width="30">
                            <span class="hidden-xs">Admin User</span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><i class="fa fa-fw fa-user"></i> Edit Profile</a></li>
                            <li><a href="#"><i class="fa fa-fw fa-cog"></i> Change Password</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="fa fa-fw fa-power-off"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>--%>


                <!--End::Header Right-->


                <!--Begin::Nav-->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-left">
                        <li><a id="dashboard" href="">Home</a></li>
                        <li><a id="report" href="#">Report</a></li>
                        <%--<li><a id="settings" href="#">Settings</a></li>--%>
                        <li><a id="admin" href="<c:url value='/admin'/>">Admin</a></li>
                    </ul>
                </div>
                <!--End::Nav-->

            </header>
        </div>
    </div>
</div>
</body>
</html>
