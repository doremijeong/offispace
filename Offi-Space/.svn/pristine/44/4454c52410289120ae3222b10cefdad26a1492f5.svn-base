<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function summernote_go(target, size) {
		
		if(!size){
			size = 250 
		}
		
		target.summernote({
			placeholder : "여기에 내용을 적으세요",
			lang : "kr-kr",
			height : size,
			disableResizeEditor : true,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {

					for(var file of files){

						if(file.size > 1024*1024*5){
							alert("이미지는 5MB 미만입니다.")
							return;
						}
						
						if(file.name.substring(file.name.lastIndexOf(".") + 1).toUpperCase() != "JPG"){
							alert("JPG 이미지 형식만 가능합니다.");
							return;
						}
					}

					for(var file of files){
						sendFile(file, this);
					}
				},
				onMediaDelete : function(target) {
					
					deleteFile(target[0].src); 
				
				}
			}
		})
	}
	
	function deleteFile(target) {
        var splitSrc = target.split("=");
        var fileName = splitSrc[splitSrc.length-1];

        var fileData = {fileName:fileName};

        $.ajax({
            url : "<%=request.getContextPath()%>/deleteImg.do",
            data : JSON.stringify(fileData),
            type : "post",
            contentType : "application/json",
            dataType:"text",
            success : function (res) {
            	
            },
            error : function() {
                alert("이미지 삭제가 불가합니다.")
            }
        })
    }

    function sendFile(file, el) {
        var form_data = new FormData();
        form_data.append("file", file);
        $.ajax({
            data : form_data,
            type : "post",
            url : "<%=request.getContextPath()%>/uploadImg.do",
            cache : false,
            contentType : false,
            processData : false,
            dataType:"text", 
            success : function(img_url) {
                $(el).summernote("editor.insertImage", img_url);
            },
            error : function(xhr) {
                alert(file.name + "업로드에 실패했습니다.")
            }
        })
    }
    
</script>