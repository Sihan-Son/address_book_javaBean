<%--
  Created by IntelliJ IDEA.
  User: sihan
  Date: 2018-11-19
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jspbook.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="addrbook.css" type="text/css" media="screen">
    <title>list</title>

    <script type="text/javascript">
        function check(id) {
            pwd = prompt("수정 삭제를 하려면 비밀번호를 입력하세요");
            document.location.href = "addrbook_control.jsp?action=edit&id=" + id + "&upasswd=" + pwd;
        }
    </script>
</head>
<body>

<jsp:useBean id="dataset" scope="request" class="java.util.ArrayList"/>

<div align="center">
    <h2>주소록 목록</h2>
    <hr>

    <form>
        <a href="addrform_form.jsp">주소록 등록</a>
        <table border="1">
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>TEL</th>
                <th>회사</th>
            </tr>
            <%
                for(AddrBook ab :(ArrayList<AddrBook>) dataset){
            %>
            <tr>
                <td><a href="javascript:check(<%=ab.getId()%>)"><%=ab.getId()%></a></td>
                <td><%=ab.getName()%></td>
                <td><%=ab.getTel()%></td>
                <td><%=ab.getCompany()%></td>
            </tr>
            <%
                }
            %>
        </table>
    </form>
</div>

</body>
</html>
