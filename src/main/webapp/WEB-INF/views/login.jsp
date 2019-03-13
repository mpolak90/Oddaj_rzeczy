<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<%@include file="include/head.jspx" %>

<body>

<%@include file="include/mini.jsph" %>

<section class="login-page">
    <h2>Zaloguj się</h2>

    <c:if test="${info != null}">
        <h3>${info}</h3>
    </c:if>

    <form action="/login" method="post">
        <div class="form-group">
            <input type="email" name="email" placeholder="Email" required/>
            <c:if test="${error != null}">
                <span class="error">${error}</span>
             </c:if>
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło" required/>
            <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/register" class="btn btn--without-border">Załóż konto</a>
            <button class="btn" type="submit">Zaloguj się</button>
        </div>

    </form>
</section>

<%@include file="include/contact.jspf" %>

</body>
</html>