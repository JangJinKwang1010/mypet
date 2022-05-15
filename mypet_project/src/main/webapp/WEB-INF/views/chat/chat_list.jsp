<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypet</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<style>
	html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
	        margin: 0;
	        padding: 0;
	        border: 0;
	        font-size:100%;
	        vertical-align: baseline;
	        background: transparent;
	}
	section { width:800px; height:700px; }
	.title {
		background-color:rgb(72,115,210);
		color:white;
		text-align:center;
		height:40px;
		font-weight:bold;
		font-size:20px;
		padding-top:15px;
	}
	.left {
		width:300px; height:95%;
		background-color:white;
		display:inline-block; float:left;
		overflow-y: scroll; overflow-x: hidden;
	}
	.left_box {
		width:93%; height:80px;
		background-color:white;
		border-bottom:1px solid lightgray;
		border-right:1px solid lightgray;
		padding-top:20px; padding-left:20px;
		cursor:pointer;
		float:left;
	}
	.left_img {
		width:50px; height:50px;
		border:1px solid lightgray;
		border-radius:50px; display:inline-block;
		float:left;
	}
	.left_img>img { border-radius:50px; }
	.left_box>p { margin-left:10px; float:left; }
	.left_box>p:nth-child(2) { font-size:16px; font-weight:bold; }
	.left_box>p:last-child { font-size:14px; margin-top:5px; color:gray; }
	#check {    }
	
	.center { background-color:rgb(240,240,240); width:500px; height:95%; display:inline-block; float:right; display:inline-block; }
	.center_chat { width:100%; height:90%; overflow-y: scroll; overflow-x: hidden; }
	.center_chat>.div { width:100%; height:60px; display:inline-block; }
	.center_chat .cdate { width:100px; height:30px; font-size:13px; display:inline-block; margin:10px 0; }
	.center_chat .you { 
		float:left; width:300px; height:30px; border-radius:10px; background-color:white; margin:10px 0; color:black; text-align:left;
	}
	.center_chat .me { 
		float:right; width:300px; height:30px; border-radius:10px; background-color:white; margin:10px 0; text-align:left;
	}
	.center_chat>div>div {
		padding:10px;	
		display:inline-block;
	}
	.center_enter { background-color:white; width:100%; height:90px; margin:10px 0; }
	.center_enter>input { width:80%; height:50px; margin:5px; border:1px solid lightgray; }
	.center_enter>button {
		width:13%; height:50px;
		float:right; margin:5px;
		border:1px solid lightgray;
	}
	
	.foot { background-color:rgb(72,115,210); width:100%; height:20px; float:left; margin-top:10px; }
	
	.info_btn { margin-left:10px; }
	
