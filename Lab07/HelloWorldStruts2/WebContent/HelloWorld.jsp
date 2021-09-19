<%@ page contentType = "text/html; charset = UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags"%>

<html>
   <head>
      <title>Hello World</title>
      <s:head />
   </head>
   
   <body>
      <s:form action = "login.action">
         <s:select name = "username" label = "Username"
            list = "{'Mike','John','Smith'}" />

         <s:select label = "Company Office" name = "mySelection"
            value = "%{'America'}" list="%{#{'America':'America'}}">
            <s:optgroup label = "Asia" 
               list = "%{#{'India':'India','China':'China'}}" />
            <s:optgroup label = "Europe"
               list="%{#{'UK':'UK','Sweden':'Sweden','Italy':'Italy'}}" />
         </s:select>

         <s:combobox label = "My Sign" name = "mySign"
            list = "#{'aries':'aries','capricorn':'capricorn'}" headerkey = "-1" 
            headervalue = "--- Please Select ---" emptyOption = "true" value = "capricorn" />
         <s:doubleselect label = "Occupation" name = "occupation"
            list = "{'Technical','Other'}" doublename = "occupations2"
            doubleList="top == 'Technical' ? 
            {'I.T', 'Hardware'} : {'Accounting', 'H.R'}" />
      </s:form>
   </body>
</html>