<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.offispace.dto.SchedulerVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
	<div class="content-wrapper">

	      <section class="content-header">
	        <div class="container-fluid">
	          <div class="row mb-2">
	            <div class="col-sm-6">
	              <h5>개인일정</h5>
	            </div>
	            <div class="col-sm-6">
	              <ol class="breadcrumb float-sm-right">
	                <li class="breadcrumb-item"><a href="#">일정</a></li>
	                <li class="breadcrumb-item active">개인일정</li>
	              </ol>
	            </div>
	          </div>
	        </div><!-- /.container-fluid -->
	      </section>

		<section class="content">
			<div class="container-fluid">
				<div class="card card-primary">
					<div class="card-body p-0">

						<!-- THE CALENDAR -->
						<div id="calendar"></div>
					</div>
					<!-- /.card-body -->
				</div>
			</div>
		</section>
	</div>

	<script>
	  var calendar = null;
      window.onload = function () {



      	$('.modal').on('hidden.bs.modal', function (e) {
    		  $(this).find('form')[0].reset();
    			if($('#scdAlldayCheck').is(':checked') == true){
    				$('#scdAlldayCheck').removeAttr('checked');
    			}
   				if($('#importantCheck').is(':checked') == true){
   					$('#importantCheck').removeAttr('checked');
   				}
    	});


      	if(${from eq 'register'}){
      		callSuccess('일정이등록되었습니다.','');
//       		alert('일정이 등록되었습니다.');
			$('#modal-detail').modal('hide');

      	}



        /* initialize the external events
         -----------------------------------------------------------------*/
        function ini_events(ele) {
          ele.each(function () {

            // create an Event Object (https://fullcalendar.io/docs/event-object)
            // it doesn't need to have a start or end
            var eventObject = {
              title: $.trim($(this).text()) // use the element's text as the event title
            }

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject)

            // make the event draggable using jQuery UI
            $(this).draggable({
              zIndex: 1070,
              revert: true, // will cause the event to go back to its
              revertDuration: 0  //  original position after the drag
            })

          })
        }

        ini_events($('#external-events div.external-event'))

        /* initialize the calendar
         -----------------------------------------------------------------*/
        //Date for the calendar events (dummy data)
        var date = new Date()
        var d = date.getDate()
