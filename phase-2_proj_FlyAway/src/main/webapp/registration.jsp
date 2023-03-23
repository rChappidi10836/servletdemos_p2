<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
	
	<div class="container">
		<form id="Form1">
			<h3> PERSONAL INFO</h3>
				<input type="text" placeholder="Name" name="name" required>
				<input type="text" placeholder="Phonenumber" 
				name="phonenumber" required>
				
				<div class="btn-box">
					<button type="button" id="Next1">Next</button>
				</div>
		</form>
		
		<form id="Form2">
			<h3> Selected Flight Details </h3>
				<input type="text" placeholder="Date" 
				name="Date" value="" required>
				<input type="text" placeholder="Source to Destination" 
				name="S2D" value="" required>
				<input type="text" placeholder="price per seat" 
				name="" value="" required>
				<div class="btn-box">
					<button type="button" id="Back1">Back</button>
					<button type="button" id="Next2">Next</button>
				</div>
		</form>
		
		<form id="Form3">
			<h3> Payment GateWay</h3>
				<input type="text" placeholder="Total Price" 
				name="password" value="" required>
				<input type="text" placeholder="UPI_ID" name="UID" required>
				<div class="btn-box">
					<button type="button" id="Back2">Back</button>
					<button type="submit" >PAY</button>
				</div>
		</form>
		
		
		<div class="step-row">
		    <div id="progress"></div>
			<div class="step-col"><small>Step 1</small></div>
			<div class="step-col"><small>Step 2</small></div>
			<div class="step-col"><small>Step 3</small></div>
		</div>
		
		
	</div>


	<script>
		var From1 = document.getElementById("Form1");
		var From2 = document.getElementById("Form2");
		var From3 = document.getElementById("Form3");
		
		var Next1 = document.getElementById("Next1");
		var Back1 = document.getElementById("Back1");
		var Next2 = document.getElementById("Next2");
		var Back2 = document.getElementById("Back2");
		
		var progress = document.getElementById("progress");
		
		Next1.onclick = function(){
			Form1.style.left = "-450px";
			Form2.style.left = "40px";
			progress.style.width= "240px";
		}
		
		Back1.onclick = function(){
			Form1.style.left = "40px";
			Form2.style.left = "450px";
			progress.style.width= "120px";
		}
		Next2.onclick = function(){
			Form2.style.left = "-450px";
			Form3.style.left = "40px";
			progress.style.width= "360px";
		}
		
		Back2.onclick = function(){
			Form2.style.left = "40px";
			Form3.style.left = "450px";
			progress.style.width= "240px";
		}
		
	</script>
</body>
<style>
	.container{
		width: 360px;
		height: 400px;
		margin: 8% auto;
		background: #fff;
		border-radius: 5px;
		position: relative;
		overflow: hidden;
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
	width: 100%;
	padding: 10px 5px;
	margin: 5px 0;
	border: 0;
	border-bottom: 1px solid #999;
	outline: none;
	background: transparent;
	/*transition: 0.5s;*/
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
	}
	#Form2{
		left: 450px;
		
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