package pl.mateuszpolak.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mateuszpolak.model.Address;
import pl.mateuszpolak.model.User;
import pl.mateuszpolak.service.AddressService;
import pl.mateuszpolak.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/logged")
public class LoggedController {

    @Autowired
    UserService userService;

    @Autowired
    AddressService addressService;

    @RequestMapping("/form")
    public String form() {
        return "form";
    }

    @RequestMapping("/profile")
    public String form(HttpSession session) {
        session.setAttribute("bags", 5);
        session.setAttribute("orgs", 5);
        session.setAttribute("donations", 5);
        return "/user/profile";
    }

    @RequestMapping("/settings")
    public String settings(HttpSession session) {
        return "/user/settings";
    }

    @PostMapping("/data")
    public String data(HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("logged");
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        userService.save(user);
        session.setAttribute("logged", user);
        return "user/settings";
    }

    @PostMapping("/address")
    public String address(HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("logged");
        Address address = new Address();

        address.setStreet(request.getParameter("street"));
        address.setNumber(request.getParameter("number"));
        address.setCode(request.getParameter("code"));
        address.setCity(request.getParameter("city"));
        address.setTelnum(request.getParameter("telnum"));

        addressService.save(address);
        user.setAddress(address);
        userService.save(user);
        session.setAttribute("logged",user);
        return "user/settings";
    }

    @PostMapping("/advance")
    public String advance(HttpServletRequest request, HttpSession session) {
        String pass = request.getParameter("pass");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        User user = (User) session.getAttribute("logged");
        if (!(BCrypt.checkpw(pass, user.getPassword()))) {
            request.setAttribute("info", "Błędne hasło");
            return "user/settings";
        }
        if (!(password.equals(password2))) {
            request.setAttribute("info", "Hasła nie są jednakowe");
            return "user/settings";
        }

        String hashPass = BCrypt.hashpw(password, BCrypt.gensalt());
        user.setPassword(hashPass);
        userService.save(user);
        session.setAttribute("logged", user);
        request.setAttribute("info", "Hasło zostało zmienione");
        return "user/user";
    }

    @RequestMapping("/disactive")
    public String disactive(HttpSession session) {
        User user = (User) session.getAttribute("logged");

        user.setActive(false);
        userService.save(user);
        session.removeAttribute("logged");
        return "index";
    }
}