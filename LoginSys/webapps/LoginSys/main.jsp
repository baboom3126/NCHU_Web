<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%

String ip="140.120.49.205:3306";
String user="4104029042";
String pwd="Ss4104029042!";
String db="4104029042";
String driver="com.mysql.jdbc.Driver";
Connection con = null;
Statement stmt = null;
ResultSet rs= null;
try{
  String url="jdbc:mysql://"+ip+"/"+db+"?useUnicode=true&characterEncoding=utf-8";
  Class.forName(driver).newInstance();
  con=DriverManager.getConnection(url,user,pwd);
  stmt=con.createStatement();
  String sql="select * from database1;";
  rs=stmt.executeQuery(sql);
}catch(Exception ex){
  out.print(ex);
}


%>
<%
String a;
String b;

request.setCharacterEncoding("UTF-8");

a=(String)session.getAttribute("id1");
b=(String)session.getAttribute("pwd1");

///////驗證登入狀態//////
String login;
login=(String)session.getAttribute("login");
if(login.equals("0"))
{
  response.sendRedirect("index.html");
}
///////驗證登入狀態//////


String c="FAIL";

String id="";
String name="";
String userid="";
String password="";
String birthday="";
String memo="";
String createdAt="";

if(rs!=null){
while(rs.next())
{
String id1 = rs.getString("id");
String name1 = rs.getString("name");
String userid1 = rs.getString("Userid");
String password1 = rs.getString("password");
String birthday1= rs.getString("birthday");
String memo1= rs.getString("memo");
String createdAt1 = rs.getString("createdAt");
try{
if(a.equals(userid1)&&b.equals(password1))
{

  c="登入成功";
  id=id1;
  name=name1;
  userid=userid1;
  password=password1;
  birthday=birthday1;
  memo=memo1;
  createdAt=createdAt1;
}}
catch(Exception e){}

}}

stmt.close();
rs.close();
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>登入</title>
    <link rel="stylesheet" href="./css/main.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="./css/materialize.min.css">
    <script src="./js/materialize.min.js"></script>
  </head>
  <body>
    <div class="container">
      <h2 class="header"><%=c%></h2>
<div class="container">
      <div class="card">

          <div class="card-tabs">
            <ul class="tabs tabs-fixed-width">
              <li class="tab"><a class="active" href="#test4">首頁</a></li>
              <li class="tab"><a href="#" onclick="location.href='query.jsp'">查詢</a></li>
            </ul>
          </div>
          <div class="card-content grey lighten-4">
            <div id="test4">

              <div class="container">
              <table class="highlight" >
                <tr >
                  <td class="text1">序號</td><td class="text1"><%=id%></td>
                </tr>
                <tr >
                  <td class="text1">NAME</td><td class="text1"><%=name%></td>
                </tr>
                <tr >
                  <td class="text1">帳號</td><td class="text1"><%=userid%></td>
                </tr>
                <tr >
                  <td class="text1">生日</td><td class="text1"><%=birthday%></td>
                </tr>
                <tr >
                  <td class="text1">備忘</td><td class="text1"><%=memo%></td>
                </tr>
                <tr >
                  <td class="text1">創建時間</td><td class="text1"><%=createdAt%></td>
                </tr>
              </table>
            </div>

          </div>

          </div>
          <div> <br><button class="btn" onclick="location.href='logout.jsp'">登出</button><br><br></div>

        </div>
  </div></div>
  </body>
</html>
