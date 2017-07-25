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

int check=0;
String a=request.getParameter("id");
if(a.equals("")){
  check=2;
}
if(rs!=null){
  while(rs.next())
  {
    String account = rs.getString("Userid");
    if(account.equals(a)){
      check=1;
    }}}


try{
      rs.close();
      stmt.close();

      if(check==0){
        out.print("帳號 OK");
      }
    if(check==1){
        out.print("已有相同的帳號");
      }
    if(check==2){
      out.print("不得輸入空白");
    }
  }
catch(Exception e){
    out.print(e);
  }

%>
