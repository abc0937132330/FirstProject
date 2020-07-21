<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>範例</title>
	</head>
	<body>
		<form action="update.php" method="post">
			<p>學號：<input type="text" name="no" value=<?php print $_GET['No']; ?>></p>
			<p>姓名：<input type="text" name="name" value=<?php print $_GET['name']; ?>></p>
			<p>性別：<input type="text" name="gender" value=<?php print $_GET['gender']; ?>></p>
<!-- <p>照片：<input type="text" name="picture" value=<?php print $_GET['picture']; ?>></p> -->
			<p>照片：<input type="text" name="picture" value=<?php print $_GET['picture']; ?>></p>
			<p>電話：<input type="text" name="phone" value=<?php print $_GET['phone']; ?>></p>
			<p>地址：<input type="text" name="address" value=<?php print $_GET['address']; ?>></p>
			<p>email:<input type="text" name="email" value=<?php print $_GET['email']; ?>></p>
			<p>班別：<input type="text" name="class" value=<?php print $_GET['myclass']; ?>></p>
			<p><input type="submit" value="確認"> <input type="reset" value="重置"></p>
		</form>
	</body>
</html>