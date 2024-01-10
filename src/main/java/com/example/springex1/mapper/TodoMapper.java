package com.example.springex1.mapper;

import com.example.springex1.domain.TodoVO;
import com.example.springex1.dto.PageRequestDTO;

import java.util.List;

public interface TodoMapper {
  void insert(TodoVO todoVO);

  List<TodoVO> selectAll();

  TodoVO selectOne(Long tno);

  void delete(Long tno);

  void update(TodoVO todoVO);

  List<TodoVO> selectList(PageRequestDTO pageRequestDTO);

}