//           m = date.getMonth(),
//           y = date.getFullYear()


        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendar.Draggable;

        var containerEl = document.getElementById('external-events');
        var checkbox = document.getElementById('drop-remove');
        var calendarEl = document.getElementById('calendar');

        // initialize the external events
        // -----------------------------------------------------------------

        var calendar = new Calendar(calendarEl, {
        	customButtons: {
        	    myCustomButton: {
        	      text: '일정등록',
        	      click: function() {
        	    	  $('#modal-detail').modal('show');

        	    	  var scdGrCode  = $('<input>').attr({'type' : 'hidden','name' : 'scdGrCode', 'value' : '<%=request.getAttribute("scdGrCode")%>'});
      	    	  	  $('form[name="registForm"]').append(scdGrCode);
        	      }
        	    }
        	  },
          googleCalendarApiKey: 'AIzaSyBi5RwswUUAzhGLsrBMKzaEHXJ-kzpLXVo',
          headerToolbar: {
            left: 'myCustomButton',
            center: 'title',
            right: 'prev,next today'
          },
          themeSystem: 'bootstrap',
          height: 600,
          locale: 'ko',
          //Random default events
          events: [
			/* 일정 리스트  */
			<%
			List<SchedulerVO> schedulerList = (List<SchedulerVO>)request.getAttribute("schedulerList");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
			for( SchedulerVO scheduler : schedulerList){
				String start = sdf.format(scheduler.getScdStartDt());
				String end = sdf.format(scheduler.getScdEndDt());
			%>
	        	  {
	                  title        : '<%= scheduler.getScdTitle()%>',

	                  <%
	                  if(scheduler.getScdAllday() != null){
		                  if(scheduler.getScdAllday().equals("Y")||scheduler.getScdAllday().equals("y")){
						  %>
						  start        : '<%= start.split(" ")[0] + "T00:00:00"  %>',
		                  end		   : '<%= end.split(" ")[0] + "T24:00:00" %>',
		                  allDay : true,

						  <%
		                  }else if(scheduler.getScdAllday().equals("N") || scheduler.getScdAllday().equals("n")){
		                  %>
		                  start        : '<%= start  %>',
		                  end		   : '<%= end %>',
		                  allDay : false,

		                  <%
		                  }
	                  }
	                  %>

	                  <%
	                  if(scheduler.getScdImport() != null){
	                  		if(scheduler.getScdImport().equals("Y")){
	                  %>
		                  backgroundColor: 'red',
		                  borderColor    : 'red',
	                  <%
	                  		}else if(scheduler.getScdImport().equals("N")){
	                  %>
		                  backgroundColor: '<%= scheduler.getScdColor()%>',
		                  borderColor    : '<%= scheduler.getScdColor()%>',
	                  <%
	                  		}
	                  }
	                  %>
	                  url:'<%=request.getContextPath()%>/scheduler/detail?scdCode=<%=scheduler.getScdCode()%>'
	              },
			<%
			}
			%>
          ],
          eventClick:function(info){
        	  info.jsEvent.preventDefault();

        	  if(info.event.url){
        		  OpenWindow(info.event.url,'일정상세조회','500','550');
        	  }
          },
          eventSources: [
            { googleCalendarId: 'algml9714@gmail.com' },
            { googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com', className: 'ko_event',color: 'white', textColor: 'red'  }
          ],

          editable: false, //수정가능여부
          droppable: false, // 캘린더안에서 드롭이 가능하게하는것
          dropAccept:'.cool-event',// this allows things to be dropped onto the calendar !!!
          drop: function (info) {
        	  alert('drop');
        	  console(info);
            // is the "remove after drop" checkbox checked?
            if (checkbox.checked) {
              // if so, remove the element from the "Draggable Events" list
              info.draggedEl.parentNode.removeChild(info.draggedEl);
            }
          }

        }) ;

        calendar.render();
        // $('#calendar').fullCalendar()

        /* ADDING EVENTS */
        var currColor = '#3c8dbc' //Red by default
        // Color chooser button
        $('#color-chooser > li > a').click(function (e) {
          e.preventDefault()
          // Save color
          currColor = $(this).css('color')
          // Add color effect to button
          $('#add-new-event').css({
            'background-color': currColor,
            'border-color': currColor
          })
        })
        $('#add-new-event').click(function (e) {
          e.preventDefault()
          // Get value and make sure it is not null
          var val = $('#new-event').val()
          if (val.length == 0) {
            return
          }

          // Create events
          var event = $('<div />')
          event.css({
            'background-color': currColor,
            'border-color': currColor,
            'color': '#fff'
          }).addClass('external-event')
          event.text(val)
          $('#external-events').prepend(event)

          // Add draggable funtionality
          ini_events(event)

          // Remove event from text input
          $('#new-event').val('')
        })
      }
    </script>
    <!-- 일정 등록 모달창 -->
