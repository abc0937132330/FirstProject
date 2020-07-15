<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>體脂肪計算器</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
@import url(assets/css/bodyfat&BMI.css);

.container1 {
	border: 1px double;
	margin: 15px auto;
	box-shadow: 5px 5px 5px 5px gray;
	height: 45px;
}
</style>

</head>

<body>
	<div class="container1" style="background-Color: #ffdab9">
		<div class="row">
			<div class="col-12 bigger">
				<a href="index1.jsp" target="_parent">回首頁</a>
			</div>
		</div>
	</div>
	<h2 align="center">健康資訊</h2>
	<div class="container">
		<!-- BMI Section -->
		<section class="bmi" align="center">
			<h3 class="title">BMI</h3>
			<input type="text" id="bmi" disabled="disabled">
			<h5 class="label">
				身高（公尺）
				</h6>
				<input type="number" id="height" min="0">
				<h5 class="label">
					體重（公斤）
					</h6>
					<input type="number" id="weight" min="0">
					<P>
						<button id="bmi-cal">計算 BMI</button>
						<button id="bmi-reset">重設</button>
		</section>

		<!-- Bodyfat Section -->
		<section class="bodyfat" align="center">
			<h3 class="title">Body Fat</h3>
			<h5 class="label">
				年齡
				</h6>
				<input type="number" id="age" min="0">
				<h5 class="label">
					性別
					</h6>
					<select id="gender">
						<option value="1">男性</option>
						<option value="0">女性</option>
					</select>
					<p>
						<button id="body-cal">計算體脂肪率</button>
						<button id="body-reset">重設</button>
		</section>
	</div>

	<script>
		$(function() {
			// BMI Section //
			$('#bmi-cal').on('click', function() {
				var h = $('#height').val(), w = $('#weight').val();

				if (h == '') {
					document.write('123');
					alert('請輸入身高');
				} else if (h > 3) {
					alert('身高請輸入公尺');
				} else if (w == '') {
					alert('請輸入體重');
				} else {
					var bmi = w / (h * h);
					function formatFloat(num, pos) {
						var size = Math.pow(10, pos);
						return Math.round(num * size) / size;
					}

					$('#bmi').val(formatFloat(bmi, 3));
				}
			});
			$('#bmi-reset').on('click', function() {
				$('#height').val('');
				$('#weight').val('');
				$('#bmi').val('');
			});

			// Bodyfar Section //
			$('#body-cal')
					.on(
							'click',
							function() {
								var bmi = $('#bmi').val(), e = $('#age').val(), g = $(
										'#gender').val();

								if (bmi == '') {
									alert('請先計算 BMI');
								} else if (g == 0) {
									var fat = (1.2 * bmi) + (0.23 * e) - 5.4
											- (10.8 * g);
									function formatFloat(num, pos) { //formatFloat 四捨五入方法，num是帶有小數的變數pos是要取小數後的幾位數
										var size = Math.pow(10, pos); //Math.pow(base基數, exponent乘上幾次的指數)
										return Math.round(num * size)
										/ size;  / / Math.round4捨5入
									}

									var a = prompt("請輸入體脂:",
											formatFloat(fat, 3));//fat得到的值,3取到小數第三位					

									if (a <= 14) {
										document.write("健美肌肉型");
									} else if (a <= 17) {
										document.write("偏瘦肌肉型");
									} else if (a <= 20) {
										document.write("偏瘦型");
									} else if (a <= 23) {
										document.write("標準肌肉型");
									} else if (a <= 26) {
										document.write("標準型");
									} else if (a <= 29) {
										document.write("缺乏運動型");
									} else if (a <= 35) {
										document.write("結實行偏胖");
									} else if (a <= 40) {
										document.write("偏胖型");
									} else if (a > 40) {
										document.write("隱性胖");
									}

								} else if (g == 1) {
									var fat = (1.2 * bmi) + (0.23 * e) - 5.4
											- (10.8 * g);
									function formatFloat(num, pos) { //formatFloat 四捨五入方法，num是帶有小數的變數pos是要取小數後的幾位數
										var size = Math.pow(10, pos); //Math.pow(base基數, exponent乘上幾次的指數)
										return Math.round(num * size)
										/ size;  / / Math.round4捨5入
									}

									var w = $('#weight').val();
									var h = $('#height').val();
									var e = $('#age').val()
									var g = $('#gender').val();
									var a = prompt("請輸入體脂:",
											formatFloat(fat, 3));//fat得到的值,3取到小數第三位					

									var sport = new Array();
									var bodydata = new Array();

									var Body_fat_weight = fat * w * 0.01;
									var Moisture_rate = (w - Body_fat_weight)
											* 73 / w;
									var Moisture_weight = Moisture_rate * w
											* 0.01;
									var Protein_weight = w * 0.18;
									var Protein_weight_rate = (w * 0.18) / w
											* 100;
									var Bone_weight_rate = (w - Body_fat_weight
											- Moisture_weight - Protein_weight)
											/ w * 100;
									var Bone_weight = (w - Body_fat_weight
											- Moisture_weight - Protein_weight);

									document
											.write("<div style='float:right' ><img src='assets/img/slide/bodypicture-woman.jpg'></div>");
									document
											.write("<div><img src='assets/img/slide/bodypicture-man.jpg'></div>");
									//document.write("<style> bodyfat&BMI.css</style>");
									if (a <= 4) {
										document
												.write("<h1 align='center'>健美肌肉型</h1>");
										//document.write("體脂率"+formatFloat(fat, 2)+"%<p>");
										//document.write("體脂重量"+formatFloat(Body_fat_weight,2)+"KG<p>");//體脂重量
										//document.write("水分率"+formatFloat(Moisture_rate,2)+"%<p>");
										//document.write("水分重量"+formatFloat(Moisture_weight,2)+"KG<p>");
										//document.write("蛋白質率"+formatFloat(Protein_weight_rate,2)+"%<p>");
										//document.write("蛋白質重量"+formatFloat(Protein_weight,2)+"KG<p>");
										//document.write("骨骼率"+formatFloat(Bone_weight_rate,2)+"%<p>");
										//document.write("骨骼重量"+formatFloat(Bone_weight,2)+"KG<p>");
										bodydata[0] = [ "身高:" + h, "體重:" + w,
												"年齡:" + e, "性別:" + g ];
										bodydata[1] = [
												"體脂率:" + formatFloat(fat, 2)
														+ "%",
												"體脂重量:"
														+ formatFloat(
																Body_fat_weight,
																2) + "KG",
												"水分率:"
														+ formatFloat(
																Moisture_rate,
																2) + "%",
												"水分重量:"
														+ formatFloat(
																Moisture_weight,
																2) + "KG" ];
										bodydata[2] = [
												"蛋白質率"
														+ formatFloat(
																Protein_weight_rate,
																2) + "%",
												"蛋白質重量"
														+ formatFloat(
																Protein_weight,
																2) + "KG",
												"骨骼率"
														+ formatFloat(
																Bone_weight_rate,
																2) + "%",
												"骨骼重量"
														+ formatFloat(
																Bone_weight, 2)
														+ "KG" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'>");
										for (var k = 0; k < bodydata.length; k++) {
											document.write("<tr><p><p>");
											for (var l = 0; l < bodydata[k].length; l++) {
												document
														.write("<td bgcolor='#00FFFF'><p><p>"
																+ bodydata[k][l]
																+ "</td>")
											}
											document.write("</tr>");
										}
										document.write("</table>");
										document.write("備註:維持正常飲食，持續運動即可");
									}

									else if (a <= 7) {
										document
												.write("<h1 align='center'>偏瘦肌肉型<h1>");
										bodydata[0] = [ "身高:" + h, "體重:" + w,
												"年齡:" + e, "性別:" + g ];
										bodydata[1] = [
												"體脂率:" + formatFloat(fat, 2)
														+ "%",
												"體脂重量:"
														+ formatFloat(
																Body_fat_weight,
																2) + "KG",
												"水分率:"
														+ formatFloat(
																Moisture_rate,
																2) + "%",
												"水分重量:"
														+ formatFloat(
																Moisture_weight,
																2) + "KG" ];
										bodydata[2] = [
												"蛋白質率"
														+ formatFloat(
																Protein_weight_rate,
																2) + "%",
												"蛋白質重量"
														+ formatFloat(
																Protein_weight,
																2) + "KG",
												"骨骼率"
														+ formatFloat(
																Bone_weight_rate,
																2) + "%",
												"骨骼重量"
														+ formatFloat(
																Bone_weight, 2)
														+ "KG" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'>");
										for (var k = 0; k < bodydata.length; k++) {
											document.write("<tr><p><p>");
											for (var l = 0; l < bodydata[k].length; l++) {
												document
														.write("<td bgcolor='#00FFFF'><p><p>"
																+ bodydata[k][l]
																+ "</td>")
											}
											document.write("</tr>");
										}
										document.write("</table>");
										document.write("維持正常飲食，持續運動即可");
									}

									else if (a <= 10) {
										document
												.write("<h1 align='center'>偏瘦型<h1>");
										bodydata[0] = [ "身高:" + h, "體重:" + w,
												"年齡:" + e, "性別:" + g ];
										bodydata[1] = [
												"體脂率:" + formatFloat(fat, 2)
														+ "%",
												"體脂重量:"
														+ formatFloat(
																Body_fat_weight,
																2) + "KG",
												"水分率:"
														+ formatFloat(
																Moisture_rate,
																2) + "%",
												"水分重量:"
														+ formatFloat(
																Moisture_weight,
																2) + "KG" ];
										bodydata[2] = [
												"蛋白質率"
														+ formatFloat(
																Protein_weight_rate,
																2) + "%",
												"蛋白質重量"
														+ formatFloat(
																Protein_weight,
																2) + "KG",
												"骨骼率"
														+ formatFloat(
																Bone_weight_rate,
																2) + "%",
												"骨骼重量"
														+ formatFloat(
																Bone_weight, 2)
														+ "KG" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'>");
										for (var k = 0; k < bodydata.length; k++) {
											document.write("<tr><p><p>");
											for (var l = 0; l < bodydata[k].length; l++) {
												document
														.write("<td bgcolor='#00FFFF'><p><p>"
																+ bodydata[k][l]
																+ "</td>")
											}
											document.write("</tr>");
										}
										document.write("</table>");
										document.write("維持正常飲食，持續運動即可");
									}

									else if (a <= 12) {
										document
												.write("<h1 align='center'>標準肌肉型</h1>");
										bodydata[0] = [ "身高:" + h, "體重:" + w,
												"年齡:" + e, "性別:" + g ];
										bodydata[1] = [
												"體脂率:" + formatFloat(fat, 2)
														+ "%",
												"體脂重量:"
														+ formatFloat(
																Body_fat_weight,
																2) + "KG",
												"水分率:"
														+ formatFloat(
																Moisture_rate,
																2) + "%",
												"水分重量:"
														+ formatFloat(
																Moisture_weight,
																2) + "KG" ];
										bodydata[2] = [
												"蛋白質率"
														+ formatFloat(
																Protein_weight_rate,
																2) + "%",
												"蛋白質重量"
														+ formatFloat(
																Protein_weight,
																2) + "KG",
												"骨骼率"
														+ formatFloat(
																Bone_weight_rate,
																2) + "%",
												"骨骼重量"
														+ formatFloat(
																Bone_weight, 2)
														+ "KG" ];
										document
												.write("<table border='2' align='center'  cellspacing='5' cellpadding='5' border-radius: '20px'>");
										for (var k = 0; k < bodydata.length; k++) {
											document.write("<tr><p><p>");
											for (var l = 0; l < bodydata[k].length; l++) {
												document
														.write("<td bgcolor='#00FFFF'><p><p>"
																+ bodydata[k][l]
																+ "</td>")
											}
											document.write("</tr>");
										}
										document.write("</table>");
										document.write("維持正常飲食，持續運動即可");
									}

									else if (a <= 15) {
										document
												.write("<h1 align='center'>標準型</h1>");
										bodydata[0] = [ "身高:" + h, "體重:" + w,
												"年齡:" + e, "性別:" + g ];
										bodydata[1] = [
												"體脂率:" + formatFloat(fat, 2)
														+ "%",
												"體脂重量:"
														+ formatFloat(
																Body_fat_weight,
																2) + "KG",
												"水分率:"
														+ formatFloat(
																Moisture_rate,
																2) + "%",
												"水分重量:"
														+ formatFloat(
																Moisture_weight,
																2) + "KG" ];
										bodydata[2] = [
												"蛋白質率"
														+ formatFloat(
																Protein_weight_rate,
																2) + "%",
												"蛋白質重量"
														+ formatFloat(
																Protein_weight,
																2) + "KG",
												"骨骼率"
														+ formatFloat(
																Bone_weight_rate,
																2) + "%",
												"骨骼重量"
														+ formatFloat(
																Bone_weight, 2)
														+ "KG" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'>");
										for (var k = 0; k < bodydata.length; k++) {
											document.write("<tr><p><p>");
											for (var l = 0; l < bodydata[k].length; l++) {
												document
														.write("<td bgcolor='#00FFFF'><p><p>"
																+ bodydata[k][l]
																+ "</td>")
											}
											document.write("</tr>");
										}
										document.write("</table>");
										sport[0] = [ "第一周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[1] = [ "第二周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[2] = [ "第三周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[3] = [ "第四周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[4] = [ "第五周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[5] = [ "第六周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[6] = [ "第七周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[7] = [ "第八周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*5",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[8] = [ "第九周", "啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[9] = [ "第十周", "啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[10] = [ "第十一周",
												"啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[11] = [ "第十二周",
												"啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[12] = [ "間隔時間", "30s", "30s",
												"30s", "30s", "30s", "30s",
												"休息" ];
										sport[13] = [ "訓練地點", "健身房/住家",
												"健身房/住家", "健身房/住家", "健身房/住家",
												"健身房/住家", "健身房/住家", "休息" ];
										sport[14] = [ "訓練總時間", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "休息" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'clear: 'both'><tr><th bgcolor='#D28EFF'>周數</th><th bgcolor='#DDFF77'>星期一</th><th bgcolor='#9900FF'>星期二</th><th bgcolor='#33CCFF'>星期三</th><th bgcolor='#66FF66'>星期四</th><th bgcolor='#FFEE99'>星期五</th><th bgcolor='#EEEE00'>星期六</th><th bgcolor='#FF77FF'>星期日</th>");
										for (var i = 0; i < sport.length; i++) {
											document.write("<tr><p><p>");
											for (var j = 0; j < sport[i].length; j++) {
												document
														.write("<td bgcolor='#CCBBFF'><p><p>"
																+ sport[i][j]
																+ "</td>");
											}
											document.write("</tr>");
										}
										document.write("</table>");
									}

									else if (a <= 19) {
										document
												.write("<h1 align='center'>缺乏運動型<h1>");
										bodydata[0] = [ "身高:" + h, "體重:" + w,
												"年齡:" + e, "性別:" + g ];
										bodydata[1] = [
												"體脂率:" + formatFloat(fat, 2)
														+ "%",
												"體脂重量:"
														+ formatFloat(
																Body_fat_weight,
																2) + "KG",
												"水分率:"
														+ formatFloat(
																Moisture_rate,
																2) + "%",
												"水分重量:"
														+ formatFloat(
																Moisture_weight,
																2) + "KG" ];
										bodydata[2] = [
												"蛋白質率"
														+ formatFloat(
																Protein_weight_rate,
																2) + "%",
												"蛋白質重量"
														+ formatFloat(
																Protein_weight,
																2) + "KG",
												"骨骼率"
														+ formatFloat(
																Bone_weight_rate,
																2) + "%",
												"骨骼重量"
														+ formatFloat(
																Bone_weight, 2)
														+ "KG" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'>");
										for (var k = 0; k < bodydata.length; k++) {
											document.write("<tr><p><p>");
											for (var l = 0; l < bodydata[k].length; l++) {
												document
														.write("<td bgcolor='#00FFFF'><p><p>"
																+ bodydata[k][l]
																+ "</td>")
											}
											document.write("</tr>");
										}
										document.write("</table>");
										sport[0] = [ "第一周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[1] = [ "第二周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[2] = [ "第三周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[3] = [ "第四周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[4] = [ "第五周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[5] = [ "第六周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[6] = [ "第七周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[7] = [ "第八周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*5",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[8] = [ "第九周", "啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[9] = [ "第十周", "啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[10] = [ "第十一周",
												"啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[11] = [ "第十二周",
												"啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[12] = [ "間隔時間", "30s", "30s",
												"30s", "30s", "30s", "30s",
												"休息" ];
										sport[13] = [ "訓練地點", "健身房/住家",
												"健身房/住家", "健身房/住家", "健身房/住家",
												"健身房/住家", "健身房/住家", "休息" ];
										sport[14] = [ "訓練總時間", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "休息" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'><tr><th bgcolor='#D28EFF'>周數</th><th bgcolor='#DDFF77'>星期一</th><th bgcolor='#9900FF'>星期二</th><th bgcolor='#33CCFF'>星期三</th><th bgcolor='#66FF66'>星期四</th><th bgcolor='#FFEE99'>星期五</th><th bgcolor='#EEEE00'>星期六</th><th bgcolor='#FF77FF'>星期日</th>");
										for (var i = 0; i < sport.length; i++) {
											document.write("<tr><p><p>");
											for (var j = 0; j < sport[i].length; j++) {
												document
														.write("<td bgcolor='#CCBBFF'><p><p>"
																+ sport[i][j]
																+ "</td>");
											}
											document.write("</tr>");
										}
										document.write("</table>");
									}

									else if (a <= 24) {
										document
												.write("<h1 align='center'>結實型偏胖<h1>");
										bodydata[0] = [ "身高:" + h, "體重:" + w,
												"年齡:" + e, "性別:" + g ];
										bodydata[1] = [
												"體脂率:" + formatFloat(fat, 2)
														+ "%",
												"體脂重量:"
														+ formatFloat(
																Body_fat_weight,
																2) + "KG",
												"水分率:"
														+ formatFloat(
																Moisture_rate,
																2) + "%",
												"水分重量:"
														+ formatFloat(
																Moisture_weight,
																2) + "KG" ];
										bodydata[2] = [
												"蛋白質率"
														+ formatFloat(
																Protein_weight_rate,
																2) + "%",
												"蛋白質重量"
														+ formatFloat(
																Protein_weight,
																2) + "KG",
												"骨骼率"
														+ formatFloat(
																Bone_weight_rate,
																2) + "%",
												"骨骼重量"
														+ formatFloat(
																Bone_weight, 2)
														+ "KG" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'>");
										for (var k = 0; k < bodydata.length; k++) {
											document.write("<tr><p><p>");
											for (var l = 0; l < bodydata[k].length; l++) {
												document
														.write("<td bgcolor='#00FFFF'><p><p>"
																+ bodydata[k][l]
																+ "</td>")
											}
											document.write("</tr>");
										}
										document.write("</table>");

										sport[0] = [ "第一周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[1] = [ "第二周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[2] = [ "第三周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[3] = [ "第四周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[4] = [ "第五周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[5] = [ "第六周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[6] = [ "第七周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[7] = [ "第八周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*5",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[8] = [ "第九周", "啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[9] = [ "第十周", "啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[10] = [ "第十一周",
												"啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[11] = [ "第十二周",
												"啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[12] = [ "間隔時間", "30s", "30s",
												"30s", "30s", "30s", "30s",
												"休息" ];
										sport[13] = [ "訓練地點", "健身房/住家",
												"健身房/住家", "健身房/住家", "健身房/住家",
												"健身房/住家", "健身房/住家", "休息" ];
										sport[14] = [ "訓練總時間", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "休息" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'><tr><th bgcolor='#D28EFF'>周數</th><th bgcolor='#DDFF77'>星期一</th><th bgcolor='#9900FF'>星期二</th><th bgcolor='#33CCFF'>星期三</th><th bgcolor='#66FF66'>星期四</th><th bgcolor='#FFEE99'>星期五</th><th bgcolor='#EEEE00'>星期六</th><th bgcolor='#FF77FF'>星期日</th>");
										for (var i = 0; i < sport.length; i++) {
											document.write("<tr><p><p>");
											for (var j = 0; j < sport[i].length; j++) {
												document
														.write("<td bgcolor='#CCBBFF'><p><p>"
																+ sport[i][j]
																+ "</td>");
											}
											document.write("</tr>");
										}
										document.write("</table>");
									}

									else if (a <= 30) {
										document
												.write("<h1 align='center'>偏胖型</h1>");
										bodydata[0] = [ "身高:" + h, "體重:" + w,
												"年齡:" + e, "性別:" + g ];
										bodydata[1] = [
												"體脂率:" + formatFloat(fat, 2)
														+ "%",
												"體脂重量:"
														+ formatFloat(
																Body_fat_weight,
																2) + "KG",
												"水分率:"
														+ formatFloat(
																Moisture_rate,
																2) + "%",
												"水分重量:"
														+ formatFloat(
																Moisture_weight,
																2) + "KG" ];
										bodydata[2] = [
												"蛋白質率"
														+ formatFloat(
																Protein_weight_rate,
																2) + "%",
												"蛋白質重量"
														+ formatFloat(
																Protein_weight,
																2) + "KG",
												"骨骼率"
														+ formatFloat(
																Bone_weight_rate,
																2) + "%",
												"骨骼重量"
														+ formatFloat(
																Bone_weight, 2)
														+ "KG" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'>");
										for (var k = 0; k < bodydata.length; k++) {
											document.write("<tr><p><p>");
											for (var l = 0; l < bodydata[k].length; l++) {
												document
														.write("<td bgcolor='#00FFFF'><p><p>"
																+ bodydata[k][l]
																+ "</td>")
											}
											document.write("</tr>");
										}
										document.write("</table>");
										sport[0] = [ "第一周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[1] = [ "第二周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[2] = [ "第三周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[3] = [ "第四周", "啞鈴12KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身8*3 啞鈴8*3",
												"深蹲12*3組 分腿蹲8*3組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 12*3 平躺抬腿12*3", "休息" ];
										sport[4] = [ "第五周", "啞鈴12KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[5] = [ "第六周", "啞鈴12KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[6] = [ "第七周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*3",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[7] = [ "第八周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*5",
												"伏地挺身12*3 啞鈴12*3",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*5組",
												"仰臥起坐 20*3 平躺抬腿20*3", "休息" ];
										sport[8] = [ "第九周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[9] = [ "第十周", "啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[10] = [ "第十一周",
												"啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[11] = [ "第十二周",
												"啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身20*3 啞鈴12*5",
												"深蹲16*5組 分腿蹲16*5組",
												"核心棒式1.5分鐘*5組",
												"仰臥起坐 30*3 平躺抬腿30*3", "休息" ];
										sport[12] = [ "間隔時間", "30s", "30s",
												"30s", "30s", "30s", "30s",
												"休息" ];
										sport[13] = [ "訓練地點", "健身房/住家",
												"健身房/住家", "健身房/住家", "健身房/住家",
												"健身房/住家", "健身房/住家", "休息" ];
										sport[14] = [ "訓練總時間", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "休息" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'><tr><th bgcolor='#D28EFF'>周數</th><th bgcolor='#DDFF77'>星期一</th><th bgcolor='#9900FF'>星期二</th><th bgcolor='#33CCFF'>星期三</th><th bgcolor='#66FF66'>星期四</th><th bgcolor='#FFEE99'>星期五</th><th bgcolor='#EEEE00'>星期六</th><th bgcolor='#FF77FF'>星期日</th>");
										for (var i = 0; i < sport.length; i++) {
											document.write("<tr><p><p>");
											for (var j = 0; j < sport[i].length; j++) {
												document
														.write("<td bgcolor='#CCBBFF'><p><p>"
																+ sport[i][j]
																+ "</td>");
											}
											document.write("</tr>");
										}
										document.write("</table>");
									}

									else if (a > 30) {
										document
												.write("<h1 align='center'>隱性胖<h1>");
										bodydata[0] = [ "身高:" + h, "體重:" + w,
												"年齡:" + e, "性別:" + g ];
										bodydata[1] = [
												"體脂率:" + formatFloat(fat, 2)
														+ "%",
												"體脂重量:"
														+ formatFloat(
																Body_fat_weight,
																2) + "KG",
												"水分率:"
														+ formatFloat(
																Moisture_rate,
																2) + "%",
												"水分重量:"
														+ formatFloat(
																Moisture_weight,
																2) + "KG" ];
										bodydata[2] = [
												"蛋白質率"
														+ formatFloat(
																Protein_weight_rate,
																2) + "%",
												"蛋白質重量"
														+ formatFloat(
																Protein_weight,
																2) + "KG",
												"骨骼率"
														+ formatFloat(
																Bone_weight_rate,
																2) + "%",
												"骨骼重量"
														+ formatFloat(
																Bone_weight, 2)
														+ "KG" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'>");
										for (var k = 0; k < bodydata.length; k++) {
											document.write("<tr><p><p>");
											for (var l = 0; l < bodydata[k].length; l++) {
												document
														.write("<td bgcolor='#00FFFF'><p><p>"
																+ bodydata[k][l]
																+ "</td>")
											}
											document.write("</tr>");
										}
										document.write("</table>");
										sport[0] = [ "第一周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身6*3 啞鈴6*3",
												"深蹲8*3組 分腿蹲8*3組 ", "核心棒式1分鐘*3",
												"仰臥起坐 6*3 平躺抬腿8*3", "休息" ];
										sport[1] = [ "第二周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身6*3 啞鈴6*3",
												"深蹲8*3組 分腿蹲8*3組 ", "核心棒式1分鐘*3",
												"仰臥起坐 6*3 平躺抬腿8*3", "休息" ];
										sport[2] = [ "第三周", "啞鈴10KG二頭、三頭8*3組",
												"顛腳12*3組 分腿蹲8*3",
												"伏地挺身6*3 啞鈴6*3",
												"深蹲8*3組 分腿蹲8*3組 ", "核心棒式1分鐘*3",
												"仰臥起坐 6*3 平躺抬腿8*3", "休息" ];
										sport[3] = [ "第四周", "啞鈴12KG二頭、三頭10*3組",
												"顛腳15*3組 分腿蹲10*3",
												"伏地挺身10*3 啞鈴10*3",
												"深蹲12*4組 分腿蹲8*4組 ",
												"核心棒式1分鐘*3",
												"仰臥起坐 8*3 平躺抬腿8*3", "休息" ];
										sport[4] = [ "第五周", "啞鈴12KG二頭、三頭10*3組",
												"顛腳15*3組 分腿蹲10*3",
												"伏地挺身10*3 啞鈴10*3",
												"深蹲12*4組 分腿蹲8*4組 ",
												"核心棒式1分鐘*4",
												"仰臥起坐 8*3 平躺抬腿8*4", "休息" ];
										sport[5] = [ "第六周", "啞鈴12KG二頭、三頭10*3組",
												"顛腳15*3組 分腿蹲10*3",
												"伏地挺身10*3 啞鈴10*3",
												"深蹲12*4組 分腿蹲8*4組 ",
												"核心棒式1分鐘*4",
												"仰臥起坐 8*3 平躺抬腿8*4", "休息" ];
										sport[6] = [ "第七周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*5",
												"伏地挺身12*5 啞鈴12*5",
												"深蹲12*5組 分腿蹲12*5組 ",
												"核心棒式1分鐘*4組",
												"仰臥起坐 10*4 平躺抬腿8*4", "休息" ];
										sport[7] = [ "第八周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*5",
												"伏地挺身12*5 啞鈴12*5",
												"深蹲12*5組 分腿蹲12*5組",
												"核心棒式1分鐘*4組",
												"仰臥起坐 10*4 平躺抬腿8*4", "休息" ];
										sport[8] = [ "第九周", "啞鈴14KG二頭、三頭10*3組",
												"顛腳20*3組 分腿蹲12*5",
												"伏地挺身12*5 啞鈴12*5",
												"深蹲12*5組 分腿蹲12*5組",
												"核心棒式1分鐘*5組",
												"仰臥起坐 10*4 平躺抬腿10*4", "休息" ];
										sport[9] = [ "第十周", "啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身12*3 啞鈴12*5",
												"深蹲12*5組 分腿蹲12*5組",
												"核心棒式1分鐘*5組",
												"仰臥起坐 12*5平躺抬腿10*4", "休息" ];
										sport[10] = [ "第十一周",
												"啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身12*3 啞鈴12*5",
												"深蹲12*5組 分腿蹲12*5組",
												"核心棒式1分鐘*5組",
												"仰臥起坐 12*5 平躺抬腿10*4", "休息" ];
										sport[11] = [ "第十二周",
												"啞鈴16KG二頭、三頭10*3組",
												"顛腳20*5組 分腿蹲12*5",
												"伏地挺身12*3 啞鈴12*5",
												"深蹲12*5組 分腿蹲12*5組",
												"核心棒式1分鐘*5組",
												"仰臥起坐 12*5平躺抬腿10*4", "休息" ];
										sport[12] = [ "間隔時間", "30s", "30s",
												"30s", "30s", "30s", "30s",
												"休息" ];
										sport[13] = [ "訓練地點", "健身房/住家",
												"健身房/住家", "健身房/住家", "健身房/住家",
												"健身房/住家", "健身房/住家", "休息" ];
										sport[14] = [ "訓練總時間", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "1HR(包含慢跑)",
												"1HR(包含慢跑)", "休息" ];
										document
												.write("<table border='2' align='center' class='man'  cellspacing='5' cellpadding='5' border-radius: '20px'><tr><th bgcolor='#D28EFF'>周數</th><th bgcolor='#DDFF77'>星期一</th><th bgcolor='#9900FF'>星期二</th><th bgcolor='#33CCFF'>星期三</th><th bgcolor='#66FF66'>星期四</th><th bgcolor='#FFEE99'>星期五</th><th bgcolor='#EEEE00'>星期六</th><th bgcolor='#FF77FF'>星期日</th>");
										for (var i = 0; i < sport.length; i++) {
											document.write("<tr><p><p>");
											for (var j = 0; j < sport[i].length; j++) {
												document
														.write("<td bgcolor='#CCBBFF'><p><p>"
																+ sport[i][j]
																+ "</td>");
											}
											document.write("</tr>");
										}
										document.write("</table>");
									}
								} else {
									alert('請選擇性別');

								}

							});

			$('#body-reset').on('click', function() {
				$('#age').val('');
				$('#gender').val('');
				$('#bodyfat').val('');
			});

		});
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>