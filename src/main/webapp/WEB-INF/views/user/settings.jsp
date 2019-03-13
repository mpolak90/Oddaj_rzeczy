<%--
  Created by IntelliJ IDEA.
  User: mateusz
  Date: 12.03.19
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/WEB-INF/views/include/head.jspx" %>
<body>
<%@include file="/WEB-INF/views/include/header.jsph" %>

<section class="help">
    <h2>Ustawienia</h2>

    <ul class="help--buttons">
        <li data-id="1"><a href="#" class="btn btn--without-border active">Dane podstawowe</a></li>
        <li data-id="2"><a href="#" class="btn btn--without-border">Domyślny adres</a></li>
        <li data-id="3"><a href="#" class="btn btn--without-border">Zarządzanie kontem</a></li>
    </ul>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>Możesz nam podać podstawowe informacje o sobie, aby wysyłanie rzeczy było jeszcze szybsze i prostsze!</p>

        <form method="post" action="/logged/data">
            <div class="form-group">
                <input type="text" name="firstName" value="${user.firstName}" required/>
                <h3>imię</h3>
            </div>
            <div class="form-group">
                <input type="text" name="lastName" value="${user.lastName}" required/>
                <h3>nazwisko</h3>
            </div>
            <div class="form-group form-group--buttons">
                <button class="btn" type="submit">Zapisz</button>
            </div>

        </form>

        <ul class="help--slides-items">

        </ul>
    </div>

    <!-- SLIDE 2 -->
    <div class="help--slides" data-id="2">
        <p>
            Ustawiając swój domyślny adres przespieszysz proces zamawiania kuriera.
        </p>
        <form method="post" action="/logged/address">
            <div class="form-group">
                <input type="text" name="street" value="${user.address.street}" required/>
                <h3>ulica</h3>
            </div>
            <div class="form-group">
                <input type="text" name="number" value="${user.address.number}" required/>
                <h3>numer bloku / mieszkania</h3>
            </div>
            <div class="form-group">
                <input type="text" name="code" value="${user.address.code}" required/>
                <h3>kod pocztowy</h3>
            </div>
            <div class="form-group">
                <input type="text" name="city" value="${user.address.city}" required/>
                <h3>miejscowość</h3>
            </div>
            <div class="form-group">
                <input type="text" name="telnum" value="${user.address.telnum}" required/>
                <h3>numer telefonu</h3>
            </div>
            <div class="form-group form-group--buttons">
                <button class="btn" type="submit">Zapisz</button>
            </div>

        </form>

    </div>

    <!-- SLIDE 3 -->
    <div class="help--slides" data-id="3">
        <p>Zmień swoje hasło, lub usuń konto.</p>

        <form method="post" action="/logged/advance">

            <div class="form-group">
                <input type="password" name="pass" required/>
                <h3>stare hasło</h3>
                <c:if test="${info != null}">
                    <h3 class="error">${info}</h3>
                </c:if>
            </div>
            <div class="form-group">
                <input type="password" name="password" required/>
                <h3>nowe hasło</h3>
            </div>
            <div class="form-group">
                <input type="password" name="password2" required/>
                <h3>powtórz nowe hasło</h3>
            </div>
            <div class="form-group form-group--buttons">
                <button class="btn" type="submit">Zapisz</button>
            </div>
        </form>
        <a href="/logged/disactive" onclick="return confirm('Uwaga! Chcesz usunąć swoje konto?')"><button class="btn control-buttons-tab">Usuń konto</button></a>


    </div>
</section>
<script src="/js/app.js"></script>
</body>
</html>
