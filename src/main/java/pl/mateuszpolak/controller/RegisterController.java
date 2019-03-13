package pl.mateuszpolak.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import pl.mateuszpolak.model.User;
import pl.mateuszpolak.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class RegisterController {

    @Autowired
    UserService userService;

    @PostMapping("/register")
    public String newuser(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String email = request.getParameter("email");

        List<User> list = userService.findByEmail(email);


        if (list.size() > 0) {
            session.setAttribute("error", "available");
            return "/register";
        }

        if (!(password.equals(password2))) {
            session.setAttribute("error", "password");
            session.setAttribute("email", email);
            return "/register";
        }
        User user = new User();
        user.setEmail(email);
        String hashPass = BCrypt.hashpw(password, BCrypt.gensalt());
        user.setPassword(hashPass);
        userService.save(user);
        return "login";
    }
}