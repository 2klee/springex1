package com.example.springex1.controller;

import com.example.springex1.dto.TodoDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/todo")
@Log4j2
public class TodoController {
  // list
  @RequestMapping("/list")
  public void list(){
    log.info("todo list");
  }

  //register get
  @GetMapping("/register")
  public void registerGet(){
    log.info("todo registerGet");
  }

  //register post
  @PostMapping("/register")
  public void registerPost(TodoDTO todoDTO){
    log.info("todo registerPost");
    log.info(todoDTO);
  }

}
