package org.zzin.controller;


import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class HomeController {

    @GetMapping("")
    public String home() {
        return "home";
    }

    @GetMapping("index")
    public String index() {
        return "index";
    }

}
