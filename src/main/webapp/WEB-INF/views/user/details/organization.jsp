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
    <h1>${org.name}</h1>
    <table class="table">
        <tr>
            <th>Nazwa</th>
            <td>${org.name}</td>
        </tr>
        <tr>
            <th>Cel i misja</th>
            <td>${org.description}</td>
        </tr>
        <tr>
            <th>Grupa</th>
            <td>${org.orgGroup.name}</td>
        </tr>
        <tr>
            <th>NIP</th>
            <td>${org.nip}</td>
        </tr>
        <tr>
            <th>Adres</th>
            <c:if test="${org.address == null}">
                <td>brak</td>
            </c:if>
            <c:if test="${org.address != null}">
                <td>${org.address.street} ${org.address.number}, ${org.address.code} ${org.address.city},
                    tel. ${org.address.telnum}</td>
            </c:if>
            <th>Aktywność</th>
            <c:if test="${org.active == true}">
                <td><img src="/images/true.png"></td>
            </c:if>
            <c:if test="${org.active != true}">
                <td><img src="/images/false.png"></td>
            </c:if>
        </tr>
    </table>
    <ul class="help--buttons">
        <li><a href="/admin/org/edit/${org.id}" class="btn btn--without-border">Zmień dane</a></li>
        <li><a href="/admin/org/edit/address/${org.id}" class="btn btn--without-border">Zmień adres</a></li>
        <c:if test="${org.active}">
            <li><a href="/admin/org/edit/block/${org.id}" class="btn btn--without-border">Zablokuj</a></li>
        </c:if>
        <c:if test="${!org.active}">
            <li><a href="/admin/org/edit/block/${org.id}" class="btn btn--without-border">Odblokuj</a></li>
        </c:if>
    </ul>
</section>
</body>
</html>