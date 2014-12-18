$(document).ready(function() {
  $("#leave-request-radio-full").hide();
  $("#leave-request-radio-half").hide();
  var menu = $("#leave_request_leave_type_id");
  menu.change(function() {
    var option_text = $("#leave_request_leave_type_id :selected").text();
    if (option_text === "Annual Leave") {
      $("#leave-request-radio-half").show();
      $("#leave-request-radio-full").show();
    }
    else if (option_text === "Select Leave Type") {
      $("#leave-request-radio-full").hide();
      $("#leave-request-radio-half").hide();
    }
    else {
      $("input[name='leave_request[day_type]']").prop('checked', false);
      $("#leave-request-radio-half").hide();
      $("#leave-request-radio-full").hide();
    }
  });
});

$(document).ready(function() {
  $("#leave_request_date_from").datepicker(
      { dateFormat: "yy-mm-dd" }
    );
});


