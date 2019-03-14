package pl.mateuszpolak.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mateuszpolak.model.User;
import pl.mateuszpolak.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @PostMapping("/login")
    public String login(HttpServletRequest request, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (userService.findByEmail(email).size() == 1) {
            List<User> list = userService.findByEmail(email);
            User user = list.get(0);

            if (BCrypt.checkpw(password, user.getPassword())) {
                if (user.isActive()) {
                    session.removeAttribute("error");
                    session.setAttribute("logged", user);
                    if (user.isAdmin()) {
                        return "/user/admin";
                    } else {
                        return "/user/profile";
                    }
                } else {
                    session.setAttribute("error", "konto nieaktywne");
                    return "login";
                }
            } else {
                session.setAttribute("error", "nieprawidłowy adres email lub hasło");
                return "login";
            }

        } else {
            session.setAttribute("error", "nieprawidłowy adres email lub hasło");
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }
}