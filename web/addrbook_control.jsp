<%--
  Created by IntelliJ IDEA.
  User: sihan
  Date: 2018-11-19
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jspbook.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.rmi.server.ExportException" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="ad" class="jspbook.AddrBean"/>
<jsp:useBean id="addrbook" class="jspbook.AddrBook"/>
<jsp:setProperty name="addrbook" property="*"/>

<%
    String action = request.getParameter("action");
    System.out.print(action);

    if (action.equals("list")) {
        ArrayList<AddrBook> datalist = ad.getDBList();
        request.setAttribute("dataset", datalist);
        pageContext.forward("addrbook_list.jsp");

    }

    if (action.equals("insert")) {
        if (ad.insertDB(addrbook)) {
            out.println("<script>alert(action)</script>");
            response.sendRedirect("addrbook_control.jsp?action=list");
        } else {
            throw new Exception("DB ERROR");
        }
    }

    else if(action.equals("edit")){
        AddrBook abook = ad.getDB(addrbook.getId());

        if(!request.getParameter("upasswd").equals("1234")){
            out.println("<script>alert('Wrong pwd'); history.go(-1);</script>");
        }
        else{
            request.setAttribute("address", abook);
            pageContext.forward("addrbook_edit_form.jsp");
        }
    }

    else if(action.equals("delete")){
        if(ad.deleteDB(addrbook.getId())){
            response.sendRedirect("addrbook_control.jsp?action=list");
        }else {
            throw new Exception("DB 삭제 오류");
        }
    }

    else if(action.equals("update")){
        if(ad.updateDB(addrbook)){
            response.sendRedirect("addrbook_control.jsp?action=list");
        }else {
            throw new Exception("DB 갱신 오류");
        }
    }



    else {
        out.println("<script>alert('plz check parameter')</script>");
    }



%>