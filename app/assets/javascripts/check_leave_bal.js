$(window).load(function(){
  $("#get-end-date").attr('disabled', 'disabled');
})

$(document).ready(function(){
  $("#leave_request_num_of_days").keyup(function(){
    var days = $("#leave_request_num_of_days").val();
    var option_text = $("#leave_request_leave_type_id :selected").val();
    var full_or_half = $("input[name='leave_request[day_type]']:checked", "#new_leave_request").val();

    if (days === "") {
      $("#get-end-date").attr('disabled', 'disabled');
    }

    if (parseInt(days) % 1 === 0){
      $.ajax({
        url:'/leave_requests/check_leave_bal',
        dataType: 'script',
        data: { num_days: days, leave_option: option_text, day_type: full_or_half },
      })
    }
  })
});
