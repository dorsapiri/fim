<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 8/13/17
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logs</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <%--<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>--%>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/bootstrap-table/dist/bootstrap-table.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/mdb/js/mdb.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/mdb/css/mdb.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/bootstrap-table/dist/bootstrap-table.css"/>" rel="stylesheet">
    <%--<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">--%>
    <link href="<c:url value="/resources/css/stylesheet.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome-4.6.3/css/font-awesome.min.css"/>" rel="stylesheet">
</head>
<body>
<jsp:include page="header-first.jsp"/>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <table class="table table-striped table-responsive" id="table-logs"
            <%--data-query-params="queryParams" data-pagination="true" data-toggle="table" data-classes="table-no-bordered" data-page-size="2"--%>>
                <thead>
                <tr>
                    <th data-field="ip">IP</th>
                    <th data-field="created">created</th>
                    <th data-field="deleted">deleted</th>
                    <th data-field="modified">modified</th>
                    <th data-field="renamed">renamed</th>
                    <th data-field="security">security</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${logEventss}" var="log">
                    <tr>
                        <td>${log.clientIP}</td>
                        <td>
                            ${log.created}
                        </td>
                        <td>
                                ${log.deleted}
                        </td>
                        <td>
                                ${log.modified}
                        </td>
                        <td>
                                ${log.renamed}
                        </td>
                        <td>
                                ${log.security}
                        </td>
                            <%--<td><input type="button" value="+" class="btn btn-success"></td>--%>
                        <td><a href="<c:url value="full-logs-${log.clientIP}"/> " class="btn btn-danger">File logs</a></td>
                        <td><a href="<c:url value="view-reglogs-${log.clientIP}"/> " class="btn btn-danger">Registry Logs</a></td>
                        <%--<td><a href="<c:url value="remove-client-${client.clientIP}"/> " class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    /*$(document).ready(function () {
        $('#table-logs').DataTable();
    });*/
    /*function queryParams() {
        return {
            type: 'owner',
            sort: 'updated',
            direction: 'desc',
            per_page: 100,
            page: 1
        };
    }

    $('table').on('page-change.bs.table',function(e,number, size) {
        console.log('page-change.bs.table', {'number': number, 'size': size, 'e': e, 'this': this});
        console.log('options', $(this).bootstrapTable('getOptions'));
    });*/
</script>
</body>
</html>
