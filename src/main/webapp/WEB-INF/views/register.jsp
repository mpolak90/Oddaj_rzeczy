<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<%@include file="include/head.jspx" %>
<body>

<%@include file="include/mini.jsph" %>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form method="post" action="/register">
        <c:if test="${error != 'password'}">
            <div class="form-group">
                <input type="email" name="email" placeholder="Email" required/>
                <c:if test="${error == 'available'}">
                    <span class="error">Adres email jest już zarejestrowany</span>
                </c:if>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Hasło" required/>
            </div>
            <div class="form-group">
                <input type="password" name="password2" placeholder="Powtórz hasło" required/>
            </div>
        </c:if>

        <c:if test="${error == 'password'}">
            <div class="form-group">
                <input type="email" name="email" value="${email}"/>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Hasło"/>
                <span class="error">Hasła nie są jednakowe</span>
            </div>
            <div class="form-group">
                <input type="password" name="password2" placeholder="Powtórz hasło"/>
            </div>
        </c:if>

        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form>
</section>

<%@include file="include/contact.jspf" %>

</body>
</html>