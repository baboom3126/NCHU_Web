<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");
String a=request.getParameter("id");
String b=request.getParameter("pwd");
session.setAttribute("id1",a);
session.setAttribute("pwd1",b);



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

String c="登入失敗";

String html0="index.html";


%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
        <%if(rs!=null){
        while(rs.next())
        {

        String userid1 = rs.getString("Userid");
        String password1 = rs.getString("password");
        try{
        if(a.equals(userid1)&&b.equals(password1))
        {
          c="登入成功";
          html0="main.jsp";
          session.setAttribute("login","1");
        }

      }
        catch(Exception e){}

        }}


        %>
<meta http-equiv='refresh' content='0;url=<%=html0%>'>
    <title>登入</title>
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
          <img src="./img/main.jpg" >
        </div>
        <div class="card-stacked">
          <div class="card-content">
            <p></p>
          </div>
          <div class="card-content" style="text-align:left;">
<div class="container">

<p>
  登入中...<br>
  <%=c%>
</p>
          </div></div>
          <div class="card-action">

            <button type="button" class="btn" name="button2" onclick="location.href='<%=html0%>'" >確定</button>

          </div>

        </div>
      </div>
    </div>
  </div>
  </body>
</html>
<%
stmt.close();
rs.close();
%>
