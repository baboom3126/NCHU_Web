<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");

session.setAttribute("login","0");
session.setAttribute("id1",null);
session.setAttribute("pwd1",null);
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
      <meta http-equiv="refresh" content="3;url=index.html">

    <title></title>
    <link rel="stylesheet" href="./css/main.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="./css/materialize.min.css">
    <script src="./js/materialize.min.js"></script>
  </head>
  <body>


    <div class="container">
    <div class="col s12 m7">
      <h2 class="header">LOGIN</h2>
      <div class="card horizontal">
        <div class="card-image">
          <img src="./img/main.jpg" style="width:100%; height:100%;">
        </div>
        <div class="card-stacked">
          <div class="card-content">
            <p></p>
          </div>
          <div class="card-content" style="text-align:left;">
<div class="container">

<p>
  登出成功
</p>
          </div></div>
          <div class="card-action">

            <button type="button" class="btn" name="button2" onclick="location.href='index.html'" >確定</button>

          </div>

        </div>
      </div>
    </div>
  </div>
  </body>
</html>
