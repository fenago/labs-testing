package com.fenago.struts2;

import com.opensymphony.xwork2.ActionSupport;

class MyAction extends ActionSupport {
   public static String GOOD = SUCCESS;
   public static String BAD = ERROR;
}

public class HelloWorld extends ActionSupport {
   private String name;

   public String execute() {
      if ("SECRET".equals(name)) return MyAction.GOOD;
      return MyAction.BAD;
   }
   
   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }
}
