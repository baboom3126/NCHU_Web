<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%

///////驗證登入狀態//////
String login;
login=(String)session.getAttribute("login");
if(login.equals("0"))
{
  response.sendRedirect("index.html");
}
///////驗證登入狀態//////

String ip="140.120.49.205:3306";
String user="4104029042";
String pwd="Ss4104029042!";
String db="4104029042";
String driver="com.mysql.jdbc.Driver";
Connection con = null;
Statement stmt = null;
ResultSet rs= null;
request.setCharacterEncoding("UTF-8");
String search;
search=request.getParameter("text1");
search="'%"+search+"%';";
String sql;
try{
  //建立連線//
  String url="jdbc:mysql://"+ip+"/"+db+"?useUnicode=true&characterEncoding=utf-8";
  Class.forName(driver).newInstance();
  con=DriverManager.getConnection(url,user,pwd);
  stmt=con.createStatement();
  /*還沒輸入值 select 全部 */
  if(!search.equals("'%null%';"))
  {
  sql="select * from database1 where name LIKE ";
  sql=sql+search;
  }
  else{
    sql="select * from database1;";
  }

  /*執行sql*/
  PreparedStatement ps=con.prepareStatement(sql);
  rs=stmt.executeQuery(sql);

}catch(Exception ex){
  out.print(ex);
}
String id="";
String name="";
String birthday="";
String memo="";
String createdAt="";
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
      <h2 class="header">查詢</h2>
<div class="container">
      <div class="card">

          <div class="card-tabs">
            <ul class="tabs tabs-fixed-width">
              <li class="tab"><a href="#" onclick="location.href='main.jsp'">首頁</a></li>
              <li class="tab"><a class="active" href="#">查詢</a></li>
            </ul>
          </div>
          <div>
            <br>
          <form class="form1" action="query.jsp" method="post">

            名字(片段搜尋) <input type="text" name="text1" style="  width: 30% !important;" value="">
            <button type="submit" class="btn" name="button">查詢</button>
          </form></div>
          <div class="card-content grey lighten-4">
            <div id="test4">

              <div class="container">
              <table class="highlight" >
                <tr>
                  <td class="td1">ID</td><td class="td1">NAME</td><td class="td1">生日</td><td class="td1">備註</td><td class="td1">加入時間</td>
                </tr>
                <%
                if(rs!=null)
                {
                  while(rs.next()){
                    id=rs.getString("id");
                    name=rs.getString("name");
                    birthday=rs.getString("birthday");
                    memo=rs.getString("memo");
                    createdAt=rs.getString("createdAt");

                %>
                <tr>
                  <td class="td2"><%=id%></td><td class="td2"><%=name%></td><td class="td2"><%=birthday%></td><td class="td2"><%=memo%></td><td class="td2"><%=createdAt%></td>
                </tr>

                <%}}%>
              </table>
            </div></div>

          </div>
          <div><br><button class="btn" onclick="location.href='logout.jsp'">登出</button> <br><br></div>

        </div>
  </div></div>
  </body>
</html>
