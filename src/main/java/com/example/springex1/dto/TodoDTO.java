package com.example.springex1.dto;

import lombok.*;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TodoDTO {
  private Long tno;
  @NotEmpty
  private String title;
  @Future
  private LocalDate dueDate;
  private boolean finished;
  @NotEmpty
  private String writer;

}
