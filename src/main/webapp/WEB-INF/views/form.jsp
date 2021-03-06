<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mateusz
  Date: 11.03.19
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<%@include file="include/head.jspx" %>
<body>
<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj ${logged.firstName}
                <ul class="dropdown">
                    <c:if test="${logged.admin}">
                        <li><a href="/admin/menu">Admin</a></li>
                    </c:if>
                    <li><a href="/logged/profile">Profil</a></li>
                    <li><a href="/logged/settings">Ustawienia</a></li>
                    <li><a href="/logged/donations">Moje zbiórki</a></li>
                    <li><a href="/logout">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Start</a></li>
            <li><a href="/steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="/about" class="btn btn--without-border">O nas</a></li>
            <li>
                <a href="/help" class="btn btn--without-border">Fundacje i organizacje</a>
            </li>
            <li><a href="/contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Oddaj rzeczy, których już nie chcesz<br/>
                <span class="uppercase">potrzebującym</span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span>Wybierz rzeczy</span></div>
                    </li>
                    <li>
                        <div><em>2</em><span>Spakuj je w worki</span></div>
                    </li>
                    <li>
                        <div><em>3</em><span>Wybierz fundację</span></div>
                    </li>
                    <li>
                        <div><em>4</em><span>Zamów kuriera</span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Jeśli wiesz komu chcesz pomóc, możesz wpisać nazwę tej organizacji w
                wyszukiwarce. Możesz też filtrować organizacje po ich lokalizacji
                bądź celu ich pomocy.
            </p>
            <p data-step="4">
                Na podstawie Twoich kryteriów oraz rzeczy, które masz do oddania
                wybraliśmy organizacje, którym możesz pomóc. Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="5">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/5</div>

        <form action="/logged/send" method="post">

            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input
                                type="checkbox"
                                name="products[]"
                                value="clothes-to-use"/>
                        <span class="checkbox"></span>
                        <span class="description">
                            ubrania, które nadają się do ponownego użycia
                        </span>
                    </label>
                </div>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input
                                type="checkbox"
                                name="products[]"
                                value="clothes-useless"/>
                        <span class="checkbox"></span>
                        <span class="description">ubrania, do wyrzucenia</span>
                    </label>
                </div>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="checkbox" name="products[]" value="toys"/>
                        <span class="checkbox"></span>
                        <span class="description">zabawki</span>
                    </label>
                </div>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="checkbox" name="products[]" value="books"/>
                        <span class="checkbox"></span>
                        <span class="description">książki</span>
                    </label>
                </div>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="checkbox" name="products[]" value="other"/>
                        <span class="checkbox"></span>
                        <span class="description">inne</span>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <input type="number" name="bags" step="1" min="1" id="bags" required/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 3 -->
            <div data-step="3">
                <h3>Lokalizacja:</h3>

                <div class="form-group--dropdown">
                    <select name="localization">
                        <option value="0">- wybierz -</option>
                        <c:forEach items="${cities}" var="city">
                            <option value="${city}">${city}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-section">
                    <h4>Komu możesz pomóc?</h4>
                    <div class="form-section--checkboxes">
                        <div class="form-group form-group--checkbox">
                            <label>
                                <input type="checkbox" name="help[]" value="children" checked/>
                                <span class="checkbox">dzieciom</span>
                            </label>
                        </div>

                        <div class="form-group form-group--checkbox">
                            <label>
                                <input type="checkbox" name="help[]" value="mothers" checked/>
                                <span class="checkbox">samotnym matkom</span>
                            </label>
                        </div>

                        <div class="form-group form-group--checkbox">
                            <label>
                                <input type="checkbox" name="help[]" value="homeless" checked/>
                                <span class="checkbox">bezdomnym</span>
                            </label>
                        </div>

                        <div class="form-group form-group--checkbox">
                            <label>
                                <input type="checkbox" name="help[]" value="disabled" checked/>
                                <span class="checkbox">niepełnosprawnym</span>
                            </label>
                        </div>

                        <div class="form-group form-group--checkbox">
                            <label>
                                <input type="checkbox" name="help[]" value="old" checked/>
                                <span class="checkbox">osobom starszym</span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h4>Wpisz nazwę konkretnej organizacji (opcjonalnie)</h4>
                    <div class="form-group">
                        <textarea rows="4" name="organization_search" id="organization-search"></textarea>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Szukaj</button>
                </div>
            </div>

            <!-- STEP 4 -->
            <div data-step="4">
                <h3>Wybierz organizację, której chcesz pomóc:</h3>

                <c:forEach items="${orgs}" var="org">

                    <div class="organizations" data-city='${org.address.city}' data-help='${org.orgGroup.name}' data-name='${org.name}'>
                        <div class="form-group form-group--checkbox">
                            <label>
                                <input type="radio" name="organization" value='${org.id}'/>
                                <span class="checkbox radio"></span>
                                <span class="description">
                                    <div class="title">${org.name}</div>
                                    <div class="subtitle">Cel i misja: ${org.description}</div>
                                </span>
                            </label>
                        </div>
                    </div>

                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="5">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica <input type="text" name="street" value="${logged.address.street}"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Numer <input type="text" name="number" value="${logged.address.number}"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto <input type="text" name="city" value="${logged.address.city}"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <input type="text" name="code" value="${logged.address.code}"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <input type="phone" name="telnum" value="${logged.address.telnum}"/>
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data <input type="date" name="data"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina <input type="time" name="time"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <textarea name="more_info" rows="5"></textarea>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 6 -->
            <div data-step="6">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text"
                                >4 worki ubrań w dobrym stanie dla dzieci</span
                                >
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text"
                                >Dla fundacji "Mam marzenie" w Warszawie</span
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li id="street">Prosta 51</li>
                                <li id="city">Warszawa</li>
                                <li id="code">99-098</li>
                                <li id="telnum">123 456 789</li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li id="date">13/12/2018</li>
                                <li id="time">15:40</li>
                                <li id="comments">Brak uwag</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>

            <!-- STEP 7 -->
            <div data-step="7">
                <h2>
                    Dziękujemy za przesłanie formularza.<br>
                    Na maila prześlemy wszelkie
                    informacje o odbiorze.
                </h2>
            </div>
        </form>
    </div>
</section>
<script src="/js/app.js"></script>
</body>
</html>