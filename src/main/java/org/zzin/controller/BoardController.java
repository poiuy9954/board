package org.zzin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zzin.service.BoardService;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board/")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("list")
    public String getList(Model model) {

        List<Map<String,String>> mapList = boardService.getList();

        mapList.forEach(i->{
            System.out.println(i);
        });

        model.addAttribute("listMap",mapList);
        return "/board/tables";
    }

    @GetMapping("read")
    public String getRead() {
        return "/board/read";
    }

    @GetMapping("modify")
    public String getModify(){
        return "/board/modify";
    }

}
