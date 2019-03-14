<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Pomagam</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<%@include file="/WEB-INF/views/include/admin.jsp" %>
<section class="help">
    <h1>Dane użytkownika ${user.email}</h1>
    <form action="/admin/users/edit" method="post">
        <input type="hidden" value="${user.id}" name="id">
    <table class="table">
        <tr>
            <td>imię</td>
            <td><input value="${user.firstName}" name="firstName"></td>
        </tr>
        <tr>
            <td>nazwisko</td>
            <td><input value="${user.lastName}" name="lastName"></td>
        </tr>
        <tr>
            <td><a href="/admin/users/details/${user.id}"><button class="btn">Powrót</button></a></td>
            <td><input class="btn" type="submit" name="lastName" value="Zapisz"></td>
        </tr>
    </table>
    </form>
</section>
</body>
</html>