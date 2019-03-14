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
    <a href="/admin/org/${org.id}">
        <button class="btn">Powrót</button>
    </a>
    <c:if test="${org == null}">
        <h1>Nowa organizacja</h1>
    </c:if>
    <c:if test="${org != null}">
        <h1>Dane organizacji ${org.name}</h1>
    </c:if>
    <form action="/admin/org/edit" method="post">
        <input type="hidden" value="${org.id}" name="id">
        <input type="hidden" value="${org.address.id}" name="address_id">
        <table class="table">
            <tr>
                <th>nazwa</th>
                <td><input value="${org.name}" name="name" required></td>
            </tr>
            <tr>
                <th>cel i misja</th>
                <td><input value="${org.description}" name="description" required></td>
            </tr>
            <tr>
                <th>NIP</th>
                <td><input value="${org.nip}" name="nip" required></td>
            </tr>
            <tr>
                <th>adres</th>
                <td></td>
            </tr>
            <tr>
                <td>ulica</td>
                <td><input value="${org.address.street}" name="street" required></td>
            </tr>
            <tr>
                <td>numer</td>
                <td><input value="${org.address.number}" name="number" required></td>
            </tr>
            <tr>
                <td>kod pocztowy</td>
                <td><input value="${org.address.code}" name="code" required></td>
            </tr>
            <tr>
                <td>miasto</td>
                <td><input value="${org.address.city}" name="city" required></td>
            </tr>
            <tr>
                <td>Nr telefonu</td>
                <td><input value="${org.address.telnum}" name="telnum" required></td>
            </tr>
            <tr>
                <td><input class="btn" type="submit" name="lastName" value="Zapisz"></td>
            </tr>
        </table>
    </form>
</section>
</body>
</html>