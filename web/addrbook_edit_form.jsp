<%--
  Created by IntelliJ IDEA.
  User: sihan
  Date: 2018-11-19
  Time: 오후 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="addrbook.css" type="text/css">

    <script type="text/javascript">
        function delcheck() {
            result = confirm("정말로 삭제하시겠습니까?");

            if(result == true){
                document.form1.action.value = "delete"
                document.form1.submit();
            }else {
                return;
            }
        }
    </script>
        <title>Title</title>
</head>
<body>

<jsp:useBean id="address" class="jspbook.AddrBook" scope="request"/>

<div align="center">
    <h2>주소록:주소 수정/삭제</h2>
    <hr>
    <p><a href="addrbook_control.jsp?action=list">목록으로</a> </p>

    <form name="form1" method="post" action="addrbook_control.jsp">
        <input type="hidden" name="id" value="<%=address.getId()%>">
        <input type="hidden" name="action" value="update">

        <table border="1">
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" value="<%=address.getName()%>"></td>
            </tr>

            <tr>
                <th>email</th>
                <td><input type="text" name="email" value="<%=address.getEmail()%>"></td>
            </tr>

            <tr>
                <th>전화번호</th>
                <td><input type="text" name="tel" value="<%=address.getTel()%>"></td>
            </tr>

            <tr>
                <th>회사</th>
                <td><input type="text" name="company" value="<%=address.getCompany()%>"></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="save">
                    <input type="reset" value="cancel">
                    <input type="button" value="delete" onclick="delcheck()">
                </td>
            </tr>

        </table>
    </form>

</div>

</body>
</html>