</style>
<script>
$(document).ready(function() {
	
	if("${from_id}" != "") {
		var id = "${from_id}";
		mclick(id);
	}
	
	var htmlOut3;
	
	$.ajax({
        type: "post",
        url: "chat_info.do",             
        data:{from_id:"${from_id}"},
        dataType: 'json',
        success: function (data) {
        	for(var idx in data){
        	var htmlOut = "";
        		if (data[idx].from_id != "${session_id}") {        			
        			htmlOut += ' <div class="left_box" id="'+ data[idx].from_id +'"><div class="left_img"> <img src="images/human2.png" width=100%; height=100%;></div>' ;
        			htmlOut += ' <p>'+data[idx].from_id+'</p> <button class="info_btn" id="'+ data[idx].from_id +'">정보보기</button></br><p>'+data[idx].last+'</p>';	   
        		} else {
        			htmlOut += ' <div class="left_box" id ="'+ data[idx].to_id +'"><div class="left_img"> <img src="images/human2.png" width=100%; height=100%;></div>' ;
        			htmlOut += ' <p>'+data[idx].to_id+'</p><button class="info_btn" id="'+ data[idx].to_id +'">정보보기</button></br><p>'+data[idx].last+'</p>';	               	
        		}
	            $(".left").append(htmlOut);            	
        	} 
        },    	
   }); 
	
	$(document).on("click", ".info_btn", function() {
		var url = "info.do?id="+$(this).attr("id");
	    var name = "popup test2";
	    var option = "width = 500, height = 300, top = 150, left = 500, location = no "
	    window.open(url, name, option);
		
	});
	
	function mclick(id) {
		$(".center_enter").remove();	    
			$.ajax({
		        type: "post",
		        url: "chat_history.do",             
		        data:{id:id},
		        dataType: 'json',
		        success: function (data) {
		        	var htmlOut = "";
		        	for(var idx in data){
			        	if (data[idx].to_id == "${session_id}") {
			        		htmlOut += ' <div class="div"><div class="cdate" style="text-align:right; margin-left:40px;">' + data[idx].cdate + '</div>';
			        	    htmlOut += ' <div class="me">'+data[idx].content+'</div></div>';     
			        	} else {
			        		htmlOut += ' <div class="div"><div class="cdate" style="margin-left:5px;">' + data[idx].cdate + '</div>';
			        	    htmlOut += ' <div class="you">'+data[idx].content+'</div></div>';      
			        	}
		        	} 	        	
		    		$(".center_chat").empty();
		            $(".center_chat").append(htmlOut);
		            $('.center_chat').scrollTop($('.center_chat')[0].scrollHeight);
		        },   
		   }); 
			
			htmlOut3 = '<div class="center_enter"><input type="text" class="form-control" id="message" autocomplete="off" ><button type="button"  class="send" id="' + id +'">전송</button></div>';
			$(".center").append(htmlOut3);
			
			$(".send").click(function() {
				var id = $(this).attr("id");			
				if($("#message").val() == "") {
					alert("메세지를 입력해주세요");
					$("#message").focus();
				} else {
					if (id != "") {
						$.ajax({
			                type: "post",
			                url: "chat_upload.do",             
			                data:{from_id:id, content:$('#message').val()},
			                dataType: 'json',
			                success: function (result) {
			                	$("#message").val("").focus();
			                },
			           }); 
					} else {
						$.ajax({
			                type: "post",
			                url: "chat_upload.do",             
			                data:{from_id:"${from_id}", content:$('#message').val()},
			                dataType: 'json',
			                success: function (result) {
			                	$("#message").val("").focus();
			                },
			           }); 
					}		
				}
				mclick(id);
			});
			
			document.querySelector('#message').addEventListener('keypress', function (e) {
			    if (e.key === 'Enter') {
			    	var id = $(this).next().attr("id");				
					if($("#message").val() == "") {
						alert("메세지를 입력해주세요");
						$("#message").focus();
					} else {
						if (id != "") {
							$.ajax({
				                type: "post",
				                url: "chat_upload.do",             
				                data:{from_id:id, content:$('#message').val()},
				                dataType: 'json',
				                success: function (result) {
				                	$("#message").val("").focus();     
				                },
				           }); 
						} else {
							$.ajax({
				                type: "post",
				                url: "chat_upload.do",             
				                data:{from_id:"${from_id}", content:$('#message').val()},
				                dataType: 'json',
				                success: function (result) {
				                	$("#message").val("").focus();
				                },
				           }); 
						}	
					}
					mclick(id);
			    }
			});	
	};

	
	$(document).on("click", ".left_box", function() {		
		
		$(".left_box").css("box-shadow", "none");
		$(this).css("box-shadow", "0 0 0 2px rgb(0,66,132) inset");
	    var id = $(this).attr("id");	    
	    $(".center_enter").remove();
	    
		$.ajax({
	        type: "post",
	        url: "chat_history.do",             
	        data:{id:id},
	        dataType: 'json',
	        success: function (data) {
	        	var htmlOut = "";
	        	for(var idx in data){
		        	if (data[idx].to_id == "${session_id}") {
		        		htmlOut += ' <div class="div"><div class="cdate" style="text-align:right; margin-left:40px;">' + data[idx].cdate + '</div>';
		        	    htmlOut += ' <div class="me">'+data[idx].content+'</div></div>';     
		        	} else {
		        		htmlOut += ' <div class="div"><div class="cdate" style="margin-left:5px;">' + data[idx].cdate + '</div>';
		        	    htmlOut += ' <div class="you">'+data[idx].content+'</div></div>';      
		        	}
	        	} 	        	
	    		$(".center_chat").empty();
	            $(".center_chat").append(htmlOut);
	            $('.center_chat').scrollTop($('.center_chat')[0].scrollHeight);
	        },
	   }); 
		
		var htmlOut2 = '<div class="center_enter"><input type="text" class="form-control" id="message" autocomplete="off" ><button type="button"  class="send" id="' + id +'">전송</button></div>';
		$(".center").append(htmlOut2);
		
		$(".send").click(function() {
			var id = $(this).attr("id");			
			if($("#message").val() == "") {
				alert("메세지를 입력해주세요");
				$("#message").focus();
			} else {
				if (id != "") {
					$.ajax({
		                type: "post",
		                url: "chat_upload.do",             
		                data:{from_id:id, content:$('#message').val()},
		                dataType: 'json',
		                success: function (result) {
		                	$("#message").val("").focus();
		                },
		           }); 
				} else {
					$.ajax({
		                type: "post",
		                url: "chat_upload.do",             
		                data:{from_id:"${from_id}", content:$('#message').val()},
		                dataType: 'json',
		                success: function (result) {
		                	$("#message").val("").focus();
		                },
		           }); 
				}		
			}
			mclick(id);
		});
		
		document.querySelector('#message').addEventListener('keypress', function (e) {
		    if (e.key === 'Enter') {
		    	var id = $(this).next().attr("id");				
				if($("#message").val() == "") {
					alert("메세지를 입력해주세요");
					$("#message").focus();
				} else {
					if (id != "") {
						$.ajax({
			                type: "post",
			                url: "chat_upload.do",             
			                data:{from_id:id, content:$('#message').val()},
			                dataType: 'json',
			                success: function (result) {
			                	$("#message").val("").focus();     
			                },
			           }); 
					} else {
						$.ajax({
			                type: "post",
			                url: "chat_upload.do",             
			                data:{from_id:"${from_id}", content:$('#message').val()},
			                dataType: 'json',
			                success: function (result) {
			                	$("#message").val("").focus();
			                },
			           }); 
					}				
				}
				mclick(id);
		    }
		});	
		
	});
	
	
});
</script>
<body>
	<section>
		<div class="title">채팅 목록</div>
		<div class="left"></div>
		<div class="center">
			<div class="center_chat"></div>			
		</div>
		<div class="foot"></div>
	</section>
</body>
</html>