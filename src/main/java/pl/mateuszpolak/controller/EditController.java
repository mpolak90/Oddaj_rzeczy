package pl.mateuszpolak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mateuszpolak.model.Address;
import pl.mateuszpolak.model.User;
import pl.mateuszpolak.service.AddressService;
import pl.mateuszpolak.service.UserService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/users/edit")
public class EditController {

    @Autowired
    UserService userService;

    @Autowired
    AddressService addressService;

    @GetMapping("/{id:[0-9]}")
    public String getEdit(Model model, @PathVariable Long id) {
        model.addAttribute(userService.find(id));
        return "user/edit/user";
    }

    @PostMapping("")
    public String postEdit(Model model, HttpServletRequest request) {
        Long id = Long.valueOf(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

        User user = userService.find(id);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        userService.save(user);
        model.addAttribute("user", user);
        return "user/details/user";
    }

    @GetMapping("/address/{id:[0-9]}")
    public String getAddress(Model model, @PathVariable Long id) {
        model.addAttribute(userService.find(id));
        return "user/edit/address";
    }

    @PostMapping("/address")
    public String postAddress(Model model, HttpServletRequest request) {
        Address address = new Address();
        User user = userService.find(Long.valueOf(request.getParameter("id")));

        address.setStreet(request.getParameter("street"));
        address.setNumber(request.getParameter("number"));
        address.setCode(request.getParameter("code"));
        address.setCity(request.getParameter("city"));
        address.setTelnum(request.getParameter("telnum"));

        user.setAddress(address);

        addressService.save(address);
        userService.save(user);
        model.addAttribute("user", userService.findByAddress(address));
        return "user/details/user";
    }

}
