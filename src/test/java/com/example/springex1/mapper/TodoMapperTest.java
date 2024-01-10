package com.example.springex1.mapper;

import com.example.springex1.domain.TodoVO;
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
}