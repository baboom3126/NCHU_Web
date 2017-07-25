<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <title>Introduction_JSP</title>
    <link rel="stylesheet" href="./index.css" type="text/css">
  </head>
  <body>
    <div>
    <form action ="send.jsp" method="post">
      <div class="div1">
      名字: <input type="text" name="text1"><br>
    </div>
    <div class="div2">
      類別: <select  name="select1" size="1" >
        <option value="學生">學生</option>
        <option value="上班族">上班族</option>
        <option value="在待業中">待業中</option>
      </select>
      </div>
      <div class="div3">
        技能 <p>(按住ctrl可複選)</p><br>
        <select name="select2" size="4" multiple >
          <option value="HTML">HTML</option>
          <option value="CSS">CSS</option>
          <option value="javascript">javascript</option>
          <option value="JSP">JSP</option>
        </select>
    </div>
    <div class="div4">
      性別: 男<input type="radio" name="radio1" value="Male">
      女<input type="radio" name="radio1" value="Female">
    </div>
      <div class="div5">
        興趣:
      吃飯<input type="checkbox" name="checkbox1" value="吃飯">
      睡覺<input type="checkbox" name="checkbox1" value="睡覺">
      咚咚<input type="checkbox" name="checkbox1" value="咚咚">
</div>
  <div class="div6">
  介紹:
  <br><textarea name="textarea1" cols="50" rows="6"></textarea>

  </div>
  <div class="div7">


      <input type="submit" class="button1" value="送出" >
        <input type="reset" class="button1" value="重設">

  </div>
</form></div>
  </body>
</html>
