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
    <title>주소입력</title>
    <link rel="stylesheet" href="addrbook.css" type="text/css">

    <script type="text/javascript">
        function check(form) {

            if(!form.name.value){
                alert("이름을 입력하세요");
                form.name.focus();
                return;
            }

            if(!form.email.value){
                alert("이메일을 입력하세요");
                form.email.focus();
                return;
            }

            if(!form.tel.value){
                alert("전화번호을 입력하세요");
                form.tel.focus();
                return;
            }

            if(!form.company.value){
                alert("회사를 입력하세요");
                form.company.focus();
                return;
            }

            form.submit();

        }
    </script>

</head>
<body>

<div align="center">
    <H2>주소록 입력</H2>
    <hr>
    [<a href="addrbook_control.jsp?action=list">목록으로</a>] <%--<P></P>--%>
    <form name="form1" method="post" action="addrbook_control.jsp">

        <input type="hidden" name="action" value="insert">

        <table border="1">
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" maxlength="15"></td>
            </tr>

            <tr>
                <th>email</th>
                <td><input type="text" name="email" maxlength="15"></td>
            </tr>

            <tr>
                <th>TEL</th>
                <td><input type="text" name="tel" maxlength="15"></td>
            </tr>

            <tr>
                <th>회사</th>
                <td><input type="text" name="company" maxlength="15"></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="SAVE" onclick="check(this.form)">
                    <input type="button" value="cancel" onclick="javascript:reset()">
                </td>
            </tr>
        </table>

    </form>
</div>

</body>
</html>
