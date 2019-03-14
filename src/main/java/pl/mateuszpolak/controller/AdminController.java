package pl.mateuszpolak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mateuszpolak.model.Organization;
import pl.mateuszpolak.model.User;
import pl.mateuszpolak.service.OrganizationService;
import pl.mateuszpolak.service.UserService;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping("/organizations")
    public String archive(Model model) {
        model.addAttribute("orgs", organizationService.findAll());
        return "user/organizations";
    }

    @RequestMapping("/archive")
    public String organizations() {
        return "user/archive";
    }

    @GetMapping("/users/details/{id:[0-9]}")
    public String userDetails(Model model, @PathVariable Long id) {
        model.addAttribute("user", userService.find(id));
        return "user/details/user";
    }

    @GetMapping("/users/edit/admin/{id:[0-9]}")
    public String admin(Model model, @PathVariable Long id) {
        User user = userService.find(id);
        if (user.isAdmin()) {
            user.setAdmin(false);
            userService.save(user);
        } else {
            user.setAdmin(true);
            userService.save(user);
        }
        model.addAttribute("user", user);
        return "user/details/user";
    }

    @GetMapping("users/edit/block/{id:[0-9]}")
    public String block(Model model, @PathVariable Long id) {
        User user = userService.find(id);
        if (user.isActive()) {
            user.setActive(false);
            userService.save(user);
        } else {
            user.setActive(true);
            userService.save(user);
        }
        model.addAttribute("user", user);
        return "user/details/user";
    }

    @GetMapping("/org/{id:[0-9]}")
    public String org(Model model, @PathVariable Long id) {
        model.addAttribute("org", organizationService.find(id));
        return "user/details/organization";
    }
}