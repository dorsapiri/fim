<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/14/17
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>

    <style>
        @import url(http://fonts.googleapis.com/css?family=Roboto:400,700);
        /*
        Inspired by http://dribbble.com/shots/890759-Ui-Kit-Metro/attachments/97174
        */
        *, *:before, *:after {
            /* Chrome 9-, Safari 5-, iOS 4.2-, Android 3-, Blackberry 7- */
            -webkit-box-sizing: border-box;

            /* Firefox (desktop or Android) 28- */
            -moz-box-sizing: border-box;

            /* Firefox 29+, IE 8+, Chrome 10+, Safari 5.1+, Opera 9.5+, iOS 5+, Opera Mini Anything, Blackberry 10+, Android 4+ */
            box-sizing: border-box;
        }
        body {
            background: #FFFFFF;
            font-family: 'Roboto', sans-serif;
            padding-top: 40px;
        }

        .main {
            background-color: #ECF0F1;
            border: 0px solid #8E44AD;
            border-radius: 5px;
            -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
            -moz-box-sizing: border-box;    /* Firefox, other Gecko */
            box-sizing: border-box; /* Opera/IE 8+ */
            margin-bottom: 40px;
            margin-right: 10%;
            margin-left: 10%;

        }

        .btn-nav {
            text-align: center;
            background-color: #ECF0F1;
            border: 0px solid #8E44AD;
            -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
            -moz-box-sizing: border-box;    /* Firefox, other Gecko */
            box-sizing: border-box; /* Opera/IE 8+ */
            margin-bottom: 40px;
        }
        .btn-nav:hover {
            color: #8E44AD;
            cursor: pointer;
            -webkit-transition: color 1s; /* For Safari 3.1 to 6.0 */
            transition: color 1s;
        }
        .btn-nav.active {
            color: #8E44AD;
            padding: 2px;
            border-top: 8px solid #8E44AD;
            border-bottom: 8px solid #8E44AD;
            border-left: 0;
            border-right: 0;
            box-sizing:border-box;
            -moz-box-sizing:border-box;
            -webkit-box-sizing:border-box;
            -webkit-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
            -moz-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
            -ms-transition: border 0.3s ease-out, color 0.3s ease 0.5s; /* IE10 is actually unprefixed */
            -o-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
            transition: border 0.3s ease-out, color 0.3s ease 0.5s;
            -webkit-animation: pulsate 1.2s linear infinite;
            animation: pulsate 1.2s linear infinite;
        }
        .btn-nav.active:before {
            content: '';
            position: absolute;
            border-style: solid;
            border-width: 6px 6px 0;
            border-color: #8E44AD transparent;
            display: block;
            width: 0;
            z-index: 1;
            margin-left: -6px;
            top: 0;
            left: 50%;
        }
        .btn-nav .glyphicon {
            color: #1ABC9C;
            padding-top: 16px;
            font-size: 40px;
        }
        .btn-nav.active p {
            margin-bottom: 8px;
        }
        @-webkit-keyframes pulsate {
            50% { color: #000; }
        }
        @keyframes pulsate {
            50% { color: #000; }
        }
        @media (max-width: 480px) {
            .btn-group {
                display: block !important;
                float: none !important;
                width: 100% !important;
                max-width: 100% !important;
            }
        }
        @media (max-width: 600px) {
            .btn-nav .glyphicon {
                padding-top: 12px;
                font-size: 26px;
            }

            .label {
                margin: 0;
                padding: 0;
                border: 0;
            }


        }

        .jumbotron {
            margin-top: 0px;
            background: #8E44AD;
            color: #FFF;
            border-radius: 5px 5px 0 0;
        }
        .jumbotron-sm { padding-top: 24px;
            padding-bottom: 24px; }
        .jumbotron small {
            color: #FFF;
        }

        /*The css under here is used for that statistics page*/

        .span5 {
            float: left;
        }

        .span3 {

        }

        .verticalLine {
            border-left: thick solid #ff0000;
        }

        .boxed-text {
            width: 600px;
            height: 400px;
            border: 5px solid green;
            float: left;
        }

        .boxed-text-pie {
            width: 600px;
            height: 400px;
            border: 5px solid red;
            float: left;

        }

        /*The css under here is used for the buttons in the statistics page*/

        .btn-group .dropdown-menu a{
            color:#fff;
        }

        .btn-default .dropdown-menu {
            color: #000 !important;
        }
        .btn-default .dropdown-menu li > a:hover,
        .btn-default .dropdown-menu li > a:focus {
            background-color: #000 !important;
            color:#fff !important;
        }
        .btn-group-primary .dropdown-menu {
            background-color: #3784c5 !important;
        }
        .btn-group-primary .dropdown-menu li > a:hover,
        .btn-group-primary .dropdown-menu li > a:focus {
            background-color: #428bca !important;
        }
        .btn-group-success .dropdown-menu {
            background-color: #51b351 !important;
        }
        .btn-group-success .dropdown-menu li > a:hover,
        .btn-group-success .dropdown-menu li > a:focus {
            background-color: #5cb85c !important;
        }
        .btn-group-info .dropdown-menu {
            background-color: #4ebbdb !important;
        }
        .btn-group-info .dropdown-menu li > a:hover,
        .btn-group-info .dropdown-menu li > a:focus {
            background-color: #5bc0de !important;
        }
        .btn-group-warning .dropdown-menu {
            background-color: #efa640 !important;
        }
        .btn-group-warning .dropdown-menu li > a:hover,
        .btn-group-warning .dropdown-menu li > a:focus {
            background-color: #f0ad4e !important;
        }
        .btn-group-danger .dropdown-menu {
            background-color: #d64742 !important;
        }
        .btn-group-danger .dropdown-menu li > a:hover,
        .btn-group-danger .dropdown-menu li > a:focus {
            background-color: #d9534f !important;
        }

        .container{
            padding-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="btn-group btn-group-justified">
            <div class="btn-group" >
                <button type="button" class="btn btn-nav" onclick="openPage('<%=request.getContextPath() %>/admin/clients',0);">
                    <span class="glyphicon glyphicon-user"></span>
                    <h4>Clients</h4>
                </button>
            </div>
            <div class="btn-group" >
                <button type="button" class="btn btn-nav" onclick="openPage('<%=request.getContextPath() %>/admin/log',1);">
                    <span class="glyphicon glyphicon-time"></span>
                    <h4>Logs</h4>
                </button>
            </div>
            <%--<div class="btn-group" onclick="#">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-usd"></span>
                    <h4>Donate</h4>
                </button>
            </div>--%>
            <div class="btn-group" onclick="#">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-cog"></span>
                    <h4>Settings</h4>
                </button>
            </div>
            <div class="btn-group" onclick="#">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-question-sign"></span>
                    <h4>Help</h4>
                </button>
            </div>

        </div>
    </div>
</div>

<script>
    var activeElx=window.location.href.split('=')[1] ;
    var items = $('.btn-nav');
    $(function() {
        $( items[activeElx] ).addClass('active');
    });
    function openPage(url,activeEl){

        $( items[activeElx] ).removeClass('active');
        $( items[activeEl] ).addClass('active');

        window.location =url+'?item='+activeEl;

    }
</script>
</body>
</html>
