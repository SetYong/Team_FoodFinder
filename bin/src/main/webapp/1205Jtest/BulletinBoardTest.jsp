<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<button type="button" style="border-radius: 0.5em:padding:5px20px">�Ұ�</button>
		<button type="button" style="border-radius: 0.5em:padding:5px20px">����</button>
		<button type="button" style="border-radius: 0.5em:padding:5px20px">��
			����</button>
		<button type="button" style="border-radius: 0.5em:padding:5px20px">����
			������</button>
	</center>
	<span style="float: right;">
		<button type="button" style="border-radius: 0.5em:padding:5px20px">�α���</button>
		<button type="button" style="boreder-radius: 0.5em:padding:5px20px">ȸ������</button>
	</span>

	<h3 text align=center>���� �ִ� ��� ���ִ� ������ �Ծ������ ���ھ��.</h3>


	<table width="90" height="300" align=left>
		<td>
			<button type="button">���ο丮</button> </br>
			<button type="button">�ʴ�丮</button> </br>
			<button type="button">���ܿ丮</button> </br>
			<button type="button">�� ����</button> </br>
			<button type="button">����</button> </br>
			<button type="button">����</button> </br>
			<button type="button">����ŷ</button> </br>
			<button type="button">���̾�Ʈ</button> </br>
			<button type="button">���ö�</button> </br>
			<button type="button">�ѽ�</button> </br>
			<button type="button">���</button> </br>
			<button type="button">�Ͻ�</button> </br>
			<button type="button">�߽�</button> </br>
			<button type="button">ä��</button> </br>
			<button type="button">ǻ��</button> </br>
			<button type="button">��� ����</button>
		</td>
	</table> 

<form name="writeFrm" method="post" >
    <input type="hidden" name="num" > 
    <table border="1" width="92%"  >
        <tbody><tr> 
            <td style="text-align: center;">����</td>
            <td>
                <input type="text" name="title" style="width: 90%;" > 
            </td>
            <tr> 
            <td style="text-align: center;">�̹���</td>
            <td>
                <textarea name="content" style="width: 10%; height: 50px;">÷������  </textarea> 
                <textarea name="content" style="width: 15%; height: 50px;">�̹��� ���  </textarea> 
            </td> 
        </tr>
           
        <tr> 
            <td rowspan="2" style="text-align: center;">����</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;">�⺻��Ḧ �Է��ϼ���.  </textarea> 
                <textarea name="content" style="width: 90%; height: 100px;">����� ����� �Է��ϼ���.  </textarea> 
            </td> 
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">�ٽ� �Է�</button>
                <button type="reset">�ۼ� �Ϸ�</button>
                <button type="button">��� ����</button> 
            </td>
        </tr>
    </tbody></table>
</body>
</html>