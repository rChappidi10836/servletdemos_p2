<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
	
	
		<form id="Form3" action="complete_registration" method="post">
		<input type="hidden" name="id" value="${flight_details.id}">
		<input type="hidden" name="paid" value="${nop * flight_details.price}">
			<h3> Selected Flight Details </h3>
			<div style='position: relative;left: 43%;' >
			<table border=1>
				<tr>
					<td>Date</td>
					<td>${flight_details.dates}</td>
				</tr>
				<tr>
					<td>Airlines</td>
					<td>${flight_details.company}</td>
				</tr>
				<tr>
					<td>Source</td>
					<td>${flight_details.source}</td>
				</tr>
				<tr>
					<td>Destination</td>
					<td>${flight_details.destination}</td>
				</tr>
			</table>
			</div>
				
				<hr>
				<!--  <input type="hidden" value="${flight_details.id}" >-->
			
			<h3>Enter you PERSONAL INFO</h3>
				 <input type="text" placeholder="Enter you Name here" name="Name" required>
				<!-- <input type="text" placeholder="Name" name="name" required="required"type="text" value="" placeholder="" data-rule-required="true" data-msg-required="Please enter Your Name">-->
				<input type="text" placeholder="Enter you Phonenumber here" name="Number" required>
				
				<hr style="margin-top: 20px;">
			<h3> Payment GateWay</h3>
				<p>Price per Seat : ${flight_details.price}</p>
				<p>No of persons  : ${nop}</p>
				<p>Total Price ${nop} x ${flight_details.price} : ${nop * flight_details.price}</p><br>
				<input style="margin-left:42%"type="text" placeholder="Enter you UPI_ID here" name="UID" required>
				<div class="btn-box">
					<button type="button" id="Back2">Back</button>
					<button type="submit">PAY</button>
				</div>
		</form>
	
</body>
<style>

	hr{
	width:90%;
    
	margin-top: 30px:
	
	}
	
	h3{
	text-align: center;
	margin-bottom: 40px;
	color: #777;
	}
	.container form{
	width: 280px;
	position: absolute;
	top: 100px;
	left: 40px;
	
	}
	form input{
	width: 15%;
	padding: 10px 5px;
	margin: 5px 0;
	border: 0;
	border-bottom: 1px solid #999;
	outline: none;
	background: transparent;
	margin-left: 25%;
	text-align:center;
	/*transition: 0.5s;*/
	}
	p{
	margin-left:30%;
	}
	.btn-box{
		width:100%;
		margin: 30px auto;
		text-align:center;
	}
	form button{
		width:100px;
		height: 35px;
		margin: 0 10px;
		background: linear-gradient(to right, #ff1105f, #ffad06);
		border-radius: 30px;
		border: 0;
		outline: none;
		colour: #fff;
		cursor: pointer;
		left:-450;
	}
	#Form1{
		left: -450px;
		
	}
	#Form3{
		left: 450px;
	}
	.step-row{
		width: 360px;
		height: 40px;
		margin: 0 auto;
		display: flex;
		align-items: center;
		box-shadow: 0 -1px 5px -1px #000;
		position: relative;
	}
	.step-col{
		width:120px;
		text-align: center;
		color: #333;
		position: relative;
	}
	#progress{
		position: absolute;
		height: 100%;
		width: 120px;
		backgroud: linear-gradient(to right, #ff1105f, #ffad06);
		transition: 1s;
	}
	#progress::after{
		content: '';
		height: 0;
		width: 0;
		border-top: 20px solid transparent;
		border-bottom: 20px solid transparent;
		position: absolute;
		right: 20px;
		top: 0;
		border-right: 20px solid black;
		
	}
</style>
</html>