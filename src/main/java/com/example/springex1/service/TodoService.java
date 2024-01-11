package com.example.springex1.service;

import com.example.springex1.dto.PageRequestDTO;
import com.example.springex1.dto.PageResponseDTO;
import com.example.springex1.dto.TodoDTO;

import java.util.List;

public interface TodoService {
  void register(TodoDTO todoDTO);

//  List<TodoDTO> getAll();  // 페이징 처리하면서 주석처리 TodoServiceImpl.java 에서도 주석처리
  PageResponseDTO getList(PageRequestDTO pageRequestDTO);

  TodoDTO getOne(Long tno);

  void remove(Long tno);

  void modify(TodoDTO todoDTO);


}
