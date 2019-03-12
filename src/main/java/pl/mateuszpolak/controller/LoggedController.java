package pl.mateuszpolak.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/logged")
public class LoggedController {

    @RequestMapping("/form")
    public String form() {
        return "form";
    }
}
