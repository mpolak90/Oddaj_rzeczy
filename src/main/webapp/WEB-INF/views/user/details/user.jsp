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
    <h1>Użytkownik ${user.email}</h1>
    <table class="table">
        <tr>
            <th>Imię</th>
            <c:if test="${user.firstName == null}">
                <td>brak</td>
            </c:if>
            <c:if test="${user.firstName != null}">
                <td>${user.firstName}</td>
            </c:if>
        </tr>
        <tr>
            <th>Nazwisko</th>
            <c:if test="${user.lastName == null}">
                <td>brak</td>
            </c:if>
            <c:if test="${user.lastName != null}">
                <td>${user.lastName}</td>
            </c:if>
        </tr>
        <tr>
            <th>Adres</th>
            <c:if test="${user.address == null}">
                <td>brak</td>
            </c:if>
            <c:if test="${user.address != null}">
                <td>${user.address.street} ${user.address.number}, ${user.address.code} ${user.address.city},
                    tel. ${user.address.telnum}</td>

            </c:if>
        </tr>
    </table>
    <ul class="help--buttons">
        <li><a href="/admin/users/edit/${user.id}" class="btn btn--without-border">Zmień dane</a></li>
        <li><a href="/admin/users/edit/address/${user.id}" class="btn btn--without-border">Zmień adres</a></li>
        <c:if test="${user.active}">
            <li><a href="/admin/users/edit/block/${user.id}" class="btn btn--without-border">Zablokuj</a></li>
        </c:if>
        <c:if test="${!user.active}">
            <li><a href="/admin/users/edit/block/${user.id}" class="btn btn--without-border">Odblokuj</a></li>
        </c:if>
        <c:if test="${user.admin}">
            <li><a href="/admin/users/edit/admin/${user.id}" class="btn btn--without-border">Odbierz uprawnienia</a>
            </li>
        </c:if>
        <c:if test="${!user.admin}">
            <li><a href="/admin/users/edit/admin/${user.id}" class="btn btn--without-border">Nadaj uprawnienia</a></li>
        </c:if>
    </ul>
</section>
</body>
</html>