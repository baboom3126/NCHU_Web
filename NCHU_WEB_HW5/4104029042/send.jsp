<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<html>
  <head>
    <meta charset="utf-8">

    <title>result</title>

  </head>
  <body style=" font-family: Microsoft JhengHei,Arial; background-color: rgba(82,82,82,0.5);">
<%
request.setCharacterEncoding("UTF-8");

String name=request.getParameter("text1");
String select=request.getParameter("select1");
String[] select2=request.getParameterValues("select2");
String gender=request.getParameter("radio1");
String[] interest=request.getParameterValues("checkbox1");
String text=request.getParameter("textarea1");

if(name.equals(""))
{name="無名";
}

%>
<div style="padding:20px;">
<table border="5px" style="margin:0px auto; width:33%; text-align:center; border-style:dotted solid;">

  <tr height="40px" style=" background-color: rgba(168, 230 , 207, 0.8);">
    <td>姓名</td>
    <td><%=name%></td>
  </tr>
  <tr height="40px" style=" background-color: rgba(220, 237, 193, 0.8);">
    <td>目前</td>
    <td><%=select%></td>
  </tr>
  <tr height="40px" style=" background-color: rgba(255, 211, 182, 0.8);">
    <td>技能</td>
    <td><%
    try{
    for(int i=0;i<select2.length;i++)
      {
        out.print(select2[i]+"  ");}
    }
    catch(Exception E){out.print("NONE");}

    %></td>
  </tr>
  <tr height="40px" style=" background-color: rgba(255, 170, 165, 0.8);">
    <td>性別</td>
    <td><%

      try{
        if(gender.equals("Male")||gender.equals("Female"))
        {out.print(gender);}
          }
      catch(Exception E){out.print("???");}

    %></td>

  </tr>
  <tr height="40px" style=" background-color: rgba(243, 247, 152, 0.8);">
    <td>興趣</td>
    <td><%
      try{
        for(int i=0;i<interest.length;i++){
          out.print(interest[i]+" ");
        }}
      catch(Exception E){out.print("沒有興趣QQ");}
    %></td>
  </tr>
  <tr height="80px" style=" background-color: rgba(171, 203, 137, 0.8);" >
    <td>自介</td>
    <td><%
    if(text.equals("")){
      out.print("人生是空白的");
    }
    else{out.print(text);}
    %></td>
  </tr>

</table></div>
</html>
