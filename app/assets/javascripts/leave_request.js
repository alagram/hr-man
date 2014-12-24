$(document).ready(function() {
  showHideDayType();
  dateFromDatePicker();
});

function showHideDayType() {
  $("#leave-request-radio-full").hide();
  $("#leave-request-radio-half").hide();
  var menu = $("#leave_request_leave_type_id");
  menu.change(function() {
    var optionText = $("#leave_request_leave_type_id :selected").text();
    if (optionText === "Annual Leave") {
      $("#leave-request-radio-half").show();
      $("#leave-request-radio-full").show();
    }
    else if (optionText === "Select Leave Type") {
      $("#leave-request-radio-full").hide();
      $("#leave-request-radio-half").hide();
    }
    else {
      $("input[name='leave_request[day_type]']").prop('checked', false);
      $("#leave-request-radio-half").hide();
      $("#leave-request-radio-full").hide();
    }
  });
}

function dateFromDatePicker() {
  $("#leave_request_date_from").datepicker(
    { dateFormat: "yy-mm-dd" }
  );
}


