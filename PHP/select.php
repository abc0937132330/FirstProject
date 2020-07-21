<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<title>範例</title>
	<style>
	/* 變更圖片長寬 */
	img {width:100px; height:100px;}
	
    </style>
</head>

<body>
	<?php
		//print 'hello';
		//mysql_connect("IP","帳號","密碼");
		$user = "student";
		$password = "1234";
		$host = "192.168.64.106";
		$db = "webcross";		//資料庫名稱
		//取得資料庫連線
		$conn = mysqli_connect($host,$user,$password) or die("資料庫連線錯誤!");
		//指定連線的資料庫
		mysqli_select_db($conn,$db);
		//指定資料庫使用的編碼
		mysqli_query($conn,"SET NAMES utf8");

		//存取資料表
		$table = mysqli_query($conn,"select no, name, gender, picture, phone, address, email, class as myclass from student order by no");
		print "<table border='1' width='80%' align='center'><tr><th>學號</th><th>姓名</th><th>大頭照</th></tr>";
		while ($row_array = mysqli_fetch_row($table)) 
		{
			//print $row_array[0] . ',' . $row_array[1] . '<br>';
			print '<tr><td>'. $row_array[0] .'</td><td>'. $row_array[1] .'</td><td><img src=images/'. $row_array[3] .'></td><td><a href=modify.php?No='.$row_array[0].'&name='.$row_array[1].'&gender='.$row_array[2].'&picture='.$row_array[3].'&phone='.$row_array[4].'&address='.$row_array[5].'&email='.$row_array[6].'&myclass='.$row_array[7].'>修改</a> <a href=delete.php?no='.'A101'.'>刪除</a></td></tr>';		}
		print '</table>';
		//關閉資料庫連結
		mysqli_close($conn);

	?>
	<p>
	<table border='1' width='70%' align='center'>
		<tr><th>學號</th><th>姓名</th><th>大頭照</th></tr>
		<tr><td>A101</td>
		<td>ABC</td>
		<td align='center'><img src='images/1.jpg'></td>
		<td align='center'><a href=modify.php?No=A101&name=asd&gender=1&picture=A101.png&phone=fdfa&address=q3wrfdsf1q3rfsfd&email=asdQW@asd.asd&myclass=JAVA班>修改</a>  <a href=delete.php?No=A101>刪除</a></td>
		</tr>
	</table>

</body>
</html>
