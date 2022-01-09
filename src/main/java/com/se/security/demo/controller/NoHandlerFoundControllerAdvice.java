package com.se.security.demo.controller;

import java.io.IOException;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.HttpClientErrorException.BadRequest;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class NoHandlerFoundControllerAdvice {

    @ExceptionHandler(NoHandlerFoundException.class)
    public String handle(NoHandlerFoundException ex) {
  	  return "404";
  	}
    @ExceptionHandler(IOException.class)
    public String handle2(NoHandlerFoundException ex) {
    	  return "404";
    }
    @ExceptionHandler({ Throwable.class })
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handle3(NoHandlerFoundException ex) {
  	  return "404";
  }
}