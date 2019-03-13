package pl.mateuszpolak.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @RequestMapping("/")
    public String index(HttpSession session) {
        session.removeAttribute("error");
        session.removeAttribute("info");
        session.removeAttribute("email");
        return "index";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/about")
    public String about() {
        return "about";
    }

    @RequestMapping("/contact")
    public String contact() {
        return "contact";
    }

    @RequestMapping("/help")
    public String help() {
        return "help";
    }

    @RequestMapping("/steps")
    public String steps() {
        return "steps";
    }
}