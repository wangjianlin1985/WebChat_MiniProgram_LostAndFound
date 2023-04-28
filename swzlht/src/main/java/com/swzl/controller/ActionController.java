package com.swzl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/swzl")
public class ActionController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String login() {
        return "common/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "common/login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/login";
    }
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String indexPage() {
        return "common/index";
    }

    @RequestMapping(value = "/user_list", method = RequestMethod.GET)
    public String user_list() {
        return "common/user_list";
    }

    @RequestMapping(value = "/addbanner", method = RequestMethod.GET)
    public String addbanner() {
        return "admin/addbanner";
    }

    @RequestMapping(value = "/bannerlist", method = RequestMethod.GET)
    public String bannerlist() {
        return "admin/bannerlist";
    }

    @RequestMapping(value = "/addnotice", method = RequestMethod.GET)
    public String addnotice() {
        return "admin/addnotice";
    }

    @RequestMapping(value = "/gg_list", method = RequestMethod.GET)
    public String gg_list() {
        return "admin/gg_list";
    }


    @RequestMapping(value = "/lost1_list", method = RequestMethod.GET)
    public String lost1_list() {
        return "admin/lost1_list";
    }

    @RequestMapping(value = "/lost_list", method = RequestMethod.GET)
    public String lost_list() {
        return "admin/lost_list";
    }

}
