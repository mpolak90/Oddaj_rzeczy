package pl.mateuszpolak.filters;

import pl.mateuszpolak.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("logged") == null) {
            session.setAttribute("info", "Zaloguj się jako administrator, aby skorzystać z tej części serwisu.");
            response.sendRedirect(request.getContextPath() + "/login");

        } else {

            User user = (User) session.getAttribute("logged");
            session.removeAttribute("info");
            if (user.isAdmin()) {
                chain.doFilter(request, response);
            } else {
                session.setAttribute("info", "Nie posiadasz uprawnień administratora.");
                response.sendRedirect((request.getContextPath()) + "/login");
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
