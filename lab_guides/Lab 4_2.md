
Struts 2 - Redirect Action
==========================

------------------------------------------------------------------------

The **redirect** result type calls the standard
*response.sendRedirect()* method, causing the browser to create a new
request to the given location.

We can provide the location either in the body of the \<result\...\>
element or as a \<param name = \"location\"\> element. Redirect also
supports the **parse** parameter. Here\'s an example configured using
XML −

```
<action name = "hello" 
   class = "com.tutorialspoint.struts2.HelloWorldAction"
   method = "execute">
   <result name = "success" type = "redirect">
       <param name = "location">
         /NewWorld.jsp
      </param >
   </result>
</action>
```

So just modify your **WebContent/WEB-INF/classes/struts.xml** file to
define redirect type as mentioned above −

```
<?xml version = "1.0" Encoding = "UTF-8"?>
<!DOCTYPE struts PUBLIC
    "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
    "http://struts.apache.org/dtds/struts-2.0.dtd">

<struts>
   <constant name = "struts.devMode" value = "true" />
   <package name = "helloworld" extends = "struts-default">

      <action name = "hello" 
         class = "com.tutorialspoint.struts2.HelloWorldAction"
         method = "execute">
         <result name = "success" type = "redirect">
            <param name = "location">
             /NewWorld.jsp
            </param >
        </result>
      </action>

      <action name = "index"> 
         <result >/index.jsp</result>
      </action>

   </package>
</struts>
```

Here **NewWorld.jsp** is a new page where you will be redirected
whenever your action retruns \"success\". Let us keep
**WebContent/WEB-INF/lib/web.xml** without any change, so its content
will be as follows −

```
<?xml version = "1.0" Encoding = "UTF-8"?>
<web-app xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance"
   xmlns = "http://java.sun.com/xml/ns/javaee" 
   xmlns:web = "http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd"
   xsi:schemaLocation = "http://java.sun.com/xml/ns/javaee 
   http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
   id = "WebApp_ID" version = "3.0">

   <display-name>Struts 2</display-name>

   <welcome-file-list>
      <welcome-file>index.jsp</welcome-file>
   </welcome-file-list>
   
   <filter>
      <filter-name>struts2</filter-name>
      <filter-class>
         org.apache.struts2.dispatcher.FilterDispatcher
      </filter-class>
   </filter>

   <filter-mapping>
      <filter-name>struts2</filter-name>
      <url-pattern>/*</url-pattern>
   </filter-mapping>

</web-app>
```

Create action class file **Java Resources/src/HelloWorldAction.java** as
follows −

```
package com.tutorialspoint.struts2;

import com.opensymphony.xwork2.ActionSupport;

public class HelloWorldAction extends ActionSupport{
   private String name;

   public String execute() throws Exception {
      return "success";
   }
   
   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }
}
```

Let create main page **WebContent/WEB-INF/index.jsp** with the following
content −

```
<%@ page language = "java" contentType = "text/html; charset = ISO-8859-1"
   pageEncoding = "ISO-8859-1"%>
<%@ taglib prefix = "s" uri = "/struts-tags"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
      <title>Hello World</title>
   </head>
   <body>
      <h1>Hello World From Struts2</h1>
      <form action = "hello">
         <label for = "name">Please enter your name</label><br/>
         <input type = "text" name = "name"/>
         <input type = "submit" value = "Say Hello"/>
      </form>
   </body>
</html>
```

Let us create **WebContent/WEB-INF/NewWorld.jsp** where request will be
redirected in case action returns \"success\" −

```
<%@ page language = "java" contentType = "text/html; charset = ISO-8859-1"
   pageEncoding = "ISO-8859-1"%>
<%@ taglib prefix = "s" uri = "/struts-tags"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
      <title>Redirected Page</title>
   </head>
   <body>
      <h1>New Page after redirection</h1>
   </body>
</html>
```

Now Right click on the project name and click **Export \> WAR File** to
create a War file. Then deploy this WAR in the Tomcat\'s webapps
directory. Finally, start Tomcat server and try to access URL
http://localhost:8080/HelloWorldStruts2/index.action. This will give you
following screen −

![](./images/helloworldstruts4.jpg)

Enter any value in the text box and submit the page. You should see the
next page after redirection −

