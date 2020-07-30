package org.zzin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import org.zzin.dto.BoardDTO;
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
        model.addAttribute("listMap",mapList);
        return "/board/tables";
    }

    @GetMapping("read")
    public String getRead(@RequestParam Long bno, Model model) {

        BoardDTO post = boardService.readPost(bno);
        model.addAttribute("post",post);
        return "/board/read";
    }

    @GetMapping("modify")
    public String getModify(@RequestParam Long bno, Model model)
    {
        BoardDTO post = boardService.readPost(bno);
        model.addAttribute("post",post);
        return "/board/modify";
    }
    @PostMapping("modify")
    public RedirectView postModify( BoardDTO dto, RedirectAttributes rttr){
        String result = boardService.modifyPost(dto);
        rttr.addFlashAttribute("result", result);
        rttr.addAttribute("bno",dto.getBno());
        return new RedirectView("/board/read");
    }
    @PostMapping("delete")
    public RedirectView postDelete( Long bno, RedirectAttributes rttr)
    {
        String result = boardService.deletePost(BoardDTO.builder().bno(bno).build());
        rttr.addFlashAttribute("result",result);
        return new RedirectView("/board/list");
    }

    @GetMapping("register")
    public String getRegister(){
        return "/board/register";
    }
    @PostMapping("register")
    public RedirectView postRegister( BoardDTO dto, RedirectAttributes rttr){
        String result = boardService.registerPost(dto);
        rttr.addFlashAttribute("result",result);
        return new RedirectView("/board/list");
    }
}
