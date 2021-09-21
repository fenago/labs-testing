package com.fenago.struts2;

import com.opensymphony.xwork2.ActionSupport;


public class SomeOtherClass extends ActionSupport {
   private String name;

   public String execute() {
      return MyAction.GOOD;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }
}