<div class="modal" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<div class="row">
					<h5 style="margin: 0; display: inline-block;">일정등록</h5>
				</div>
			</div>
			<!-- modal header-->
			<form role="form" method="post" action="register.do" name="registForm">
				<input type="hidden" name="empCode" value="${loginUser.empCode}" />
				<div class="modal-body">
					<div class="col-md-12">
						<div class="card card-info card-outline" style="height: auto;">
							<!-- /.card-header -->
							<div class="card-body">
								<div class="form-group row" style="margin-bottom: 5px;">
									<label for="importantCheck" class="col-sm-4 col-form-label">중요 여부</label>
									<div class="col-sm-6 d-flex align-items-center">
										<div class="" style="display: inline-block;">
											<input type="checkbox" id="importantCheck" name="scdImport" value="Y" onchange="import_go();" />
											<label for="importantCheck" style="margin: 0; font-weight: 300;">중요</label>
										</div>
									</div>
								</div>
								<div class="form-group row" style="margin-bottom: 5px;">
									<label for="scdAlldayCheck" class="col-sm-4 col-form-label">종일 여부</label>
									<div class="col-sm-6 d-flex align-items-center">
										<div class="" style="display: inline-block;">
											<input type="checkbox" id="scdAlldayCheck" name="scdAllday" value="Y" onchange="allDay()" />
											<label for="scdAlldayCheck" style="margin: 0; font-weight: 300;">종일</label>
										</div>
									</div>
								</div>


								<div class="form-group row" style="margin-bottom: 5px;">
									<label for="scdStartDt" class="col-sm-4 col-form-label">시작일</label>
									<div class="col-sm-8">
										<input type="date" class="form-control form-control-sm" id="scdStartDt" name="scdStartDt">
									</div>
								</div>


								<div class="form-group row" style="margin-bottom: 5px;">
									<label for="scdEndDt" class="col-sm-4 col-form-label">종료일</label>
									<div class="col-sm-8">
										<input type="date" class="form-control form-control-sm" id="scdEndDt" name="scdEndDt">
									</div>
								</div>


								<div class="form-group row" style="margin-bottom: 5px;">
									<label for="scdStartTime" class="col-sm-4 col-form-label">시작 시간</label>
									<div class="col-sm-8">
										<input type="time" class="form-control form-control-sm" id="scdStartTime" name="scdStartTime">
									</div>
								</div>


								<div class="form-group row" style="margin-bottom: 5px;">
									<label for="scdEndTime" class="col-sm-4 col-form-label">종료 시간</label>
									<div class="col-sm-8">
										<input type="time" class="form-control form-control-sm" id="scdEndTime" name="scdEndTime">
									</div>
								</div>


								<div class="form-group row">
									<label for="scdTitle" class="col-sm-4 col-form-label">제목</label>
									<div class="col-sm-8">
										<input type="text" class="form-control form-control-sm" placeholder="제목을 입력하세요" id="scdTitle" name="scdTitle">
									</div>
								</div>


								<div class="form-group row">
									<label for="scdContent" class="col-sm-4 col-form-label">내용</label>
									<div class="col-sm-8">
										<textarea class="form-control" rows="2" style="resize: none;" placeholder="내용을 입력하세요" id="scdContent" name="scdContent"></textarea>
									</div>
								</div>


								<div class="row d-flex justify-content-center">
									<button type="button" class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="regist_go();">등록</button>
									<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">닫기</span>
									</button>
								</div>


							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!--/.col (right) -->
				</div>
			</form>
		</div>
	</div>
</div>
<!--modal -->
<%-- <form role="form">
	<input type="hidden" name="empCode" value="${scheduler.empCode }" />
</form>--%>
<script>
/* 종일여부 체크 */
function allDay(){
// 	console.log($('#scdAlldayCheck').val());
// 	console.log($('#scdAlldayCheck').is(':checked'))

	if($('#scdAlldayCheck').is(':checked') == true){
		$('#scdAlldayCheck').attr('checked', true);
// 		$('#scdAlldayCheck').val('Y',true);

		$('#scdStartTime').attr('disabled','disabled');
		$('#scdEndTime').attr('disabled','disabled');
	}

	if($('#scdAlldayCheck').is(':checked') == false){
		$('#scdAlldayCheck').removeAttr('checked');
// 		$('#scdAlldayCheck').val('N',false);

		$('#scdStartTime').removeAttr('disabled');
		$('#scdEndTime').removeAttr('disabled');
	}

}


</script>
<script>
/* 중요여부체크 */
function import_go() {
// 		console.log($('#importantCheck').val());
// 		console.log($('#importantCheck').is(':checked'))

		if($('#importantCheck').is(':checked') == true){
			$('#importantCheck').attr('checked', true);
		}

		if($('#importantCheck').is(':checked') == false){
			$('#importantCheck').removeAttr('checked');
		}
	}
/* 일정등록 */
function regist_go(){

	let registForm = document.querySelector("form[name='registForm']");
	registForm.submit();

}
</script>

</body>