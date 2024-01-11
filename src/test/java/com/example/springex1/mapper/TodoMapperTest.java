package com.example.springex1.mapper;

import com.example.springex1.domain.TodoVO;
import com.example.springex1.dto.PageRequestDTO;
import com.example.springex1.dto.PageResponseDTO;
import com.example.springex1.dto.TodoDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.awt.*;
import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

class TodoMapperTest {

  @Autowired(required = false)
  private TodoMapper todoMapper;

  @Test
  void insert() {
    TodoVO todoVO =TodoVO.builder()
            .title("테스트")
            .dueDate(LocalDate.of(2024,01,9))
            .writer("관리자")
            .build();

    todoMapper.insert(todoVO);
  }

  @Test
  public void testSelectAll(){
    List<TodoVO> voList = todoMapper.selectAll();
    voList.forEach(vo -> log.info(vo));
  }


  @Test
  public void testSelectOne(){
    TodoVO todoVO = todoMapper.selectOne(3L);
    log.info(todoVO);
  }

  @Test
  public void testSelectList() {
    PageRequestDTO pageRequestDTO = PageRequestDTO.builder().page(1).size(10).build();
    List<TodoVO> voList = todoMapper.selectList(pageRequestDTO);
    voList.forEach(vo -> log.info(vo));
  }

  @Test
  public void testPaging(){
    PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
            .page(3).size(10).build();

    List<TodoVO> voList = todoMapper.selectList(pageRequestDTO);
    voList.forEach(vo-> log.info(vo));
  }

  @Test
  public void testGetCount(){
    PageRequestDTO pageRequestDTO = PageRequestDTO.builder().page(1).size(10).build();
    int count = todoMapper.getCount(pageRequestDTO);
    log.info("count");
  }
  
  
//  @Test
//  public void testPaging(){
//    PageRequestDTO pageRequestDTO = PageRequestDTO.builder().page(1).size(10).build();
//
//    PageResponseDTO<TodoDTO> pageResponseDTO = todoService.getList(pageRequestDTO);
//
//    log.info("pageResponseDTO");
//
//    pageResponseDTO.getDtoList().stream().forEach(todoDTO -> log.info("todoDTO"));
//  }

}