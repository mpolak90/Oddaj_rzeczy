package pl.mateuszpolak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mateuszpolak.model.Address;
import pl.mateuszpolak.model.Organization;
import pl.mateuszpolak.service.AddressService;
import pl.mateuszpolak.service.OrganizationService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/org/edit")
public class OrganizationEditController {

    @Autowired
    OrganizationService organizationService;

    @Autowired
    AddressService addressService;

    @GetMapping("/{id:[0-9]}")
    public String getEdit(Model model, @PathVariable Long id) {
        model.addAttribute("org", organizationService.find(id));
        return "user/edit/organization";
    }

    @GetMapping("")
    public String newOrg() {
        return "user/edit/organization";
    }

    @PostMapping("")
    public String postEdit(Model model, HttpServletRequest request) {
        Organization organization;
        Address address;

        if (request.getParameter("org") == null) {
            organization = new Organization();
            address = new Address();
        } else {
            organization = organizationService.find(Long.valueOf(request.getParameter("id")));
            address = addressService.find(Long.valueOf(request.getParameter("address_id")));
        }

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String nip = request.getParameter("nip");

        organization.setName(name);
        organization.setDescription(description);
        organization.setNip(nip);

        address.setStreet(request.getParameter("street"));
        address.setNumber(request.getParameter("number"));
        address.setCode(request.getParameter("code"));
        address.setCity(request.getParameter("city"));
        address.setTelnum(request.getParameter("telnum"));

        addressService.save(address);

        organization.setAddress(address);
        organizationService.save(organization);

        model.addAttribute("org", organization);
        return "user/details/organization";
    }

    @GetMapping("/address/{id:[0-9]}")
    public String getAddress(Model model, @PathVariable Long id) {
        model.addAttribute("org", organizationService.find(id));
        return "user/edit/address";
    }

    @PostMapping("/address")
    public String postAddress(Model model, HttpServletRequest request) {

        Address address;

        if (request.getParameter("address_id") != null) {
            address = addressService.find(Long.valueOf(request.getParameter("address_id")));
        } else {
            address = new Address();
        }

        Organization organization = organizationService.find(Long.valueOf(request.getParameter("id")));

        address.setStreet(request.getParameter("street"));
        address.setNumber(request.getParameter("number"));
        address.setCode(request.getParameter("code"));
        address.setCity(request.getParameter("city"));
        address.setTelnum(request.getParameter("telnum"));

        organization.setAddress(address);

        addressService.save(address);
        organizationService.save(organization);
        model.addAttribute("org", organizationService.findByAddress(address));
        return "user/details/organization";
    }

    @GetMapping("/block/{id:[0-9]}")
    public String block(Model model, @PathVariable Long id) {
        Organization organization = organizationService.find(id);

        if (organization.isActive()) {
            organization.setActive(false);
            organizationService.save(organization);
        } else {
            organization.setActive(true);
            organizationService.save(organization);
        }
        model.addAttribute("org", organization);
        return "/user/details/organization";
    }

}
