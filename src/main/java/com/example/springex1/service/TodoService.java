package com.example.springex1.service;

import com.example.springex1.dto.TodoDTO;

import java.util.List;

public interface TodoService {
  void register(TodoDTO todoDTO);

  List<TodoDTO> getAll();

  TodoDTO getOne(Long tno);

  void remove(Long tno);

  void modify(TodoDTO todoDTO);

}
