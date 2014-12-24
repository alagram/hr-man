"use strict";
$(window).load(function(){
  $("#get-end-date").prop('disabled', true);
})

$(document).ready(function(){
  keyUpAjax();
});

function keyUpAjax (){
  $("#leave_request_num_of_days").keyup(function(){
    var days = $("#leave_request_num_of_days").val();
    var optionText = $("#leave_request_leave_type_id :selected").val();
    var dayTypeRadionBtn = $("input[name='leave_request[day_type]']:checked", "#new_leave_request").val();

    if (days === "") {
      $("#get-end-date").prop('disabled', true);
    }

    if (parseInt(days) % 1 === 0){
      $.ajax({
        url:'/leave_requests/check_leave_bal',
        type: 'POST',
        dataType: 'script',
        data: { num_days: days, leave_option: optionText, day_type: dayTypeRadionBtn },
      })
    }
  })
}
