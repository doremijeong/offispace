// 파업창을 띄우기
// 새로운 window창을 open할 경우 사용되는 함수(args : 주소, 창타이틀, 넓이, 높이)
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes, width=" + WinWidth +
		", height=" + WinHeight + ", top=" + wintop +
		", left=" + winleft + ", resizable=yes, status=yes");
	win.focus();
}

function CloseWindow(parentURL) {
	window.opener.location.reload(true);
	window.close();
}

// 사용자 사진 출력
// 순수 자바 스크립트 객체만 넘겨줘야함 제이쿼리를 쓰더라도 [0]째만 넘겨주기
function MemberPictureThumb(targetObj, fileName, contextPath) { // 대상, 이미지 파일
	if (!contextPath) contextPath = "";
	// `url('${contextPath}/member/getPicture?picture=${fileName}`;
	//targetObj.style.backgroundImage = "url('" + contextPath + "/common/getPicture.do?picture=" + fileName + "')";
	//targetObj.style.backgroundPosition = "center";
	//targetObj.style.backgroundRepeat = "no-repeat";
	//targetObj.style.backgroundSize = "cover";
	//getImage = "url('" + contextPath + "/common/getPicture.do?attachSaveName=" + fileName + "')";
	//console.log(targetObj.src);
	targetObj.attr("src",contextPath + "/common/getPicture.do?attachSaveName=" + fileName);
}

//spring_security redirect loginForm (권한 없음
function AjaxErrorSecurityRedirectHandler(status) {
	if (status == "302") {
		callCancel("세션만료","세션이 만료되었습니다. \n로그인 하세요.");
		location.reload();
	} else if (status == "403") {
		callCancel("제한된 접근","권한이 유효하지 않습니다.");
		history.go(-1);
	} else {
		callFail();
		history.go(-1);
	}
}




function getCommonCodeList(searchType,  keyword) {
	return new Promise(resolve => {
		fetch('/offispace/common/getCommonCodeList/' + searchType + '/' + keyword)
			.then(response => response.json())
			.then(data => {
				resolve(data);
			});
	})
}


