package com.example.springex1.mapper;

import com.example.springex1.domain.TodoVO;

import java.util.List;

public interface TodoMapper {
  void insert(TodoVO todoVO);

  List<TodoVO> selectAll();

}
