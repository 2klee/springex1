package com.example.springex1.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.util.List;


@Getter
@ToString
public class PageResponseDTO <E>{ //제네릭 사용
  private int page;
  private int size;
  private int total;

  private int start; // 시작 페이지 번호
  private int end; // 끝 페이지 번호

  private boolean prev;  // 이전 페이지 존재여부
  private boolean next;  // 다음 페이지 존재여부

  private List<E> dtoList;


  // builder Builder()를 다른 이름으로 네이밍 할 때 사용
  @Builder(builderMethodName = "withAll")
  public PageResponseDTO(PageRequestDTO pageRequestDTO, List<E> dtoList, int total) {
    this.page = pageRequestDTO.getPage();
    this.size = pageRequestDTO.getSize();

    this.total = total;
    this.dtoList = dtoList;

    // 마지막 페이지, 시작 페이지 번호 계산
    this.end = (int)(Math.ceil(this.page / 10.0)) * 10;
    this.start = this.end - 9;

    int last = (int)(Math.ceil((total/(double)size)));

    this.end = end > last ? last : end;

    this.prev = this.start > 1;
    this.next = total > this.end * this.start;

  }
}
