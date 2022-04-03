<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태타입설정</title>
</head>
<body>
	<section class="content">
    <div class="container-fluid">
        <div class="card card-info" style="width: 450px; margin: 0px;">
          <div class="card-header">
            <h3 class="card-title"><i class="fas fa-cog"></i>&nbsp;&nbsp;근태타입설정</h3>
          </div>
          <!-- /.card-header -->
          <!-- form start -->
          <form role="form" method="post" action="attTypeRegister.do" name="registerForm" class="form-horizontal" style="margin: 0px;">
            <div class="card-body">
              <div class="form-group row">
                <label for="attName" class="col-sm-4 col-form-label">근무유형</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="attName" name="attName" placeholder="ex) A형,B형...">
                </div>
              </div>
              <div class="form-group row">
                <label for="coreStartTime" class="col-sm-4 col-form-label">코어시작시간</label>
                <div class="col-sm-8">
                  <input type="time" class="form-control" id="coreStartTime" name="attCoreStartTime">
                </div>
              </div>
              <div class="form-group row">
                <label for="coreEndTime" class="col-sm-4 col-form-label">코어종료시간</label>
                <div class="col-sm-8">
                  <input type="time" class="form-control" id="coreEndTime" name="attCoreEndTime">
                </div>
              </div>
              <div class="form-group row">
                <label for="attTime" class="col-sm-4 col-form-label">출근시간</label>
                <div class="col-sm-8">
                  <input type="time" class="form-control" id="attTime" name="attTime">
                </div>
              </div>
              <div class="form-group row">
                <label for="attLeavTime" class="col-sm-4 col-form-label">퇴근시간</label>
                <div class="col-sm-8">
                  <input type="time" class="form-control" id="attLeavTime" name="attLeavTime">
                </div>
              </div>
              </div>
            <!-- /.card-body -->
            <div class="card-footer">
              <button type="submit" class="btn btn-info" onclick="register_go();">등록</button>
              <button type="button" id="closeBtn" class="btn btn-default float-right" onclick="CloseWindow();">닫기</button>
            </div>
            <!-- /.card-footer -->
          </form>
        </div>
      </div>
  </section>
  
<script>
function register_go(){
// 	alert('약오르지롱');
	var form=$('form[role="form"]');
	form.submit();
}
</script>
</body>
</html>