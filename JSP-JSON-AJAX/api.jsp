<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java"
    import="org.json.JSONObject"
    import="org.json.JSONArray"
    import="org.json.JSONException"
    import="java.util.*"
    import="java.text.*"
%>
<%
    // 解決 CORS 跨網域問題
    response.setHeader("Access-Control-Allow-Origin", "*");
    // 輸出 JSON 格式
    response.setContentType("application/json");
    // 建立 JSONArray
    JSONArray list = new JSONArray();
    // 建立 JSONObject
    JSONObject object = new JSONObject();
    // 建立日期格式
    SimpleDateFormat df = new SimpleDateFormat("YYYY/MM/dd HH:mm:ss");

    // 建立一筆資料
    object.put("name", "weixiang");
    object.put("RegNo", new Integer(12345));
    object.put("Mark", new Double(99));
    object.put("mail", "once9125@gmail.com");
    object.put("CreateAt", df.format(new java.util.Date()));
    list.put(object);

    // 建立一筆資料
    object.put("name", "jack");
    object.put("Reg No", new Integer(54321));
    object.put("Mark", new Double(11));
    object.put("mail", "g105029033@mail.nchu.edu.tw");
    object.put("CreateAt", df.format(new java.util.Date()));
    list.put(object);

    out.println(list);
%>
