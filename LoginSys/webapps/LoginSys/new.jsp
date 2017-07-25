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
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
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
  <%
  request.setCharacterEncoding("UTF-8");
  String name=request.getParameter("name1");
  String a=request.getParameter("id");
  String b=request.getParameter("pwd");
  String date=request.getParameter("date1");
  String memo=request.getParameter("textarea1");
  int check=0;
  String url="";
  if(a.equals("")){
    check=2;
  }
  ///////檢查是否重複帳號
  if(rs!=null){
    while(rs.next())
    {
      String account = rs.getString("Userid");
      if(account.equals(a)){
        check=1;
      }



    }}
    switch(check){
      case 0:
    try{
    String sql = "insert into database1 (name, Userid,password,birthday,memo) values (?,?,?,?,?)";
    PreparedStatement ps = con.prepareStatement(sql);
          ps.setString(1,name);
          ps.setString(2,a);
          ps.setString(3,b);
          ps.setString(4,date);
          ps.setString(5,memo);
          ps.executeUpdate();
          out.print("<br>創建成功<br>");

    }
    catch(Exception e){
      out.print("<br>創建失敗<br>");
      out.print(e);
      url="register.html";
  }
    url="index.html";
  break;

    case 1:
      out.print("<br>已有重複的帳號<br>");
      url="register.html";

    break;
    case 2:
      out.print("<br>不得輸入空白<br>");
      url="register.html";

      break;
    }
    try{
    rs.close();
    stmt.close();
    }
    catch(Exception e){
      out.print(e);
    }
  %>

</p>
          </div></div>
          <div class="card-action">

            <button type="button" class="btn" name="button2" onclick="location.href='register.html'" >返回</button>

            <button type="button" class="btn" name="button2" onclick="location.href='index.html'" >登入</button>
          </div>

        </div>
      </div>
    </div>
  </div>
  </body>
</html>
