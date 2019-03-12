package pl.mateuszpolak.filters;

import javax.servlet.*;
import java.io.IOException;

@javax.servlet.annotation.WebFilter(filterName = "WebFilter")
public class WebFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }
}