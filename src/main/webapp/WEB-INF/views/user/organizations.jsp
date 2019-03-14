<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Pomagam</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include/admin.jsp" %>
<section class="help">
    <h1>Fundacje i organizacje</h1>
    <table class="table table-hover">
        <thead>
        <tr>
            <th colspan="3"><input id="myInput" placeholder="Szukaj..."></th>
            <th colspan="2"><a href="/admin/org/edit"><button class="btn">Dodaj organizację</button></a></th>
            <th colspan="2"><a href="/admin/org/groups"><button class="btn">Grupy</button></a></th>
        </tr>
        <tr>
            <th>Nazwa</th>
            <th>NIP</th>
            <th>Grupa</th>
        </tr>
        </thead>
        <tbody id="myTable">
        <c:forEach items="${orgs}" var="org">
            <tr>
                <td>${org.name}</td>
                <td>${org.nip}</td>
                <td>${org.orgGroup.name}</td>
                <td><a href="/admin/org/${org.id}"><button class="btn">Więcej...</button></a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</section>
<script>
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
</body>
</html>