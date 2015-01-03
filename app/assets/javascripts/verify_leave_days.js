$(document).ready(function() {
  var leaveTypeMenu = $("#leave_request_leave_type_id");
  leaveTypeMenu.change(function() {
    optionText = $("#leave_request_leave_type_id :selected").val();
    if (optionText === "") {
      $('#leave_request_num_of_days').val("").prop('disabled', false);
      $('#leave_request_num_of_days').val("").prop('readonly', false);
      $("#get-end-date").prop('disabled', true);
    }
    else if (parseInt(optionText) % 1 === 0){
      $.ajax({
        url: '/leave_requests/confirm_leave_days',
        type: 'POST',
        dataType: 'script',
        data: { leave_type: optionText },
      })
    }
  })
})
