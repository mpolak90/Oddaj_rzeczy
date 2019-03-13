package pl.mateuszpolak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mateuszpolak.service.OrganizationService;
import pl.mateuszpolak.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    OrganizationService organizationService;

    @RequestMapping("/menu")
    public String menu() {
        return "user/admin";
    }

    @RequestMapping("/users")
    public String users(Model model) {
        model.addAttribute("users", userService.findAll());
        return "user/users";
    }

    @RequestMapping("/admins")
    public String admins(Model model) {
        model.addAttribute("users", userService.findAllAdmins());
        return "user/admins";
    }

    @RequestMapping("/archive")
    public String archive(Model model) {
        model.addAttribute("orgs", organizationService.findAll());
        return "user/archive";
    }

    @RequestMapping("/organizations")
    public String organizations() {
        return "user/organizations";
    }
}