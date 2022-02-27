<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
</head>
<style>
	section { text-align:center; }
	.p {
		font-weight:bold;
		font-size:20px;
		margin:20px 0;
	}
	.div {
		display:inline-block;
		border:1px solid lightgray;
		border-radius:5px;
		width:80%;
		height:300px;
		margin-top:10px;
		text-align:center;
		margin-bottom:40px; 
	}
	#img { margin-top:15px; }
	button {
		border:none;
		width:20%;
		height:50px;
		border-radius:10px;
		font-weight:bold;
		margin-top:15px;
		background-color:rgb(72,115,210);
		color:white;
		font-size:20px;
	}
	button:hover {
		background-color:rgb(0,68,130);
		color:white;
	}
	
	.bar-container {
	 	 height: 2.7rem;
	 	 width:250px;
	 	 display:inline-block;
	 	 float:left;
	}
	.animal-label {
	    font-weight:bold;
	    font-size:14px; 
	    display:inline-block;
	    float:left;
	    width:150px;
	    text-align:center;
	    margin-left:50px;
	}
	.gbox {
		width:100%;
		display:inline-block;
	}
	
	.box0 {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(235, 166, 190, 0.2);
	}
	.bar0 {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(235, 166, 190, 1);
	}
	.box1 {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(117, 204, 84, 0.2);
	}
	.bar1 {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(117, 204, 84, 1);
	}
	.box2 {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(27, 175, 234, 0.2);
	}
	.bar2 {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(27, 175, 234, 1);
	}
	.box3 {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(251, 176, 59, 0.2);
	}
	.bar3 {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(251, 176, 59, 1);
	}
	.box4 {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(195, 140, 102, 0.2);
	}
	.bar4 {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(195, 140, 102, 1);
	}
	#loading {
	  display: none;
	}
</style>
<script>
$(document).ready(function() {
	var img_name;
	var img_src;
	var img_id = "img" + getParam("num");
	var text = "text" + getParam("num");
	var star = "별" + getParam("num");
	var file_name = "pfile" + getParam("num");
	
	$("input").attr("id", file_name);
	
	$("input").change(function(e){
			img_name = this.files[0].name;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result); 
				img_src = e.target.result;
				$('#loading').show();
			}
			reader.readAsDataURL(this.files[0]);
			
			init().then(function(){
				predict();
				$('#loading').hide();
			});
		
	});
	
	$("input").click(function() {
		$("#label-container").hide();
		$(".bar-container").hide();
	});
	
	$(".ok").click(function() {
		opener.document.getElementById(text).style.display = "none";
		opener.document.getElementById(star).style.display = "none";
		opener.document.getElementById(img_id).style.display = "block";
		opener.document.getElementById(img_id).src = img_src;
		opener.document.getElementById('append2').append(document.getElementById(file_name));
		opener.document.getElementById(file_name).style.display="none";
		window.close(); //창 닫기
	});
	
	
	function getParam(sname) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);
	    var sval = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == sname) { sval = temp[1]; }
	    }
	    return sval;
	}


	

});

//More API functions here:
// https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

// the link to your model provided by Teachable Machine export panel
const URL = "https://teachablemachine.withgoogle.com/models/uDVQKd90U/";

let model, webcam, labelContainer, maxPredictions, barWidth;

// Load the image model and setup the webcam
async function init() {
	const modelURL = URL + "model.json";
	const metadataURL = URL + "metadata.json";

	// load the model and metadata
	// Refer to tmImage.loadFromFiles() in the API to support files from a file picker
	// or files from your local hard drive
	// Note: the pose library adds "tmImage" object to your window (window.tmImage)
	model = await
	tmImage.load(modelURL, metadataURL);
	maxPredictions = model.getTotalClasses();

	

	// append elements to the DOM
	labelContainer = document.getElementById("label-container");
	
	for (let i = 0; i < maxPredictions; i++) { // and class labels
		var label = document.createElement("div");	
		labelContainer.appendChild(label);	
	}
}


// run the webcam image through the image model
async function predict() {
	// predict can take in an image, video or canvas html element
	var image = document.getElementById("img")
	const prediction = await model.predict(image, false);
	prediction.sort((a, b) => parseFloat(b.probability) - parseFloat(a.probability));
	console.log(prediction);
      
	
	for (let i = 0; i < 5; i++) {

		 if (prediction[i].probability.toFixed(2) > 0.1) {
	           barWidth = Math.round(prediction[i].probability.toFixed(2) * 100) + "%";
	       } else if (prediction[i].probability.toFixed(2) >= 0.01) {
	           barWidth = "4%"
	       } else {
	           barWidth = "2%"
	       }
		 
		
		var label = "<div class='gbox'><div class='animal-label d-flex align-items-center'>" + prediction[i].className + "</div>";
		const bar = "<div class='bar-container position-relative container'><div class='box" + i + "'></div><div class='d-flex justify-content-center align-items-center bar" + i + "' style='width: " + barWidth + "'><span class='d-block percent-text'>" + Math.round(prediction[i].probability.toFixed(2) * 100) + "%</span></div></div></div>";
		labelContainer.childNodes[i].innerHTML = label+bar;
		$("#label-container").show();
		$(".bar-container").show();
	}
   
}

</script>
<body>
<section>
	<p class="p">사진 등록</p>
	<input type="file" class="form-control" name="file2" >
	<div class="div">
		<img id="img" src="images/image.png" width=90%; height=90%; >
	</div>
	<div id="loading" class="animated bounce">
            <span class="sr-only">Loading...</span>
    </div>
	<div id="label-container" ></div>
	<div class='bar-container position-relative container'></div>
</section>
</body>
</html>