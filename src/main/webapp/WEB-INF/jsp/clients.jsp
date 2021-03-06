<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/14/17
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Clients</title>
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
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <div class="actions">
            <div class="col-md-2">
                <c:if test="${clientAddError == false}">
                    <a href="#modal-dialog" id="add-client" class="btn btn-default modal-toggle" data-toggle="modal">Add Client</a>
                </c:if>
                <c:if test="${clientAddError == true}">
                    <a href="#" onclick="info('Please, Remove client and then add another Client.')" id="add-error" class="btn btn-default">Add Client</a>
                </c:if>
            </div>
        </div>
    </div>

    <div id="modal-dialog" class="modal">
        <!-- Modal content -->
        <div class="modal-dialog">
            <div class="modal-content"  style="max-width: 800px;">
                <div class="modal-header">
                    <a href="#" data-dismiss="modal" aria-hidden="true" class="close" id="close">&times;</a>
                    <h3>New Client</h3>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <jsp:include page="add-client.jsp"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <table class="table table-responsive">
                <thead>
                <tr>
                    <th>IP</th>
                    <th></th>
                    <th></th>
                    <th>Last Connection</th>
                    <%--<th>Addresses</th>--%>
                </tr>
                </thead>
                <tbody id="myTable">
                <c:forEach items="${clients}" var="client">
                    <tr>
                        <td>${client.clientIP}</td>
                        <%--<td>
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Addresses
                                    <span class="caret"></span></button>
                            </div>
                        </td>--%>
                            <%--<td><input type="button" value="+" class="btn btn-success"></td>--%>
                        <td><a href="<c:url value="add-address-client-${client.clientIP}"/> " class="btn btn-group-primary">Add Address</a></td>
                        <td><a href="<c:url value="add-registry-key-client-${client.clientIP}"/> " class="btn btn-group-primary">Add Registry key</a></td>
                        <td <c:if test="${client.longConnect}">style="color: red;" </c:if>>${client.lastcon}</td>
                            <%--${client.longConnect}--%>
                        <td><a href="<c:url value="remove-client-${client.clientIP}"/> " class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="col-md-12 text-center">
                <ul class="pagination pagination-lg pager" id="myPager"></ul>
            </div>
        </div>
    </div>

</div>
<script>
    $.fn.pageMe = function(opts){
        var $this = this,
            defaults = {
                perPage: 7,
                showPrevNext: false,
                numbersPerPage: 5,
                hidePageNumbers: false,
                showFirstLast: true
            },
            settings = $.extend(defaults, opts);

        var listElement = $this;
        var perPage = settings.perPage;
        var children = listElement.children();
        var pager = $('.pagination');

        if (typeof settings.childSelector!="undefined") {
            children = listElement.find(settings.childSelector);
        }

        if (typeof settings.pagerSelector!="undefined") {
            pager = $(settings.pagerSelector);
        }

        var numItems = children.size();
        var numPages = Math.ceil(numItems/perPage);

        pager.data("curr",0);

        if (settings.showFirstLast){
            $('<li><a href="#" class="first_link">&lt;</a></li>').appendTo(pager);
        }
        if (settings.showPrevNext){
            $('<li><a href="#" class="prev_link">«</a></li>').appendTo(pager);
        }

        var curr = 0;
        while(numPages > curr && (settings.hidePageNumbers==false)){
            $('<li><a href="#" class="page_link">'+(curr+1)+'</a></li>').appendTo(pager);
            curr++;
        }

        if (settings.numbersPerPage>1) {
            $('.page_link').hide();
            $('.page_link').slice(pager.data("curr"), settings.numbersPerPage).show();
        }

        if (settings.showPrevNext){
            $('<li><a href="#" class="next_link">»</a></li>').appendTo(pager);
        }
        if (settings.showFirstLast){
            $('<li><a href="#" class="last_link">&gt;</a></li>').appendTo(pager);
        }

        pager.find('.page_link:first').addClass('active');
        pager.find('.prev_link').hide();
        if (numPages<=1) {
            pager.find('.next_link').hide();
        }
        pager.children().eq(2).addClass("active");

        children.hide();
        children.slice(0, perPage).show();

        pager.find('li .page_link').click(function(){
            var clickedPage = $(this).html().valueOf()-1;
            goTo(clickedPage,perPage);
            return false;
        });
        pager.find('li .first_link').click(function(){
            first();
            return false;
        });

        pager.find('li .prev_link').click(function(){
            previous();
            return false;
        });
        pager.find('li .next_link').click(function(){
            next();
            return false;
        });
        pager.find('li .last_link').click(function(){
            last();
            return false;
        });
        function previous(){
            var goToPage = parseInt(pager.data("curr")) - 1;
            goTo(goToPage);
        }

        function next(){
            goToPage = parseInt(pager.data("curr")) + 1;
            goTo(goToPage);
        }

        function first(){
            var goToPage = 0;
            goTo(goToPage);
        }

        function last(){
            var goToPage = numPages-1;
            goTo(goToPage);
        }

        function goTo(page){
            var startAt = page * perPage,
                endOn = startAt + perPage;

            children.css('display','none').slice(startAt, endOn).show();

            if (page>=1) {
                pager.find('.prev_link').show();
            }
            else {
                pager.find('.prev_link').hide();
            }

            if (page < (numPages - settings.numbersPerPage)) {
                pager.find('.next_link').show();
            }
            else {
                pager.find('.next_link').hide();
            }

            pager.data("curr",page);

            if (settings.numbersPerPage > 1) {
                $('.page_link').hide();

                if (page < (numPages - settings.numbersPerPage)) {
                    $('.page_link').slice(page, settings.numbersPerPage + page).show();
                }
                else {
                    $('.page_link').slice(numPages-settings.numbersPerPage).show();
                }
            }

            pager.children().removeClass("active");
            pager.children().eq(page+2).addClass("active");

        }
    };

    $(document).ready(function(){

        $('#myTable').pageMe({pagerSelector:'#myPager',showPrevNext:true,hidePageNumbers:false,perPage:7});

    });
</script>
</body>
</html>
