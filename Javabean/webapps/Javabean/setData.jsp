<%@ page contentType="text/html; charset=utf8" %>

<jsp:useBean id="person" scope="session" class="com.kclin.PersonData"/>

<jsp:setProperty name="person" property="userName" param="tbxName"/>
<jsp:setProperty name="person" property="age"/>


Hi!
<Font color = red>
<jsp:getProperty name="person" property="userName"/>
</Font>


<BR>您的年紀是
<Font color = blue>
<jsp:getProperty name="person" property="age"/>
</Font>歲
<br>
<br>
  /////改年紀////
  <br>
    <br>

<%
person.setAge(30); //呼叫Bean物件的方法, 設定屬性
%>
Hi!
<jsp:getProperty name="person" property="userName"/>
<br>新的年紀是


<%= person.getAge() %>
