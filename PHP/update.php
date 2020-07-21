
<?php 
$user = "student";
$password = "1234";
$host = "192.168.64.106";
$db = "webcross";		//資料庫名稱
//取得資料庫連線
$conn = mysqli_connect($host,$user,$password) or die("資料庫連線錯誤!");

//指定連線的資料庫
mysqli_select_db($conn,$db);

//準備UPDATE指令
$updateSQL = sprintf("update student set name='%s',gender=%d,picture='%s',phone='%s',address='%s',email='%s',class='%s' where No = '%s'",$_POST['name'],$_POST['gender'],$_POST['picture'],$_POST['phone'],$_POST['address'],$_POST['email'],$_POST['myclass'],$_POST['No']);
//print $updateSQL;

//執行UPDATE指令
$result = mysqli_query($conn,$updateSQL);

if ($result == 1)
{
    print "資料更新成功!";
}
else 
{
    print "資料更新失敗!";
}
mysqli_close($conn);
?>