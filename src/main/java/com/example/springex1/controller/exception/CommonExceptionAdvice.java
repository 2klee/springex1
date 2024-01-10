package com.example.springex1.controller.exception;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.sql.Array;
import java.util.Arrays;

@ControllerAdvice
@Log4j2
public class CommonExceptionAdvice {
  //스프링에서 예외 처리 할때 일반적으로
  //@ControllerAdvice 사용
  //@ExceptionHandler

  @ResponseBody
  @ExceptionHandler(NumberFormatException.class)
  public String exceptNumber(NumberFormatException numberFormatException){
    log.error("--------------------------------");
    log.error(numberFormatException.getMessage());

    return "NUMBER FORMAT EXCEPTION";
  }

  @ResponseBody
  @ExceptionHandler(Exception.class)
  public String excepCommon(Exception exception){
    log.error("================================================");
    log.error(exception.getMessage());

    StringBuffer buffer = new StringBuffer("<ul>");
    buffer.append("<li>" + exception.getMessage() + "</li>");

    Arrays.stream(exception.getStackTrace()).forEach(stackTraceElement -> {
      buffer.append("<li>" + stackTraceElement + "</li>");
    });

    buffer.append("</ul>");

    return buffer.toString();
  }


  @ExceptionHandler(NoHandlerFoundException.class)
  @ResponseStatus(HttpStatus.NOT_FOUND)
  public String notFound(){
    return "custom404";
  }


}
