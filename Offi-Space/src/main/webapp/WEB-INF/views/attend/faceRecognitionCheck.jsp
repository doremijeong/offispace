<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
<style>
body {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

canvas {
  position: absolute;
}
</style>
<!-- <script type="text/javascript">
function auto_close(){
	setTimeout('closed()',900000);
}

function closed(){
	self.close();
	window.opener.close();
}

auto_close();

</script>
 -->



</head>
<body>

<script>
loaderShow();
</script>

<script src="<%=request.getContextPath() %>/resources/face/face-api.js"></script>
<div class="videoBox" style="display:none">
	 <video id="video" height="560" width="720" autoplay muted ></video>
</div>
<script>
const video = document.getElementById("video");
Promise.all([
	  faceapi.nets.tinyFaceDetector.loadFromUri("<%=request.getContextPath() %>/resources/face/models"),
	  faceapi.nets.faceRecognitionNet.loadFromUri("<%=request.getContextPath() %>/resources/face/models"),
	  faceapi.nets.faceLandmark68Net.loadFromUri("<%=request.getContextPath() %>/resources/face/models"),
	  faceapi.nets.ssdMobilenetv1.loadFromUri("<%=request.getContextPath() %>/resources/face/models")
	  ]).then(startVideo);
	  
async function startVideo(){
	  
	  labeledFaceDescriptors = await loadLabledImages();
	  
	  loaderHide();
	  document.querySelector('.videoBox').style.display="";
	
	  faceMatcher = new faceapi.FaceMatcher(labeledFaceDescriptors, 0.4)

	  navigator.getUserMedia(
	    {video: {} },
	    stream => (video.srcObject = stream),
	    err => console.log(err)
	  );
}	
let count=0;
video.addEventListener("playing",()=>{		
	  const canvas = faceapi.createCanvasFromMedia(video);
	  document.body.append(canvas);
	  const displaySize = { width: video.width, height: video.height};
	  console.log(video.width, video.height)
	  faceapi.matchDimensions(canvas, displaySize);

	  
	  setInterval( async() =>{
	    const detections = await faceapi
	    .detectAllFaces(video, new faceapi.TinyFaceDetectorOptions())
	    .withFaceLandmarks()
	    .withFaceDescriptors();

	    const resizedDectections = faceapi.resizeResults(detections, displaySize);
	    canvas.getContext("2d").clearRect( 0, 0, canvas.width, canvas.height);

	    faceapi.draw.drawDetections(canvas, resizedDectections);
	    faceapi.draw.drawFaceLandmarks(canvas, resizedDectections);
	
	    const results = faceMatcher.findBestMatch(resizedDectections[0].descriptor);

	   
	    
	    console.log(results.label);
	    if(results.label == '${loginUser.empCode}'){
	    	
	    	Swal.fire({//confirm ?????????
	    		  title: '${loginUser.empName}??? ?????????????????????????',
// 	    		  text: text,
	    		  icon: 'warning',
	    		  showCancelButton: true,
	    		  confirmButtonText: '??????',
	    		  cancelButtonText: '??????',
	    		  reverseButtons: false
	    		})
	    		.then((result) => {
	    			if (result.isConfirmed) {
	    					$.ajax({
	    						url:'<%=request.getContextPath()%>/attend/answerTimemodify.do',
	    						type:'get',
	    						success:function(success){
	    							
	    							Swal.fire({ //confirm ?????????
	    				    			  title: "????????????",
	    				    			  text: "???????????????????????????.",
	    				    			  icon: 'success',
	    				    			  confirmButtonText: '??????',
	    				    			  reverseButtons: false
	    				    			})
	    				    			.then((result) => {
	    				    				if (result.isConfirmed) {
	    				    					window.close();
	    				    				} else if ( result.dismiss === Swal.DismissReason.cancel) {
	    				    					window.close();	
	    				    			 	}
	    				    			});
	    							
	    							window.close();
	    						},
	    						error:function(res){
	    							alert(error.responseText);
	    						}
	    					})	    		
	    					return;
	    			} else if ( result.dismiss === Swal.DismissReason.cancel) {
	    				callCancel(canTitle,canText);
	    		 	}
	    		});
	    }
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	<%-- var answer=confirm('${loginUser.empName}??? ?????????????????????????');
	    	if(answer){
				$.ajax({
					url:'<%=request.getContextPath()%>/attend/answerTimemodify.do',
					type:'get',
					success:function(success){
						alert('????????? ?????????????????????.');
						window.close();
						
					},
					error:function(res){
						alert(error.responseText);
					}
				})	    		
	    		
	    	}
	    	return;
	    } --%>
	    /* else{ //???????????????????????? ????????? ??????????????????????????? ????????? ???????????? ????????? ?????? ????????? ????????????  close?????? ??????.
	    	count++;
	    	if(count >= 500){
	    		alert('???????????????????????????.\n ????????? ?????? ???????????????.');
	    		window.close();
	    	}
	    	console.log(count);
	    } */
	    
/* 		if(results.label == "Lily"){
	    	alert('??????');
	    }
		if(results.label == "Haeyoon"){
	    	alert('?????? ');
	    }
		if(results.label == "Mihi"){
	    	alert('?????? ');
	    }
		if(results.label == "Mijung"){
	    	alert('?????? ');
// 	    	return;
// 			confirm('????????? ?????????????????????????');
// 			if(confirm==true){
// 				CloseWindow();
// 			}else{
// 				history.go(-1);
// 			}
	    	
	    }
 */		

	},3000)
})
	
function loadLabledImages(){
//	  const labels = ['OP0469', 'OP0472', 'OP0470', 'OP0501', 'OP0468', 'OP0471']
 	  const labels = ['${loginUser.empCode}'];

	  return Promise.all(
	    labels.map(async label => {
	      const descriptions = []
	      for(let i = 1; i <= 3; i++){
		    const img = await faceapi.fetchImage(`https://raw.githubusercontent.com/petite-reveuse/FaceRecogTest/main/labeled_images/`+label+`/`+i+`.jpg`)
// 		    const img = await faceapi.fetchImage("https://192.168.143.4/offispace/common/getPicture.do?attachSaveName=mijeong.jpg");
			
	        const detections = await faceapi.detectSingleFace(img)
	        .withFaceLandmarks().withFaceDescriptor()
	        descriptions.push(detections.descriptor)
	      }

	      return new faceapi.LabeledFaceDescriptors(label, descriptions)
	    })
	  )
	}	
</script>
</body>
