$(document).ready(function(){
  $("#get-end-date").click(function(event){
    event.preventDefault();
    var date_enetered = $("#leave_request_date_from").val();
    var num_days = $("#leave_request_num_of_days").val();
    $.ajax({
      url: '/leave_requests/get_end_date',
      type: 'POST',
      dataType: 'script',
      data: { date: date_enetered, days: num_days },
    })
  })
});
