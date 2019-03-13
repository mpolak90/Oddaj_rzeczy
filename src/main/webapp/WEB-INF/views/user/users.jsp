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
    <h1>Użytkownicy</h1>
    <table class="table table-hover">
        <thead>
        <tr>
            <th colspan="3"><input id="myInput" placeholder="Szukaj..."></th>
        </tr>

        <tr>
            <th>E-mail</th>
            <th>Imię</th>
            <th>Nazwisko</th>
            <th>Ulica</th>
            <th>Numer</th>
            <th>Kod</th>
            <th>Miasto</th>
            <th>Nr tel.</th>
            <th>Aktywność</th>
            <th>Administrator</th>
        </tr>
        </thead>
        <tbody id="myTable">
        <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.email}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.address.street}</td>
            <td>${user.address.number}</td>
            <td>${user.address.code}</td>
            <td>${user.address.city}</td>
            <td>${user.address.telnum}</td>
            <c:if test="${user.active}">
                <td><img src="/images/true.png"></td>
            </c:if>
            <c:if test="${!user.active}">
                <td><img src="/images/false.png"></td>
            </c:if>
            <c:if test="${user.admin}">
                <td><img src="/images/true.png"></td>
            </c:if>
            <c:if test="${!user.admin}">
                <td><img src="/images/false.png"></td>
            </c:if>
            <td><a href="/admin/users/details/${user.id}"><button class="btn">Więcej...</button></a></td>
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