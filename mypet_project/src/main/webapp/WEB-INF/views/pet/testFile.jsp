<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
//colors
$color_gallery_approx: #eeeeee;
$white: #ffffff;
$color_jade_approx: #1fb264;
$color_salem_approx: #15824b;
$color_eucalyptus_approx: #1aa059;
$color_log_cabin_approx: #222;
$color_valencia_approx: #cd4535;
$color_roof_terracotta_approx: #b02818;
$color_flush_mahogany_approx: #c13b2a;

//fonts
$font_0: sans-serif;

body {
	font-family: $font_0;
	background-color: $color_gallery_approx;
}
.teachable{
	width: 500px;
	height:800px;
	border:1px solid;
}
.file-upload {
	background-color: $white;
	width: 500px;
	margin: 0 auto;
}
.file-upload-btn {
	width: 100%;
	margin: 0;
	color: $white;
	background: $color_jade_approx;
	border: none;
	padding: 10px;
	//Instead of the line below you could use @include border-radius($radius, $vertical-radius)
	border-radius: 4px;
	border-bottom: 4px solid $color_salem_approx;
	//Instead of the line below you could use @include transition($transition-1, $transition-2, $transition-3, $transition-4, $transition-5, $transition-6, $transition-7, $transition-8, $transition-9, $transition-10)
	transition: all .2s ease;
	outline: none;
	text-transform: uppercase;
	font-weight: 700;
	&:hover {
		background: $color_eucalyptus_approx;
		color: $white;
		//Instead of the line below you could use @include transition($transition-1, $transition-2, $transition-3, $transition-4, $transition-5, $transition-6, $transition-7, $transition-8, $transition-9, $transition-10)
		transition: all .2s ease;
		cursor: pointer;
	}
	&:active {
		border: 0;
		//Instead of the line below you could use @include transition($transition-1, $transition-2, $transition-3, $transition-4, $transition-5, $transition-6, $transition-7, $transition-8, $transition-9, $transition-10)
		transition: all .2s ease;
	}
}
.file-upload-content {
	display: none;
	text-align: center;
}
.file-upload-input {
	position: absolute;
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	outline: none;
	opacity: 0;
	cursor: pointer;
}
.image-upload-wrap {
	margin-top: 20px;
	border: 4px dashed $color_jade_approx;
	position: relative;
	&:hover {
		background-color: $color_jade_approx;
		border: 4px dashed $white;
	}
}
.image-dropping {
	background-color: $color_jade_approx;
	border: 4px dashed $white;
}
.image-title-wrap {
	padding: 0 15px 15px;
	color: $color_log_cabin_approx;
}
.drag-text {
	text-align: center;
	h3 {
		font-weight: 100;
		text-transform: uppercase;
		color: $color_salem_approx;
		padding: 60px 0;
	}
}
.file-upload-image {
	max-height: 200px;
	max-width: 200px;
	margin: auto;
	padding: 20px;
}
.remove-image {
	width: 200px;
	margin: 0;
	color: $white;
	background: $color_valencia_approx;
	border: none;
	padding: 10px;
	//Instead of the line below you could use @include border-radius($radius, $vertical-radius)
	border-radius: 4px;
	border-bottom: 4px solid $color_roof_terracotta_approx;
	//Instead of the line below you could use @include transition($transition-1, $transition-2, $transition-3, $transition-4, $transition-5, $transition-6, $transition-7, $transition-8, $transition-9, $transition-10)
	transition: all .2s ease;
	outline: none;
	text-transform: uppercase;
	font-weight: 700;
	&:hover {
		background: $color_flush_mahogany_approx;
		color: $white;
		//Instead of the line below you could use @include transition($transition-1, $transition-2, $transition-3, $transition-4, $transition-5, $transition-6, $transition-7, $transition-8, $transition-9, $transition-10)
		transition: all .2s ease;
		cursor: pointer;
	}
	&:active {
		border: 0;
		//Instead of the line below you could use @include transition($transition-1, $transition-2, $transition-3, $transition-4, $transition-5, $transition-6, $transition-7, $transition-8, $transition-9, $transition-10)
		transition: all .2s ease;
	}
}
</style>
</head>
<body>
<div class="teachable">
	<div class="file-upload">
		<button class="file-upload-btn" type="button"
			onclick="$('.file-upload-input').trigger( 'click' )">AddImage</button>

		<div class="image-upload-wrap">
			<input class="file-upload-input" type='file'
				onchange="readURL(this);" accept="image/*" />
			<div class="drag-text">
				<h3>이미지를 넣어주세요</h3>
			</div>
		</div>
		<div class="file-upload-content">
			<img class="file-upload-image" id="face-image" src="#" alt="your image" />
			<div id="label-container"></div>
			<div class="image-title-wrap">
				<button type="button" onclick="removeUpload()" class="remove-image">
					지우기 <span class="image-title">Uploaded Image</span>
				</button>
			</div>
		</div>
	</div>
	<div id="webcam-container"></div>
	<script>function readURL(input) {
		  if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      $('.image-upload-wrap').hide();
			      $('.file-upload-image').attr('src', e.target.result);
			      $('.file-upload-content').show();
			      $('.image-title').html(input.files[0].name);
			    };

			    reader.readAsDataURL(input.files[0]);
				init().then(function(){
					predict();
				});
			  } else {
			    removeUpload();
			  }
			}

			function removeUpload() {
			  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
			  $('.file-upload-content').hide();
			  $('.image-upload-wrap').show();
			}
			$('.image-upload-wrap').bind('dragover', function() {
			  $('.image-upload-wrap').addClass('image-dropping');
			});
			$('.image-upload-wrap').bind('dragleave', function() {
			  $('.image-upload-wrap').removeClass('image-dropping');
			});
			</script>
	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
	<script type="text/javascript">
		// More API functions here:
		// https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

		// the link to your model provided by Teachable Machine export panel
		const URL = "https://teachablemachine.withgoogle.com/models/uDVQKd90U/";

		let model, webcam, labelContainer, maxPredictions;

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
				labelContainer.appendChild(document.createElement("div"));
			}
		}


		// run the webcam image through the image model
		async function predict() {
			// predict can take in an image, video or canvas html element
			var image = document.getElementById("face-image")
			const prediction = await model.predict(image, false);
			prediction.sort((a, b) => parseFloat(b.probability) - parseFloat(a.probability));
			console.log(prediction);
			for (let i = 0; i < 5; i++) {
				const classPrediction = prediction[i].className + ": " + prediction[i].probability.toFixed(2);
				labelContainer.childNodes[i].innerHTML = classPrediction;
			}
		}
	</script>
	</div>
</body>
</html>